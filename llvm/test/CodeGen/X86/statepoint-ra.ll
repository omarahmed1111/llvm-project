; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs -O3 -use-registers-for-deopt-values -restrict-statepoint-remat=true < %s 2>&1 | FileCheck %s

target triple = "x86_64-unknown-linux-gnu"

; CHECK-NOT: error: ran out of registers during register allocation

define void @barney(i8 addrspace(1)* %arg, double %arg1, double %arg2, double %arg3, double %arg4, double %arg5, double %arg6, double %arg7, double %arg8, double %arg9, double %arg10, double %arg11, double %arg12) gc "statepoint-example" personality i32* ()* @widget {
bb:
  %tmp = call coldcc token (i64, i32, void ()*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidf(i64 2882400000, i32 0, void ()* nonnull @blam, i32 0, i32 0, i32 0, i32 0) [ "deopt"(i32 0, i32 1, i32 0, i32 0, i32 0, i32 26, i32 0, i32 0, i8 addrspace(1)* %arg, i32 4, double %arg1, i32 7, i8* null, i32 4, double %arg2, i32 7, i8* null, i32 4, double %arg3, i32 7, i8* null, i32 4, double %arg4, i32 7, i8* null, i32 4, double %arg5, i32 7, i8* null, i32 4, double %arg6, i32 7, i8* null, i32 4, double %arg7, i32 7, i8* null, i32 4, double %arg8, i32 7, i8* null, i32 4, double %arg9, i32 7, i8* null, i32 4, double %arg10, i32 7, i8* null, i32 4, double %arg11, i32 7, i8* null, i32 4, double %arg12, i32 7, i8* null, i32 7, i8* null), "gc-live"(i8 addrspace(1)* %arg) ]
  br i1 undef, label %bb13, label %bb15

bb13:                                             ; preds = %bb
  %tmp14 = call token (i64, i32, i32 (i8 addrspace(1)*, double, double, double, double, double, double, double, double, double)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_i32p1i8f64f64f64f64f64f64f64f64f64f(i64 2, i32 5, i32 (i8 addrspace(1)*, double, double, double, double, double, double, double, double, double)* nonnull @quux, i32 10, i32 0, i8 addrspace(1)* nonnull null, double %arg1, double %arg2, double %arg3, double %arg5, double %arg6, double %arg7, double %arg9, double %arg10, double %arg11, i32 0, i32 0) [ "deopt"(i32 0, i32 2, i32 0, i32 70, i32 0, i32 26, i32 0, i32 0, i8 addrspace(1)* null, i32 4, double %arg1, i32 7, i8* null, i32 4, double %arg2, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 4, double %arg4, i32 7, i8* null, i32 4, double %arg5, i32 7, i8* null, i32 4, double %arg6, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 4, double %arg8, i32 7, i8* null, i32 4, double %arg9, i32 7, i8* null, i32 4, double %arg10, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 4, double %arg12, i32 7, i8* null, i32 7, i8* null), "gc-live"(i8 addrspace(1)* null) ]
  br label %bb15

bb15:                                             ; preds = %bb13, %bb
  %tmp16 = phi double [ %arg4, %bb13 ], [ 1.000000e+00, %bb ]
  %tmp17 = phi double [ %arg8, %bb13 ], [ 1.000000e+00, %bb ]
  %tmp18 = phi double [ %arg12, %bb13 ], [ 1.000000e+00, %bb ]
  br i1 undef, label %bb25, label %bb19

bb19:                                             ; preds = %bb15
  %tmp20 = invoke token (i64, i32, i32 (i32, i8 addrspace(1)*, i32)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_i32i32p1i8i32f(i64 1, i32 16, i32 (i32, i8 addrspace(1)*, i32)* nonnull @eggs, i32 3, i32 0, i32 undef, i8 addrspace(1)* nonnull undef, i32 0, i32 0, i32 0) [ "deopt"(i32 0, i32 2, i32 0, i32 97, i32 0, i32 26, i32 0, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 0, i32 2, i32 3, i32 0, i32 20, i32 0, i32 0, i8 addrspace(1)* undef, i32 4, double %arg1, i32 7, i8* null, i32 4, double %arg2, i32 7, i8* null, i32 4, double %tmp16, i32 7, i8* null, i32 4, double %arg5, i32 7, i8* null, i32 4, double %arg6, i32 7, i8* null, i32 4, double %tmp17, i32 7, i8* null, i32 4, double %arg9, i32 7, i8* null, i32 4, double %arg10, i32 7, i8* null, i32 4, double %tmp18, i32 7, i8* null, i32 7, i8* null), "gc-live"(i8 addrspace(1)* undef) ]
          to label %bb21 unwind label %bb23

bb21:                                             ; preds = %bb19
  %tmp22 = call token (i64, i32, void (i8 addrspace(1)*, double, double, double, double, double, double, double, double, double, i32)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidp1i8f64f64f64f64f64f64f64f64f64i32f(i64 2, i32 5, void (i8 addrspace(1)*, double, double, double, double, double, double, double, double, double, i32)* nonnull @ham, i32 11, i32 0, i8 addrspace(1)* nonnull undef, double %arg1, double %arg2, double %tmp16, double %arg5, double %arg6, double %tmp17, double %arg9, double %arg10, double %tmp18, i32 51, i32 0, i32 0) [ "deopt"(i32 0, i32 2, i32 0, i32 97, i32 0, i32 26, i32 0, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 7, i8* null, i32 2, i32 2, i32 46, i32 0, i32 20, i32 0, i32 0, i8 addrspace(1)* undef, i32 4, double %arg1, i32 7, i8* null, i32 4, double %arg2, i32 7, i8* null, i32 4, double %tmp16, i32 7, i8* null, i32 4, double %arg5, i32 7, i8* null, i32 4, double %arg6, i32 7, i8* null, i32 4, double %tmp17, i32 7, i8* null, i32 4, double %arg9, i32 7, i8* null, i32 4, double %arg10, i32 7, i8* null, i32 4, double %tmp18, i32 7, i8* null, i32 3, i32 51), "gc-live"(i8 addrspace(1)* undef) ]
  unreachable

bb23:                                             ; preds = %bb19
  %tmp24 = landingpad token
          cleanup
  ret void

bb25:                                             ; preds = %bb15
  ret void
}

declare i32* @widget()
declare i32 @quux(i8 addrspace(1)*, double, double, double, double, double, double, double, double, double)
declare void @blam()
declare i32 @eggs(i32, i8 addrspace(1)*, i32)
declare void @ham(i8 addrspace(1)*, double, double, double, double, double, double, double, double, double, i32)
declare token @llvm.experimental.gc.statepoint.p0f_isVoidf(i64 , i32 , void ()*, i32 , i32 , ...)
declare token @llvm.experimental.gc.statepoint.p0f_i32p1i8f64f64f64f64f64f64f64f64f64f(i64 , i32 , i32 (i8 addrspace(1)*, double, double, double, double, double, double, double, double, double)*, i32 , i32 , ...)
declare token @llvm.experimental.gc.statepoint.p0f_i32i32p1i8i32f(i64 , i32 , i32 (i32, i8 addrspace(1)*, i32)*, i32 , i32 , ...)
declare token @llvm.experimental.gc.statepoint.p0f_isVoidp1i8f64f64f64f64f64f64f64f64f64i32f(i64 , i32 , void (i8 addrspace(1)*, double, double, double, double, double, double, double, double, double, i32)*, i32 , i32 , ...)
