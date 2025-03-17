
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
    localparam int BACKBONE_LAYERS = 1; // amount of layers in the backbone,
        //not including the feature extraction layer, or the output layer that determines I and Q
    localparam int LAYER_SIZES [BACKBONE_LAYERS+1:0] = {2, 12, 12}; // amount of neurons/outputs in each layer
    localparam int INPUTS_SIZE = 14;
    localparam int OUTPUTS_SIZE = 28;
    localparam int WEIGHTS_SIZE [1:BACKBONE_LAYERS+1] = '{BACKBONE_LAYERS+1{14}}; // is also the size of the bias
    localparam int ADDER_TREE [1:BACKBONE_LAYERS+1] = '{BACKBONE_LAYERS+1{1}};
    localparam int PARALLEL_INPUTS = 3;
    localparam string LAYER_BACKBONE = "pnfc_no_rnn_dense";
    localparam string FEATURE_EXTRACTION = "1_3_INV"; // to use abs2_4 or abs1_3 for feature augmentation
    localparam PHASE_NORMALIZATION = 1; // 1 for true, 0 for false
    localparam DENSE = 1; // 0 for no dense connection, 1 for sending FEx layer output to output layer input
    localparam string ACTIVATION_FUNCTION [1:BACKBONE_LAYERS] = '{BACKBONE_LAYERS{"RELU"}};
    localparam signed [0:13] LAYER_FIRST_BIAS [0:11]  = '{417, -871, 1276, 1409, -511, 1552, -2687, 77, 1217, -1876, -1578, -1250};
    localparam signed [0:13] LAYER_FIRST_WEIGHT [0:11][0:11]  = '{'{0, 0, 0, 0, 0, -1850, 0, 0, 0, 0, 3736, -3933}, '{0, 0, 0, 2213, 0, 0, 0, 0, 0, 0, -2112, 0}, '{2586, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, '{0, 0, 3412, 0, 0, 2040, 2268, 0, 0, 0, 0, 0}, '{-2138, 0, 0, 0, 0, 0, 0, 0, 0, -2168, -2153, 0}, '{0, 0, 0, 3107, 0, 0, 0, 0, 0, 0, 0, 0}, '{0, 0, 0, 0, 0, 0, 0, 0, 0, 1584, 0, 1395}, '{1979, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, '{-2721, 0, 0, 0, 0, 0, 0, 0, 1485, -3382, 0, 1849}, '{0, 0, 0, 0, 0, 0, 0, 0, 2904, 2007, 0, 2419}, '{0, 0, 1824, 0, 0, 0, 0, 0, 2800, 0, 3292, 1561}, '{0, 1904, 0, 0, 0, -1992, 0, 0, 0, 0, 0, 0}};
    localparam int LAYER_FIRST_WEIGHT_QUANTIZER   = -13;
    localparam int LAYER_FIRST_ACT_QUANTIZER   = -13;
    localparam int LAYER_FIRST_OUT_QUANTIZER   = -15;
    localparam signed [0:13] LAYER_LAST_BIAS [0:1]  = '{-193, 14};
    localparam signed [0:13] LAYER_LAST_WEIGHT [0:1][0:23]  = '{'{-3971, 0, -3535, 4022, -3181, 0, 3521, 2870, 1810, 0, 0, 0, 0, 0, 2518, 0, 0, 0, 0, 0, 3135, 2444, -2029, 0}, '{3743, 2808, -4248, 0, -3546, 0, 0, 0, 2029, 2402, 2607, 0, 0, 0, 0, 0, 0, 2968, 1944, 0, 0, 0, -3130, 0}};
    localparam int LAYER_LAST_WEIGHT_QUANTIZER   = -13;
    localparam int LAYER_LAST_ACT_QUANTIZER   = -13;
    localparam int LAYER_LAST_OUT_QUANTIZER   = -15;
    localparam string LAYER_TYPES [1:BACKBONE_LAYERS+1] = '{"INT_LINEAR", "INT_LINEAR"};
    // The names of the layers are: BACKBONE.FC_HID.0, BACKBONE.FC_OUT;
    localparam int LAYER_ORDER [0:BACKBONE_LAYERS+1] = {0, 1, 2}; // The order of the layers in LAYER_NAMES
        // IMPORTANT: the order of the layers in the code of the backbone is detemined based on what is defined first in the backbone,
        // make sure that this order is correct, or change the backbone if needed
endpackage
