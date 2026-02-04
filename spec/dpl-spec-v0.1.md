# Dust Programming Language (DPL)  
## Language Specification v0.1

**Status:** Draft  
**Version:** v0.1  
**Last Updated:** February 2026  
**License:** Dust Open Source License (DOSL)

---

## Copyright

Copyright © 2026 Dust LLC  
All rights reserved.

---

## About This Document

This document is the **authoritative specification** of the **Dust Programming Language (DPL)**, version v0.1.

It defines the syntax, semantics, and conformance requirements of the language.  
Any implementation of DPL **must conform to this specification** to be considered compliant.

If there is a conflict between:
- this specification, and
- any compiler, runtime, tool, or example,

**this specification takes precedence.**

---

## Scope of v0.1

DPL v0.1 defines the **foundational core** of the language:

- lexical structure
- grammar
- regime model (K / Q / Φ)
- type system (core)
- effect system (core)
- binding and contract semantics
- error and failure model
- conformance requirements

The following are **explicitly out of scope** for v0.1:

- macro systems
- generics
- inheritance
- reflection
- exceptions
- dynamic typing
- implicit concurrency
- standard library completeness
- optimization guarantees

These may be addressed in later versions if justified.

---

## Normative Language

The key words **MUST**, **MUST NOT**, **SHOULD**, **SHOULD NOT**, and **MAY** in this document are to be interpreted as described in RFC 2119.

---

## Table of Contents

### 1. Introduction
1.1 Purpose of the Dust Programming Language  
1.2 Design Philosophy  
1.3 Intended Use Cases  
1.4 Non-Goals  
1.5 Relationship to Implementations  

---

### 2. Lexical Structure
2.1 Character Set  
2.2 Tokens  
2.3 Whitespace and Comments  
2.4 Identifiers  
2.5 Keywords and Reserved Words  
2.6 Literals  

---

### 3. Grammar
3.1 Overview  
3.2 Program Structure  
3.3 Forge Declarations  
3.4 Shape Declarations  
3.5 Process Declarations  
3.6 Statements  
3.7 Expressions  
3.8 Binding Declarations  
3.9 Grammar Constraints  

> *This section incorporates the normative grammar defined in*  
> **Grammar v0.1**.

---

### 4. Regime Model
4.1 Overview of Regimes  
4.2 K-Regime (Classical Computation)  
4.3 Q-Regime (Quantum Computation)  
4.4 Φ-Regime (Phase Computation)  
4.5 Regime Isolation Rules  
4.6 Cross-Regime Interaction  

---

### 5. Type System
5.1 Type Categories  
5.2 Primitive Types  
5.3 Structural Types (`shape`)  
5.4 Linear Types  
5.5 Resource Types  
5.6 Dimensional and Unit Types  
5.7 Determinism Qualifiers  
5.8 Type Validity and Well-Formedness  

---

### 6. Effects and Irreversibility
6.1 Effect Overview  
6.2 Observation (`observe`)  
6.3 Emission (`emit`)  
6.4 Sealing (`seal`)  
6.5 Effect Propagation  
6.6 Effect Restrictions by Regime  

---

### 7. Constraints and Admissibility
7.1 Constraint Declarations  
7.2 Global vs Local Constraints  
7.3 Admissibility Conditions  
7.4 Proofs and Witnesses  
7.5 Failure of Admissibility  

---

### 8. Processes and Execution
8.1 Process Lifecycle  
8.2 Resource Declaration (`uses`)  
8.3 Linearity Enforcement  
8.4 Evaluation Order  
8.5 Determinism Guarantees  

---

### 9. Time and Concurrency
9.1 Logical Time  
9.2 Physical Time  
9.3 Clocks and Scheduling  
9.4 Deadlines and Jitter  
9.5 Synchronization Domains  

---

### 10. Binding and Contracts
10.1 Bind Declarations  
10.2 Contract Semantics  
10.3 Cross-Regime Contracts  
10.4 Contract Violations  

---

### 11. Error and Failure Model
11.1 Compile-Time Errors  
11.2 Type Errors  
11.3 Constraint Failures  
11.4 Runtime Traps  
11.5 Undefined Behavior (or Lack Thereof)  

---

### 12. Dust Intermediate Representation (DIR)
12.1 Purpose of DIR  
12.2 Relationship to the Language  
12.3 Semantic Preservation  
12.4 Versioning Rules  

---

### 13. Conformance
13.1 Compiler Conformance  
13.2 Runtime Conformance  
13.3 Observable Behavior  
13.4 Compliance Testing  

---

### 14. Versioning and Evolution
14.1 Specification Versioning  
14.2 Backward Compatibility  
14.3 Experimental Features  

---

### 15. Security and Safety Considerations
15.1 Resource Exhaustion  
15.2 Effect Isolation  
15.3 Safety-Critical Usage  

---

### 16. Glossary
16.1 Terms and Definitions  

---

### Appendix A. Rationale and Design Notes  
### Appendix B. Deferred Features  
### Appendix C. Change Log  

---

## Change Log

- v0.1 — Initial specification structure defined.

---

© 2026 Dust LLC