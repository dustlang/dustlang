# §4 Regime Model
## Dust Programming Language Specification v0.1

**Status:** Normative  
**Last Updated:** February 2026

This section is part of the Dust Programming Language Specification v0.1.

---

## 4.1 Overview

The Dust Programming Language defines computation in terms of **explicit regimes**.  
A regime specifies the fundamental rules under which a process executes, including:

- how data may be represented and manipulated;
- how resources are treated;
- what forms of effects are permitted;
- how determinism and irreversibility are handled.

Every executable process in DPL MUST belong to exactly one regime.

Regimes are not interchangeable abstractions. Each regime reflects a distinct class of physically meaningful computation.

---

## 4.2 Regime Classification

DPL defines three computation regimes in v0.1:

- **K** — Classical (deterministic computation)
- **Q** — Quantum (linear resource computation)
- **Φ** — Phase (admissibility-based computation)

The regime of a process is declared syntactically and is visible at compile time.

---

## 4.3 K-Regime (Classical Computation)

### 4.3.1 Purpose

The K-regime models deterministic classical computation.

It is intended for:
- control logic,
- numerical computation,
- orchestration,
- interaction with classical systems.

---

### 4.3.2 Characteristics

K-regime processes exhibit the following properties:

- values are copyable and reusable;
- execution is deterministic, subject to explicit effects;
- control flow follows classical semantics;
- time and resource usage may be declared explicitly.

---

### 4.3.3 Permitted Operations

Within a K-regime process:

- all value types may be used;
- mutable state is not permitted unless explicitly modeled;
- effects such as `emit`, `observe`, and `seal` are permitted;
- calls to other K-regime processes are permitted.

---

## 4.4 Q-Regime (Quantum Computation)

### 4.4.1 Purpose

The Q-regime models computation over **non-clonable, linear resources**.

It is intended to represent quantum state preparation, transformation, and measurement without embedding quantum mechanics inside classical abstractions.

---

### 4.4.2 Characteristics

Q-regime processes exhibit the following properties:

- values are treated as linear resources;
- copying and implicit reuse are prohibited;
- operations are reversible unless explicitly marked as irreversible;
- measurement is an explicit effect.

---

### 4.4.3 Linearity

All values manipulated within a Q-regime process MUST obey linear usage rules.

A linear value:

- MUST be used exactly once;
- MUST NOT be implicitly copied or discarded;
- MAY be transformed or consumed by effects.

Violations of linearity are compile-time errors.

---

### 4.4.4 Permitted Operations

Within a Q-regime process:

- only linear types may be used;
- effects are restricted to those defined as valid for Q-regime;
- calls to other Q-regime processes are permitted;
- calls to K- or Φ-regime processes are not permitted directly.

---

## 4.5 Φ-Regime (Phase Computation)

### 4.5.1 Purpose

The Φ-regime models computation governed by **global phase consistency and admissibility**, rather than probabilistic sampling or collapse.

It is intended for systems where validity arises from the existence of consistent configurations subject to constraints.

---

### 4.5.2 Characteristics

Φ-regime processes exhibit the following properties:

- computation is constraint-driven rather than instruction-driven;
- execution seeks admissible configurations;
- results are validated by proofs or witnesses of admissibility;
- non-determinism is not treated as intrinsic randomness.

---

### 4.5.3 Constraints and Admissibility

A Φ-regime process may declare constraints that must be satisfied.

Execution is considered successful if and only if:

- a configuration satisfying all constraints exists, and
- an admissibility witness can be constructed.

Failure to find such a configuration is not an error of execution, but an admissibility failure.

---

### 4.5.4 Permitted Operations

Within a Φ-regime process:

- constraint declarations are permitted;
- proof construction is permitted;
- effects are restricted and MUST be justified by admissibility;
- calls to other Φ-regime processes are permitted.

---

## 4.6 Regime Isolation

Processes in different regimes are isolated by default.

A process in one regime:

- MUST NOT directly call a process in another regime;
- MUST NOT access values defined in another regime;
- MUST NOT rely on semantics from another regime.

This isolation ensures that the rules of each regime remain well-defined and enforceable.

---

## 4.7 Cross-Regime Interaction

Interaction between regimes is permitted only through **explicit binding declarations**.

A binding:

- declares a directional relationship between two processes;
- specifies contractual obligations governing the interaction;
- defines what information, effects, or results may cross the boundary.

Bindings are declared outside of process bodies and are statically verified.

---

## 4.8 Regime Visibility and Tooling

The regime of every process is:

- explicitly declared in source code;
- visible to the compiler and tooling;
- available for static analysis and verification.

Tooling MAY use regime information to:

- enforce correctness;
- generate warnings;
- restrict unsafe compositions.

---

## 4.9 Regime Stability

The regime model defined in this section is foundational.

Changes to:
- the number of regimes,
- the meaning of existing regimes,
- or the isolation rules between regimes,

constitute **breaking changes** and require a new major specification version.

---

© 2026 Dust LLC


⸻