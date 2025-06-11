
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
    localparam int LAYER_SIZES [BACKBONE_LAYERS+1:0] = {2, 12, 12, 12}; // amount of neurons/outputs in each layer
    localparam int INPUTS_SIZE = 14;
    localparam int WEIGHTS_SIZE [1:BACKBONE_LAYERS+1] = '{BACKBONE_LAYERS+1{14}}; // is also the size of the bias
    localparam int ADDER_TREE [1:BACKBONE_LAYERS+1] = '{BACKBONE_LAYERS+1{1}};
    localparam int PARALLEL_INPUTS = 3;
    localparam string FEATURE_EXTRACTION = "1_3_INV"; // to use abs2_4 or abs1_3 for feature augmentation
    localparam DENSE = 2; // 0 for no dense connection, 1 for sending FEx layer output to output layer input
    localparam string ACTIVATION_FUNCTION [1:BACKBONE_LAYERS] = '{BACKBONE_LAYERS{"RELU"}};
    logic signed [0:13] LAYER_FIRST_WEIGHT [0:11][0:11]  = '{'{-1178, 1394, 2036, -263, -66, -1934, -385, 413, 2421, -1649, 1513, -1709}, '{175, -18, -1735, 2313, -1043, 996, -452, -1344, 1599, 1168, -2207, 267}, '{287, -644, -920, 1709, 478, 1882, -270, 1475, 1114, -282, 1573, 1496}, '{-618, 778, 1976, 1490, -508, 2132, 1830, -905, -835, 1989, 999, 1577}, '{-2234, -1638, 862, -1604, -1294, -366, -1625, -1759, 452, -2266, -2250, -798}, '{2025, 2189, -516, 631, 591, 1170, -628, 584, 1471, -982, 1475, 588}, '{-708, 1045, -838, 2053, -2122, 376, -520, -1636, 1825, 1318, -187, 1826}, '{1286, -1365, -66, -1223, -889, 1355, -1218, -426, -248, -746, 1391, 1456}, '{-939, -28, -1029, 339, 387, -817, 1333, 1704, 1772, -1004, 1494, 1708}, '{1556, 118, -690, -19, 1466, -37, 1187, -440, 2280, 1546, -1506, 976}, '{-64, 363, 1380, 950, 2688, 73, -1527, -1817, 2401, -414, 2018, 369}, '{565, 2001, 1502, 2705, 2378, -2082, 1173, 186, -749, -930, -1722, 995}};
    logic signed [0:13] LAYER_FIRST_BIAS [0:11]  = '{-112, -842, 98, -1257, -1027, -1066, -2148, 1128, 1460, 571, 1216, -2144};
    localparam int LAYER_FIRST_WEIGHT_QUANTIZER   = -13;
    localparam int LAYER_FIRST_ACT_QUANTIZER   = -13;
    localparam int LAYER_FIRST_OUT_QUANTIZER   = -15;
    logic signed [0:13] LAYER_MID_WEIGHT [0:0][0:11][0:11]  = '{'{'{1001, 2091, -1208, -795, -1449, 1257, 2311, -977, 1393, -474, -1863, -1094}, '{164, 1156, 2090, 587, -2262, -195, -987, -459, -1967, -341, 1345, -2242}, '{564, 828, -580, -1691, 978, -1480, -1237, -613, 517, -1879, -410, -22}, '{1734, -1974, -2145, -1391, 494, 280, 222, -1522, 707, -1202, -2035, 1870}, '{-1520, 2199, -1901, -63, -2309, 2183, -2309, -1117, 983, 1569, 584, 207}, '{2627, -1537, -1207, 380, 832, 1014, -237, -164, -502, 869, 1220, 2163}, '{-4817, 122, 1176, 1626, -2235, -360, -1831, 876, -388, -1263, 1162, 1227}, '{1144, -341, 927, -901, 277, -1953, 1826, 1701, 1899, 444, 554, 667}, '{-991, -1256, 1246, 955, -553, 2229, 2, -2312, -2115, -296, 598, 1503}, '{-3988, -1852, 817, -2379, 1324, -533, -43, -1673, 1691, -1958, 1028, 772}, '{-1566, 537, 1066, 1261, -922, -552, -1303, 1951, -73, -2011, 1911, -431}, '{-887, -630, 25, 2106, 1333, -1816, -446, -1978, -1954, -1921, 390, -712}}};
    logic signed [0:13] LAYER_MID_BIAS [0:0][0:11]  = '{'{-2242, 1383, -1486, -936, -1291, 1997, 854, -2518, 599, 1543, -576, 166}};
    localparam int LAYER_MID_WEIGHT_QUANTIZER [0:0]  = '{-13};
    localparam int LAYER_MID_ACT_QUANTIZER [0:0]  = '{-13};
    localparam int LAYER_MID_OUT_QUANTIZER [0:0]  = '{-15};
    logic signed [0:13] LAYER_LAST_WEIGHT [0:1][0:35]  = '{'{3221, -106, 1404, -726, 2210, -5, 691, -474, 2784, 1379, 1488, -2273, 402, -1306, 572, 1295, -440, 2543, -2140, -1218, 2614, -3121, -332, -2223, 614, -2913, 1447, 1032, -1317, 1610, 1612, -1330, 1960, -2042, 1075, 1689}, '{516, -158, 684, 2632, 112, 1829, 2686, -721, 1561, -1801, -2673, -544, 791, -2567, -2087, 2548, -3108, -735, 1127, -3245, -833, 2761, 1562, -920, 1729, -1747, 2374, 210, 1, -3091, -956, -1611, 730, -336, -2849, 2788}};
    logic signed [0:13] LAYER_LAST_BIAS [0:1]  = '{-184, 169};
    localparam int LAYER_LAST_WEIGHT_QUANTIZER   = -13;
    localparam int LAYER_LAST_ACT_QUANTIZER   = -13;
    localparam int LAYER_LAST_OUT_QUANTIZER   = -15;
    localparam string LAYER_TYPES [1:BACKBONE_LAYERS+1] = '{"INT_LINEAR", "INT_LINEAR", "INT_LINEAR"};
    // The names of the layers are: BACKBONE.FC_HID.0, BACKBONE.FC_HID.1, BACKBONE.FC_OUT;
    localparam int LAYER_ORDER [0:BACKBONE_LAYERS+1] = {0, 1, 2, 3}; // The order of the layers in LAYER_NAMES
        // IMPORTANT: the order of the layers in the code of the backbone is detemined based on what is defined first in the backbone,
        // make sure that this order is correct, or change the backbone if needed
endpackage
