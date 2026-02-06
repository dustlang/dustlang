# File: dpl-limits-of-computation.md

# The Limits of Computation in DPL
## What Is Intentionally Inexpressible

Document Type: Formal Research Paper  
Status: Non-Normative (Semantics-Aligned, Explanatory)  
Applies To: Dust Programming Language (DPL)  
Version: v0.1  
Authority: Specification-defined semantics only  
Copyright: © 2026 Dust LLC

---

## Abstract

Every computational system defines not only what it can express, but also what it must forbid. The Dust Programming Language (DPL) is explicit about its limits. These limits are not accidental omissions or deferred features; they are deliberate semantic boundaries required to preserve admissibility, determinism, physical realism, and global correctness.

This paper formalizes the **intentional limits of computation in DPL**. It identifies classes of behavior that DPL refuses to express, explains why they are incompatible with constraint-first semantics, and clarifies how these limits establish trust in the language over time. By stating what DPL cannot do, this paper completes the semantic closure of the system.

---

## 1. Introduction

Most programming languages define themselves by capability. Features accumulate, and limits are discovered indirectly through failure, performance collapse, or undefined behavior.

DPL takes a different approach.

In DPL, limits are **semantic commitments**. They define the shape of admissible computation and prevent entire categories of unsound behavior. This paper enumerates those limits and explains their necessity.

---

## 2. Limits as Semantic Guarantees

A limit in DPL is not a weakness. It is a guarantee that:

- certain contradictions cannot be expressed,
- certain classes of bugs cannot occur,
- certain forms of semantic drift are impossible.

Limits ensure that all expressible programs remain globally meaningful.

---

## 3. No Implicit Execution

### 3.1 Forbidden Behavior

DPL forbids:
- implicit execution,
- speculative execution across admissibility boundaries,
- execution-before-validation.

No computation may occur unless it is admissible.

---

### 3.2 Rationale

Implicit execution creates realities before constraints are satisfied. This violates global consistency and undermines non-existence as a semantic outcome.

---

## 4. No Partial Admissibility

### 4.1 Forbidden Behavior

DPL forbids:
- partially admissible executions,
- execution of constraint subsets,
- progressive relaxation of constraints.

A program is either admissible or it does not exist.

---

### 4.2 Rationale

Partial admissibility introduces ambiguity about correctness and enables invalid intermediate states.

---

## 5. No Introspection of Forbidden State

### 5.1 Forbidden Behavior

DPL forbids:
- inspecting inadmissible executions,
- reading Φ-regime resolution internals,
- observing quantum state without measurement,
- introspection that bypasses effect boundaries.

---

### 5.2 Rationale

Allowing such introspection would create knowledge that the language semantics deny, breaking determinism and knowledge boundaries.

---

## 6. No Probabilistic Φ-Computation

### 6.1 Forbidden Behavior

DPL forbids:
- probabilistic resolution of admissibility,
- heuristic pruning of Φ constraints,
- sampling-based phase decisions.

Φ-computation is deterministic.

---

### 6.2 Rationale

Probability in Φ-regime would replace consistency with likelihood, undermining admissibility as a semantic gate.

---

## 7. No Constraint Erasure

### 7.1 Forbidden Behavior

DPL forbids:
- removing constraints for performance,
- ignoring constraints during optimization,
- eliding constraints at backend boundaries.

---

### 7.2 Rationale

Constraints define meaning. Erasing them alters what is allowed to exist.

---

## 8. No Time Ambiguity

### 8.1 Forbidden Behavior

DPL forbids:
- unspecified scheduling,
- nondeterministic timing,
- implicit concurrency races.

Time is part of correctness.

---

### 8.2 Rationale

Ambiguous time semantics make global reasoning impossible and invalidate determinism guarantees.

---

## 9. No Hidden Effects

### 9.1 Forbidden Behavior

DPL forbids:
- implicit side effects,
- untracked observation,
- hidden coupling to external systems.

---

### 9.2 Rationale

Effects must be explicit to preserve auditability, replay, and semantic truth.

---

## 10. No Semantic Backdoors

### 10.1 Forbidden Behavior

DPL forbids:
- unsafe escape hatches,
- undefined behavior regions,
- implementation-defined semantics.

---

### 10.2 Rationale

Backdoors create divergence between specification and reality, destroying trust.

---

## 11. No Unlimited Expressiveness

DPL does not aim to express every conceivable computation.

It intentionally excludes:
- self-contradictory systems,
- globally inconsistent specifications,
- behaviors that cannot be reconciled with physical or logical constraints.

Expressiveness is bounded by admissibility.

---

## 12. Why These Limits Matter

These limits:
- enable non-existence as correctness,
- make debugging meaningful without execution,
- ensure optimizations preserve truth,
- guarantee semantic stability over time.

They are the reason DPL can be trusted.

---

## 13. Comparison to Other Systems

Many systems rely on:
- undefined behavior,
- probabilistic resolution,
- implementation latitude.

DPL rejects these approaches. Its limits are explicit and enforced.

---

## 14. Conclusion

The Dust Programming Language is defined as much by what it refuses to allow as by what it enables.

By establishing clear, intentional limits on computation, DPL preserves global consistency, determinism, and semantic integrity. These limits are not barriers to progress; they are the foundation of correctness.

What DPL cannot express is precisely what makes what it can express trustworthy.

---

© 2026 Dust LLC