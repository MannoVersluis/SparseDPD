
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
    localparam string FEATURE_EXTRACTION = "1_3_INV"; // to use abs2_4 or abs1_3 for feature augmentation
    localparam DENSE = 2; // 0 for no dense connection, 1 for sending FEx layer output to output layer input
    localparam string ACTIVATION_FUNCTION [1:BACKBONE_LAYERS] = '{BACKBONE_LAYERS{"RELU"}};
    localparam signed [0:13] LAYER_FIRST_BIAS [0:11]  = '{288, -153, 384, 362, -90, 1134, -52, 198, 173, -313, 415, 19};
    localparam signed [0:13] LAYER_FIRST_WEIGHT [0:11][0:11]  = '{'{-82, -1387, -1424, 0, 0, 0, 0, 1230, 0, 0, 0, 1374}, '{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, '{1593, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, '{0, 0, 2052, 0, 0, 0, 0, 0, 1581, 0, 0, 0}, '{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, '{0, 0, -1264, 0, 0, 0, 0, 0, 0, -1142, 0, 0}, '{0, 0, 0, -1165, 1716, 0, -1684, 0, 1206, 1307, 0, 0}, '{0, 0, 1935, 0, 0, 0, 0, 0, 1904, 0, 0, 0}, '{-673, 0, 1797, 0, 0, 0, 0, 0, 2267, 1499, 0, 1531}, '{0, 0, 0, 0, 873, 0, 0, 0, 1083, 0, -1225, 0}, '{-1367, 0, 0, 0, 0, 0, 0, 0, 0, 0, 874, 4198}, '{0, 0, 0, -3383, 6429, 0, 0, 0, -960, 0, 0, 1477}};
    localparam int LAYER_FIRST_WEIGHT_QUANTIZER   = -13;
    localparam int LAYER_FIRST_ACT_QUANTIZER   = -13;
    localparam int LAYER_FIRST_OUT_QUANTIZER   = -15;
    localparam signed [0:13] LAYER_LAST_BIAS [0:1]  = '{239, -206};
    localparam signed [0:13] LAYER_LAST_WEIGHT [0:1][0:23]  = '{'{-2719, 0, 0, 1699, 0, -1993, 0, 2035, 1760, 0, 0, -1166, 0, 0, 2275, 952, 0, 0, 0, 0, 2383, 0, 0, 0}, '{1664, 0, -1332, 0, 0, 0, -6675, 0, 844, 2477, 3634, -4067, 0, 0, 0, -871, 1491, 0, 0, 0, 0, 0, 0, 0}};
    localparam int LAYER_LAST_WEIGHT_QUANTIZER   = -13;
    localparam int LAYER_LAST_ACT_QUANTIZER   = -13;
    localparam int LAYER_LAST_OUT_QUANTIZER   = -15;
    localparam string LAYER_TYPES [1:BACKBONE_LAYERS+1] = '{"INT_LINEAR", "INT_LINEAR"};
    // The names of the layers are: BACKBONE.FC_HID.0, BACKBONE.FC_OUT;
    localparam int LAYER_ORDER [0:BACKBONE_LAYERS+1] = {0, 1, 2}; // The order of the layers in LAYER_NAMES
        // IMPORTANT: the order of the layers in the code of the backbone is detemined based on what is defined first in the backbone,
        // make sure that this order is correct, or change the backbone if needed
endpackage
