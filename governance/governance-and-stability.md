# Governance, Versioning, and Semantic Stability
## Preserving Meaning Over Time in the Dust Programming Language

**Status:** Normative  
**Authority:** Dust Language Specification (`/spec`), Dust Language Charter (`/charter/*`)  
**Applies To:** Entire `dustlang` repository and all Dust artifacts

---

## 1. Purpose

This document defines the **governance model** of the Dust Programming Language (DPL).

Its purpose is to:
- establish how the language evolves,
- define versioning and compatibility rules,
- preserve semantic stability over time,
- and prevent drift, fragmentation, or authority inversion.

This document governs **process**, not semantics.

---

## 2. Governing Principles

Dust governance is founded on the following principles:

- **Semantic sovereignty:** Meaning is defined only by the specification.
- **Stability over novelty:** Changes must preserve meaning.
- **Constraint-based evolution:** Admissibility governs change.
- **Implementation independence:** No implementation defines behavior.
- **Explicit authority:** Governance is structural, not social.

---

## 3. Sources of Authority

The authoritative sources of Dust meaning are:

1. `/spec` — language semantics (primary authority)
2. `/ir` — canonical semantic representation
3. `/vm` — reference execution semantics

All other documents are subordinate.

No governance process may override these sources.

---

## 4. Change Domains

Proposed changes fall into one of the following domains:

- **Semantic changes** — affect language meaning
- **Representational changes** — affect DIR structure
- **Execution changes** — affect DVM behavior
- **Process changes** — affect governance or tooling
- **Non-normative changes** — research, guides, examples

Each domain has distinct admissibility rules.

---

## 5. Semantic Changes

Semantic changes include any modification that affects:

- typing rules,
- regime semantics,
- effects,
- admissibility,
- time or concurrency semantics.

Semantic changes MUST:
- be made in `/spec`,
- preserve backward compatibility where defined,
- be explicitly versioned,
- satisfy admissibility constraints.

No semantic change may be introduced indirectly.

---

## 6. Versioning Model

Dust uses **explicit semantic versioning** for normative artifacts.

Version changes MUST reflect:

- additions of expressiveness,
- clarifications of undefined behavior,
- or tightening of admissibility rules.

Version changes MUST NOT:
- change the meaning of valid existing programs,
- reinterpret observable behavior,
- introduce implicit semantics.

Backward compatibility is enforced at the DIR level.

---

## 7. Compatibility Guarantees

A Dust program is compatible across versions if:

- its DIR representation remains valid,
- its observable behavior remains unchanged,
- its admissibility outcomes are preserved.

If compatibility cannot be preserved, the change is inadmissible.

---

## 8. Evolution Process

The evolution process follows these steps:

1. Proposal identification
2. Domain classification
3. Admissibility evaluation
4. Normative update (if required)
5. Version increment
6. Documentation synchronization

Skipping steps is prohibited.

---

## 9. Role of Implementations

Implementations:
- may propose changes,
- may experiment in non-normative spaces,
- may optimize within defined bounds.

Implementations:
- may not define semantics,
- may not serve as precedent,
- may not force adoption.

Correctness is measured against normative artifacts only.

---

## 10. Deprecation Policy

Deprecation is permitted only when:

- behavior is explicitly defined as deprecated,
- a stable alternative exists,
- compatibility is preserved for existing programs.

Silent deprecation is forbidden.

---

## 11. Governance Failures

The following constitute governance failure:

- semantic drift without versioning,
- implementation-defined behavior,
- authority inversion,
- undocumented reinterpretation,
- backward-incompatible change.

Governance failures invalidate the affected artifacts.

---

## 12. Stability Invariants

The following invariants must always hold:

- Meaning is stable across time
- Authority is singular and explicit
- Evolution is constrained
- Compatibility is enforced structurally

Violations of these invariants are inadmissible.

---

## 13. Final Statement

The Dust Programming Language evolves by **definition**, not by accretion.

Governance exists to preserve meaning, not to accelerate change.

Stability is not stagnation.  
Stability is **intentional continuity**.

---