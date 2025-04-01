
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
    localparam int WEIGHTS_SIZE [1:BACKBONE_LAYERS+1] = '{BACKBONE_LAYERS+1{14}}; // is also the size of the bias
    localparam int ADDER_TREE [1:BACKBONE_LAYERS+1] = '{BACKBONE_LAYERS+1{1}};
    localparam int PARALLEL_INPUTS = 3;
    localparam string LAYER_BACKBONE = "pnfc_no_rnn_dense";
    localparam string FEATURE_EXTRACTION = "1_3_INV"; // to use abs2_4 or abs1_3 for feature augmentation
    localparam PHASE_NORMALIZATION = 1; // 1 for true, 0 for false
    localparam DENSE = 1; // 0 for no dense connection, 1 for sending FEx layer output to output layer input
    localparam string ACTIVATION_FUNCTION [1:BACKBONE_LAYERS] = '{BACKBONE_LAYERS{"RELU"}};
    localparam signed [0:13] LAYER_FIRST_BIAS [0:11]  = '{522, -868, 953, 1252, -512, 1356, -198, -166, 1353, -1128, -97, -2179};
    localparam signed [0:13] LAYER_FIRST_WEIGHT [0:11][0:11]  = '{'{0, 0, 0, 0, 0, -1843, 0, 0, 0, 0, 5088, -3672}, '{0, 0, 0, 2204, 0, 0, 0, 0, 0, 0, -2103, 0}, '{0, 0, 0, 0, 0, 1793, 0, 0, 0, 0, 0, 0}, '{0, 0, 3974, 0, 0, 2031, 2039, 0, 0, 0, 0, 0}, '{-2129, 0, 0, 0, 0, 0, 0, 0, 0, -2159, -2144, 0}, '{0, 0, -1829, 2929, 0, 0, 0, 0, 0, 0, 0, 0}, '{0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 0, 4240}, '{2071, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, '{0, 0, 0, 0, 0, 0, 0, 0, 0, -2922, 0, 3148}, '{0, 0, 0, 0, 0, 0, 0, 0, 3196, 0, 0, 3508}, '{0, 0, 1648, 0, 0, 0, -2965, 0, 2620, 0, 3564, 2916}, '{0, 0, 0, 0, 0, -1984, 0, 0, 0, 0, 0, 0}};
    localparam int LAYER_FIRST_WEIGHT_QUANTIZER   = -13;
    localparam int LAYER_FIRST_ACT_QUANTIZER   = -13;
    localparam int LAYER_FIRST_OUT_QUANTIZER   = -15;
    localparam signed [0:13] LAYER_LAST_BIAS [0:1]  = '{11, 81};
    localparam signed [0:13] LAYER_LAST_WEIGHT [0:1][0:23]  = '{'{-2490, 0, -3048, 3720, -3178, 0, 3184, 2233, 0, 0, 0, -2417, 0, 0, 2037, 0, 0, 0, 0, 0, 2651, 1694, -2841, 0}, '{4306, 2797, -4000, -2264, -3524, 0, 0, -2573, 2145, 1850, 2368, 0, 0, 0, 0, 0, 0, 2956, 1631, 0, 0, 0, -2234, 0}};
    localparam int LAYER_LAST_WEIGHT_QUANTIZER   = -13;
    localparam int LAYER_LAST_ACT_QUANTIZER   = -13;
    localparam int LAYER_LAST_OUT_QUANTIZER   = -15;
    localparam string LAYER_TYPES [1:BACKBONE_LAYERS+1] = '{"INT_LINEAR", "INT_LINEAR"};
    // The names of the layers are: BACKBONE.FC_HID.0, BACKBONE.FC_OUT;
    localparam int LAYER_ORDER [0:BACKBONE_LAYERS+1] = {0, 1, 2}; // The order of the layers in LAYER_NAMES
        // IMPORTANT: the order of the layers in the code of the backbone is detemined based on what is defined first in the backbone,
        // make sure that this order is correct, or change the backbone if needed
endpackage
