# §12 Dust Intermediate Representation (DIR)
## Dust Programming Language Specification v0.1

**Status:** Normative  
**Last Updated:** February 2026

This section is part of the Dust Programming Language Specification v0.1.

---

## 12.1 Overview

The **Dust Intermediate Representation (DIR)** is the canonical semantic form of all Dust Programming Language (DPL) programs.

DIR serves as the stable boundary between:
- the DPL language specification, and
- all concrete implementations, runtimes, and hardware backends.

All DPL programs MUST be translatable into DIR.  
All observable behavior of a DPL program is defined by its DIR form.

---

## 12.2 Purpose of DIR

DIR exists to ensure:

- semantic stability across architectures;
- reproducible and deterministic behavior;
- verifiable compilation;
- long-term evolution of implementations without redefining the language.

DIR is not an optimization artifact.  
It is a **semantic contract**.

---

## 12.3 Authority and Normativity

DIR is defined by this specification.

No implementation-specific IR, bytecode, or machine code may redefine or reinterpret DIR semantics.

If a discrepancy exists between:
- a source-level interpretation, and
- DIR-level behavior,

**DIR is authoritative.**

---

## 12.4 Relationship to DPL Source

The relationship between DPL source and DIR is defined as follows:

- DPL source defines intent and structure;
- DIR defines meaning and behavior.

Multiple DPL programs MAY map to identical DIR if they are semantically equivalent.

---

## 12.5 Scope of DIR

DIR captures all semantically relevant aspects of a DPL program, including:

- process structure;
- regime classification;
- type information;
- linearity constraints;
- declared effects;
- constraints and admissibility requirements;
- execution ordering;
- binding and contract obligations.

No behavior not represented in DIR is observable.

---

## 12.6 Determinism and Reproducibility

DIR is deterministic by construction.

Given:
- identical DIR,
- identical inputs,
- identical environmental assumptions,

execution MUST produce identical observable outcomes.

This property enables:
- reproducible research;
- deterministic testing;
- verified deployment.

---

## 12.7 Regime Representation

DIR explicitly represents computation regimes.

Each process in DIR is tagged with exactly one regime:

- `K`
- `Q`
- `Φ`

Regime tags are preserved through all compilation stages and MUST NOT be erased or inferred.

---

## 12.8 Type Preservation

DIR preserves complete type information.

Type erasure is prohibited.

DIR MUST encode:

- primitive types;
- structural types;
- linearity annotations;
- resource classifications;
- determinism qualifiers.

Backends MUST respect all encoded typing constraints.

---

## 12.9 Effect Representation

All effects are explicitly represented in DIR.

DIR encodes:

- effect type (`observe`, `emit`, `seal`);
- effect ordering;
- effect dependencies;
- effect permissions across bindings.

Effects MUST NOT be reordered, elided, or duplicated by implementations.

---

## 12.10 Constraint and Admissibility Encoding

DIR represents constraints and admissibility explicitly.

DIR MUST encode:

- all declared constraints;
- admissibility scopes;
- witness requirements;
- constraint dependencies.

Constraint resolution strategy is not prescribed, but semantic outcomes are.

---

## 12.11 Binding and Contract Encoding

Bindings and contracts are first-class elements in DIR.

DIR encodes:

- binding directionality;
- contract clauses;
- permitted effect propagation;
- admissibility and timing conditions.

Contract enforcement MUST be preserved across all backends.

---

## 12.12 Execution Semantics

DIR defines execution semantics independently of hardware or runtime.

Execution order, failure behavior, and observability are determined solely by DIR.

Implementations MAY introduce optimizations provided that:
- DIR semantics are preserved;
- no observable behavior changes.

---

## 12.13 Lowering and Backends

Lowering DIR to a concrete backend is implementation-defined, but subject to strict constraints:

- lowering MUST preserve all DIR semantics;
- backends MUST NOT introduce new effects;
- backends MUST NOT weaken failure guarantees;
- backends MUST NOT introduce non-determinism.

Multiple backends MAY exist for the same DIR.

---

## 12.14 Validation and Verification

Implementations SHOULD provide mechanisms to:

- inspect DIR;
- validate DIR correctness;
- compare DIR for equivalence;
- audit effects and constraints.

DIR validation failures are fatal errors.

---

## 12.15 DIR Versioning

DIR is versioned independently but coherently with the language specification.

Changes to:
- DIR semantics,
- encoded guarantees,
- or representable constructs,

constitute breaking changes and require a new major specification version.

---

## 12.16 DIR Stability

DIR is a foundational component of DPL.

The guarantees defined in this section MUST remain stable across all v0.x releases.

---

© 2026 Dust LLC


⸻
