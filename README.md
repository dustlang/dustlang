# Dust Programming Language (DPL)

**Version:** v0.1  
**Status:** Foundational Language Definition  
**License:** Dust Open Source License (DOSL)

---

## Overview

The **Dust Programming Language (DPL)** is a programming language designed from first principles to support **classical**, **quantum**, and **phase-based** computation within a single, unified system.

DPL is not an extension of existing languages, nor a domain-specific overlay. It is a clean-slate language whose semantics are grounded in **physical reality**: resources, time, irreversibility, and global consistency are explicit and first-class.

This repository contains the **canonical language specification** and the supporting normative and non-normative documents that define, explain, and govern DPL.

---

## What Makes DPL Different

DPL is built around a small number of foundational ideas:

- **Regime-Typed Computation**  
  Every executable process belongs to one of three explicit regimes:
  - **K** — Classical (deterministic, time-aware computation)
  - **Q** — Quantum (linear, non-clonable resources)
  - **Φ** — Phase (admissibility- and consistency-governed computation)

- **Constraint-First Semantics**  
  Programs describe what must be satisfied, not merely sequences of operations.

- **Explicit Effects**  
  Observation, emission, sealing, and coupling are explicit language constructs, never hidden side effects.

- **Physical Realism**  
  Time, resources, irreversibility, and admissibility are modeled directly in the language.

- **Semantic Sovereignty**  
  DPL defines its own semantics, intermediate representation, execution model, and conformance rules.

---

## Design Principles

DPL is guided by a small set of non-negotiable design principles:

- **Explicitness Over Inference**  
  No important behavior is implied, inferred, or guessed later.

- **Constraints Before Control Flow**  
  Validity is established globally before execution proceeds locally.

- **Determinism as a Requirement**  
  Observable behavior must be reproducible and auditable.

- **Admissibility as a Gatekeeper**  
  Computation proceeds only when global constraints are satisfied.

- **Implementation Independence**  
  No compiler, runtime, or backend defines language meaning.

- **Semantic Stability Over Time**  
  Evolution is constrained to preserve meaning, not novelty.

These principles are enforced structurally, not by convention.

---

## Repository Structure

```
dustlang/
├── README.md                     # This file
├── LICENSE                       # Dust Open Source License (DOSL)
├── DPL_White_Paper.md            # Vision & positioning (non-normative)
│
├── spec/                         # Canonical language specification (LAW)
│   ├── README.md
│   ├── dpl-spec-v0.1.md
│   ├── 01-introduction.md
│   ├── 02-lexical-structure.md
│   ├── 03-grammar.md
│   ├── 04-regime-model.md
│   ├── 05-type-system.md
│   ├── 06-effects.md
│   ├── 07-constraints.md
│   ├── 08-processes.md
│   ├── 09-time-concurrency.md
│   ├── 10-binding-contracts.md
│   ├── 11-errors.md
│   ├── 12-dir.md
│   ├── 13-conformance.md
│   ├── 14-versioning.md
│   ├── 15-security.md
│   ├── glossary.md
│   ├── rationale.md
│   ├── changelog.md
│   └── notes/
│       ├── design-rationale.md
│       └── future-work.md
│
├── charter/                      # Authority, scope, admissibility
├── ir/                           # Dust Intermediate Representation
├── vm/                           # Dust Virtual Machine semantics
├── compiler/                     # Compiler architecture & phase model
├── semantics/                    # Admissibility, effects, time
├── security/                     # Security model
├── verification/                 # Formal verification hooks
├── governance/                   # Versioning & semantic stability
├── research/                     # Interpretive research (non-normative)
├── guides/                       # Examples, book, migration
└── archive/                      # Deprecated / inadmissible materials
```

> **Note:** The specification (`/spec`) is the authoritative definition of the language.  
> No compiler, runtime, guide, or example defines DPL behavior.

---

## The DPL Language Specification

The **DPL Language Specification v0.1** is the canonical reference for:

- lexical structure and grammar  
- type system and linearity rules  
- effect system and irreversibility  
- regime semantics (K / Q / Φ)  
- execution model  
- admissibility and constraint handling  
- conformance requirements  

If there is ever a disagreement between an implementation and the specification,  
**the specification wins**.

---

## Governance and Evolution

DPL evolves under explicit governance to preserve semantic stability.

- Language meaning is defined **only** by the specification
- Compatibility is enforced at the DIR level
- Implementations do not create precedent
- Changes are versioned, constrained, and auditable

Governance exists to protect meaning, not to accelerate change.  
See `/charter` and `/governance` for details.

---

## Current Status

- Grammar v0.1: **Defined**
- License: **Defined (DOSL)**
- Core semantic model: **Defined**
- Intermediate representation (DIR): **Defined**
- Execution semantics (DVM): **Defined**
- Compiler architecture: **Defined**
- Reference implementation: **In progress**

DPL is currently in the **language-definition and consolidation phase**.  
Semantics are explicit, versioned, and governed.

---

## Non-Goals (v0.x)

DPL intentionally does **not** attempt to be:

- a general-purpose scripting language  
- a drop-in replacement for existing systems languages  
- a wrapper around external quantum DSLs  
- a probabilistic programming language  
- a macro-heavy metaprogramming system  

Features are added only when they are **semantically and physically justified**.

---

## Licensing

DPL is released under the **Dust Open Source License (DOSL)**.

- Free to use, modify, and distribute
- Mandatory attribution to Dust LLC
- No transfer of Dust LLC copyrights, patents, or trademarks
- No warranty or support
- Clear limitation of liability

See the `LICENSE` file for full terms.

---

## Contributing

At this stage, contributions are focused on:

- specification clarity and internal consistency
- error discovery and correction
- example programs that illustrate semantics
- tooling that respects canonical definitions

Implementation contributions are evaluated strictly against the specification.

---

## Final Note

DPL is a language for systems where **meaning matters**.

If something is important:
- it must be explicit,
- it must be constrained,
- and it must be admissible.

Nothing else is allowed to happen.

---

© 2026 Dust LLC