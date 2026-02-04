# Appendix B. Deferred Features
## Dust Programming Language Specification v0.1

**Status:** Non-Normative  
**Last Updated:** February 2026

This appendix enumerates language features that are intentionally **deferred** from DPL v0.1.  
Deferred features are not rejected; they are postponed until their inclusion can be justified without weakening the language’s semantic guarantees.

Nothing in this appendix defines language behavior.  
If a conflict exists between this appendix and the specification proper, the specification is authoritative.

---

## B.1 Purpose of Deferral

DPL is designed to grow in complexity over time while preserving semantic clarity and correctness.

Deferring features serves to:

- avoid premature abstraction;
- prevent semantic leakage from existing languages;
- keep the core language analyzable;
- ensure that every feature introduced has a clear physical or semantic justification.

---

## B.2 Macros and Metaprogramming

### Status: Deferred

Macro systems and compile-time code generation are excluded from v0.1.

Rationale:
- macros obscure program meaning;
- they introduce non-local reasoning;
- they complicate tooling and analysis;
- they risk redefining language semantics outside the specification.

Future consideration:
- declarative, hygienic, and semantically transparent metaprogramming MAY be considered if it can be specified without introducing hidden behavior.

---

## B.3 Generics and Parametric Polymorphism

### Status: Deferred

Generic types and functions are not included in v0.1.

Rationale:
- generics complicate the type system significantly;
- they interact non-trivially with linearity and regimes;
- premature inclusion risks weakening static guarantees.

Future consideration:
- parametric polymorphism MAY be introduced once linear and regime-safe formulations are fully characterized.

---

## B.4 Inheritance and Subtyping

### Status: Deferred

Inheritance-based type hierarchies are excluded.

Rationale:
- inheritance introduces implicit behavior and substitution assumptions;
- it complicates reasoning about resource ownership and linearity;
- structural clarity is preferred in early versions.

Future consideration:
- limited, explicit subtyping MAY be explored if it preserves static analyzability.

---

## B.5 Mutable State and References

### Status: Deferred

Implicit mutable state and reference semantics are not included.

Rationale:
- mutable state complicates determinism and effect reasoning;
- it introduces hidden temporal dependencies;
- it increases the risk of unsafe concurrency.

Future consideration:
- controlled, explicit state models MAY be introduced if they integrate cleanly with effects and time semantics.

---

## B.6 Exception Handling and Recovery

### Status: Deferred

Exception handling, try/catch constructs, and dynamic recovery mechanisms are excluded.

Rationale:
- exceptions introduce implicit control flow;
- they obscure failure paths;
- they risk allowing effects after failure.

Future consideration:
- explicit, typed recovery constructs MAY be introduced if they preserve the “fail before effect” guarantee.

---

## B.7 Implicit Concurrency and Parallelism

### Status: Deferred

Implicit concurrency, automatic parallelism, and data-parallel constructs are excluded.

Rationale:
- implicit concurrency undermines determinism;
- it complicates effect ordering and time reasoning;
- explicit coordination is preferred.

Future consideration:
- higher-level concurrency abstractions MAY be added once time and synchronization semantics are fully exercised.

---

## B.8 Probabilistic Programming Primitives

### Status: Deferred

Built-in probabilistic programming constructs are not included.

Rationale:
- probability is not treated as a fundamental primitive in DPL;
- admissibility and determinism provide alternative modeling tools;
- probabilistic abstractions risk conflating epistemic uncertainty with physical randomness.

Future consideration:
- probabilistic layers MAY be introduced as libraries or explicit regimes if justified.

---

## B.9 Automatic Optimization Semantics

### Status: Deferred

The specification does not define optimization behavior.

Rationale:
- optimization is an implementation concern;
- semantic guarantees must not depend on optimization;
- premature optimization rules risk introducing undefined behavior.

Future consideration:
- optional, formally specified optimization classes MAY be introduced at the DIR level.

---

## B.10 Reflection and Runtime Introspection

### Status: Deferred

Reflection, dynamic type inspection, and runtime self-modification are excluded.

Rationale:
- reflection weakens static guarantees;
- it complicates verification and auditability;
- it blurs the boundary between specification and execution.

Future consideration:
- limited introspection MAY be introduced for tooling support if it remains non-semantic.

---

## B.11 Foreign Function Interfaces (FFI)

### Status: Deferred

No FFI is defined in v0.1.

Rationale:
- FFIs introduce undefined behavior boundaries;
- they undermine effect and resource tracking;
- they require careful security modeling.

Future consideration:
- controlled, declarative interop MAY be defined once effect containment is fully characterized.

---

## B.12 Standard Library Expansion

### Status: Deferred

The standard library surface is intentionally minimal.

Rationale:
- the language specification must stabilize first;
- libraries should not define semantics;
- premature libraries risk ossifying design mistakes.

Future consideration:
- domain-specific libraries MAY be added incrementally after v1.0.

---

## B.13 Summary

Deferred features are not omissions; they are deliberate design decisions.

DPL prioritizes:
- semantic clarity over convenience;
- explicitness over power;
- correctness over familiarity.

This appendix records these decisions so that future evolution remains principled rather than reactive.

---

© 2026 Dust LLC


⸻
