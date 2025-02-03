
// this package contains the model parameters and weights

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 09:28:10 PM
// Design Name: 
// Module Name: backbones
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

// IMPORTANT: the order of the layers in the code of the backbone is detemined based on what is defined first in the backbone,
        // make sure that this order is correct, or change the backbone if needed

package parameter_weights_pack;
    localparam int BACKBONE_LAYERS = 2; // amount of layers in the backbone,
        //not including the feature extraction layer, or the output layer that determines I and Q
    localparam int LAYER_SIZES [BACKBONE_LAYERS+1:0] = {2, 4, 4, 8}; // amount of neurons/outputs in each layer
    localparam int INPUTS_SIZE = 12;
    localparam int WEIGHTS_SIZE [1:BACKBONE_LAYERS+1] = '{BACKBONE_LAYERS+1{12}}; // is also the size of the bias
    localparam int ADDER_TREE [1:BACKBONE_LAYERS+1] = '{BACKBONE_LAYERS+1{1}};
    localparam int PARALLEL_INPUTS = 2;
    localparam string LAYER_BACKBONE = "pnfc_no_rnn";
    localparam string FEATURE_EXTRACTION = "1_3_INV"; // to use abs2_4 or abs1_3 for feature augmentation
    localparam PHASE_NORMALIZATION = 0; // 1 for true, 0 for false
    localparam DENSE = 1; // 0 for no dense connection, 1 for sending FEx layer output to output layer input
    localparam string ACTIVATION_FUNCTION [1:BACKBONE_LAYERS] = '{BACKBONE_LAYERS{"RELU"}};
    logic signed [0:11] LAYER_FIRST_WEIGHT [0:3][0:7]  = '{'{97, 1263, -514, 191, -49, 559, -255, 116}, '{503, 87, -72, 458, -518, -486, -614, -444}, '{224, -676, -167, -497, 940, 255, -175, 782}, '{175, 613, -705, -782, 134, 825, 260, -256}};
    logic signed [0:11] LAYER_FIRST_BIAS [0:3]  = '{359, -36, 447, 281};
    localparam int LAYER_FIRST_WEIGHT_QUANTIZER   = -11;
    localparam int LAYER_FIRST_ACT_QUANTIZER   = -11;
    localparam int LAYER_FIRST_OUT_QUANTIZER   = -15;
    logic signed [0:11] LAYER_MID_WEIGHT [0:0][0:3][0:3]  = '{'{'{1212, 1000, 621, 809}, '{592, -426, -562, -374}, '{-1345, 438, 873, -357}, '{-765, -20, 1238, 1363}}};
    logic signed [0:11] LAYER_MID_BIAS [0:0][0:3]  = '{'{-449, -337, 541, -289}};
    localparam int LAYER_MID_WEIGHT_QUANTIZER [0:0]  = '{-11};
    localparam int LAYER_MID_ACT_QUANTIZER [0:0]  = '{-11};
    localparam int LAYER_MID_OUT_QUANTIZER [0:0]  = '{-15};
    logic signed [0:11] LAYER_LAST_WEIGHT [0:1][0:11]  = '{'{117, -427, -1554, -1536, 1492, -570, -272, -462, 967, 128, -795, 887}, '{-1973, 254, 409, -806, 411, 614, 594, 14, 910, 798, 111, -421}};
    logic signed [0:11] LAYER_LAST_BIAS [0:1]  = '{305, -106};
    localparam int LAYER_LAST_WEIGHT_QUANTIZER   = -11;
    localparam int LAYER_LAST_ACT_QUANTIZER   = -11;
    localparam int LAYER_LAST_OUT_QUANTIZER   = -15;
    localparam string LAYER_TYPES [1:BACKBONE_LAYERS+1] = '{"INT_LINEAR", "INT_LINEAR", "INT_LINEAR"};
    // The names of the layers are: BACKBONE.FC_HID.0, BACKBONE.FC_HID.1, BACKBONE.FC_OUT;
    localparam int LAYER_ORDER [0:BACKBONE_LAYERS+1] = {0, 1, 2, 3}; // The order of the layers in LAYER_NAMES
        // IMPORTANT: the order of the layers in the code of the backbone is detemined based on what is defined first in the backbone,
        // make sure that this order is correct, or change the backbone if needed
endpackage
