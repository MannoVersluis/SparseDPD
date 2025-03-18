
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
    localparam signed [0:13] LAYER_FIRST_BIAS [0:11]  = '{417, -871, 1275, 1410, -511, 1552, -2687, 77, 1216, -1877, -1578, -1248};
    localparam signed [0:13] LAYER_FIRST_WEIGHT [0:11][0:11]  = '{'{0, 0, 0, 0, 0, -1850, 0, 0, 0, 0, 3747, -3945}, '{0, 0, 0, 2213, 0, 0, 0, 0, 0, 0, -2112, 0}, '{2584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, '{0, 0, 3417, 0, 0, 2040, 2267, 0, 0, 0, 0, 0}, '{-2138, 0, 0, 0, 0, 0, 0, 0, 0, -2168, -2153, 0}, '{0, 0, 0, 3109, 0, 0, 0, 0, 0, 0, 0, 0}, '{0, 0, 0, 0, 0, 0, 0, 0, 0, 1587, 0, 1392}, '{1980, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, '{-2725, 0, 0, 0, 0, 0, 0, 0, 1487, -3382, 0, 1843}, '{0, 0, 0, 0, 0, 0, 0, 0, 2905, 2004, 0, 2421}, '{0, 0, 1825, 0, 0, 0, 0, 0, 2801, 0, 3288, 1565}, '{0, 1905, 0, 0, 0, -1992, 0, 0, 0, 0, 0, 0}};
    localparam int LAYER_FIRST_WEIGHT_QUANTIZER   = -13;
    localparam int LAYER_FIRST_ACT_QUANTIZER   = -13;
    localparam int LAYER_FIRST_OUT_QUANTIZER   = -15;
    localparam signed [0:13] LAYER_LAST_BIAS [0:1]  = '{-193, 14};
    localparam signed [0:13] LAYER_LAST_WEIGHT [0:1][0:23]  = '{'{-3986, 0, -3533, 4023, -3181, 0, 3518, 2872, 1808, 0, 0, 0, 0, 0, 2516, 0, 0, 0, 0, 0, 3133, 2444, -2031, 0}, '{3752, 2808, -4250, 0, -3546, 0, 0, 0, 2029, 2405, 2609, 0, 0, 0, 0, 0, 0, 2968, 1944, 0, 0, 0, -3134, 0}};
    localparam int LAYER_LAST_WEIGHT_QUANTIZER   = -13;
    localparam int LAYER_LAST_ACT_QUANTIZER   = -13;
    localparam int LAYER_LAST_OUT_QUANTIZER   = -15;
    localparam string LAYER_TYPES [1:BACKBONE_LAYERS+1] = '{"INT_LINEAR", "INT_LINEAR"};
    // The names of the layers are: BACKBONE.FC_HID.0, BACKBONE.FC_OUT;
    localparam int LAYER_ORDER [0:BACKBONE_LAYERS+1] = {0, 1, 2}; // The order of the layers in LAYER_NAMES
        // IMPORTANT: the order of the layers in the code of the backbone is detemined based on what is defined first in the backbone,
        // make sure that this order is correct, or change the backbone if needed
endpackage
