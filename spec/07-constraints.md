# §7 Constraints and Admissibility
## Dust Programming Language Specification v0.1

**Status:** Normative  
**Last Updated:** February 2026

This section is part of the Dust Programming Language Specification v0.1.

---

## 7.1 Overview

The Dust Programming Language supports **constraint-driven computation** as a first-class capability.

A *constraint* is a declarative statement that restricts the set of configurations a program may consider valid.  
*Admissibility* is the property that at least one configuration exists that satisfies all declared constraints.

Constraints do not execute.  
They delimit the space of acceptable outcomes.

---

## 7.2 Constraint Declarations

Constraints are declared using the `constrain` statement.

constrain ;

A constraint expression MUST evaluate to a boolean condition over program state or values.

Constraint declarations:

- do not produce values;
- do not cause effects;
- do not imply execution order.

---

## 7.3 Scope of Constraints

Constraints apply within a well-defined scope:

- constraints declared inside a process apply to that process;
- constraints MAY refer to parameters, local bindings, or derived structures;
- constraints MUST NOT refer to undeclared identifiers.

Constraints declared in a Φ-regime process are considered **global** to that process unless explicitly scoped.

---

## 7.4 Admissibility

### 7.4.1 Definition

A process execution is **admissible** if there exists at least one configuration that satisfies all declared constraints and regime rules.

Admissibility is a semantic property, not a runtime side effect.

---

### 7.4.2 Admissibility vs Execution

Admissibility determines whether execution *may proceed*.  
It does not specify how execution proceeds.

- If a configuration exists, execution MAY continue.
- If no configuration exists, admissibility fails.

Admissibility failure is not a runtime error.

---

## 7.5 Admissibility Witnesses

### 7.5.1 Purpose

An *admissibility witness* is an explicit object that attests that a set of constraints is satisfiable.

Witnesses serve to:

- make admissibility explicit;
- allow admissibility to cross process boundaries;
- justify effects in constraint-driven regimes.

---

### 7.5.2 Construction

Witnesses are constructed using the `prove` statement:

prove  from ;

The proof expression MUST reference the constrained configuration or structure being validated.

---

### 7.5.3 Typing

Admissibility witnesses have explicit types.

A witness:

- MUST be used to justify dependent operations;
- MAY be passed between processes subject to regime rules;
- MUST NOT be fabricated or implicitly assumed.

---

## 7.6 Φ-Regime Constraint Semantics

In the Φ-regime:

- constraints define the computation itself;
- execution consists of resolving constraints into admissible configurations;
- results are valid only if accompanied by admissibility witnesses.

A Φ-regime process that does not produce a witness is invalid.

---

## 7.7 Constraint Failure

### 7.7.1 Definition

Constraint failure occurs when no admissible configuration exists.

Constraint failure:

- does not indicate an implementation error;
- does not imply undefined behavior;
- represents a valid semantic outcome.

---

### 7.7.2 Handling Constraint Failure

On constraint failure:

- the process terminates without producing results;
- no effects are performed;
- the failure MAY be reported as an admissibility failure.

Constraint failure handling is further specified in §11.

---

## 7.8 Constraints and Effects

Constraints restrict effects.

An effect:

- MUST NOT occur unless all required constraints are satisfied;
- MAY require an admissibility witness as justification;
- MUST be suppressed if admissibility fails.

This ensures that irreversible actions occur only in valid configurations.

---

## 7.9 Cross-Process Admissibility

Admissibility MAY cross process boundaries via witnesses.

A process receiving a witness:

- MAY rely on the validity of the proven constraints;
- MUST respect the scope and assumptions of the witness;
- MUST NOT weaken or reinterpret the witness.

Bindings MAY impose additional requirements on admissibility transfer.

---

## 7.10 Determinism and Constraints

Constraint resolution does not imply probabilistic behavior.

- Multiple admissible configurations MAY exist.
- Selection among admissible configurations MUST be deterministic unless otherwise specified.
- Non-determinism MUST be explicit and justified.

---

## 7.11 Constraint System Stability

The constraint and admissibility system defined in this section is foundational.

Changes to:

- the meaning of constraints,
- admissibility semantics,
- witness requirements,

constitute breaking changes and require a new major specification version.

---

© 2026 Dust LLC


⸻
