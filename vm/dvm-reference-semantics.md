# Dust Virtual Machine (DVM)
## Reference Execution Semantics for the Dust Programming Language

**Status:** Normative  
**Authority:** Dust Language Specification (`/spec`), Dust Intermediate Representation (`/ir/dir-spec.md`)  
**Applies To:** All Dust execution backends

---

## 1. Purpose

The **Dust Virtual Machine (DVM)** defines the *reference execution semantics* of the Dust Programming Language (DPL).

The DVM specifies **what it means for a Dust program to execute**, independent of:
- hardware architecture,
- operating system,
- runtime implementation,
- or optimization strategy.

All execution backends MUST be **observationally equivalent** to DVM execution.

---

## 2. Normative Role

The DVM is **normative** wherever execution behavior is concerned.

- DIR defines *program meaning*.
- DVM defines *program execution*.

If a discrepancy exists between an execution backend and DVM semantics, **the backend is incorrect**.

---

## 3. Execution Model Overview

The DVM executes **valid DIR artifacts**.

Execution is defined as:
- constraint evaluation,
- state evolution,
- effect realization,
- and admissibility resolution,

performed in accordance with DIR structure and annotations.

The DVM does not interpret source syntax.

---

## 4. State Model

The DVM maintains an explicit execution state composed of:

- value state
- resource state
- constraint state
- time state
- effect history

All state components are:
- explicitly represented,
- evolution-tracked,
- and admissibility-checked.

No implicit state is permitted.

---

## 5. Regime-Specific Execution

Execution semantics are regime-dependent and enforced explicitly.

### 5.1 K-Regime Execution

K-regime execution is:
- deterministic,
- copy-safe,
- time-ordered where specified.

Operations:
- consume values,
- produce values,
- update time state,
- emit effects explicitly.

---

### 5.2 Q-Regime Execution

Q-regime execution enforces:
- linear resource usage,
- non-duplication of quantum state,
- explicit allocation and deallocation.

Unitary evolution and measurement are executed as defined by DIR.

Measurement:
- produces irreversible effects,
- updates admissibility state,
- consumes the measured resource.

---

### 5.3 Φ-Regime Execution

Φ-regime execution is governed by **global admissibility**.

Execution:
- evaluates consistency constraints,
- validates admissibility witnesses,
- resolves admissible configurations.

No probabilistic collapse occurs.

Failure to satisfy admissibility halts execution with a defined inadmissibility outcome.

---

## 6. Constraint Evaluation

Constraints are evaluated continuously during execution.

A constraint MAY:
- remain latent,
- become active,
- or fail.

Constraint failure:
- halts execution,
- produces a failure outcome,
- records failure state.

Execution MAY NOT continue under violated constraints.

---

## 7. Time Semantics

Time is explicit in DVM execution.

The DVM maintains:
- logical time domains,
- physical time domains,
- synchronization boundaries,
- deadlines and jitter bounds.

Execution advances time only as permitted by DIR annotations.

Out-of-bounds time behavior is inadmissible.

---

## 8. Effect Realization

Effects defined in DIR are realized by the DVM as observable actions.

Effects are:
- ordered where specified,
- irreversible where specified,
- recorded in execution history.

No effect may be:
- elided,
- reordered,
- or inferred.

Effect realization defines the **observable boundary** of execution.

---

## 9. Determinism and Replay

Given:
- the same DIR artifact,
- the same initial execution state,

DVM execution MUST produce observationally equivalent results.

The DVM supports:
- deterministic replay,
- trace inspection,
- execution auditing.

Any backend incapable of deterministic replay is non-conforming.

---

## 10. Failure Semantics

The DVM defines explicit failure modes, including:

- constraint violation,
- admissibility failure,
- illegal resource usage,
- time violation.

Failures:
- are terminal,
- produce defined outcomes,
- are recorded in execution history.

Undefined failure behavior is forbidden.

---

## 11. Observational Equivalence

Two executions are observationally equivalent if:

- all realized effects are identical,
- admissibility outcomes match,
- execution traces differ only in non-observable structure.

Backend implementations MUST satisfy observational equivalence relative to the DVM.

---

## 12. Backend Conformance

An execution backend conforms to DVM semantics if:

1. It accepts only valid DIR artifacts
2. It enforces all constraints
3. It realizes all effects explicitly
4. It preserves determinism guarantees
5. It matches DVM observational behavior

Conformance is evaluated by comparison to DVM execution, not by implementation similarity.

---

## 13. Reference Status

The DVM is a **semantic reference**, not a required implementation.

Optimizations, parallelization, and hardware specialization are permitted **only** if observational equivalence is preserved.

---

## 14. Prohibited Behavior

The following are prohibited:

- implicit effects
- hidden state
- nondeterministic execution
- undefined failure handling
- semantic shortcuts

Any such behavior invalidates conformance.

---

## 15. Summary

The Dust Virtual Machine defines execution meaning for the Dust Programming Language.

It is:
- the reference for correctness,
- the basis for verification,
- the arbiter of execution behavior.

All Dust execution is measured against the DVM.

---