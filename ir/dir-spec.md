# Dust Intermediate Representation (DIR)
## Canonical Semantic Representation of the Dust Programming Language

**Status:** Normative  
**Authority:** Dust Language Specification (`/spec`)  
**Applies To:** All Dust programs, all execution targets

---

## 1. Purpose

The **Dust Intermediate Representation (DIR)** is the canonical semantic form of all programs written in the Dust Programming Language (DPL).

DIR defines *program meaning* independently of:
- surface syntax,
- compiler implementation,
- execution backend,
- or hardware substrate.

All valid DPL programs **must** lower to a valid DIR artifact.  
All execution backends **must** be observationally equivalent to DIR interpretation.

DIR is authoritative wherever the specification delegates semantic representation.

---

## 2. Normative Status

DIR is a **normative representation**, subordinate only to the language specification.

- Source syntax is not normative.
- Implementations are not normative.
- Examples are not normative.

If a discrepancy exists between an implementation and DIR, **DIR prevails**.

---

## 3. Core Properties

Every DIR artifact MUST satisfy the following properties:

- Architecture-independent
- Regime-annotated
- Constraint-preserving
- Effect-explicit
- Deterministic
- Fully typed
- Serializable
- Versioned

A DIR artifact violating any required property is invalid.

---

## 4. Structural Model

DIR is a **typed, graph-structured representation**.

It is composed of:

- **Nodes** — operations, declarations, constraints, effects
- **Edges** — data dependencies, control dependencies, constraint relations
- **Regions** — scopes for regime, phase, time, and lifetime

DIR is not instruction-linear.  
Ordering is represented **only** where semantically required.

---

## 5. Regime Annotation

Each DIR node MUST be annotated with exactly one computational regime:

- `K` — Classical
- `Q` — Quantum
- `Φ` — Phase

Regime annotations are invariant under transformation.

Cross-regime interactions are permitted **only** where allowed by the specification and must be represented explicitly in DIR.

Implicit regime transitions are forbidden.

---

## 6. Type Preservation

DIR preserves all type information defined by the specification.

This includes:

- Value types
- Linear types
- Constraint types
- Dimensional types
- Determinism qualifiers (`det`, `ens`, `adm`)

Type erasure is not permitted in DIR.

Any DIR artifact containing unresolved, inferred, or inconsistent typing is invalid.

---

## 7. Constraint Representation

Constraints are first-class entities in DIR.

Each constraint is represented explicitly with:

- scope of applicability,
- satisfaction conditions,
- failure semantics.

Constraint nodes may encode:

- physical limits,
- global consistency conditions,
- admissibility requirements,
- boundary conditions.

Execution of a DIR artifact is permitted **only** if all active constraints are satisfied.

---

## 8. Effect Encoding

All effects defined by the specification are explicitly represented in DIR.

Effects are:

- typed,
- ordered where required,
- irreversible where specified.

No implicit effects are permitted.

If an observable outcome exists, a corresponding effect node MUST exist in DIR.

---

## 9. Time Semantics

DIR encodes time explicitly and structurally.

Time annotations may include:

- logical time domains,
- physical time domains,
- deadlines,
- jitter bounds,
- synchronization domains.

Concurrency is represented by structural independence, not interleaving order.

---

## 10. Determinism

DIR is deterministic by construction.

Given:
- the same DIR artifact,
- the same initial conditions,

interpretation MUST yield observationally equivalent results.

Any nondeterminism MUST be:
- explicit,
- typed,
- admissibility-checked.

Implicit nondeterminism is inadmissible.

---

## 11. Validation Rules

A DIR artifact is valid if and only if all of the following hold:

1. All nodes are typed
2. All regime annotations are consistent
3. All constraints are well-formed
4. All effects are explicit
5. No forbidden cross-regime flows exist
6. Time semantics are coherent
7. Determinism requirements are satisfied

Invalid DIR artifacts MUST be rejected.

---

## 12. Versioning and Compatibility

DIR is versioned independently of:

- source syntax,
- compiler versions,
- backend implementations.

Backward compatibility is enforced **at the DIR level**.

A new DIR version MAY:
- add annotations,
- extend expressiveness,
- refine validation rules.

A new DIR version MUST NOT:
- change the meaning of previously valid DIR artifacts.

---

## 13. Relationship to Execution

DIR defines **what programs mean**, not how they are executed.

Execution semantics are defined by the **Dust Virtual Machine (DVM)**, which MUST be observationally equivalent to DIR interpretation.

DIR is the semantic contract between language and execution.

---

## 14. External Independence

DIR is defined exclusively by the Dust specification corpus.

DIR is not derived from, compatible with, or constrained by any external intermediate representation system.

---

## 15. Summary

DIR is the semantic spine of the Dust Programming Language.

It is:
- the unit of meaning,
- the unit of verification,
- the unit of compatibility,
- the unit of execution equivalence.

No Dust program exists outside DIR.

---