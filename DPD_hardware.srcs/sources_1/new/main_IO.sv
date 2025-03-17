`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2025 12:37:08 PM
// Design Name: 
// Module Name: main_IO
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import parameter_weights_pack::*;

//module main_IO #(
//    )(
//    input logic [31:0] s_inp_axis_tdata,
//    input logic s_inp_axis_tlast, s_inp_axis_tvalid, m_out_axis_tready,
//    input logic clk, resetn,
//    output logic [63:0] m_out_axis_tdata,
//    output logic s_inp_axis_tready, m_out_axis_tlast, m_out_axis_tvalid
//    );

module main_IO #
(
    parameter ADDR_WIDTH = 12,
    parameter C_AXIS_TDATA_WIDTH = 32
)
(
    input clk, resetn,
    /*
     * AXI slave interface (input to the FIFO)
     */
//    input  wire                   s00_axis_aclk,
//    input  wire                   s00_axis_aresetn,
    input  wire [C_AXIS_TDATA_WIDTH-1:0]  s00_axis_tdata,
    input  wire [(C_AXIS_TDATA_WIDTH/8)-1:0] s00_axis_tstrb,
    input  wire                   s00_axis_tvalid,
    output wire                   s00_axis_tready,
    input  wire                   s00_axis_tlast,
    
    /*
     * AXI master interface (output of the FIFO)
     */
//    input  wire                   m00_axis_aclk,
//    input  wire                   m00_axis_aresetn,
    output wire [2*C_AXIS_TDATA_WIDTH-1:0]  m00_axis_tdata,
    output wire [2*(C_AXIS_TDATA_WIDTH/8)-1:0] m00_axis_tstrb,
    output wire                   m00_axis_tvalid,
    input  wire                   m00_axis_tready,
    output wire                   m00_axis_tlast
);

//localparam SHIFT_DELAY = 4;

reg [ADDR_WIDTH:0] wr_ptr_reg = {ADDR_WIDTH+1{1'b0}}, wr_ptr_next;
reg [ADDR_WIDTH:0] wr_addr_reg = {ADDR_WIDTH+1{1'b0}};
reg [ADDR_WIDTH:0] rd_ptr_reg = {ADDR_WIDTH+1{1'b0}}, rd_ptr_next;
reg [ADDR_WIDTH:0] rd_addr_reg = {ADDR_WIDTH+1{1'b0}};

reg [ADDR_WIDTH:0] wr_ptr_sync1_reg = {ADDR_WIDTH+1{1'b0}};
reg [ADDR_WIDTH:0] rd_ptr_sync1_reg = {ADDR_WIDTH+1{1'b0}};

reg rst_sync1_reg = 1'b1;

reg [(2*C_AXIS_TDATA_WIDTH)+2-1:0] mem[(2**ADDR_WIDTH)-1:0];
reg [(2*C_AXIS_TDATA_WIDTH)+2-1:0] mem_read_data_reg = {(2*C_AXIS_TDATA_WIDTH)+2{1'b0}};
reg mem_read_data_valid_reg = 1'b0, mem_read_data_valid_next;
wire [(2*C_AXIS_TDATA_WIDTH)+2-1:0] mem_write_data;
reg [2*INPUTS_SIZE-1:0] DPD_in = {2*INPUTS_SIZE{1'b0}};
reg [2*C_AXIS_TDATA_WIDTH-1:0] DPD_out;

reg [(2*C_AXIS_TDATA_WIDTH)+2-1:0] m00_data_reg = {(2*C_AXIS_TDATA_WIDTH)+2{1'b0}};

reg m00_axis_tvalid_reg = 1'b0, m00_axis_tvalid_next;

// full when first TWO MSBs do NOT match, but rest matches
// (gray code equivalent of first MSB different but rest same)
wire full = ((wr_ptr_reg[ADDR_WIDTH] != rd_ptr_sync1_reg[ADDR_WIDTH]) &&
             (wr_ptr_reg[ADDR_WIDTH-1:0] == rd_ptr_sync1_reg[ADDR_WIDTH-1:0]));
// empty when pointers match exactly
wire empty = rd_ptr_reg == wr_ptr_sync1_reg;

// control signals
reg write;
reg read;
reg store_output;

assign s00_axis_tready = ~full & ~rst_sync1_reg;

assign m00_axis_tvalid = m00_axis_tvalid_reg;

assign mem_write_data = {s00_axis_tlast, DPD_out};
//assign mem_write_data = {s00_axis_tlast, s00_axis_tdata};
assign {m00_axis_tlast, m00_axis_tdata} = m00_data_reg;

// reset synchronization
always @(posedge clk) begin
    if (!resetn) begin
        rst_sync1_reg <= 1'b1;
    end else begin
        rst_sync1_reg <= 1'b0;
    end
end

// Write logic
always @* begin
    write = 1'b0;

    wr_ptr_next = wr_ptr_reg;

    if (s00_axis_tvalid) begin
        // input data valid
        if (~full) begin
            // not full, perform write
            write = 1'b1;
            wr_ptr_next = wr_ptr_reg + 1;
        end
    end
end

always @(posedge clk) begin
    if (rst_sync1_reg) begin
        wr_ptr_reg <= {ADDR_WIDTH+1{1'b0}};
    end else begin
        wr_ptr_reg <= wr_ptr_next;
    end

    wr_addr_reg <= wr_ptr_next;

    if (write) begin
        
        DPD_in[0 +:INPUTS_SIZE] <= s00_axis_tdata[0 +:INPUTS_SIZE];
        DPD_in[INPUTS_SIZE +:INPUTS_SIZE] <= s00_axis_tdata[C_AXIS_TDATA_WIDTH/2 +:INPUTS_SIZE];
////        mem_shift_delay[SHIFT_DELAY-1:1] <= mem_shift_delay[SHIFT_DELAY-2:0];
        mem[wr_addr_reg[ADDR_WIDTH-1:0]] <= mem_write_data;
//        mem[wr_addr_reg[ADDR_WIDTH-1:0]] <= mem_shift_delay[SHIFT_DELAY-1];
    end
end

logic DPD_clk; // clock gated version of clk that only updates when new input is given

BUFGCE bufgce_i0 (
    .I(clk),
    .CE(read),
    .O(DPD_clk)
);

// sending inputs to DPD
    main dpd_model (
        .clk(DPD_clk),
        .I(DPD_in[0 +:INPUTS_SIZE]),
        .Q(DPD_in[INPUTS_SIZE +:INPUTS_SIZE]),
        .I_out(DPD_out[0 +:2*INPUTS_SIZE]),
        .Q_out(DPD_out[C_AXIS_TDATA_WIDTH +:2*INPUTS_SIZE])
    );
    
    if (2*INPUTS_SIZE < C_AXIS_TDATA_WIDTH) begin
        localparam IO_PADDING = C_AXIS_TDATA_WIDTH-2*INPUTS_SIZE;
        assign DPD_out[2*INPUTS_SIZE +: IO_PADDING] = 'b0; 
        assign DPD_out[C_AXIS_TDATA_WIDTH+2*INPUTS_SIZE +: IO_PADDING] = 'b0; 
    end

// pointer synchronization
always @(posedge clk) begin
    if (rst_sync1_reg) begin
        rd_ptr_sync1_reg <= {ADDR_WIDTH+1{1'b0}};
    end else begin
        rd_ptr_sync1_reg <= rd_ptr_reg;
    end
end

always @(posedge clk) begin
    if (rst_sync1_reg) begin
        wr_ptr_sync1_reg <= {ADDR_WIDTH+1{1'b0}};
    end else begin
        wr_ptr_sync1_reg <= wr_ptr_reg;
    end
end

// Read logic
always @* begin
    read = 1'b0;

    rd_ptr_next = rd_ptr_reg;

    mem_read_data_valid_next = mem_read_data_valid_reg;

    if (store_output | ~mem_read_data_valid_reg) begin
        // output data not valid OR currently being transferred
        if (~empty) begin
            // not empty, perform read
            read = 1'b1;
            mem_read_data_valid_next = 1'b1;
            rd_ptr_next = rd_ptr_reg + 1;
        end else begin
            // empty, invalidate
            mem_read_data_valid_next = 1'b0;
        end
    end
end

always @(posedge clk) begin
    if (rst_sync1_reg) begin
        rd_ptr_reg <= {ADDR_WIDTH+1{1'b0}};
        mem_read_data_valid_reg <= 1'b0;
    end else begin
        rd_ptr_reg <= rd_ptr_next;
        mem_read_data_valid_reg <= mem_read_data_valid_next;
    end

    rd_addr_reg <= rd_ptr_next;

    if (read) begin
        mem_read_data_reg <= mem[rd_addr_reg[ADDR_WIDTH-1:0]];
    end
end

// Output register
always @* begin
    store_output = 1'b0;

    m00_axis_tvalid_next = m00_axis_tvalid_reg;

    if (m00_axis_tready | ~m00_axis_tvalid) begin
        store_output = 1'b1;
        m00_axis_tvalid_next = mem_read_data_valid_reg;
    end
end

always @(posedge clk) begin
    if (rst_sync1_reg) begin
        m00_axis_tvalid_reg <= 1'b0;
    end else begin
        m00_axis_tvalid_reg <= m00_axis_tvalid_next;
    end

    if (store_output) begin
        m00_data_reg <= mem_read_data_reg;
    end
end

endmodule









//module main_IO #(
//    )(
//    input logic [31:0] s_inp_axis_tdata,
//    input logic s_inp_axis_tlast, s_inp_axis_tvalid, m_out_axis_tready,
//    input logic clk, resetn,
//    output logic [63:0] m_out_axis_tdata,
//    output logic s_inp_axis_tready, m_out_axis_tlast, m_out_axis_tvalid
//    );
    
//    logic new_m_out_axis_tvalid = 0;
//    logic new_m_out_axis_tdata = 0;
//    logic new_s_inp_axis_tready = 0;
    
//    always_ff @(posedge clk) begin
//        if (!resetn) begin
//            new_m_out_axis_tvalid <= 1'b0;
//            new_s_inp_axis_tready <= 1'b0;
//        end else begin
//            new_m_out_axis_tvalid <= 1'b1;
//            new_s_inp_axis_tready <= 1'b1;
//        end
//        if (!resetn)
//            new_m_out_axis_tdata <= 64'b0;
//        else if (m_out_axis_tready)
////            new_m_out_axis_tdata <= {16'b1, 16'b0, 16'b1, 16'b0};
////            new_m_out_axis_tdata <= {16'b1, s_inp_axis_tdata[31:16], 16'b0, s_inp_axis_tdata[15:0]};
////        else new_m_out_axis_tdata <=  new_m_out_axis_tdata;
//            m_out_axis_tdata[0 +: 2*INPUTS_SIZE] <= I_out;
//            m_out_axis_tdata[32 +: 2*INPUTS_SIZE] <= Q_out;
//    end
    
//    assign s_inp_axis_tready = new_s_inp_axis_tready;
//    assign m_out_axis_tlast = 1'b1;
//    assign m_out_axis_tvalid = new_m_out_axis_tvalid;
////    assign m_out_axis_tdata = new_m_out_axis_tdata;
    
    
//    assign I = s_inp_axis_tdata[0 +: INPUTS_SIZE];
//    assign Q = s_inp_axis_tdata[16 +: INPUTS_SIZE];
////    if (2*INPUTS_SIZE < 32) begin
////        assign m_out_axis_tdata[31:2*INPUTS_SIZE] = {{1'b0}};
////        assign m_out_axis_tdata[63:32+2*INPUTS_SIZE] = {{1'b0}};
////    end
    
//    main dpd_model (
//        .clk(clk),
//        .I(I),
//        .Q(Q),
//        .I_out(I_out),
//        .Q_out(Q_out)
//    );
    
//    localparam LATENCY = 14 + 3*PHASE_NORMALIZATION;
    
//    assign m_out_axis_tdata = 'b1;
    
    
//    assign s_inp_axis_tready = 1'b1;
    
//    logic new_m_out_axis_valid = 0;
//    logic curr_m_out_axis_valid = 0;
    
//    assign m_out_axis_valid = curr_m_out_axis_valid;
    
//    logic [LATENCY-1:0] tlast_delayed;
////    , tvalid_delayed;
    
//    always_ff @(posedge clk) begin
//        tlast_delayed <= {tlast_delayed[LATENCY-2:0], s_inp_axis_tlast};
////        tvalid_delayed <= {tvalid_delayed[LATENCY-2:0], s_inp_axis_tvalid};
//        if (resetn) begin
//            new_m_out_axis_valid <= 1;
//            curr_m_out_axis_valid <= new_m_out_axis_valid;
//        end
//        else begin 
//            new_m_out_axis_valid <= 0;
//            curr_m_out_axis_valid <= 0;
//        end
        
//        m_out_axis_tlast <= s_inp_axis_tlast;
//    end
    
////    assign m_out_axis_tlast = tlast_delayed[LATENCY-1];
////    assign m_out_axis_valid = tvalid_delayed[LATENCY-1];
    
//endmodule
