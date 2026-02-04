# §5 Type System
## Dust Programming Language Specification v0.1

**Status:** Normative  
**Last Updated:** February 2026

This section is part of the Dust Programming Language Specification v0.1.

---

## 5.1 Overview

The Dust Programming Language employs a **static, explicit type system** designed to enforce correctness, physical realism, and regime safety.

The type system serves the following purposes:

- prevent invalid compositions at compile time;
- enforce linearity where required;
- distinguish values from resources;
- ensure that regime rules are upheld;
- provide a foundation for effect and admissibility checking.

All well-formed DPL programs MUST be well-typed according to the rules defined in this section.

---

## 5.2 Type Categories

DPL defines the following categories of types:

- **Primitive Types** — basic scalar values;
- **Structural Types** — user-defined composite types;
- **Array Types** — fixed-size collections;
- **Linear Types** — non-clonable resources;
- **Resource Types** — externally constrained or scarce entities;
- **Qualified Types** — types annotated with determinism or usage qualifiers.

These categories are orthogonal unless explicitly stated otherwise.

---

## 5.3 Primitive Types

The following primitive types are defined in v0.1:

i32   i64
f32   f64
bool

Primitive types represent immutable values.

Primitive values:

- are copyable;
- have no internal resource semantics;
- are valid in all regimes unless restricted by context.

---

## 5.4 Structural Types (`shape`)

Structural types are defined using `shape` declarations.

A structural type consists of:

- a fixed set of named fields;
- explicit field types;
- no inheritance or subtyping in v0.1.

Example:

shape Vec3 {
x: f64;
y: f64;
z: f64;
}

Structural types are:

- immutable by default;
- copyable only if all fields are copyable;
- treated as linear if any field is linear.

---

## 5.5 Array Types

Array types are written as:

T[N]

where `T` is a type and `N` is a compile-time constant integer.

Array properties:

- size is fixed at compile time;
- indexing semantics are defined in §8;
- copyability depends on element type.

---

## 5.6 Linear Types

### 5.6.1 Definition

A linear type represents a value or resource that MUST be used exactly once.

Linear types:

- MUST NOT be copied;
- MUST NOT be implicitly discarded;
- MUST be consumed, transformed, or returned.

Linearity is enforced statically.

---

### 5.6.2 Sources of Linearity

A type is linear if:

- it is declared as linear by the language;
- it contains a linear field;
- it is returned by a Q-regime process;
- it represents a quantum or scarce physical resource.

---

### 5.6.3 Linearity Violations

The following are compile-time errors:

- copying a linear value;
- failing to use a linear value;
- using a linear value more than once.

---

## 5.7 Resource Types

Resource types represent entities whose availability or usage is externally constrained.

Examples include, but are not limited to:

- hardware interfaces;
- experimental apparatus;
- time-bound or capacity-limited systems.

Resource types:

- MAY be linear or non-linear;
- MUST be declared via `uses` clauses;
- MUST NOT be implicitly created.

---

## 5.8 Qualified Types

Types MAY be annotated with qualifiers that refine their interpretation.

### 5.8.1 Determinism Qualifiers

The following determinism qualifiers are defined:

- `det` — deterministic
- `ens` — ensemble-based
- `adm` — admissibility-derived

Qualifiers indicate how values may be reasoned about, not how they are stored.

---

### 5.8.2 Qualifier Propagation

Qualifiers propagate according to the following rules:

- combining values yields the least deterministic qualifier;
- operations MAY restrict acceptable qualifiers;
- regime rules MAY prohibit certain qualifiers.

---

## 5.9 Regime-Specific Typing Rules

### 5.9.1 K-Regime

In the K-regime:

- all non-linear types are permitted;
- linear types MAY be used if explicitly declared;
- determinism is assumed unless otherwise annotated.

---

### 5.9.2 Q-Regime

In the Q-regime:

- all values MUST be linear;
- primitive copyable types are prohibited unless wrapped;
- linearity violations are fatal compile-time errors.

---

### 5.9.3 Φ-Regime

In the Φ-regime:

- types represent constraint-bearing structures;
- admissibility witnesses MUST be explicitly typed;
- use of values without witnesses is prohibited.

---

## 5.10 Type Validity and Well-Formedness

A program is **well-typed** if:

- all expressions have a statically determined type;
- all linearity rules are satisfied;
- all regime-specific constraints are respected;
- all required qualifiers are present and valid.

Programs that are not well-typed are invalid and MUST be rejected.

---

## 5.11 Type Inference

DPL v0.1 does **not** require global type inference.

Implementations MAY provide limited local inference, provided that:

- all inferred types are unambiguous;
- inferred behavior is equivalent to explicit typing.

Explicit typing is always permitted.

---

## 5.12 Type System Stability

The type system defined in this section is foundational.

Additions to the type system MAY occur in future versions, but:

- removal of type categories,
- relaxation of linearity,
- or weakening of regime constraints

constitute breaking changes and require a new major specification version.

---

© 2026 Dust LLC


⸻
