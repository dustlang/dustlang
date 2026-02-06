# The DPL Corpus Index and Reading Order
## A Map of Meaning, Authority, and Dependency

Document Type: Canonical Index / Synthesis Paper  
Status: Normative for Navigation (Non-Semantic)  
Applies To: Dust Programming Language (DPL)  
Version: v0.1  
Authority: Specification-defined semantics only  
Copyright: © 2026 Dust LLC

---

## Abstract

The Dust Programming Language (DPL) corpus is a deliberately structured body of documents defining semantics, constraints, governance, and usage. This index provides a complete map of that corpus, establishes reading orders for different audiences, and clarifies dependency relationships among documents.

This document does not introduce new semantics. Its purpose is architectural: to make the meaning of the corpus navigable, stable, and auditable. It serves as the final capstone of the DPL documentation stack.

---

## 1. Corpus Philosophy

The DPL corpus is not a collection of independent papers. It is a **single semantic system**, partitioned for clarity and authority.

Principles:
- Meaning flows downward from the specification.
- No document contradicts a higher-authority document.
- Non-normative papers explain, but do not define.
- The absence of a document is treated as intentional.

---

## 2. Authority Layers

### 2.1 Normative Layer (Defines Meaning)

These documents define what DPL *is*.

- **DPL Language Specification** (`spec/`)
- **Dust Intermediate Representation (DIR) Specification**
- **Dust Virtual Machine (DVM) Reference Semantics**

If there is disagreement, these documents win.

---

### 2.2 Semantic Foundations (Explain Meaning)

These documents explain why the specification is shaped as it is.

- `dpl-information-carriers.md`
- `dpl-access-semantics.md`
- `dpl-observability-and-knowledge-boundaries.md`
- `dpl-non-existence-and-inadmissibility.md`
- `dpl-compositionality-under-constraints.md`

---

### 2.3 Execution, Transformation, and Correctness

These documents govern how meaning is preserved under use.

- `dpl-constraint-first-debugging.md`
- `dpl-admissibility-preserving-optimization.md`
- `dpl-semantic-equivalence-and-identity.md`
- `dpl-semantic-telemetry-and-introspection.md`
- `dpl-limits-of-computation.md`

---

### 2.4 Governance and Evolution

These documents ensure meaning survives time.

- `dpl-governance-and-semantic-stability.md`
- `dpl-executable-specifications-and-conformance.md`

---

### 2.5 Ecosystem and Scale

These documents define how DPL grows without drift.

- `dpl-ecosystem-layering-and-library-semantics.md`

---

## 3. Canonical Reading Orders

### 3.1 For Language Implementers

1. DPL Language Specification  
2. DIR Specification  
3. DVM Reference Semantics  
4. `dpl-admissibility-preserving-optimization.md`  
5. `dpl-semantic-equivalence-and-identity.md`  
6. `dpl-governance-and-semantic-stability.md`  
7. `dpl-executable-specifications-and-conformance.md`  

---

### 3.2 For Researchers and Theorists

1. `dpl-information-carriers.md`  
2. `dpl-non-existence-and-inadmissibility.md`  
3. `dpl-compositionality-under-constraints.md`  
4. `dpl-limits-of-computation.md`  
5. `dpl-semantic-equivalence-and-identity.md`  

---

### 3.3 For Tool and Compiler Authors

1. DPL Language Specification  
2. DIR Specification  
3. `dpl-constraint-first-debugging.md`  
4. `dpl-semantic-telemetry-and-introspection.md`  
5. `dpl-admissibility-preserving-optimization.md`  

---

### 3.4 For Advanced Users and System Designers

1. DPL White Paper  
2. `dpl-information-carriers.md`  
3. `dpl-non-existence-and-inadmissibility.md`  
4. `dpl-ecosystem-layering-and-library-semantics.md`  
5. `dpl-governance-and-semantic-stability.md`  

---

## 4. Dependency Discipline

Rules:
- No lower-layer document introduces new semantics.
- All examples defer to the specification.
- All explanations assume admissibility as primary.
- Any future document must declare its dependency layer.

Violations are grounds for rejection.

---

## 5. Corpus Completeness

With this index, the DPL corpus is considered **semantically complete** for v0.1.

Future additions may:
- extend explanations,
- add guides,
- clarify tooling.

They may not:
- reinterpret meaning,
- relax constraints,
- introduce shadow semantics.

---

## 6. Maintenance and Evolution

This index must be updated whenever:
- a new top-level document is added,
- a dependency relationship changes,
- a reading path is revised.

It is the canonical map of the corpus.

---

## 7. Conclusion

The Dust Programming Language corpus is designed to be read, reasoned about, and trusted as a whole. This index ensures that every reader—human or institutional—can understand not just the documents, but their relationships and authority.

Meaning in DPL is not scattered.  
It is structured, layered, and complete.

---

© 2026 Dust LLC