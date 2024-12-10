
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

// IMPORTANT: the order of the layers in the code of the backbone can't be determined automatically,
// make sure that the order in LAYER_ORDER of the layer names in LAYER_NAMES is correct, or change it manually if needed

package parameter_weights_pack;
    parameter int BACKBONE_LAYERS = 2; // amount of layers in the backbone,
        //not including the feature extraction layer, or the output layer that determines I and Q
    parameter int LAYER_SIZES [BACKBONE_LAYERS+1:0] = {2, 15, 15, 36}; // amount of neurons/outputs in each layer
    parameter int INPUTS_SIZE [BACKBONE_LAYERS+1:0] = '{8};
    parameter int WEIGHTS_SIZE [BACKBONE_LAYERS+1:0] = '{8}; // is also the size of the bias
    parameter int OUTPUTS_SIZE = 16;
    parameter int ADDER_TREE [BACKBONE_LAYERS+1:0] = '{0};
    parameter int MODEL_BACKBONE = 0; // update this in python (and replace parameter with localparam)
    parameter string ACTIVATION_FUNCTION [BACKBONE_LAYERS+1:0] = '{"RELU"}; // IMPORTANT: make sure the correct activation function is defined here
    
    parameter [7:0] BACKBONEFC_HID0WEIGHT [14:0][35:0] = '{'{3, 14, -5, 26, -5, 12, -18, 3, 10, -3, -9, 18, -10, -8, -11, -6, 8, -10, 0, -3, 15, -11, -7, 13, -7, 17, -13, -5, -9, 7, 6, -12, 13, -4, -10, -6}, '{12, 17, 6, -1, 8, -15, -17, -9, -14, 12, 0, -11, -6, -4, 14, 15, -20, 8, 6, 5, -7, 1, 1, 16, -25, -12, -14, -12, 2, 9, -21, 8, 12, -16, 0, -8}, '{-4, -16, -13, -19, -22, 24, 5, 8, -1, 22, -2, 1, -10, -16, 17, -20, -9, -6, 20, 14, -11, 23, -16, 6, 1, 2, 24, 27, 9, -2, 22, 20, 14, 4, 9, 29}, '{-10, -13, -25, -19, 6, -4, 2, 16, -3, 9, 3, 17, 19, 12, 11, -25, -15, 3, -4, 15, -11, 9, 17, -22, 14, 15, -3, 32, -11, -8, -8, -7, -1, -4, -12, 10}, '{10, 10, 5, -1, 3, -17, 9, -19, -5, -10, 10, -7, -16, -3, -23, -10, 2, -1, -5, 14, -12, -6, 25, 9, 1, 14, 17, -9, -10, -2, 8, -5, 9, -21, -11, 19}, '{-10, 8, 17, 4, -11, -16, -4, 11, 34, -1, 2, -7, 6, -4, 14, -14, 11, 8, 1, 19, -21, 16, 15, -7, -8, 4, 46, -38, -3, 19, 36, -1, -25, -23, 27, 14}, '{22, 0, -3, -23, 19, 2, 43, -6, -30, 5, 2, -6, -25, 12, 23, 15, 28, 6, -31, -16, 16, 10, 9, 33, 29, 20, -21, -18, 8, 49, 26, 22, 0, -3, 9, -18}, '{-10, 16, -1, -16, 16, 1, 9, -20, 2, 11, -5, -14, 15, 8, 4, 3, -2, 12, -7, -14, 6, 4, 6, -4, -5, -4, 4, -18, -22, 6, -14, -4, 4, 1, 12, 1}, '{-4, -9, -5, -1, 5, -32, -5, -4, 10, 9, -22, -20, 11, -14, 12, 2, 0, 17, -7, 24, 13, -7, 14, -1, -8, 9, 9, 24, 23, 5, -11, 3, 3, 15, 13, 25}, '{-5, -17, -13, -16, 5, 21, 9, 23, -5, -11, 4, -16, -8, 16, -7, 11, -6, -8, 42, 2, 0, 4, 13, -17, 1, -5, 13, 12, -7, 4, 1, 14, 42, 9, -25, -26}, '{-1, 5, 20, -1, -13, -2, 22, -5, -14, 6, -3, -24, 13, 9, 18, 11, -3, -7, 4, -6, 9, -13, -4, 15, 7, -8, -23, 12, 0, -13, 30, 22, -4, -12, 22, -3}, '{-19, 6, -11, -6, -21, -30, -12, 5, -5, 16, -5, -12, 5, -22, -14, 5, -21, 11, 6, -13, -15, 13, 16, 1, -15, -6, 13, 3, 11, 11, 5, 14, 20, 16, 28, 8}, '{-8, -2, 7, 7, -10, -18, -20, 17, -9, 2, -8, -6, 8, 11, -8, -9, 14, -11, -18, -6, 16, 0, -2, -8, 8, -14, 11, 5, 1, 0, -17, 10, 6, -21, -23, -8}, '{15, -12, 16, -16, -26, 3, -19, -5, -5, 0, -16, -17, 12, 1, -8, 6, -11, 6, -3, 16, -11, 7, 21, 29, -7, 12, 10, 1, -19, 18, -5, -12, -2, 10, -17, 12}, '{-7, 3, 15, 6, -16, -4, 5, -20, -1, -7, 0, 12, -12, -9, 15, -16, 17, -16, -6, -1, 3, -18, -2, 4, 13, -21, -16, 1, -6, -19, -22, -23, -19, -13, -18, -21}};
    parameter [7:0] BACKBONEFC_HID0BIAS [14:0] = '{8, -23, 3, -3, -6, 2, 20, -12, 5, -4, 21, 18, 16, 3, 1};
    parameter int  BACKBONEFC_HID0WEIGHT_QUANTIZER = -7;
    parameter int  BACKBONEFC_HID0ACT_QUANTIZER = -7;
    parameter int  BACKBONEFC_HID0OUT_QUANTIZER = -15;
    parameter [7:0] BACKBONEFC_HID1WEIGHT [14:0][14:0] = '{'{-26, 19, -14, -6, 10, -46, 8, 18, -25, 12, 0, 11, 17, 5, -2}, '{-25, 16, 24, -8, -34, 59, -15, 8, -1, 10, 22, 30, -2, 29, 20}, '{6, -32, -5, -27, 18, 60, -5, 9, 10, 37, -29, -5, -29, 0, 2}, '{6, -25, -7, -30, -31, 2, -36, 7, -34, -25, -9, -34, 24, 24, -20}, '{11, 12, 19, 4, -21, 55, -32, -8, 11, -4, -7, -21, 5, 3, 31}, '{-8, 20, 10, -9, -9, 24, -23, -7, 15, 32, -6, 18, 22, 11, 16}, '{14, 27, -31, 9, -4, -16, -37, 18, 26, -23, 14, 14, 1, -4, 22}, '{-1, -4, -15, 13, 4, 1, 34, 11, -18, -2, 29, 11, 6, 26, -24}, '{-12, -20, 38, -26, -4, -1, -17, 10, -7, 42, -9, -10, 6, 23, -4}, '{26, -16, 4, 10, 13, -12, 34, -24, -19, -10, 5, 22, 28, 20, -11}, '{-27, -31, 12, -30, -33, -17, -28, -13, -21, -18, 30, -7, 26, 0, -5}, '{-12, -19, -35, 27, -9, -16, 55, 3, -5, -40, -18, -23, 34, 25, 7}, '{-26, -13, -23, 13, -19, 8, -27, 14, 12, -5, -15, 4, -6, -27, 28}, '{-17, 24, -26, -6, 11, -62, 38, -23, 3, -12, 26, 29, 6, -3, -18}, '{14, -21, 24, -11, 16, 54, -3, -1, 14, -15, 11, -3, 6, -2, -17}};
    parameter [7:0] BACKBONEFC_HID1BIAS [14:0] = '{26, 5, 13, -2, 10, 14, 21, 22, 8, 12, -11, 23, 10, 22, -5};
    parameter int  BACKBONEFC_HID1WEIGHT_QUANTIZER = -7;
    parameter int  BACKBONEFC_HID1ACT_QUANTIZER = -7;
    parameter int  BACKBONEFC_HID1OUT_QUANTIZER = -15;
    parameter [7:0] BACKBONEFC_OUTWEIGHT [1:0][65:0] = '{'{-27, 25, 25, 28, 4, 3, -9, 5, 19, -6, -24, 38, 16, -12, 6, -6, 6, 25, -28, 41, 30, 3, -14, 13, -22, 25, -19, 10, -36, 28, 19, 22, -4, 15, 1, 23, 24, -28, 10, -5, -14, 23, -11, 0, 17, 18, 12, -7, -28, -32, 15, 3, -21, 18, 37, 26, 1, 10, -20, 22, -27, 26, -18, -13, -27, -2}, '{-7, -21, 24, 17, -32, -32, 14, 35, -17, 26, -2, -23, 18, -38, 29, 34, -18, 10, 35, 6, 10, 10, -19, 5, -24, 32, -20, 3, -15, 11, 3, 26, -3, -10, 23, -19, -32, 11, -28, -7, -4, 8, -9, -11, -10, 22, 4, -18, -26, -1, 8, -6, 17, 28, 7, 9, 17, -11, 5, 27, -22, 1, -14, -28, 17, 23}};
    parameter [7:0] BACKBONEFC_OUTBIAS [1:0] = '{16, 10};
    parameter int  BACKBONEFC_OUTWEIGHT_QUANTIZER = -7;
    parameter int  BACKBONEFC_OUTACT_QUANTIZER = -7;
    parameter int  BACKBONEFC_OUTOUT_QUANTIZER = -15;
    parameter string LAYER_NAMES [BACKBONE_LAYERS:0] = '{"BACKBONEFC_HID0", "BACKBONEFC_HID1", "BACKBONEFC_OUT"};
    parameter string LAYER_TYPES [BACKBONE_LAYERS:0] = '{"INT_LINEAR", "INT_LINEAR", "INT_LINEAR"};
    parameter int LAYER_ORDER [BACKBONE_LAYERS:0] = {0, 1, 2}; // The order of the layers in LAYER_NAMES
        // IMPORTANT: the order of the layers in the code of the backbone can't be determined automatically,
        // make sure that this order is correct, or change it manually if needed
        // the default order is the order in which the layers are defined in the backbone of the model
endpackage
