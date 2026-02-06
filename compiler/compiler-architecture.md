# Dust Compiler Architecture & Phase Model
## Deterministic Realization of Dust Language Semantics

**Status:** Normative (Technical)  
**Authority:** Dust Language Specification (`/spec`), DIR (`/ir/dir-spec.md`), DVM (`/vm/dvm-reference-semantics.md`)  
**Applies To:** All Dust compiler implementations

---

## 1. Purpose

This document defines the **architecture and phase model** of the Dust compiler.

Its purpose is to:
- describe how Dust programs are transformed from source to DIR,
- define phase responsibilities and invariants,
- establish correctness and determinism guarantees,
- and specify failure behavior.

This document does **not** define language semantics.  
It defines **how semantics are preserved**.

---

## 2. Normative Scope

This document is normative with respect to:

- compiler phase structure,
- phase ordering constraints,
- invariants that must hold at phase boundaries,
- determinism requirements,
- admissible compiler behavior.

Any compiler that violates these requirements is **non-conforming**, even if it produces executable output.

---

## 3. Compiler-as-Data Principle

The Dust compiler is designed under the **compiler-as-data** principle:

- inputs are structured artifacts,
- transformations are explicit,
- outputs are structured artifacts,
- all intermediate forms are inspectable.

Compilation is treated as a **deterministic transformation pipeline**, not an opaque process.

---

## 4. High-Level Pipeline

A conforming Dust compiler MUST implement the following conceptual phases, in order:

1. Source ingestion
2. Structural formation
3. Regime validation
4. Type checking
5. Constraint formation
6. Effect extraction
7. Time annotation
8. DIR construction
9. DIR validation

Phases MAY be internally subdivided, but phase boundaries MUST be preserved.

---

## 5. Phase Definitions and Invariants

### 5.1 Source Ingestion

**Purpose:** Accept source artifacts.

**Invariants:**
- Source text is immutable
- No semantic interpretation occurs

---

### 5.2 Structural Formation

**Purpose:** Construct structural representations of the program.

**Invariants:**
- All syntactic structure is preserved
- No type or regime inference occurs
- No reordering is permitted

---

### 5.3 Regime Validation

**Purpose:** Validate regime annotations and boundaries.

**Invariants:**
- Every construct is assigned a regime
- No implicit regime transitions exist
- Cross-regime interactions are explicit

Failure at this phase is terminal.

---

### 5.4 Type Checking

**Purpose:** Validate all type constraints.

**Invariants:**
- All types are resolved
- Linear and non-linear usage is enforced
- Dimensional constraints are validated
- Determinism qualifiers are preserved

Type errors do not propagate to later phases.

---

### 5.5 Constraint Formation

**Purpose:** Materialize constraints as first-class entities.

**Invariants:**
- All constraints are explicit
- Constraint scope is defined
- No constraint is implicit or inferred

---

### 5.6 Effect Extraction

**Purpose:** Identify and encode all effects.

**Invariants:**
- All observable actions are represented
- Irreversibility is preserved
- No implicit effects remain

---

### 5.7 Time Annotation

**Purpose:** Assign time semantics.

**Invariants:**
- Time domains are explicit
- Ordering is structural, not procedural
- Concurrency is represented by independence

---

### 5.8 DIR Construction

**Purpose:** Produce a DIR artifact.

**Invariants:**
- DIR fully preserves semantics
- No information is erased
- All annotations are present

DIR construction is lossless.

---

### 5.9 DIR Validation

**Purpose:** Ensure DIR admissibility.

**Invariants:**
- DIR satisfies all validation rules defined in `/ir`
- No unresolved references exist
- Determinism is provable

Invalid DIR artifacts MUST be rejected.

---

## 6. Determinism Guarantees

The compiler MUST be deterministic.

Given:
- identical source input,
- identical configuration,

the compiler MUST produce:
- byte-for-byte equivalent DIR output.

Randomization, nondeterministic ordering, and environment-dependent behavior are inadmissible.

---

## 7. Failure Semantics

Failures are:

- phase-local,
- explicit,
- terminal.

A failure in one phase MUST:
- prevent execution of subsequent phases,
- report structured diagnostic information,
- leave no partial artifacts.

Silent recovery is prohibited.

---

## 8. Optimization Constraints

Optimizations are permitted only if:

- they preserve DIR meaning,
- they do not alter observable behavior,
- they do not introduce nondeterminism.

Optimizations MAY:
- restructure graphs,
- eliminate redundancy,
- specialize execution paths,

but MUST preserve observational equivalence.

---

## 9. Backend Independence

The compiler produces DIR.

It does not:
- generate machine code,
- assume a target architecture,
- encode runtime behavior.

Backend lowering occurs **after** DIR and is governed by DVM conformance rules.

---

## 10. Tooling and Introspection

A conforming compiler SHOULD provide:

- phase dumps,
- DIR inspection,
- constraint visualization,
- effect tracing.

These facilities are non-normative but encouraged.

---

## 11. Prohibited Compiler Behavior

The following behaviors are prohibited:

- implicit semantic inference
- hidden state mutation
- semantic shortcuts
- nondeterministic passes
- execution during compilation

Any such behavior invalidates compiler conformance.

---

## 12. Summary

The Dust compiler is a **semantic preservation system**.

It:
- transforms structure without loss,
- enforces constraints explicitly,
- guarantees determinism,
- and produces canonical meaning.

Correctness is defined by **conformance**, not performance.

---