# Dust Programming Language Specification (v0.2 Draft)

Welcome to the **v0.2 draft** of the Dust Programming Language
(DPL) specification.  This repository is a **complete drop‑in
replacement** for the specification repository and can be used to
track, review and iterate on the proposed changes for the v0.2
release.  It preserves all existing v0.1 semantics while adding
definitions and rules necessary to enable systems‑level programming
in the K‑regime.

## What’s inside?

The `spec/` directory contains the normative specification files.  In
v0.1 these sections covered the language grammar, regime model, type
system, effects and constraints.  For v0.2 we have retained the
original text and appended additive **sections marked “v0.2
additions”** in the appropriate files.  These additions are
structured so they can be merged into the corresponding sections when
v0.2 is finalised.  Files provided here include:

* **`03-grammar-additions.md`** – new grammar productions and
  reserved keywords enabling memory allocation, threading and I/O
  operations.
* **`04-regime-model.md`** – expansions to the K‑regime semantics,
  including deterministic concurrency, memory effects, I/O and
  hardware access.
* **`05-type-system-additions.md`** – definitions of new resource
  types (`Mem`, `Thread<T>`, `Mutex`, `File`, `Port`, `Device`) and
  ownership rules.
* **`06-effects-additions.md`** – extended effect vocabulary
  covering memory management, concurrency, I/O and unsafe blocks.
* **`07-constraints-additions.md`** – new constraints for memory
  safety, concurrency correctness, I/O validity and unsafe code.

## Status and Use

These files constitute a **complete replacement** for the
`dustlang/dustlang` specification repository at the v0.2 draft
stage.  They are intended for implementers and reviewers who need
the full context of the spec along with the new v0.2 additions.  All
changes are **additive** and preserve the semantics of v0.1; existing
programs should compile and run unchanged【587782563170635†L29-L34】.
Where sections remain unchanged from v0.1, please refer to the
original specification for the authoritative text【645413170785987†L474-L498】.

Feedback on these drafts is welcome.  Once the additions are
approved, they will be merged into the canonical specification and
published as v0.2.