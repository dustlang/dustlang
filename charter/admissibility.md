# Dust Language Charter — Admissibility

**Status:** Normative  
**Applies To:** Entire `dustlang` repository  
**Scope:** Admissibility of documents, changes, and artifacts

---

## 1. Purpose

This document defines **admissibility** within the Dust Programming Language corpus.

Admissibility determines:
- which documents are valid,
- which changes may be accepted,
- and which artifacts may be considered part of the Dust definition.

Admissibility is not consensus-based.  
Admissibility is **constraint-based**.

---

## 2. Definition of Admissibility

An artifact is **admissible** if and only if it:

1. Conforms to the authority rules defined in `/charter/authority.md`
2. Respects the scope boundaries defined in `/charter/scope.md`
3. Introduces no semantic contradictions
4. Introduces no semantic duplication
5. Preserves global coherence across the corpus

Failure to satisfy any condition renders the artifact **inadmissible**.

---

## 3. Classes of Artifacts

Admissibility is evaluated relative to artifact class.

### 3.1 Normative Artifacts

Normative artifacts include:
- the language specification (`/spec`)
- DIR specification
- DVM reference semantics
- governance documents

Normative artifacts must:
- be internally complete,
- be unambiguous,
- and be mutually consistent.

Normative artifacts may **only** be changed by modifying the authoritative source they belong to.

---

### 3.2 Non-Normative Artifacts

Non-normative artifacts include:
- research papers,
- guides,
- examples,
- exploratory documents.

These artifacts:
- may explain or explore,
- may propose interpretations,
- may illustrate usage,

but may not define or alter semantics.

Non-normative artifacts are inadmissible if cited as authority.

---

## 4. Admissibility of Changes

A proposed change is admissible only if:

- it does not contradict existing normative definitions,
- it does not redefine behavior outside its authority domain,
- it preserves observational equivalence where required,
- it does not introduce implicit semantics.

Changes that require semantic reinterpretation must be applied **first** to the specification.

---

## 5. Prohibition of Semantic Leakage

Semantic leakage occurs when:

- a non-normative document introduces rules,
- a technical document redefines language behavior,
- or an example resolves ambiguity not resolved by the spec.

Semantic leakage is strictly inadmissible.

---

## 6. Admissibility of Cross-References

Cross-references are admissible only when they are:

- directional (from non-normative to normative),
- non-authoritative,
- and non-interpretive.

No document may derive semantic authority from a reference.

---

## 7. Resolution of Inadmissibility

If an artifact is found inadmissible:

1. It must be corrected to restore admissibility, or
2. It must be relocated to `/archive/deprecated`, or
3. It must be removed from the corpus.

No inadmissible artifact may remain in an authoritative location.

---

## 8. Global Coherence Requirement

All admissible artifacts must collectively satisfy **global coherence**:

- No contradictions
- No circular authority
- No implicit precedence
- No semantic drift

Global coherence is evaluated structurally, not rhetorically.

---

## 9. Admissibility Invariants

The following invariants must always hold:

- Admissibility is binary, not graded
- Authority cannot be inferred
- Silence does not imply permission
- Consistency overrides convenience

Violations of these invariants invalidate admissibility.

---

## 10. Final Statement

Admissibility is the mechanism by which Dust preserves coherence over time.

It ensures that:
- meaning is stable,
- authority is explicit,
- and evolution is constrained.

Nothing enters the Dust corpus by momentum.  
Everything enters by **admissibility**.

---