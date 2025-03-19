#ifndef EDGEDRNN_TEST_H
#define EDGEDRNN_TEST_H
/*
 * Var Type: General Matrix
 * Var Name: edgedrnn_test_stim
 * Bit Width: 16
 * Dimension: (8, 1000)
 */
#define DPD_HARDWARE_TEST_STIM_NUM_ROWS 2
#define DPD_HARDWARE_TEST_STIM_NUM_COLS 1000
#define DPD_HARDWARE_TEST_STIM_MAT_SIZE 2000
extern const short DPD_hardware_test_stim[DPD_HARDWARE_TEST_STIM_MAT_SIZE];
/*
 * Var Type: General Matrix
 * Var Name: edgedrnn_test_gold_fc
 * Bit Width: 16
 * Dimension: (1, 1000)
 */
//#define EDGEDRNN_TEST_GOLD_FC_NUM_ROWS 1
//#define EDGEDRNN_TEST_GOLD_FC_NUM_COLS 1000
//#define EDGEDRNN_TEST_GOLD_FC_MAT_SIZE 1000
//extern const short edgedrnn_test_gold_fc[EDGEDRNN_TEST_GOLD_FC_MAT_SIZE];
/*
 * Var Type: General Matrix
 * Var Name: edgedrnn_test_gold_rnn
 * Bit Width: 16
 * Dimension: (16, 1000)
 */
#define DPD_HARDWARE_TEST_GOLD_RNN_NUM_ROWS 2
#define DPD_HARDWARE_TEST_GOLD_RNN_NUM_COLS 1000
#define DPD_HARDWARE_TEST_GOLD_RNN_MAT_SIZE 2000
extern const int DPD_hardware_test_gold_rnn[DPD_HARDWARE_TEST_GOLD_RNN_MAT_SIZE];
#endif
