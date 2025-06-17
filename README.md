# Systemverilog-DPD
This repository constains the rtl code of the SpardeDPD neural network
It has only been tested in Vivado 2024.2
When running the code, please keep in mind that no reset was included since the design is implemented as a one-directional pipeline, making the outputs only dependent on the current and memory_depth previous inputs.
Due to this, the design will give incorrect outputs until the inputs have propagated to the output.

design_1_wrapper.v is the top-level file for the test on the FPGA using Vitis that stores inputs and corresponding outputs in memory and uses the PS part of the chip to send inputs and outputs to and from the PL part of the chip.

main.sv is the top-level file for out-of-context implementation without a testbench, or for potential implementation on an FPGA with enough I/O ports.

main_parallel.sv is the top-level file that can implement multiple instances of the PNTDNN model in parallel for higher throughput

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

# Vitis implementation
The Vitis implementation to test the design uses Vitis Classic 2024.2
Due to the small amount of I/O ports on the Xilinx Zynq-7Z010 FPGA, the memory of the device is used to store a number of inputs with their corresponding output. These inputs and outputs are then used to test the device.
The Vitis implementation prints the sent inputs and received outputs to the terminal and checks if the outputs are equal to the predefined outputs in the DPD_hardware_test.c file.
# Updating Vitis
This needs to be done if any of the code, parameters, weights of biases is changed.
- Update constraints used in Vivado
- Update the bitstream used in Vitis
- Update the desired inputs and outputs, DPD_hardware_test_stim and DPD_hardware_test_gold_rnn, in DPD_hardware_test.c

