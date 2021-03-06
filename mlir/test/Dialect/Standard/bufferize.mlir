// RUN: mlir-opt %s -std-bufferize | FileCheck %s

// CHECK-LABEL:   func @dim(
// CHECK-SAME:              %[[TENSOR:.*]]: tensor<f32>,
// CHECK-SAME:              %[[INDEX:.*]]: index) -> index {
// CHECK:           %[[MEMREF:.*]] = memref.buffer_cast %[[TENSOR]] : memref<f32>
// CHECK:           %[[EXTENT:.*]] = memref.dim %[[MEMREF]], %[[INDEX]] : memref<f32>
// CHECK:           return %[[EXTENT]] : index
func @dim(%arg0: tensor<f32>, %arg1: index) -> index {
  %0 = memref.dim %arg0, %arg1 : tensor<f32>
  return %0 : index
}

// CHECK-LABEL:   func @select(
// CHECK-SAME:                 %[[PRED:.*]]: i1,
// CHECK-SAME:                 %[[TRUE_VAL:.*]]: tensor<f32>,
// CHECK-SAME:                 %[[FALSE_VAL:.*]]: tensor<f32>) -> tensor<f32> {
// CHECK:           %[[TRUE_VAL_MEMREF:.*]] = memref.buffer_cast %[[TRUE_VAL]] : memref<f32>
// CHECK:           %[[FALSE_VAL_MEMREF:.*]] = memref.buffer_cast %[[FALSE_VAL]] : memref<f32>
// CHECK:           %[[RET_MEMREF:.*]] = select %[[PRED]], %[[TRUE_VAL_MEMREF]], %[[FALSE_VAL_MEMREF]] : memref<f32>
// CHECK:           %[[RET:.*]] = memref.tensor_load %[[RET_MEMREF]] : memref<f32>
// CHECK:           return %[[RET]] : tensor<f32>
func @select(%arg0: i1, %arg1: tensor<f32>, %arg2: tensor<f32>) -> tensor<f32> {
  %0 = select %arg0, %arg1, %arg2 : tensor<f32>
  return %0 : tensor<f32>
}
