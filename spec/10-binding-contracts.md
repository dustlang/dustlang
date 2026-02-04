# §10 Binding and Contracts
## Dust Programming Language Specification v0.1

**Status:** Normative  
**Last Updated:** February 2026

This section is part of the Dust Programming Language Specification v0.1.

---

## 10.1 Overview

The Dust Programming Language enforces **explicit bindings** between processes and governs those bindings with **contracts**.

A *binding* declares that the output or behavior of one process may be used by another.  
A *contract* specifies the conditions under which such interaction is permitted.

Bindings and contracts are the sole mechanism for:
- cross-process interaction,
- cross-regime interaction,
- propagation of effects, timing assumptions, and admissibility.

No implicit binding exists in DPL.

---

## 10.2 Bind Declarations

Bindings are declared using the `bind` construct.

bind <source_process> -> <target_process>
contract {
;
…
}

A bind declaration MUST appear at the forge level.

---

## 10.3 Process References

Processes referenced in a binding are identified by regime and name:

::<process_name>

A binding MUST reference exactly one source process and one target process.

---

## 10.4 Directionality

Bindings are **directional**.

A binding from `A -> B` permits information or influence to flow from `A` to `B` only.

The reverse direction requires a separate binding declaration.

---

## 10.5 Purpose of Contracts

A contract defines the **obligations and guarantees** associated with a binding.

Contracts MAY specify constraints related to:

- timing and latency,
- admissibility requirements,
- effect permissions,
- resource usage,
- determinism assumptions.

Contracts do not execute code.  
They restrict what interactions are valid.

---

## 10.6 Contract Clauses

Each contract consists of one or more clauses.

A clause is a declarative statement of the form:

  ;

Clause semantics are domain-specific and interpreted by the compiler and runtime.

---

## 10.7 Static Verification

Bindings and contracts are subject to static verification.

At compile time, an implementation MUST verify that:

- the source and target processes exist;
- regime isolation rules are respected;
- contract clauses are syntactically valid;
- no binding violates regime or type constraints.

Bindings that cannot be verified statically MUST be rejected.

---

## 10.8 Effect Propagation Across Bindings

Effects do not automatically propagate across bindings.

A contract MUST explicitly permit effect propagation.

If effect propagation is not permitted:
- effects performed by the source process MUST NOT be observable by the target process;
- attempts to rely on such effects are invalid.

---

## 10.9 Timing and Scheduling Contracts

Bindings MAY impose timing-related constraints, including:

- maximum latency,
- minimum or maximum execution frequency,
- synchronization requirements.

If timing constraints cannot be met:
- the binding MUST NOT be exercised;
- no effects may cross the boundary;
- execution MAY be aborted or deferred.

---

## 10.10 Admissibility and Witness Transfer

Bindings MAY permit the transfer of admissibility witnesses.

When witness transfer is permitted:

- the target process MAY rely on the validity of the witness;
- the scope and assumptions of the witness MUST be preserved;
- the witness MUST NOT be altered or weakened.

Bindings MUST explicitly declare whether witness transfer is allowed.

---

## 10.11 Cross-Regime Bindings

Cross-regime interaction is permitted only through bindings.

For cross-regime bindings:

- regime-specific constraints MUST be satisfied on both sides;
- contracts MUST specify how semantics are reconciled;
- unsafe or ambiguous interactions MUST be rejected.

Cross-regime bindings are statically visible and auditable.

---

## 10.12 Runtime Enforcement

At runtime, implementations MUST enforce binding contracts.

If a contract is violated:

- the binding MUST NOT be exercised;
- no effects may occur through the binding;
- a contract violation MUST be reported as defined in §11.

Contract violations are not undefined behavior.

---

## 10.13 Binding Composition

Multiple bindings MAY exist between processes.

Bindings do not compose implicitly.

Each binding is evaluated independently according to its own contract.

---

## 10.14 Binding Stability

The binding and contract system defined in this section is foundational.

Changes to:
- binding semantics,
- contract enforcement,
- or cross-regime interaction rules,

constitute breaking changes and require a new major specification version.

---

© 2026 Dust LLC


⸻
