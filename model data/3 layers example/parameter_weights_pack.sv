
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
    localparam int BACKBONE_LAYERS = 3; // amount of layers in the backbone,
        //not including the feature extraction layer, or the output layer that determines I and Q
    localparam int LAYER_SIZES [BACKBONE_LAYERS+1:0] = {2, 12, 12, 12, 12}; // amount of neurons/outputs in each layer
    localparam int INPUTS_SIZE = 14;
    localparam int WEIGHTS_SIZE [1:BACKBONE_LAYERS+1] = '{BACKBONE_LAYERS+1{14}}; // is also the size of the bias
    localparam int ADDER_TREE [1:BACKBONE_LAYERS+1] = '{BACKBONE_LAYERS+1{1}};
    localparam int PARALLEL_INPUTS = 3;
    localparam string FEATURE_EXTRACTION = "1_3_INV";
    localparam DENSE = 2; // 0 for no dense connection, 1 for sending FEx layer output to output layer input
    localparam string ACTIVATION_FUNCTION [1:BACKBONE_LAYERS] = '{BACKBONE_LAYERS{"RELU"}};
    logic signed [0:13] LAYER_FIRST_WEIGHT [0:11][0:11]  = '{'{-1139, 620, 1720, -858, -703, -1934, -53, -309, 2105, -2101, 2069, 248}, '{90, -192, -2524, 816, -2532, 996, -476, -1498, 810, 935, -2520, -723}, '{261, -707, -930, 2579, 1351, 1882, -292, 1413, 1104, -456, 1458, 1525}, '{-669, 520, 1806, 2264, 143, 2132, 1782, -1162, -1005, 1961, 781, 1411}, '{-2234, -1638, 862, -1604, -1294, -366, -1625, -1759, 452, -2266, -2250, -798}, '{2042, 1976, -748, 843, 745, 1170, -611, 371, 1240, -795, 1549, 701}, '{-947, 906, -991, 806, -3300, 376, -759, -1776, 1671, 1106, -307, 1694}, '{1469, -959, 350, -1187, -817, 1355, -1045, -23, 168, -589, 1771, 1848}, '{-1105, -417, -1458, -1212, -1176, -817, 1182, 1319, 1343, -1198, 1099, 1282}, '{1595, 100, -661, -81, 1354, -37, 1240, -454, 2308, 1610, -1447, 1124}, '{-254, 55, 876, 300, 2042, 73, -1701, -2121, 1896, -633, 1715, -138}, '{909, 2382, 1929, 3004, 2673, -2082, 1513, 565, -322, -595, -1352, 1413}};
    logic signed [0:13] LAYER_FIRST_BIAS [0:11]  = '{-6, 837, 547, 587, -2247, -957, 452, 2084, 1504, 541, -2610, 2256};
    localparam int LAYER_FIRST_WEIGHT_QUANTIZER   = -13;
    localparam int LAYER_FIRST_ACT_QUANTIZER   = -13;
    localparam int LAYER_FIRST_OUT_QUANTIZER   = -15;
    logic signed [0:13] LAYER_MID_WEIGHT [0:1][0:11][0:11]  = '{'{'{1001, 2091, -1208, -795, -1449, 1257, 2311, -977, 1393, -474, -1863, -1094}, '{2188, 1156, 2253, 850, -2262, -793, -1140, -529, -1885, -264, 1457, -1989}, '{-1113, 2176, -648, -1810, 978, -1564, -1328, -647, 449, -1993, -554, -106}, '{172, -631, -2215, -1502, 494, 103, 139, -1546, 636, -1299, -2130, 1786}, '{-2496, 3459, -1805, -60, -2309, 2241, -2369, -1069, 1147, 1771, 704, 355}, '{2233, -124, -917, 536, 832, 2001, 369, 377, -157, 1163, 1558, 2370}, '{-2653, -126, 1077, 1585, -2235, -980, -2199, 576, -532, -1345, 1017, 1191}, '{97, 1099, 1030, -881, 277, -2121, 1879, 1832, 2020, 459, 554, 723}, '{-1931, -1379, 969, 607, -553, 1652, 35, -2367, -2305, -585, 575, 1153}, '{-2237, -1852, 907, -2229, 1324, -1031, -110, -1796, 1707, -1864, 1017, 922}, '{1691, -720, 1313, 1537, -922, -101, -711, 2127, 142, -1721, 2368, -217}, '{-887, -630, 25, 2106, 1333, -1816, -446, -1978, -1954, -1921, 390, -712}}'{'{124, 426, 2181, 2301, -242, -821, 818, -73, 843, -1129, -2126, -1346}, '{-1873, -665, -255, 563, 390, -638, 1240, -1525, 1265, -1753, 1815, 1922}, '{1667, -132, 887, 1826, 1353, -1419, -277, 1642, 2251, 1661, -953, -1790}, '{-260, -1826, 701, -735, -944, -2340, -838, 1980, 1345, -311, -1788, 1537}, '{-2282, 308, 1319, -415, 385, 229, 1885, -688, 251, 1044, -1012, 1033}, '{-1028, 895, -1160, -937, -1562, 200, 277, 2259, 646, -1933, 2055, 161}, '{962, -540, 1019, -138, 833, -1112, 1522, 413, 454, -260, 1953, 944}, '{1069, -1773, 209, -860, 529, 1409, -428, 1946, -1324, -970, 2034, -2202}, '{-346, -1615, 267, -2206, 1026, 537, -1552, 1233, 1271, -1101, 1327, -1625}, '{636, 1103, -1099, 1, 537, 2310, 150, 1713, 2293, -567, 1141, -1235}, '{-2043, -418, 575, -1942, -1516, 1789, -1990, -647, 796, -2344, -762, 1982}, '{1242, -669, 1348, -1228, 1833, 1020, 472, -2186, -335, -1187, 568, -125}}};
    logic signed [0:13] LAYER_MID_BIAS [0:1][0:11]  = '{'{-2064, -1736, 1937, 554, 441, -928, 1291, 1800, 246, -1135, 1175, 0}'{-1787, -388, -1657, 238, -168, 1172, 1739, 860, 456, 81, -24, 1932}};
    localparam int LAYER_MID_WEIGHT_QUANTIZER [0:1]  = '{-13'{-1787, -388, -1657, 238, -168, 1172, 1739, 860, 456, 81, -24, 1932}};
    localparam int LAYER_MID_ACT_QUANTIZER [0:1]  = '{-13'{-1787, -388, -1657, 238, -168, 1172, 1739, 860, 456, 81, -24, 1932}};
    localparam int LAYER_MID_OUT_QUANTIZER [0:1]  = '{-15'{-1787, -388, -1657, 238, -168, 1172, 1739, 860, 456, 81, -24, 1932}};
    logic signed [0:13] LAYER_LAST_WEIGHT [0:1][0:47]  = '{'{3312, -3180, 326, -1180, 774, 1379, -754, -724, -542, 915, -1804, 2564, 2542, 1683, -1127, -2244, -1328, 766, -133, -2106, -1201, -1504, 936, 2670, -2514, -1687, -1140, -1743, 2211, 2322, -1901, 1643, 2775, 2501, -467, 1240, 28, -839, 535, -564, -442, -2231, -2381, 1487, 2005, 1025, 1871, -2073}, '{-2631, -928, -201, 1529, -2233, 1133, -1754, -1484, 1785, 1421, -304, -1939, 1679, -73, -1044, 2049, 2515, 1189, 1280, -328, 1145, -1744, 1022, -1224, 726, -2710, -2469, 2534, -2088, -2043, -1000, 1012, 2113, -2339, 2536, 625, -1582, 1682, 1337, -1366, 2259, -2427, -2269, 1680, -976, -1795, 1642, 1088}};
    logic signed [0:13] LAYER_LAST_BIAS [0:1]  = '{97, 492};
    localparam int LAYER_LAST_WEIGHT_QUANTIZER   = -13;
    localparam int LAYER_LAST_ACT_QUANTIZER   = -13;
    localparam int LAYER_LAST_OUT_QUANTIZER   = -15;
    localparam string LAYER_TYPES [1:BACKBONE_LAYERS+1] = '{"INT_LINEAR", "INT_LINEAR", "INT_LINEAR", "INT_LINEAR"};
    // The names of the layers are: BACKBONE.FC_HID.0, BACKBONE.FC_HID.1, BACKBONE.FC_HID.2, BACKBONE.FC_OUT;
    localparam int LAYER_ORDER [0:BACKBONE_LAYERS+1] = {0, 1, 2, 3, 4}; // The order of the layers in LAYER_NAMES
        // IMPORTANT: the order of the layers in the code of the backbone is detemined based on what is defined first in the backbone,
        // make sure that this order is correct, or change the backbone if needed
endpackage
