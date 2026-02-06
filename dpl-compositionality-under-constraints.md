# Compositionality Under Constraints in DPL
## When Admissible Systems Do Not Compose

Document Type: Formal Research Paper  
Status: Non-Normative (Semantics-Aligned, Explanatory)  
Applies To: Dust Programming Language (DPL)  
Version: v0.1  
Authority: Specification-defined semantics only  
Copyright: © 2026 Dust LLC

---

## Abstract

Compositionality is often treated as an implicit property of programming systems: if two components are correct in isolation, their composition is assumed to be correct. The Dust Programming Language (DPL) rejects this assumption. In DPL, correctness is governed by global admissibility, and admissibility is not, in general, compositional.

This paper formalizes compositionality under constraint-first semantics. It explains why individually admissible components may fail to compose, defines the conditions under which composition is permitted, and establishes admissibility-preserving composition as a semantic requirement rather than a convenience. This framework is essential for large-scale systems, modular compilation, and distributed computation in DPL.

---

## 1. Introduction

Traditional programming models assume that programs compose by default. Modules, functions, and subsystems are expected to combine mechanically, with correctness preserved through local reasoning.

DPL does not make this assumption.

In DPL, composition is an operation that must itself be admissible. Two systems may each admit valid executions independently, yet no execution may exist for their combination. This outcome is not exceptional; it is fundamental.

This paper explains why compositionality must be constrained and how DPL enforces it.

---

## 2. Composition as a Semantic Operation

In DPL, composition is not syntactic concatenation. It is a semantic operation that combines:

- constraints,
- regimes,
- effects,
- time domains,
- admissibility requirements.

Formally, given two programs A and B, composition produces a candidate program C whose admissibility must be independently established.

Composition does not inherit admissibility automatically.

---

## 3. Local Admissibility vs Global Admissibility

### 3.1 Local Admissibility

A program is locally admissible if there exists at least one execution satisfying its internal constraints under its declared regimes.

Local admissibility answers:
- Can this program exist in isolation?

---

### 3.2 Global Admissibility

A composed program is globally admissible only if there exists an execution satisfying the combined constraints of all components.

Global admissibility answers:
- Can these programs coexist?

Local admissibility does not imply global admissibility.

---

## 4. Non-Additivity of Constraints

Constraints in DPL are not additive.

Examples of non-additivity include:
- incompatible time bounds,
- conflicting resource ownership,
- mutually exclusive effects,
- regime incompatibilities.

The conjunction of two valid constraint sets may be unsatisfiable.

This property is intrinsic to constraint-first semantics.

---

## 5. Failure Modes of Composition

Composition may fail due to:

- constraint contradiction,
- effect interference,
- time-domain overlap violations,
- regime boundary conflicts,
- admissibility witness incompatibility.

These failures do not indicate defects in the components. They indicate invalid composition.

---

## 6. Admissibility-Preserving Composition

### 6.1 Definition

A composition is admissibility-preserving if and only if:

- the combined constraint set is satisfiable,
- regime rules remain consistent,
- effect ordering remains valid,
- time semantics remain coherent.

Only such compositions may exist.

---

### 6.2 Explicit Composition Contracts

DPL encourages explicit composition contracts that specify:

- required invariants,
- resource assumptions,
- time compatibility,
- effect interaction rules.

Composition without a contract is treated as provisional and subject to admissibility rejection.

---

## 7. Composition Across Regimes

### 7.1 K–K Composition

Classical components compose freely unless constrained by time or effects.

---

### 7.2 K–Q Composition

Composition must respect linear resource boundaries. Classical duplication must not alias quantum resources.

---

### 7.3 Φ Composition

Φ-regime components compose only if their admissibility conditions are jointly satisfiable. No partial composition is permitted.

---

## 8. Composition and Modularity

DPL redefines modularity:

- Modules are not guaranteed to compose.
- Interfaces describe admissibility assumptions, not just types.
- Reuse requires admissibility compatibility.

This prevents unsound large-scale system construction.

---

## 9. Distributed Composition

In distributed systems, compositionality failures may arise from:

- clock domain mismatches,
- inconsistent causal assumptions,
- conflicting admissibility witnesses.

DPL treats distributed composition as a first-class admissibility problem.

---

## 10. Implications for Compilation

Compilers must:

- check admissibility at composition points,
- reject inadmissible module combinations,
- preserve admissibility under transformations.

Compilation cannot assume compositional closure.

---

## 11. Implications for Programmers

Programmers must reason not only about components, but about their interactions.

DPL enforces this by:
- rejecting invalid compositions,
- requiring explicit contracts,
- preventing accidental coexistence of incompatible systems.

---

## 12. Conclusion

In DPL, composition is not a convenience; it is a semantic commitment.

By rejecting automatic compositionality, DPL ensures that only globally consistent systems may exist. This discipline enables scalable, trustworthy computation without hidden contradictions.

Correct systems do not merely function in isolation.  
They must be allowed to coexist.

---

© 2026 Dust LLC