
# Dust Programming Language (DPL)

**Version:** v0.1 (Specification in Progress)  
**Status:** Foundational Language Definition  
**License:** Dust Open Source License (DOSL)

---

## Overview

The **Dust Programming Language (DPL)** is a new programming language designed from first principles to support **classical**, **quantum**, and **phase-based** computation within a single, unified system.

DPL is not an extension of existing languages, nor a domain-specific overlay. It is a clean-slate language whose semantics are grounded in physical reality: resources, time, irreversibility, and global consistency are explicit and first-class.

This repository contains the **language specification**, reference materials, and supporting documents that define DPL.

---

## What Makes DPL Different

DPL is built around a small number of foundational ideas:

- **Regime-Typed Computation**  
  Every executable process belongs to one of three explicit regimes:
  - **K** — Classical (deterministic, time-aware computation)
  - **Q** — Quantum (linear, non-clonable resources)
  - **Φ** — Phase (admissibility- and consistency-governed computation)

- **Constraint-First Semantics**  
  Programs describe what must be satisfied, not just sequences of operations.

- **Explicit Effects**  
  Observation, emission, sealing, and coupling are explicit language constructs, not hidden side effects.

- **Physical Realism**  
  Time, resources, irreversibility, and admissibility are modeled directly in the language.

- **Semantic Sovereignty**  
  DPL defines its own execution model, intermediate representation, and verification rules.

---

## Repository Structure

.
├── README.md                 # This file
├── LICENSE                   # Dust Open Source License (DOSL)
├── spec/
│   ├── dpl-spec-v0.1.md      # DPL Language Specification (the “book”)
│   ├── grammar-v0.1.md       # Formal grammar (normative extract)
│   └── glossary.md           # Terminology and definitions
├── notes/
│   ├── design-rationale.md   # Motivations and non-goals
│   └── future-work.md        # Explicitly deferred features
└── examples/
└── (to be added)

> **Note:** The specification is the authoritative definition of the language.  
> No compiler or implementation defines DPL behavior.

---

## The DPL Language Specification

The **DPL Language Spec v0.1** is the canonical reference for:

- lexical structure and grammar
- type system and linearity rules
- effect system
- regime semantics (K / Q / Φ)
- execution model
- admissibility and constraint handling
- conformance requirements

If there is ever a disagreement between an implementation and the specification, **the specification wins**.

---

## Current Status

- Grammar v0.1: **Defined**
- License: **Defined (DOSL)**
- Type system: **In progress**
- Effect system: **In progress**
- Execution model: **Planned**
- Reference compiler: **Not yet implemented**

DPL is currently in the **language-definition phase**.  
Syntax and semantics may evolve until v1.0, but all changes are tracked and versioned.

---

## Non-Goals (v0.x)

DPL intentionally does **not** attempt to be:

- a general-purpose scripting language
- a drop-in replacement for C/C++/Rust
- a wrapper around existing quantum DSLs
- a probabilistic programming language
- a macro-heavy metaprogramming system

Features are added only when they are **physically justified**.

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

- specification clarity
- internal consistency
- error elimination
- example programs that illustrate semantics

Implementation contributions will be considered after the core specification stabilizes.

---

## Philosophy

DPL is designed for people who need their programs to mean something physically.

If you are working in:
- foundational physics
- advanced engineering
- novel computing architectures
- systems where correctness matters more than convenience

then DPL is being built for you.

---

## Status Disclaimer

DPL is an evolving language.  
Nothing in this repository should be considered production-ready unless explicitly marked as such.

---

© 2026 Dust LLC


⸻
