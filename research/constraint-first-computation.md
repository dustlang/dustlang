# A Constraint-First Model of Computation
## Interpreting Computation as Admissible Evolution

**Status:** Non-Normative Research Paper  
**Applies To:** Conceptual understanding of the Dust Programming Language  
**Authority:** None (Interpretive Only)

---

## 1. Introduction

Most models of computation describe *how* operations proceed.  
They emphasize sequences of actions, transitions between states, or transformations of symbols.

The Dust Programming Language is built on a different interpretive stance:

> **Computation is not primarily an ordered list of operations.  
> Computation is the evolution of systems subject to constraints.**

This paper articulates a **constraint-first model of computation** as an interpretive framework for understanding Dust.  
It does not define language semantics.  
It explains *why the semantics are structured the way they are*.

---

## 2. Instruction-First vs Constraint-First Thinking

An instruction-first model assumes:

- computation proceeds step by step,
- correctness is evaluated locally,
- global properties emerge implicitly,
- ordering is the dominant organizing principle.

A constraint-first model assumes:

- computation exists within a space of admissible configurations,
- correctness is global before it is local,
- ordering is imposed only when required,
- invalid configurations are excluded rather than corrected.

Dust adopts the second stance.

---

## 3. Computation as Admissible State Space

In a constraint-first model:

- a program defines a **space of possible states**,
- constraints carve out **admissible regions**,
- execution is movement *within* that region.

If no admissible state exists, computation does not proceed.

This reframes failure:
- failure is not an error during execution,
- failure is the absence of an admissible continuation.

---

## 4. Global Consistency Before Local Progress

Constraint-first computation prioritizes **global consistency**.

A computation step is meaningful only if:
- it does not violate constraints elsewhere,
- it preserves regime invariants,
- it respects resource conservation,
- it remains admissible in the future.

This explains why Dust:
- makes constraints explicit,
- evaluates admissibility continuously,
- treats failure as terminal and explicit.

---

## 5. Constraints Are Not Control Flow

In Dust, constraints are not branches or conditions.

They do not say:
> “If this happens, do that.”

They say:
> “This configuration may not exist.”

Control flow determines *which* admissible path is taken.  
Constraints determine *whether any path exists at all*.

---

## 6. Determinism in a Constraint-First World

Constraint-first computation does not imply rigidity.

Determinism arises because:
- admissibility is binary,
- constraint resolution is explicit,
- nondeterminism must be declared and constrained.

Freedom exists inside admissible space.  
Chaos is excluded by definition.

---

## 7. Relationship to Multi-Regime Computation

Constraint-first thinking naturally supports multiple regimes:

- classical computation respects determinism and time,
- quantum computation respects linearity and irreversibility,
- phase computation respects global consistency and admissibility.

The regimes differ not by instruction sets, but by **constraint structure**.

This unifies them without collapsing their distinctions.

---

## 8. Observation as Boundary, Not Mechanism

In a constraint-first model:

- observation does not *cause* computation,
- observation *reveals* which admissible path was realized.

This aligns with Dust’s explicit effect and observation semantics:
- nothing is observed implicitly,
- observation is irreversible,
- admissibility governs what may be observed.

---

## 9. Why This Model Matters

A constraint-first model enables:

- deterministic concurrency,
- explicit irreversibility,
- global correctness guarantees,
- admissibility-based computation,
- long-term semantic stability.

It also aligns computation more closely with physical systems, where:
- constraints precede motion,
- violations do not propagate,
- invalid states simply do not exist.

---

## 10. Limits of This Paper

This paper:

- does not define Dust semantics,
- does not replace the specification,
- does not prescribe implementation.

It is a **conceptual lens**, not a rulebook.

All authoritative meaning remains in normative documents.

---

## 11. Conclusion

A constraint-first model of computation shifts the question from:

> “What happens next?”

to:

> **“What is allowed to exist?”**

The Dust Programming Language adopts this stance not as philosophy, but as engineering discipline.

Computation proceeds only where it is admissible.  
Everything else is excluded by construction.

---