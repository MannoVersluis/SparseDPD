
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
    localparam PHASE_NORMALIZATION = 1; // 1 for true, 0 for false
    localparam DENSE = 2; // 0 for no dense connection, 1 for sending FEx layer output to output layer input
    localparam string ACTIVATION_FUNCTION [1:BACKBONE_LAYERS] = '{BACKBONE_LAYERS{"RELU"}};
    localparam signed [0:13] LAYER_FIRST_WEIGHT [0:11][0:11]  = '{'{-1187, -54, 310, -1520, -1303, -1934, -83, -979, 695, -1874, 1832, -851}, '{175, -18, -1735, 2313, -1043, 996, -452, -1344, 1599, 1168, -2207, 267}, '{955, -275, -738, 757, -405, 1882, 412, 1850, 1296, 395, 1287, 517}, '{-88, 1268, 2490, 1579, -393, 2132, 2357, -416, -320, 2206, 1162, 1779}, '{-2234, -1638, 659, -1604, -1294, -366, -1625, -1759, 249, -2266, -2250, -1201}, '{1315, 1347, -1411, 2780, 2705, 1170, -1339, -257, 577, -1297, 1124, 233}, '{-634, 1115, -721, 2738, -1452, 376, -445, -1567, 1941, 1328, -179, 1890}, '{2191, -449, 907, -2385, -1996, 1355, -321, 487, 724, -854, 1270, 1325}, '{-1554, -649, -1532, 287, 295, -817, 722, 1084, 1269, -1959, 889, 1552}, '{1484, 282, -331, -450, 1004, -37, 1126, -273, 2638, 2452, -272, 2461}, '{-1386, 1566, 3143, -922, 148, 73, -2848, -612, 4163, 375, 3545, 2253}, '{614, 2022, 1498, -300, -606, -2082, 1222, 207, -754, -633, -1517, 1112}};
    localparam signed [0:13] LAYER_FIRST_BIAS [0:11]  = '{349, -911, 1015, 1367, -537, 1500, -1385, -47, 1527, -2834, -1120, -1835};
    localparam int LAYER_FIRST_WEIGHT_QUANTIZER   = -13;
    localparam int LAYER_FIRST_ACT_QUANTIZER   = -13;
    localparam int LAYER_FIRST_OUT_QUANTIZER   = -15;
    localparam signed [0:13] LAYER_LAST_WEIGHT [0:1][0:23]  = '{'{-2640, 92, -3434, 4218, -3335, -1342, 2007, 3108, 1721, -1214, 231, -2435, -1811, 724, 1784, 2292, -497, -73, -520, 1668, 2428, 3336, -2515, 299}, '{2321, 2935, -4242, -1880, -3698, 911, -158, -1843, 1623, 3667, 3962, -685, 1397, -1643, 87, -2232, 3904, 3102, 3015, 590, 868, 1171, -3414, -2083}};
    localparam signed [0:13] LAYER_LAST_BIAS [0:1]  = '{-90, 159};
    localparam int LAYER_LAST_WEIGHT_QUANTIZER   = -13;
    localparam int LAYER_LAST_ACT_QUANTIZER   = -13;
    localparam int LAYER_LAST_OUT_QUANTIZER   = -15;
    localparam string LAYER_TYPES [1:BACKBONE_LAYERS+1] = '{"INT_LINEAR", "INT_LINEAR"};
    // The names of the layers are: BACKBONE.FC_HID.0, BACKBONE.FC_OUT;
    localparam int LAYER_ORDER [0:BACKBONE_LAYERS+1] = {0, 1, 2}; // The order of the layers in LAYER_NAMES
        // IMPORTANT: the order of the layers in the code of the backbone is detemined based on what is defined first in the backbone,
        // make sure that this order is correct, or change the backbone if needed
endpackage
