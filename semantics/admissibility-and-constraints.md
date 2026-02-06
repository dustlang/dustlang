# Admissibility & Constraint Resolution in DPL
## Semantic Foundations for Valid Computation

**Status:** Normative  
**Authority:** Dust Language Specification (`/spec`), DIR (`/ir/dir-spec.md`), DVM (`/vm/dvm-reference-semantics.md`)  
**Applies To:** All Dust programs, compilers, and execution backends

---

## 1. Purpose

This document defines the **semantic role of admissibility and constraints** in the Dust Programming Language (DPL).

Its purpose is to:
- formalize admissibility as a semantic condition,
- define how constraints are represented and resolved,
- specify failure behavior when admissibility cannot be satisfied,
- and ensure global coherence across all computational regimes.

This document does **not** introduce new constraints or semantics.  
It specifies **how constraints defined by the specification are enforced**.

---

## 2. Definition of Admissibility

A program state is **admissible** if and only if:

- all active constraints are satisfied,
- all regime invariants hold,
- all resource rules are respected,
- all effect preconditions are met.

Admissibility is:
- global,
- binary,
- and non-probabilistic.

A state is either admissible or inadmissible.  
There is no partial admissibility.

---

## 3. Role of Constraints

Constraints encode **necessary conditions** for valid computation.

Constraints may express:
- physical limits,
- resource conservation,
- global consistency,
- temporal bounds,
- regime-specific requirements.

Constraints are not control flow.  
They are **conditions on existence**.

---

## 4. Constraint Classification

Constraints are classified by semantic role.

### 4.1 Structural Constraints

Structural constraints ensure that:
- program structure is well-formed,
- regime boundaries are respected,
- typing and scoping rules hold.

Structural constraints are validated during compilation and preserved in DIR.

---

### 4.2 Resource Constraints

Resource constraints ensure that:
- linear resources are neither duplicated nor lost,
- allocation and deallocation are balanced,
- scarce resources are conserved.

Violations render the program inadmissible.

---

### 4.3 Temporal Constraints

Temporal constraints ensure that:
- deadlines are respected,
- synchronization domains are coherent,
- jitter bounds are satisfied.

Temporal constraints are evaluated during execution.

---

### 4.4 Global Consistency Constraints

Global constraints ensure that:
- system-wide invariants hold,
- admissibility witnesses remain valid,
- no contradictory configurations exist.

These constraints may span multiple regions or regimes.

---

## 5. Constraint Representation in DIR

All constraints are explicitly represented in DIR.

Each constraint node includes:
- scope of applicability,
- satisfaction conditions,
- failure semantics.

No constraint may be implicit or inferred.

---

## 6. Constraint Resolution

Constraint resolution is the process of determining whether a given program state is admissible.

Resolution:
- is deterministic,
- may be incremental,
- may be deferred until required.

Resolution does not modify program meaning.  
It validates whether execution may proceed.

---

## 7. Regime-Specific Admissibility

### 7.1 K-Regime

Admissibility requires:
- deterministic execution,
- valid resource usage,
- satisfaction of temporal constraints.

---

### 7.2 Q-Regime

Admissibility requires:
- linear resource integrity,
- valid unitary evolution,
- correct handling of irreversible measurement.

Violation of linearity is inadmissible.

---

### 7.3 Φ-Regime

Admissibility requires:
- satisfaction of global consistency constraints,
- presence of valid admissibility witnesses,
- absence of contradictory configurations.

Execution produces admissibility outcomes, not probabilistic samples.

---

## 8. Failure Semantics

If constraint resolution fails:

- execution halts,
- a defined inadmissibility outcome is produced,
- failure state is recorded.

Failure is:
- explicit,
- terminal,
- non-recoverable within the same execution.

Silent constraint violation is forbidden.

---

## 9. Interaction with Effects

Effects may:
- activate constraints,
- consume admissibility witnesses,
- alter constraint state.

Effect realization is permitted **only** in admissible states.

Effects that would violate constraints are prohibited.

---

## 10. Determinism Guarantees

Constraint resolution is deterministic.

Given:
- identical DIR,
- identical initial state,

constraint evaluation MUST yield identical admissibility outcomes.

Nondeterministic constraint resolution is inadmissible.

---

## 11. Observational Consequences

Admissibility outcomes are observable.

Two executions differ observably if:
- one yields admissibility,
- and the other yields inadmissibility.

Constraint satisfaction is therefore part of observable behavior.

---

## 12. Prohibited Behavior

The following are prohibited:

- implicit constraints,
- heuristic resolution,
- probabilistic admissibility,
- constraint violation masking,
- continuation after inadmissibility.

Any such behavior invalidates conformance.

---

## 13. Summary

Admissibility is the semantic gatekeeper of Dust computation.

Constraints define what **may exist**.
Admissibility defines what **may occur**.

Computation proceeds only within admissible space.

---