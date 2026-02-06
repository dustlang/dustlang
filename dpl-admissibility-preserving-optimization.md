# Admissibility-Preserving Optimization in DPL
## When Faster Is Allowed—and When It Is Forbidden

Document Type: Formal Technical Paper  
Status: Non-Normative (Semantics-Aligned, Explanatory)  
Applies To: Dust Programming Language (DPL)  
Version: v0.1  
Authority: Specification-defined semantics only  
Copyright: © 2026 Dust LLC

---

## Abstract

Optimization is traditionally defined as any transformation that improves performance while preserving observable behavior. The Dust Programming Language (DPL) adopts a stricter criterion. In DPL, an optimization is valid if and only if it preserves **admissibility**. Transformations that preserve outputs but alter which executions are allowed are forbidden, regardless of performance benefit.

This paper formalizes admissibility-preserving optimization under constraint-first semantics. It defines what optimizations are allowed, what transformations are illegal, and why many conventional optimization techniques are unsound in DPL. The goal is to ensure that performance improvements never compromise global consistency, determinism, or semantic truth.

---

## 1. Introduction

Most programming systems optimize under the assumption that:

> If two programs produce the same outputs, they are equivalent.

DPL rejects this assumption.

In DPL, programs may be observationally identical yet semantically different if they admit different sets of executions. Optimization must therefore preserve **which executions may exist**, not merely what values are produced.

This paper establishes admissibility as the primary invariant of optimization.

---

## 2. Optimization as Semantic Transformation

In DPL, optimization is a transformation between programs:

- source program P
- transformed program P′

The transformation is valid only if P and P′ are **admissibility-equivalent**.

Performance gains are secondary to semantic preservation.

---

## 3. Admissibility Preservation

### 3.1 Definition

An optimization is admissibility-preserving if and only if:

- every admissible execution of P is admissible in P′, and
- no new admissible executions are introduced by P′.

Formally:

    Admissible(P) = Admissible(P′)

This definition is stricter than observational equivalence.

---

### 3.2 Why This Is Necessary

Admissibility encodes:
- global constraints,
- time guarantees,
- resource ownership,
- effect ordering,
- regime consistency.

Violating admissibility breaks correctness even if outputs match.

---

## 4. Observational vs Admissibility Equivalence

### 4.1 Observational Equivalence

Two programs are observationally equivalent if:
- they produce the same observable outputs
- under the same observations

This notion is insufficient for DPL.

---

### 4.2 Admissibility Equivalence

Two programs are admissibility-equivalent if:
- they admit exactly the same executions
- under the same constraints and regimes

DPL optimization requires admissibility equivalence.

---

## 5. Allowed Optimizations

The following transformations are admissibility-preserving when applied correctly:

- dead code elimination (for unreachable admissible paths)
- constant folding (without effect reordering)
- structural simplification that preserves constraints
- memoization of pure, deterministic computations
- reordering of operations proven independent by constraints

Each must be proven constraint-neutral.

---

## 6. Forbidden Optimizations

The following are explicitly forbidden:

- removing constraints for performance
- speculative execution across admissibility boundaries
- effect reordering that alters irreversibility
- time-bound relaxation
- duplicating linear or Φ-regime entities
- probabilistic shortcuts in Φ-regime resolution

These transformations may improve speed but break meaning.

---

## 7. Optimization Across Regimes

### 7.1 K-Regime Optimization

Permitted only if:
- time semantics are preserved
- effects remain ordered
- determinism is maintained

---

### 7.2 Q-Regime Optimization

Highly restricted:
- no duplication
- no implicit measurement
- no shortcut evolution

Linearity violations are semantic violations.

---

### 7.3 Φ-Regime Optimization

Extremely constrained:
- no approximation
- no heuristic pruning
- no partial resolution exposure

Φ-optimization is limited to constraint representation improvements, not semantic shortcuts.

---

## 8. Optimization and Non-Existence

An optimization must not:
- turn an inadmissible program into an admissible one
- hide inadmissibility through execution shortcuts

Inadmissibility must remain visible as non-existence.

---

## 9. Compiler Responsibilities

Compilers must:
- track admissibility invariants
- reject unsafe optimizations
- prove constraint preservation
- prioritize correctness over performance

Performance claims without admissibility proofs are invalid.

---

## 10. Tooling and Verification

Optimization passes should be:
- auditable
- replayable
- independently verifiable

Verification tools must be able to confirm admissibility equivalence.

---

## 11. Implications for Implementers

Implementers must abandon:
- aggressive speculative execution
- optimization-by-observation
- heuristic shortcuts

DPL rewards correctness-first engineering.

---

## 12. Conclusion

In DPL, optimization is not about making programs faster—it is about making them faster **without changing what is allowed to exist**.

Any optimization that alters admissibility is incorrect, regardless of performance gain.

Speed without truth is not optimization.  
It is corruption.

---

© 2026 Dust LLC