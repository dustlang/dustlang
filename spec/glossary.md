# §16 Glossary
## Dust Programming Language Specification v0.1

**Status:** Normative  
**Last Updated:** February 2026

This glossary defines terms as they are used throughout the Dust Programming Language (DPL) Specification.  
All definitions are authoritative within the scope of this specification.

---

### Admissibility  
The property that at least one configuration exists that satisfies all declared constraints and regime rules.  
Admissibility is a semantic condition, not a runtime effect.

---

### Admissibility Failure  
The outcome in which no admissible configuration exists.  
Admissibility failure is not an error and does not imply undefined behavior.

---

### Admissibility Witness  
An explicit object that attests to the satisfiability of a set of constraints.  
Witnesses justify dependent operations and effects, especially in the Φ-regime.

---

### Binding  
An explicit declaration that permits interaction between two processes.  
Bindings are directional and governed by contracts.

---

### Contract  
A declarative set of conditions that restrict how a binding may be exercised.  
Contracts govern timing, effects, admissibility, and other interaction constraints.

---

### Constraint  
A declarative statement that restricts the set of valid configurations.  
Constraints do not execute and do not imply control flow.

---

### Constraint Failure  
See **Admissibility Failure**.

---

### Determinism  
The property that a program produces identical observable behavior given identical inputs and environment assumptions.

---

### DIR (Dust Intermediate Representation)  
The canonical semantic representation of all DPL programs.  
DIR defines observable behavior independently of source syntax or target architecture.

---

### Effect  
An explicit, irreversible operation that interacts with an external system, commits information, or alters admissible future behavior.  
Effects are limited to `observe`, `emit`, and `seal` in v0.1.

---

### Effect Ordering  
The requirement that effects occur in program order and are not reordered, duplicated, or elided.

---

### Execution Context  
The complete environment in which a process executes, including bound values, resources, constraints, regime rules, and effect permissions.

---

### Failure  
A classified termination of execution that is neither successful completion nor undefined behavior.  
Failures include runtime failures, admissibility failures, and contract violations.

---

### Forge  
The unit of compilation, ownership, and verification in DPL.  
A forge contains shapes, processes, and bindings.

---

### Grammar  
The formal syntactic rules that define how valid DPL programs are written.

---

### Implementation  
Any compiler, runtime, interpreter, tool, or backend that processes DPL source or DIR.

---

### Linearity  
A usage property requiring that a value or resource be used exactly once.  
Linearity is enforced statically.

---

### Logical Time  
An abstract ordering of events independent of physical clocks, used to reason about causality.

---

### Observable Behavior  
The externally visible outcome of program execution: return values, effects and their order, admissibility success or failure, and runtime failure classification.

---

### Physical Time  
Time corresponding to real-world clocks, durations, or hardware timing.

---

### Process  
The fundamental executable unit of DPL, defined with a regime, parameters, constraints, effects, and a body.

---

### Regime  
A classification that defines the fundamental semantic rules under which a process executes.  
DPL defines three regimes: K, Q, and Φ.

---

### Regime Isolation  
The rule that processes in different regimes cannot interact directly and must use explicit bindings.

---

### Resource  
An externally constrained or scarce entity required for execution, declared via `uses`.

---

### Runtime Failure  
A failure that occurs during execution due to unmet conditions such as resource unavailability or timing violations.

---

### Seal  
An effect that irreversibly commits information to a permanent record.

---

### Shape  
A user-defined structural type composed of named fields.

---

### Source File  
A text file containing DPL source code.  
The canonical file extension is `.ds`.

---

### Specification  
The Dust Programming Language Specification, which is the sole authority on language semantics and behavior.

---

### Type  
A classification that defines the structure, usage rules, and interpretation of values.

---

### Undefined Behavior  
Behavior with no specified meaning.  
Undefined behavior does not exist in DPL.

---

### Witness  
See **Admissibility Witness**.

---

© 2026 Dust LLC


⸻
