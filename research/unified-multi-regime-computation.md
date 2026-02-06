# Unified Multi-Regime Computation
## Interpreting Classical, Quantum, and Phase Computation as a Single System

**Status:** Non-Normative Research Paper  
**Applies To:** Conceptual understanding of the Dust Programming Language  
**Authority:** None (Interpretive Only)

---

## 1. Introduction

Modern computation is often divided into separate conceptual domains:

- classical deterministic computation,
- quantum computation with linear resources and measurement,
- global consistency–based or constraint-driven computation.

These domains are typically treated as incompatible or isolated, each requiring
distinct languages, tooling, and mental models.

The Dust Programming Language adopts a different position:

> **Multiple computational regimes can coexist coherently when they are unified
> by constraints rather than instructions.**

This paper explores **unified multi-regime computation** as an interpretive
framework for understanding Dust’s design.

---

## 2. What Is a Computational Regime?

In Dust, a *computational regime* is not a syntax mode or runtime switch.

A regime is defined by:
- the kinds of resources that exist,
- the constraints that govern them,
- and the admissibility conditions for valid evolution.

Regimes differ in **rules**, not in *language*.

---

## 3. The Three Regimes as Constraint Classes

Dust distinguishes three regimes conceptually:

- **Classical regime** — deterministic evolution of copyable values
- **Quantum regime** — linear evolution of non-copyable resources
- **Phase regime** — global consistency and admissibility resolution

Each regime is characterized by a distinct **constraint structure**.

The unification arises because all regimes:
- are expressed in the same language,
- are subject to explicit constraints,
- participate in the same admissibility logic.

---

## 4. Why Instruction Unification Fails

Attempts to unify computational regimes at the instruction level typically fail because:

- copying assumptions conflict with linearity,
- local control flow conflicts with global constraints,
- probabilistic abstraction conflicts with determinism guarantees.

Dust does not attempt to unify instructions.

It unifies **validity conditions**.

---

## 5. Constraint-First Unification

Under a constraint-first model:

- classical computation is admissible when determinism holds,
- quantum computation is admissible when linearity holds,
- phase computation is admissible when global consistency holds.

The regimes coexist because:
- constraints are explicit,
- violations are terminal,
- and admissibility is global.

There is no need for regime “emulation” or semantic compromise.

---

## 6. Regime Boundaries as Semantic Interfaces

Regime boundaries in Dust are:

- explicit,
- typed,
- constrained.

Cross-regime interaction is permitted only when:
- constraints of both regimes are satisfied,
- resource rules are preserved,
- admissibility remains global.

This prevents leakage of assumptions across regimes.

---

## 7. Determinism Across Regimes

Unification does not require uniform determinism.

Instead:
- determinism is required *within admissible space*,
- nondeterminism must be explicit and constrained,
- observational equivalence is preserved.

This allows regimes with different internal rules to coexist
without introducing semantic ambiguity.

---

## 8. Global Admissibility as the Unifying Principle

The key unifying concept is **admissibility**.

Regardless of regime:
- computation proceeds only in admissible states,
- inadmissibility halts execution,
- admissibility outcomes are observable.

This provides a single criterion for correctness across all regimes.

---

## 9. Implications for Tooling and Reasoning

Unified multi-regime computation enables:

- single-artifact reasoning across regimes,
- consistent verification models,
- shared execution semantics,
- and coherent governance.

Tools do not need regime-specific languages.
They need regime-aware constraints.

---

## 10. Limits of This Interpretation

This paper:

- does not define regime semantics,
- does not prescribe regime usage,
- does not replace normative documents.

It is an interpretive model intended to:
- clarify design intent,
- explain coherence,
- and support reasoning.

All authoritative meaning remains elsewhere.

---

## 11. Conclusion

Unified multi-regime computation is possible when computation is understood
as **admissible evolution under constraints**.

Dust achieves unification not by flattening differences,
but by making differences explicit and compatible.

The regimes remain distinct.  
The system remains coherent.

---