# Appendix C. Change Log (Expanded)
## Dust Programming Language Specification v0.1

**Status:** Non-Normative  
**Last Updated:** February 2026

This appendix records the evolution of the Dust Programming Language (DPL) specification.  
It provides historical context and rationale for changes but does not define language semantics.

If a conflict exists between this appendix and the specification proper, the specification is authoritative.

---

## C.1 Purpose of the Change Log

The change log exists to:

- preserve institutional memory;
- document design intent behind changes;
- support long-term maintenance and review;
- prevent accidental semantic drift.

Every change listed here reflects an intentional design decision.

---

## C.2 Version v0.1 — Foundational Release

**Status:** Initial Public Specification  
**Date:** February 2026

This version establishes the complete foundational definition of the Dust Programming Language.

---

### C.2.1 Structural Changes

- Adopted a **chapter-per-file specification structure** to allow independent evolution of sections.
- Established `spec/` as the authoritative specification directory.
- Designated `dpl-spec-v0.1.md` as the master index and front matter only.
- Introduced appendices as non-normative explanatory and planning artifacts.

---

### C.2.2 Language Identity and Scope

- Defined DPL as a **clean-slate language**, not derived from or compatible with existing languages.
- Explicitly excluded undefined behavior.
- Explicitly rejected implicit concurrency, implicit effects, and implicit resource access.
- Defined `.ds` as the canonical file extension for DPL source files.

---

### C.2.3 Regime Model

- Introduced three explicit computation regimes:
  - **K** (Classical)
  - **Q** (Quantum / Linear)
  - **Φ** (Phase / Admissibility-Based)
- Enforced regime isolation by default.
- Required explicit bindings for cross-regime interaction.

---

### C.2.4 Type System

- Defined a static, explicit type system.
- Introduced linear types as a first-class concept.
- Distinguished values from resources.
- Prohibited implicit copying or discarding of linear values.
- Deferred generics, inheritance, and mutable state.

---

### C.2.5 Effects and Irreversibility

- Defined a closed set of effects: `observe`, `emit`, `seal`.
- Required all effects to be explicit and auditable.
- Prohibited effects inside expressions.
- Enforced strict effect ordering.

---

### C.2.6 Constraints and Admissibility

- Introduced declarative constraints.
- Defined admissibility as a semantic property rather than an error.
- Required admissibility witnesses in Φ-regime computation.
- Defined constraint failure as a valid outcome.

---

### C.2.7 Processes and Execution

- Defined processes as the sole executable unit.
- Established deterministic execution by default.
- Prohibited implicit sharing of state between processes.
- Defined execution context explicitly.

---

### C.2.8 Time and Concurrency

- Made time an explicit semantic dimension.
- Distinguished logical time from physical time.
- Mandated deterministic scheduling.
- Prohibited data races by construction.

---

### C.2.9 Binding and Contracts

- Introduced explicit binding declarations.
- Defined contracts as declarative interaction constraints.
- Required static and runtime enforcement of contracts.
- Formalized cross-regime interaction rules.

---

### C.2.10 Error and Failure Model

- Classified failures into compile-time errors, runtime failures, admissibility failures, and contract violations.
- Prohibited exception handling and undefined behavior.
- Enforced “fail before effect” semantics.

---

### C.2.11 Dust Intermediate Representation (DIR)

- Established DIR as the canonical semantic representation.
- Prohibited type erasure and semantic weakening in DIR.
- Required all implementations to preserve DIR semantics.
- Defined DIR as deterministic and reproducible by construction.

---

### C.2.12 Conformance Requirements

- Defined strict compiler, runtime, and backend conformance rules.
- Prohibited partial or silent non-conformance.
- Defined observable behavior precisely.

---

### C.2.13 Versioning and Evolution

- Adopted a major/minor versioning model.
- Required major version increments for semantic changes.
- Introduced explicit experimental feature labeling.
- Defined a formal deprecation policy.

---

### C.2.14 Security and Safety

- Defined security as a semantic property.
- Prohibited hidden capabilities and implicit privilege escalation.
- Explicitly documented non-guarantees.

---

### C.2.15 Appendices

- Added Appendix A (Rationale and Design Notes).
- Added Appendix B (Deferred Features).
- Established this appendix (Change Log) as the authoritative historical record.

---

## C.3 Post-v0.1 Notes

Future versions of this change log will:

- enumerate changes by version;
- classify changes as additive, clarifying, or breaking;
- reference affected specification sections explicitly.

No changes may be made retroactively to the meaning of v0.1.

---

## C.4 Closing Note

This change log exists to make the evolution of DPL transparent, deliberate, and reviewable.

The language grows by recorded decision, not by accident.

---

© 2026 Dust LLC


⸻
