# Dust Programming Language Specification

**Language:** Dust Programming Language (DPL)  
**Current Spec Version:** v0.2 (Complete)  
**Status:** Systems Programming Specification  
**License:** Dust Open Source License (DOSL)

---

## Purpose of This Directory

This directory contains the **authoritative specification** of the Dust Programming Language (DPL).

The specification defines:
- the syntax of the language,
- the meaning of programs,
- the rules governing correctness and validity,
- and the requirements for conforming implementations.

All content in this directory is considered **normative** unless explicitly stated otherwise.

---

## Current Specification: v0.2

**File:** `dpl-spec-v0.2.md`

This is the **complete and authoritative specification** for DPL v0.2, including all systems programming extensions:

### v0.2 Features

- **Memory Management**: `alloc`, `free` with Mem type
- **Concurrency**: `spawn`, `join`, `Thread<T>`, `mutex_new`, `mutex_lock`, `mutex_unlock`
- **I/O Operations**: `open`, `read`, `write`, `close`, `io_read`, `io_write`, `mmio_read`, `mmio_write`
- **Unsafe Operations**: `unsafe` blocks
- **Resource Types**: `Mem`, `Thread<T>`, `Mutex`, `File`, `Port`, `Device`
- **Deterministic Scheduling**: Seed-based thread scheduling

### v0.1 Core (also included)

- Regime model (K, Q, Φ)
- Shape declarations
- Process declarations
- Effect system (emit, observe, seal)
- Constraint system
- Binding and contracts

---

## How to Read the Specification

The DPL Language Specification is structured as a **book composed of chapters**, where:

- each chapter is a standalone file,
- each file may grow in complexity over time,
- changes are tracked at the section level,
- the specification as a whole remains coherent and authoritative.

Readers may begin with **§1 Introduction** and proceed sequentially, or jump directly to sections relevant to their interests (e.g., grammar, type system, or execution model).

---

## Specification Authority

The specification files in this directory collectively define the Dust Programming Language.

If there is any disagreement between:
- this specification, and
- any compiler, runtime, tool, example, or external description,

**the specification takes precedence.**

No implementation defines the language.

---

## Structure of the Specification

The specification is organized as follows:

spec/
├── README.md                     # This file
├── dpl-spec-v0.2.md             # Complete v0.2 specification (AUTHORITATIVE)
├── dpl-spec-v0.1.md             # Legacy v0.1 specification
│
├── 01-introduction.md            # §1 Introduction
├── 02-lexical-structure.md      # §2 Lexical Structure
├── 03-grammar.md               # §3 Grammar
├── 04-regime-model.md           # §4 Regime Model
├── 05-type-system.md            # §5 Type System
├── 06-effects.md                # §6 Effects and Irreversibility
├── 07-constraints.md           # §7 Constraints and Admissibility
├── 08-processes.md              # §8 Processes and Execution
├── 09-time-concurrency.md       # §9 Time and Concurrency
├── 10-binding-contracts.md      # §10 Binding and Contracts
├── 11-errors.md                 # §11 Error and Failure Model
├── 12-dir.md                    # §12 Dust Intermediate Representation (DIR)
├── 13-conformance.md            # §13 Conformance Requirements
├── 14-versioning.md             # §14 Versioning and Evolution
├── 15-security.md               # §15 Security and Safety Considerations
│
├── glossary.md                   # Shared terminology
├── rationale.md                 # Non-normative design rationale
├── changelog.md                 # Specification change log
└── drafts/
    └── v0.2/
        └── spec/
            └── # Draft additions (superseded by dpl-spec-v0.2.md)

---

## Versioning Model

- The **language specification** has a version number (e.g., v0.2).
- Individual sections may evolve internally without changing the overall spec version.
- The spec version increments only when a change introduces breaking semantic differences.

The change history for the specification is recorded in `changelog.md`.

---

## Normative Language

Throughout the specification, the terms **MUST**, **MUST NOT**, **SHOULD**, **SHOULD NOT**, and **MAY** are used as defined in RFC 2119.

---

## Non-Normative Content

The following files are **not normative** and are provided for explanatory or historical context only:

- `rationale.md`
- design notes
- commentary embedded in examples

These materials do not define language behavior.

---

## Contributions and Changes

During the v0.x series, changes to the specification prioritize:

- clarity,
- internal consistency,
- elimination of ambiguity,
- alignment with physical meaning.

New features are introduced only when they are clearly justified and scoped.

---

## Scope Disclaimer

The Dust Programming Language is under active definition.

Nothing in this directory should be considered production-ready unless explicitly stated.  
Semantics may evolve until the language reaches v1.0.

---

© 2026 Dust LLC
