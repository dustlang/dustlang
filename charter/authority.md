# Dust Language Charter — Authority

**Status:** Normative  
**Applies To:** Entire `dustlang` repository  
**Scope:** Semantic authority, precedence, and interpretive rules

---

## 1. Purpose

This document defines the **authority structure** of the Dust Programming Language (DPL).

Its purpose is to establish:
- where semantic truth resides,
- which documents are authoritative,
- how conflicts are resolved,
- and what constitutes a valid definition of meaning.

This charter governs *interpretation*, not implementation.

---

## 2. Primary Authority

The **sole authoritative definition of the Dust Programming Language** is the language specification located at:

```
/spec
```

The specification:
- defines all language semantics,
- defines all regimes (K, Q, Φ),
- defines all typing, effects, time semantics, and admissibility rules.

No other document, directory, or artifact may redefine, amend, or supersede the specification.

If a conflict exists, **the specification prevails**.

---

## 3. Secondary Normative Documents

The following documents are normative **only insofar as they derive from and conform to the specification**:

- `/ir/dir-spec.md` — canonical semantic representation
- `/vm/dvm-reference-semantics.md` — execution meaning
- `/governance/governance-and-stability.md` — evolution constraints

These documents may:
- formalize,
- clarify,
- or operationalize

but may **not introduce new semantics**.

---

## 4. Non-Normative Documents

The following directories contain **non-normative** materials:

- `/research`
- `/guides`
- `/archive`

These documents:
- may explore,
- may explain,
- may illustrate,

but have **no authority** over language meaning.

They may not be cited as semantic justification.

---

## 5. White Paper Status

The Dust Programming Language White Paper, located at:

```
/DPL_White_Paper.md
```

is **positional and descriptive**, not normative.

It defines:
- scope,
- intent,
- worldview,

but does **not** define language behavior.

In the event of disagreement, the specification prevails.

---

## 6. Prohibition on Semantic Duplication

No document outside `/spec` may:
- restate formal grammar,
- redefine typing rules,
- specify execution semantics,
- or introduce admissibility criteria.

Duplication of semantic content is considered **inadmissible**, even if textually consistent.

---

## 7. Conflict Resolution

If ambiguity or conflict arises:

1. The specification is consulted first.
2. If unresolved, the DIR specification may clarify representation.
3. If unresolved, the DVM reference semantics may clarify execution.
4. No research or guide document may be used to resolve ambiguity.

If ambiguity persists, the issue must be resolved by **updating the specification**.

---

## 8. Implementation Independence

No implementation defines semantics.

Compilers, runtimes, tools, and examples:
- must conform to the specification,
- may not interpret beyond it,
- may not serve as precedent.

Observational equivalence is the only acceptable criterion for correctness.

---

## 9. Authority Invariants

The following invariants must always hold:

- There is exactly one language specification.
- Semantics flow outward, never inward.
- Authority is structural, not social.
- No document gains authority by usage or popularity.

Violations of these invariants invalidate the offending document.

---

## 10. Final Statement

The Dust Programming Language is governed by **definition, not convention**.

Meaning is established by specification, preserved by structure, and protected by constraint.

This charter exists to ensure that authority remains singular, explicit, and stable over time.

---