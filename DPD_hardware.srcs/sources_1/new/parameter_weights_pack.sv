
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
    parameter int BACKBONE_LAYERS = 2; // amount of layers in the backbone,
        //not including the feature extraction layer, or the output layer that determines I and Q
    parameter int LAYER_SIZES [BACKBONE_LAYERS+1:0] = {2, 4, 4, 8}; // amount of neurons/outputs in each layer
    parameter int INPUTS_SIZE = 12;
    parameter int WEIGHTS_SIZE [1:BACKBONE_LAYERS+1] = '{BACKBONE_LAYERS+1{12}}; // is also the size of the bias
    parameter int ADDER_TREE [1:BACKBONE_LAYERS+1] = '{BACKBONE_LAYERS+1{1}};
    parameter int PARALLEL_INPUTS = 2;
    parameter string LAYER_BACKBONE = "fc_no_rnn";
    parameter string FEATURE_EXTRACTION = "2_4"; // to use abs2_4 or abs1_3 for feature augmentation
    parameter string ACTIVATION_FUNCTION [1:BACKBONE_LAYERS] = '{BACKBONE_LAYERS{"RELU"}};
    parameter [0:11] LAYER_FIRST_WEIGHT [0:3][0:7]  = '{'{354, 988, -465, 296, 119, 920, 174, 903}, '{424, -599, 496, 1414, -133, 119, -7, 367}, '{-14, -1043, -475, -617, 730, 86, -195, 858}, '{-273, 595, -192, 82, -261, 238, 182, -493}};
    parameter [0:11] LAYER_FIRST_BIAS [0:3]  = '{451, 702, 300, -226};
    parameter int LAYER_FIRST_WEIGHT_QUANTIZER   = -11;
    parameter int LAYER_FIRST_ACT_QUANTIZER   = -11;
    parameter int LAYER_FIRST_OUT_QUANTIZER   = -15;
    parameter [0:11] LAYER_MID_WEIGHT [0:0][0:3][0:3]  = '{'{'{671, 1980, 323, -447}, '{1543, -418, -924, -226}, '{-660, 438, 97, -349}, '{-252, -342, 1590, 845}}};
    parameter [0:11] LAYER_MID_BIAS [0:0][0:3]  = '{'{-473, 587, -668, 302}};
    parameter int LAYER_MID_WEIGHT_QUANTIZER [0:0]  = '{-11};
    parameter int LAYER_MID_ACT_QUANTIZER [0:0]  = '{-11};
    parameter int LAYER_MID_OUT_QUANTIZER [0:0]  = '{-15};
    parameter [0:11] LAYER_LAST_WEIGHT [0:1][0:3]  = '{'{-624, 1849, 1703, -980}, '{1431, -811, 437, -1067}};
    parameter [0:11] LAYER_LAST_BIAS [0:1]  = '{-276, 178};
    parameter int LAYER_LAST_WEIGHT_QUANTIZER   = -11;
    parameter int LAYER_LAST_ACT_QUANTIZER   = -11;
    parameter int LAYER_LAST_OUT_QUANTIZER   = -15;
    parameter string LAYER_TYPES [1:BACKBONE_LAYERS+1] = '{"INT_LINEAR", "INT_LINEAR", "INT_LINEAR"};
    // The names of the layers are: BACKBONE.FC_HID.0, BACKBONE.FC_HID.1, BACKBONE.FC_OUT;
    parameter int LAYER_ORDER [0:BACKBONE_LAYERS+1] = {'0, 1, 2, 3}; // The order of the layers in LAYER_NAMES
        // IMPORTANT: the order of the layers in the code of the backbone is detemined based on what is defined first in the backbone,
        // make sure that this order is correct, or change the backbone if needed
endpackage
