# Information Carriers in DPL
## Bits, Qubits, and Phibits Under Constraint-First Semantics

**Document Type:** Technical Comparison  
**Status:** Non-Normative (Formal, Explanatory)  
**Applies To:** Dust Programming Language (DPL)  
**Version:** v0.1  
**Authority:** Specification-defined semantics only  
**Copyright:** © 2026 Dust LLC  

---

## Abstract

The Dust Programming Language (DPL) introduces a unified semantic framework in which classical, quantum, and phase-based computation coexist without contradiction. Central to this framework is a precise distinction between three classes of information carriers: **Bits**, **Qubits**, and **Phibits**.

This paper presents a formal, technical comparison of these carriers as they are defined, constrained, and enforced within DPL. The comparison is grounded in constraint-first semantics, explicit irreversibility, regime typing, and admissibility-gated execution. Rather than treating information uniformly as state, DPL assigns each carrier a distinct semantic role: values, linear resources, and global admissibility conditions.

The goal of this paper is to clarify what each carrier represents, how it evolves, what guarantees it provides, and why Phibits constitute a genuinely new class of information enabled only by DPL’s semantic architecture.

---

## 1. Scope and Framing

This document compares Bits, Qubits, and Phibits **as semantic objects in DPL**, not as hardware abstractions or philosophical concepts. The analysis is limited to:

- semantic constraints
- admissibility rules
- effect and irreversibility handling
- determinism and global consistency

This paper does not define language semantics. All authoritative definitions reside in the specification and related normative documents.

---

## 2. Formal Definitions

### 2.1 Bit (Classical Value)

A **Bit** in DPL is a classical, copyable value governed by deterministic semantics.

Formally:
- A Bit is a value with local state.
- It may be copied freely.
- Its evolution is fully determined by program logic.
- It carries no global consistency obligations.
- Failure involving Bits is typically local and recoverable.

Bits exist exclusively within the **K-regime**.

---

### 2.2 Qubit (Linear Quantum Resource)

A **Qubit** in DPL is a linear, non-copyable resource.

Formally:
- A Qubit has single ownership.
- It cannot be copied or implicitly duplicated.
- Its evolution is constrained to unitary transformations.
- Measurement is an explicit, irreversible effect.
- Measurement consumes the resource.

Qubits exist within the **Q-regime** and are enforced by the linear type system.

---

### 2.3 Phibit (Phase / Admissibility Carrier)

A **Phibit** is neither a value nor a physical resource.

Formally:
- A Phibit represents a **global admissibility condition**.
- It does not encode binary state.
- It encodes whether a configuration is globally consistent.
- It has no meaningful local representation.
- It does not evolve probabilistically.
- It resolves to *admissible* or *inadmissible*.

Phibits exist exclusively within the **Φ-regime**.

---

## 3. Semantic Classification

| Property | Bit | Qubit | Phibit |
|--------|-----|-------|--------|
| Regime | K | Q | Φ |
| Ontology | Value | Resource | Consistency condition |
| Copyable | Yes | No | Not applicable |
| Local state | Yes | Yes | No |
| Global constraints | No | Limited | Yes |
| Probabilistic | No | At observation | No |
| Collapse | No | Yes (measurement) | No |
| Deterministic | Yes | Until measurement | Yes |
| Irreversible effects | Optional | Required | Required |
| Failure meaning | Runtime error | Measurement outcome | Inadmissibility |

---

## 4. Evolution Semantics

### 4.1 Bit Evolution

Bit evolution is instruction-determined and local:

    bₙ₊₁ = f(bₙ)

Characteristics:
- deterministic
- copy-safe
- independent of global constraints
- execution may proceed despite unrelated failures

---

### 4.2 Qubit Evolution

Qubit evolution is linear and constrained:

    |ψₙ₊₁⟩ = U |ψₙ⟩

Characteristics:
- linearity enforced statically
- no cloning permitted
- measurement produces classical information
- measurement irreversibly consumes the resource

---

### 4.3 Phibit Resolution

Phibits do not evolve temporally. Instead, they resolve:

    Φ(system, constraints) → { admissible | inadmissible }

Characteristics:
- no intermediate state
- no branching
- no sampling
- no collapse

Resolution depends solely on global consistency.

---

## 5. Determinism and Randomness

### Bits
- fully deterministic
- no intrinsic randomness

### Qubits
- deterministic evolution
- apparent randomness only at measurement
- randomness tied to irreversible observation

### Phibits
- fully deterministic
- no randomness at any stage
- outcome fixed by admissibility

**Key distinction:** Phibits replace probability with **consistency**.

---

## 6. Failure Semantics

### Bit Failure
- typically local
- often recoverable
- does not invalidate unrelated computation

### Qubit Failure
- misuse is a compile-time error (linearity violation)
- measurement is irreversible but valid

### Phibit Failure
- failure means *no admissible configuration exists*
- execution halts immediately
- no recovery semantics are defined

Phibit failure is not an error—it is a semantic conclusion.

---

## 7. Information-Theoretic Roles

### Bits
- encode local, classical information
- best suited for control, logic, and arithmetic

### Qubits
- encode physical quantum information
- best suited for interference and entanglement

### Phibits
- encode **global logical information**
- best suited for constraint satisfaction, validation, and proofs of consistency

Phibits do not replace Bits or Qubits; they address a different informational dimension.

---

## 8. Why Phibits Are New

Traditional programming languages lack Phibits because they lack:
- global admissibility semantics
- explicit failure as non-existence
- constraint-first execution models

Phibits arise naturally only when:
- constraints are semantic, not procedural
- execution is gated by admissibility
- global consistency is first-class

This makes Phibits a **language-level construct**, not a library abstraction.

---

## 9. Unified Use in DPL

DPL supports all three carriers coherently:
- **Bits** orchestrate deterministic computation
- **Qubits** carry linear, physical state
- **Phibits** determine whether the system as a whole may proceed

Unification occurs at the level of **admissibility**, not representation.

---

## 10. Implications for Computation

The introduction of Phibits enables:
- non-probabilistic global reasoning
- admissibility-native solvers
- proof-carrying execution
- deterministic decision systems
- constraint-bound AI control layers

These applications are impractical without a semantic distinction between values, resources, and admissibility.

---

## 11. Summary

**Bits compute.**  
**Qubits interfere.**  
**Phibits constrain existence.**

DPL is the first language in which all three are:
- formally distinguished
- semantically enforced
- interoperable without contradiction

This distinction defines not just how computation is expressed, but **what kinds of computation are possible**.

---

© 2026 Dust LLC