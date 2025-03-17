
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
    localparam signed [0:-13] LAYER_FIRST_BIAS [0:11]  = '{168, 759, -446, 25, -796, -112, -321, 39, 232, -169, 58, -391};
    localparam signed [0:-13] LAYER_FIRST_WEIGHT [0:11][0:11]  = '{'{-27, 507, 14, 4108, -2975, 204, -65, 1319, 1460, 19, 162, 38}, '{40, -213, -2431, -68, -768, -200, -63, 105, -1692, -226, 282, 3354}, '{-128, 315, -191, -5, -108, 206, 153, -251, 1095, -28, -128, -9}, '{307, 117, -13, -903, 1705, -185, -133, -998, 79, 62, 2247, 320}, '{-67, 116, 2268, 312, 915, 162, 193, 250, 1835, 443, 2049, 653}, '{-424, -189, -362, -214, 99, 270, -334, 223, 305, -218, 56, -291}, '{95, -205, -172, -296, -369, 352, -56, -12, -220, 308, -253, -179}, '{107, 171, 990, 132, 2895, -128, -4, -19, -104, -223, 85, -3979}, '{-69, -59, 2099, 3615, -86, -156, -320, -33, 1878, -77, 75, -1852}, '{48, -87, -375, -237, 320, -16, -29, 172, -291, -30, -124, 232}, '{319, 2242, -647, 879, -1738, 52, -38, 530, -1267, 42, -613, 238}, '{371, 206, -292, 423, -383, -298, -220, -22, 80, -130, -419, -51}};
    localparam int LAYER_FIRST_WEIGHT_QUANTIZER   = -13;
    localparam int LAYER_FIRST_ACT_QUANTIZER   = -13;
    localparam int LAYER_FIRST_OUT_QUANTIZER   = -15;
    localparam signed [0:-13] LAYER_LAST_BIAS [0:1]  = '{415, -80};
    localparam signed [0:-13] LAYER_LAST_WEIGHT [0:1][0:23]  = '{'{-798, -4775, 1162, -1784, 3577, -167, -451, -102, 2266, -366, 0, -113, 71, -549, 2634, 149, 98, -288, -158, -40, 2253, -33, -247, 1}, '{1635, 1364, -230, -3359, -708, -571, -644, -1261, -760, 428, -8190, -29, 42, -119, -114, 262, 20, 559, 149, 162, 184, 101, 119, 1737}};
    localparam int LAYER_LAST_WEIGHT_QUANTIZER   = -13;
    localparam int LAYER_LAST_ACT_QUANTIZER   = -13;
    localparam int LAYER_LAST_OUT_QUANTIZER   = -15;
    localparam string LAYER_TYPES [1:BACKBONE_LAYERS+1] = '{"INT_LINEAR", "INT_LINEAR"};
    // The names of the layers are: BACKBONE.FC_HID.0, BACKBONE.FC_OUT;
    localparam int LAYER_ORDER [0:BACKBONE_LAYERS+1] = {0, 1, 2}; // The order of the layers in LAYER_NAMES
        // IMPORTANT: the order of the layers in the code of the backbone is detemined based on what is defined first in the backbone,
        // make sure that this order is correct, or change the backbone if needed
endpackage
