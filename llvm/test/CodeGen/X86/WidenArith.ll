; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown-unknown -mattr=+avx | FileCheck %s --check-prefix=X86
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx | FileCheck %s --check-prefix=X64

define <8 x i32> @test(<8 x float> %a, <8 x float> %b) {
; X86-LABEL: test:
; X86:       # %bb.0:
; X86-NEXT:    vaddps %ymm1, %ymm0, %ymm2
; X86-NEXT:    vmulps %ymm0, %ymm1, %ymm1
; X86-NEXT:    vsubps %ymm2, %ymm1, %ymm3
; X86-NEXT:    vcmpltps %ymm1, %ymm0, %ymm0
; X86-NEXT:    vcmpltps %ymm3, %ymm2, %ymm1
; X86-NEXT:    vandps %ymm1, %ymm0, %ymm0
; X86-NEXT:    vandps {{\.LCPI[0-9]+_[0-9]+}}, %ymm0, %ymm0
; X86-NEXT:    retl
;
; X64-LABEL: test:
; X64:       # %bb.0:
; X64-NEXT:    vaddps %ymm1, %ymm0, %ymm2
; X64-NEXT:    vmulps %ymm0, %ymm1, %ymm1
; X64-NEXT:    vsubps %ymm2, %ymm1, %ymm3
; X64-NEXT:    vcmpltps %ymm1, %ymm0, %ymm0
; X64-NEXT:    vcmpltps %ymm3, %ymm2, %ymm1
; X64-NEXT:    vandps %ymm1, %ymm0, %ymm0
; X64-NEXT:    vandps {{.*}}(%rip), %ymm0, %ymm0
; X64-NEXT:    retq
 %c1 = fadd <8 x float> %a, %b
 %b1 = fmul <8 x float> %b, %a
 %d  = fsub <8 x float> %b1, %c1
 %res1 = fcmp olt <8 x float> %a, %b1
 %res2 = fcmp olt <8 x float> %c1, %d
 %andr = and <8 x i1>%res1, %res2
 %ex = zext <8 x i1> %andr to <8 x i32>
 ret <8 x i32>%ex
}


