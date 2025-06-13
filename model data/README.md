This repository constains the rtl code of the SpardeDPD neural network
It has only been tested in Vivado 2024.2

Bit-accurate example model of 1, 2 and 3 layers are given in the model date folder.
To use those example models, refer to Changing Dataset below.

# Changing Dataset
- Update weight and bias parameters in parameter_weights_pack.sv
- Update desired input and output in the xsim folder in the simulation directory
# Changing Model Size
- Update BACKBONE_LAYERS in parameter_weights_pack.sv
- Update LAYER_SIZES in parameter_weights_pack.sv
- Update PARALLEL_INPUTS in parameter_weights_pack.sv if this is set to 
- Update INPUTS_SIZE in parameter_weights_pack.sv
- Update WEIGHTS_SIZE in parameter_weights_pack.sv
- Update weight and bias parameters in parameter_weights_pack.sv
- Update desired input and output in the xsim folder in the simulation directory
# Changing Activation Function
- Add the activation function module to activation_functions.sv
- Make the activation function module selectable from the activation_function module in activation_functions.sv
- Update ACTIVATION_FUNCTION in parameter_weights_pack.sv
# Changing Neural Network Layer Type
- Add module with new neural network layer
- Make neural network layer module selectable from backbones.sv
- Update LAYER_TYPES in parameter_weights_pack.sv
# Changing Adder Tree
The adder tree is used for the fully connected neural network layer type.
- Add module with new adder tree to adder_trees.sv
- Make adder tree module selectable from adder_trees.sv
- Update ADDER_TREE in parameter_weights_pack.sv
# Changing Feature Extraction Layer
- Add module with new feature extraction layer
- Make feature extraction layer module selectable from feature_extraction.sv
- Update FEATURE_EXTRACTION in parameter_weights_pack.sv
