# Dust Language Charter — Scope

**Status:** Normative  
**Applies To:** Entire `dustlang` repository  
**Scope:** Semantic domain, responsibility boundaries, and exclusions

---

## 1. Purpose

This document defines the **scope of responsibility** of the Dust Programming Language (DPL).

Its purpose is to specify:
- what the Dust language and specification are responsible for defining,
- what they intentionally leave undefined,
- and where Dust’s authority begins and ends.

This charter ensures that the language remains coherent, bounded, and non-overreaching.

---

## 2. Scope of the Dust Programming Language

The Dust Programming Language governs the following domains:

- Program meaning and semantics
- Type systems and admissibility
- Computational regimes (K, Q, Φ)
- Effects and irreversibility
- Time and concurrency semantics
- Constraint formulation and satisfaction
- Canonical semantic representation (DIR)
- Reference execution meaning (DVM)

Within these domains, Dust definitions are **complete and authoritative**.

---

## 3. What Dust Explicitly Defines

DPL explicitly defines:

- The meaning of valid programs
- The conditions under which programs are admissible
- The semantic consequences of effects
- The structure of execution as observable behavior
- The invariants required for correctness and determinism
- The rules governing regime interaction

If behavior is defined in the specification, it is **binding**.

---

## 4. What Dust Explicitly Does Not Define

DPL intentionally does **not** define:

- Implementation strategies
- Performance characteristics
- Memory layouts
- Instruction selection
- Hardware-specific optimizations
- Compilation algorithms
- Runtime data structures
- Tooling user interfaces

These concerns are delegated to implementations, provided they remain observationally equivalent.

---

## 5. Undefined vs Unspecified Behavior

Dust distinguishes between:

- **Undefined behavior**:  
  Explicitly prohibited constructs whose meaning is invalid.

- **Unspecified behavior**:  
  Intentionally unconstrained choices permitted to vary between implementations while preserving observable equivalence.

Only the specification may designate behavior as undefined or unspecified.

---

## 6. Observational Boundary

The scope of Dust ends at **observable program behavior**, as defined by:

- effects,
- outputs,
- admissibility outcomes,
- and execution traces.

Internal implementation details that do not affect observation are out of scope.

---

## 7. Relationship to External Systems

Dust may interact with:
- operating systems,
- hardware devices,
- external services,
- or physical systems,

but the semantics of those systems are **not** governed by Dust.

Dust governs only:
- how such interactions are represented,
- constrained,
- and observed within a Dust program.

---

## 8. Non-Goals

The following are **non-goals** of the Dust Programming Language:

- Serving as a hardware description language
- Replacing operating systems
- Defining physical laws
- Enforcing a specific programming style
- Optimizing for any single execution substrate

Excluding these goals preserves semantic clarity.

---

## 9. Scope Invariants

The following invariants must always hold:

- Dust defines meaning, not mechanism
- Dust governs programs, not implementations
- Dust constrains execution, not performance
- Dust models interaction, not external reality itself

Any document or proposal that violates these invariants is inadmissible.

---

## 10. Final Statement

The strength of the Dust Programming Language lies in its **bounded authority**.

By defining its scope precisely—and refusing to exceed it—Dust preserves semantic integrity, enables diverse implementations, and maintains long-term coherence.

Scope is not limitation.  
Scope is **discipline**.

---