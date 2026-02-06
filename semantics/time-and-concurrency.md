# Time, Causality, and Deterministic Concurrency in DPL
## Explicit Temporal Semantics and Coherent Parallelism

**Status:** Normative  
**Authority:** Dust Language Specification (`/spec`), DIR (`/ir/dir-spec.md`), DVM (`/vm/dvm-reference-semantics.md`)  
**Applies To:** All Dust programs, compilers, and execution backends

---

## 1. Purpose

This document defines the **semantic treatment of time and concurrency** in the Dust Programming Language (DPL).

Its purpose is to:
- formalize time as an explicit semantic dimension,
- define causality and ordering,
- specify deterministic concurrency guarantees,
- and ensure that parallel execution does not introduce nondeterminism.

This document does **not** introduce new timing primitives.  
It defines **how time and concurrency defined in the specification are enforced**.

---

## 2. Time as a First-Class Semantic Dimension

In DPL, time is not implicit.

Time is:
- explicitly represented,
- semantically constrained,
- and observable through effects.

All temporal behavior must be represented in DIR and enforced by the DVM.

---

## 3. Time Domains

DPL supports multiple time domains, including but not limited to:

- logical time,
- physical time,
- synchronization time.

Time domains are:
- explicitly identified,
- non-interchangeable,
- and constrained by specification rules.

No implicit time conversion is permitted.

---

## 4. Temporal Ordering

Ordering is a semantic property, not an execution artifact.

Ordering constraints may arise from:
- explicit sequencing,
- data dependency,
- effect ordering,
- temporal constraints.

If no ordering constraint exists, execution is unordered by definition.

---

## 5. Causality

Causality is defined by **semantic dependence**, not by execution order.

A computation A is causally prior to computation B if and only if:
- B depends on the result, effect, or admissibility outcome of A.

Causal relationships MUST be explicit in DIR.

---

## 6. Concurrency Model

Concurrency in DPL is defined as **the absence of required ordering**.

Concurrent computations:
- may execute in parallel,
- may be interleaved,
- or may be serialized,

provided that observational equivalence is preserved.

Concurrency is structural, not procedural.

---

## 7. Deterministic Concurrency Guarantee

DPL guarantees deterministic concurrency.

Given:
- the same DIR artifact,
- the same initial state,

all admissible executions MUST yield observationally equivalent results.

Parallelism MUST NOT introduce nondeterminism.

---

## 8. Synchronization Semantics

Synchronization constructs:
- impose explicit ordering,
- constrain concurrency,
- establish temporal boundaries.

Synchronization MUST be explicit.

Implicit synchronization is inadmissible.

---

## 9. Interaction with Effects

Effects define observable time.

If two effects are ordered:
- their order MUST be preserved.

If two effects are unordered:
- their relative execution order MUST NOT affect observation.

Effect ordering constraints are enforced by the DVM.

---

## 10. Regime-Specific Temporal Semantics

### 10.1 K-Regime

K-regime time semantics support:
- explicit scheduling,
- deadlines,
- jitter bounds.

Deterministic scheduling is required.

---

### 10.2 Q-Regime

Q-regime time semantics enforce:
- correct sequencing of unitary evolution,
- irreversible measurement timing,
- linear resource lifetime constraints.

Temporal misuse of quantum resources is inadmissible.

---

### 10.3 Φ-Regime

Φ-regime time semantics govern:
- admissibility resolution order,
- global consistency evaluation,
- witness validation.

Time does not represent progression but **resolution**.

---

## 11. Time Violations

Violations of temporal constraints include:
- missed deadlines,
- invalid ordering,
- synchronization failures.

Time violations:
- halt execution,
- produce defined failure outcomes,
- are observable.

Silent timing violations are prohibited.

---

## 12. Prohibited Behavior

The following are inadmissible:

- implicit time advancement,
- nondeterministic scheduling,
- race conditions affecting observation,
- time-dependent semantics not encoded in DIR.

Any such behavior invalidates conformance.

---

## 13. Summary

Time and concurrency in DPL are explicit, constrained, and deterministic.

Concurrency expresses freedom.  
Time expresses obligation.

Together, they ensure that parallel computation remains coherent, admissible, and observable.

---