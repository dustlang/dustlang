# Semantic Equivalence and Program Identity in DPL
## When Two Programs Are the Same—and When They Are Not

Document Type: Formal Research Paper  
Status: Non-Normative (Semantics-Aligned, Explanatory)  
Applies To: Dust Programming Language (DPL)  
Version: v0.1  
Authority: Specification-defined semantics only  
Copyright: © 2026 Dust LLC

---

## Abstract

Programming systems typically define equivalence in terms of observable behavior: if two programs produce the same outputs, they are considered the same. The Dust Programming Language (DPL) adopts a stricter and more fundamental notion. In DPL, programs are equivalent only if they admit the same executions under the same constraints.

This paper formalizes **semantic equivalence** and **program identity** in DPL. It distinguishes observational equivalence from admissibility equivalence, defines identity across transformations and regimes, and establishes equivalence as a semantic property independent of syntax, compilation strategy, or execution backend. These definitions are essential for correctness-preserving optimization, caching, reuse, verification, and long-term governance.

---

## 1. Introduction

Equivalence is not merely a theoretical concern. It determines:

- whether a compiler transformation is valid,
- whether two artifacts may be substituted,
- whether cached results may be reused,
- whether verification results remain applicable.

DPL requires a notion of equivalence that respects global constraints, admissibility, and irreversibility. Observable outputs alone are insufficient.

This paper defines the equivalence relations that DPL recognizes and explains why weaker notions are unsound.

---

## 2. Programs as Semantic Objects

In DPL, a program is not defined by its text. It is defined by:

- declared constraints,
- regime assignments,
- effect structure,
- time semantics,
- admissibility conditions.

Syntax is an encoding. Semantics determine identity.

---

## 3. Observational Equivalence

### 3.1 Definition

Two programs are observationally equivalent if, under the same observations, they produce the same observable outcomes.

Observational equivalence considers:
- emitted values,
- measurements,
- visible effects.

---

### 3.2 Insufficiency

Observational equivalence ignores:
- which executions were disallowed,
- whether inadmissibility was altered,
- changes to time guarantees,
- differences in effect ordering that do not surface immediately.

In DPL, two observationally equivalent programs may not be semantically equivalent.

---

## 4. Admissibility Equivalence

### 4.1 Definition

Two programs are **admissibility-equivalent** if and only if:

- they admit exactly the same executions, and
- they reject exactly the same executions,

under identical regimes, constraints, and effects.

Formally:

    Admissible(P₁) = Admissible(P₂)

This is the primary equivalence relation in DPL.

---

### 4.2 Consequences

Admissibility equivalence implies:
- identical non-existence behavior,
- identical global correctness,
- identical safety envelopes.

Programs that differ in admissibility are not interchangeable.

---

## 5. Identity Across Transformations

### 5.1 Compilation

Compilation preserves identity only if:
- admissibility is preserved,
- effect structure is preserved,
- time semantics are preserved.

Different binaries may represent the same program identity.

---

### 5.2 Optimization

Optimizations preserve identity only if they are admissibility-preserving. Performance improvements do not create new identities.

---

### 5.3 Refactoring

Syntactic refactoring preserves identity if and only if:
- no constraints are added or removed,
- no effect boundaries are altered,
- no regime semantics change.

---

## 6. Identity Across Regimes

### 6.1 K-Regime Identity

Identity is primarily structural and deterministic, but still constrained by time and effects.

---

### 6.2 Q-Regime Identity

Identity includes:
- linear ownership structure,
- absence of duplication,
- identical measurement boundaries.

Two programs that differ in resource usage are not identical.

---

### 6.3 Φ-Regime Identity

Identity is purely global:
- same admissibility conditions,
- same resolution outcomes,
- same non-existence behavior.

Internal reasoning paths are irrelevant.

---

## 7. Equivalence Classes of Programs

Programs in DPL form equivalence classes defined by admissibility equivalence.

Within a class:
- syntax may vary,
- structure may vary,
- performance may vary.

Across classes:
- substitution is forbidden.

This enables safe caching and reuse.

---

## 8. Identity and Caching

Caching is valid only if:
- cached results correspond to an admissibility-equivalent program,
- no constraints differ,
- no effect boundaries differ.

Caching by observation alone is unsound.

---

## 9. Identity and Verification

Formal proofs attach to equivalence classes, not artifacts.

If a program changes but remains admissibility-equivalent, proofs remain valid. If admissibility changes, all proofs are invalidated.

---

## 10. Identity and Governance

Governance rules rely on identity to enforce:
- backward compatibility,
- semantic stability,
- deprecation discipline.

Identity changes require version changes.

---

## 11. What DPL Forbids

DPL explicitly forbids:
- treating observational equivalence as identity,
- assuming compilation preserves meaning by default,
- equating performance changes with semantic changes.

Identity is semantic, not operational.

---

## 12. Conclusion

In DPL, two programs are the same only if they allow the same realities to exist.

Observable behavior is not enough. Syntax is not enough. Execution artifacts are not enough.

Program identity is defined by admissibility.

Only what is allowed to exist may be considered the same.

---

© 2026 Dust LLC