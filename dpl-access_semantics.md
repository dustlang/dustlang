# Access Semantics of Information Carriers in DPL  
## Bits, Qubits, and Phibits as Distinct Modes of Access

**Document Type:** Formal Technical Paper  
**Status:** Non-Normative (Explanatory, Semantics-Aligned)  
**Applies To:** Dust Programming Language (DPL)  
**Version:** v0.1  
**Authority:** Specification-defined semantics only  
**Copyright:** © 2026 Dust LLC  

---

## Abstract

The Dust Programming Language (DPL) introduces a semantic distinction not only between different kinds of information carriers—Bits, Qubits, and Phibits—but also between the *ways in which those carriers may be accessed*. Unlike conventional programming languages, which assume a uniform notion of read/write access, DPL defines **access itself as a regime-dependent semantic operation**.

This paper formalizes the access semantics of Bits, Qubits, and Phibits in DPL. It demonstrates that each carrier supports a fundamentally different access mode: **evaluation**, **consumption**, and **resolution**, respectively. These access modes are enforced structurally by the type system, effect system, and admissibility rules, and they preserve the semantic meaning of each carrier. The result is a unified yet non-uniform access model that enables global correctness, physical realism, and admissibility-based computation.

---

## 1. Introduction

In most programming languages, access to information is implicitly uniform. Values are read, written, copied, and inspected under a single abstraction—typically memory access. Even in advanced systems, restrictions on access are treated as exceptions rather than semantic primitives.

DPL rejects this assumption.

In DPL, *how* information is accessed is as important as *what* information exists. Each information carrier enforces its own access semantics, aligned with its ontological role and global constraints. This paper presents a formal account of those access semantics and explains why a uniform access model is neither sound nor sufficient for DPL’s goals.

---

## 2. Access as a Semantic Operation

### 2.1 Access Is Not Observation

In DPL, access is not synonymous with observation. Observation is an explicit effect, while access is a semantic interaction governed by regime rules.

Formally:
- Access may or may not be observable.
- Access may or may not be reversible.
- Access may or may not preserve the accessed entity.

Access is therefore treated as a **semantic operation**, not a syntactic convenience.

---

### 2.2 Access and Correctness

Because DPL enforces global admissibility, incorrect access is not merely unsafe—it is **inadmissible**. The language must therefore define, for each information carrier, what forms of access are meaningful and allowed.

---

## 3. Bits: Access by Evaluation

### 3.1 Definition

Bits are classical values in the K-regime. Their defining property is **local determinism**.

---

### 3.2 Access Semantics

Accessing a Bit means *evaluating its value*.

Formally:
- Access(B) → Value
- Access does not alter the Bit.
- Access has no global consequences.

Properties:
- Copying is permitted.
- Repeated access yields identical results.
- Access is reversible.

---

### 3.3 Effects and Bits

Accessing a Bit does not produce an effect. Effects arise only when Bit values are explicitly observed, emitted, or coupled to the external world.

---

### 3.4 Summary

Bits support **value access**:
- read ≡ evaluate
- write ≡ assign
- copy ≡ duplicate

This access model aligns with deterministic classical computation.

---

## 4. Qubits: Access by Consumption

### 4.1 Definition

Qubits are linear resources in the Q-regime. Their defining property is **single ownership**.

---

### 4.2 Access Semantics

Qubits cannot be accessed by inspection. Any interaction with a qubit is either:
- a transformation that preserves linearity, or
- a measurement that consumes the resource.

Formally:
- Access(Q) ≠ Value
- Access(Q) → Resource evolution or consumption

There is no operation corresponding to “read without change”.

---

### 4.3 Measurement as Access

Measurement is the only operation that yields classical information from a qubit. It is:
- explicit,
- irreversible,
- destructive with respect to the qubit resource.

After measurement, the qubit no longer exists as an accessible entity.

---

### 4.4 Enforcement

The linear type system statically enforces:
- no copying,
- no aliasing,
- no implicit reuse.

Incorrect access is a compile-time error.

---

### 4.5 Summary

Qubits support **resource access**:
- access ≡ use
- observation ≡ consumption
- reuse ≡ illegal

This access model preserves physical constraints.

---

## 5. Phibits: Access by Resolution

### 5.1 Definition

Phibits are global admissibility carriers in the Φ-regime. They do not represent state, value, or resource.

---

### 5.2 Access Semantics

Phibits cannot be accessed by reading, writing, or inspection. Instead, they are **resolved**.

Resolution answers a single question:
> Does a globally admissible configuration exist under the declared constraints?

Formally:
- Access(Φ) → { admissible | inadmissible }

There is no intermediate result.

---

### 5.3 No Local Representation

A Phibit has:
- no address,
- no local state,
- no duplicable representation.

Attempting to treat a Phibit as a value or resource is a semantic error.

---

### 5.4 Resolution as Effect

Resolving a Phibit is an observable, irreversible boundary:
- admissible → execution may proceed
- inadmissible → execution halts

Resolution does not consume a resource; it determines existence.

---

### 5.5 Summary

Phibits support **admissibility resolution**:
- no inspection
- no copying
- no partial access

They encode global consistency, not data.

---

## 6. Comparative Access Model

| Carrier | Access Mode | Can Inspect? | Can Copy? | Access Is Reversible? | Outcome |
|------|------------|--------------|-----------|-----------------------|---------|
| Bit | Evaluation | Yes | Yes | Yes | Value |
| Qubit | Consumption | No | No | No | Value + resource destruction |
| Phibit | Resolution | No | No | No | Admissible / Inadmissible |

---

## 7. Unified Access Law

DPL enforces the following access law:

> **Information carriers may only be accessed in ways that preserve their semantic meaning.**

This law prevents:
- copying linear resources,
- inspecting global constraints,
- treating admissibility as data.

Access violations are semantic violations.

---

## 8. Implications for Language Design

This access model enables:
- deterministic replay,
- explicit irreversibility,
- global correctness enforcement,
- non-probabilistic consistency resolution.

It also explains why Phibits cannot be implemented as libraries in other languages: the access model itself must be enforced by the language core.

---

## 9. Implications for Programmers

Programmers must think in terms of:
- **what kind of information they hold**, and
- **how that information may be accessed**.

DPL does not allow accidental misuse. The language enforces correct access structurally.

---

## 10. Conclusion

DPL formalizes access as a semantic operation rather than a uniform abstraction. By distinguishing evaluation, consumption, and resolution as separate access modes, DPL preserves the integrity of Bits, Qubits, and Phibits and enables new classes of computation.

The result is a language in which:
- Bits are accessed,
- Qubits are consumed,
- Phibits are resolved.

This distinction is not an implementation detail.  
It is a foundational property of computation in DPL.

---

© 2026 Dust LLC