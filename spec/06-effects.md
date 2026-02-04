# §6 Effects and Irreversibility
## Dust Programming Language Specification v0.1

**Status:** Normative  
**Last Updated:** February 2026

This section is part of the Dust Programming Language Specification v0.1.

---

## 6.1 Overview

The Dust Programming Language treats effects as **first-class, explicit language constructs**.

An *effect* is any operation that:
- produces an irreversible change,
- interacts with an external system,
- commits information that cannot be withdrawn,
- or alters the admissible future behavior of a program.

Effects are never implicit.  
All effects MUST be declared syntactically and are subject to static verification.

---

## 6.2 Effect Classification

DPL defines the following core effects in v0.1:

- **Observation** (`observe`)
- **Emission** (`emit`)
- **Sealing** (`seal`)

Each effect represents a distinct category of irreversibility.

No other effects exist in v0.1.

---

## 6.3 Observation (`observe`)

### 6.3.1 Definition

The `observe` effect represents the irreversible acquisition of information from a system.

Observation:
- consumes uncertainty,
- commits to a specific outcome,
- may restrict future admissible configurations.

---

### 6.3.2 Semantics

An `observe` statement:

- produces a concrete value or record;
- is irreversible once performed;
- MUST be explicitly written in source code.

Example:

observe sensor_reading;

Observation semantics are regime-dependent and are further constrained by §4.

---

### 6.3.3 Regime Restrictions

- **K-Regime:** `observe` is permitted.
- **Q-Regime:** `observe` represents measurement and consumes linear resources.
- **Φ-Regime:** `observe` is permitted only when justified by admissibility and MUST be associated with a witness.

---

## 6.4 Emission (`emit`)

### 6.4.1 Definition

The `emit` effect represents the irreversible act of producing influence on an external system.

Examples include:
- actuation,
- signal transmission,
- control output,
- physical intervention.

---

### 6.4.2 Semantics

An `emit` statement:

- causes an irreversible external effect;
- MAY alter future system state;
- MUST be explicitly declared.

Example:

emit motor_command;

---

### 6.4.3 Regime Restrictions

- **K-Regime:** `emit` is permitted.
- **Q-Regime:** `emit` is restricted and consumes linear resources.
- **Φ-Regime:** `emit` is permitted only if admissibility guarantees are satisfied.

---

## 6.5 Sealing (`seal`)

### 6.5.1 Definition

The `seal` effect represents the irreversible commitment of information to a permanent record.

Sealing indicates that:
- the sealed data cannot be altered,
- the act of sealing itself is observable,
- reproducibility boundaries are crossed.

---

### 6.5.2 Semantics

A `seal` statement:

- commits data to an immutable record;
- prevents subsequent modification;
- establishes a fixed point in program history.

Example:

seal experiment_log;

---

### 6.5.3 Regime Restrictions

- **K-Regime:** `seal` is permitted.
- **Q-Regime:** `seal` consumes linear state where applicable.
- **Φ-Regime:** `seal` is permitted only when consistent with admissibility.

---

## 6.6 Effect Statements

Effects are expressed only as standalone statements.

The following forms are defined:

observe ;
emit ;
seal ;

Effects MUST NOT appear inside expressions or be implicitly invoked.

---

## 6.7 Effect Ordering

Effects occur in program order.

The relative order of effects:

- MUST be preserved by all conforming implementations;
- MUST NOT be reordered, eliminated, or duplicated;
- MAY be constrained further by contracts or regimes.

---

## 6.8 Effect Propagation

Effects propagate through process boundaries.

If a process performs an effect, then:

- any process calling it is considered effectful;
- effectfulness is part of the process’s observable behavior;
- bindings MAY restrict or prohibit effect propagation.

---

## 6.9 Effect Safety

The effect system ensures that:

- irreversible operations are visible and auditable;
- simulations can exclude effects by construction;
- safety-critical behavior is explicitly marked.

Programs that attempt to perform undeclared or disallowed effects are invalid.

---

## 6.10 Effect Failure

If an effect cannot be performed due to:

- violated constraints,
- failed admissibility,
- resource exhaustion,

the effect MUST fail deterministically.

Effect failure semantics are defined in §11.

---

## 6.11 Effect System Stability

The effect system defined in this section is foundational.

Adding new effect categories, altering effect meaning, or weakening effect visibility constitutes a breaking change and requires a new major specification version.

---

© 2026 Dust LLC


⸻
