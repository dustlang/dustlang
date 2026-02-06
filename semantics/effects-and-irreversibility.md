# Effects, Irreversibility, and Observation Semantics
## Explicit Interaction with the World in DPL

**Status:** Normative  
**Authority:** Dust Language Specification (`/spec`), DIR (`/ir/dir-spec.md`), DVM (`/vm/dvm-reference-semantics.md`)  
**Applies To:** All Dust programs, compilers, and execution backends

---

## 1. Purpose

This document defines the **semantic role of effects** in the Dust Programming Language (DPL).

Its purpose is to:
- formalize effects as first-class semantic entities,
- define irreversibility explicitly,
- establish observation as a semantic boundary,
- and ensure that all interaction with the world is auditable and deterministic.

This document does **not** introduce new effects.  
It defines **how effects specified by the language are represented and enforced**.

---

## 2. Definition of an Effect

An **effect** is a semantic operation that produces an **observable consequence** beyond internal computation.

Effects:
- are explicit,
- are typed,
- and may be irreversible.

If an observable consequence exists, an effect MUST exist.

---

## 3. Explicitness Requirement

All effects MUST be:

- explicitly declared in the program,
- explicitly represented in DIR,
- explicitly realized by the DVM.

Implicit effects are inadmissible.

No observation may occur without a corresponding effect.

---

## 4. Effect Classification

Effects are classified by semantic role.

### 4.1 Observation Effects

Observation effects:
- expose internal state to observation,
- perform measurement,
- yield externally visible information.

Observation is irreversible.

---

### 4.2 Emission Effects

Emission effects:
- actuate physical or external systems,
- produce signals or outputs,
- modify the environment.

Emission effects are irreversible.

---

### 4.3 Sealing Effects

Sealing effects:
- commit state to an immutable record,
- finalize outcomes,
- prevent further modification.

Sealed state is permanently fixed.

---

### 4.4 Coupling Effects

Coupling effects:
- bind computation to an external system,
- establish persistent interaction,
- impose external constraints.

Coupling effects extend admissibility conditions.

---

## 5. Irreversibility

Irreversibility is a **semantic property**, not an implementation artifact.

An effect is irreversible if:
- its consequences cannot be undone,
- or its observation cannot be unobserved.

Irreversibility MUST be:
- explicit,
- represented in DIR,
- enforced by execution.

---

## 6. Effect Ordering

Effects are ordered only where ordering is semantically required.

Ordering constraints:
- are explicit,
- are preserved by the compiler,
- are enforced by the DVM.

Unordered effects MAY execute independently, provided observational equivalence is preserved.

---

## 7. Interaction with Admissibility

Effects interact with admissibility in the following ways:

- An effect MAY require admissibility preconditions.
- An effect MAY consume admissibility witnesses.
- An effect MAY alter constraint state.

Effects MUST NOT:
- violate active constraints,
- occur in inadmissible states.

An effect that would violate admissibility is prohibited.

---

## 8. Regime-Specific Effect Semantics

### 8.1 K-Regime Effects

K-regime effects:
- are deterministic,
- operate on copyable values,
- obey explicit time semantics.

---

### 8.2 Q-Regime Effects

Q-regime effects:
- may include measurement,
- consume linear resources,
- are inherently irreversible.

Measurement effects destroy the measured quantum resource.

---

### 8.3 Φ-Regime Effects

Φ-regime effects:
- do not sample probability,
- report admissibility outcomes,
- expose consistency or inconsistency.

Φ-regime observation yields proofs, not values.

---

## 9. Observational Boundary

The **observational boundary** of a Dust program is defined entirely by its effects.

Internal computation without effects is unobservable.

Two executions are observationally equivalent if and only if:
- all realized effects are identical,
- in type, content, and admissibility outcome.

---

## 10. Effect Recording and Auditing

All realized effects MUST be recorded in execution history.

Effect records:
- are ordered where required,
- are immutable,
- support deterministic replay.

Effect histories define the observable trace of execution.

---

## 11. Failure Semantics

If an effect cannot be realized due to:
- constraint violation,
- inadmissibility,
- resource misuse,

execution MUST halt with a defined failure outcome.

Silent effect suppression is forbidden.

---

## 12. Prohibited Behavior

The following are inadmissible:

- implicit observation,
- hidden side effects,
- reversible measurement,
- effect reordering that changes observation,
- effect execution in inadmissible states.

Any such behavior invalidates conformance.

---

## 13. Summary

Effects are the sole interface between Dust computation and observation.

By making effects explicit, typed, and irreversible where required, Dust ensures that interaction with the world is:

- deterministic,
- auditable,
- and semantically sound.

Nothing is observed without an effect.  
Nothing happens without admissibility.

---