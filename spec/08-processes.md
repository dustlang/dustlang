# §8 Processes and Execution
## Dust Programming Language Specification v0.1

**Status:** Normative  
**Last Updated:** February 2026

This section is part of the Dust Programming Language Specification v0.1.

---

## 8.1 Overview

A **process** is the fundamental executable unit in the Dust Programming Language.

Processes define:
- inputs and outputs,
- the regime under which execution occurs,
- the resources required,
- the constraints and effects involved,
- and the rules governing evaluation.

Execution in DPL is the realization of a process under its declared regime, types, constraints, and effects.

---

## 8.2 Process Declaration

A process is declared using the `proc` construct.

Each process declaration MUST specify:
- a regime (`K`, `Q`, or `Φ`);
- a name;
- zero or more parameters;
- an optional return type;
- an optional set of qualifiers;
- a process body.

The grammar of process declarations is defined in §3.

---

## 8.3 Process Parameters and Inputs

Process parameters define the inputs to execution.

Parameters:
- MUST be explicitly typed;
- are immutable within the process body;
- are evaluated at process invocation.

In Q-regime processes, parameters MUST be linear.

---

## 8.4 Process Results and Returns

A process MAY return a value.

Return values:
- MUST conform to the declared return type;
- MUST satisfy regime-specific typing rules;
- MUST respect linearity and admissibility requirements.

A process that declares a return type MUST execute exactly one `return` statement along all valid execution paths.

---

## 8.5 Process Qualifiers

### 8.5.1 Resource Usage (`uses`)

The `uses` qualifier declares external or constrained resources required by a process.

Resources declared via `uses`:
- MUST be available for execution to proceed;
- MUST NOT be implicitly created;
- MAY impose additional execution constraints.

Resource availability is verified prior to execution.

---

### 8.5.2 Linearity (`linear`)

The `linear` qualifier asserts that the process enforces linear usage of its inputs and internal values.

Linearity requirements:
- are statically verified;
- are mandatory for Q-regime processes;
- MAY be applied to K- or Φ-regime processes when appropriate.

---

## 8.6 Execution Context

Each process executes within an **execution context** that includes:

- bound parameter values;
- declared resources;
- constraint set;
- effect permissions;
- regime rules.

The execution context is established before process body evaluation begins.

---

## 8.7 Evaluation Model

### 8.7.1 Statement Evaluation

Statements in a process body are evaluated in program order.

Evaluation proceeds sequentially unless otherwise specified by later sections of this specification.

---

### 8.7.2 Expression Evaluation

Expressions:
- are evaluated deterministically;
- MUST NOT perform effects;
- MAY depend on previously bound values.

Expression evaluation MUST NOT alter the execution context.

---

## 8.8 Constraint Resolution During Execution

Constraints declared within a process contribute to the constraint set of the execution context.

Execution MUST ensure that:

- all required constraints are satisfied;
- admissibility is established before dependent operations proceed;
- constraint failure prevents further execution.

Constraint resolution MAY occur incrementally or as a whole, provided semantics are preserved.

---

## 8.9 Effect Execution

Effects are executed at the point they appear in the process body.

Before executing an effect:
- all relevant constraints MUST be satisfied;
- required admissibility witnesses MUST be available;
- resource requirements MUST be met.

If any of these conditions are not met, the effect MUST NOT be performed.

---

## 8.10 Process Invocation

A process invocation:

- creates a new execution context;
- binds arguments to parameters;
- enforces regime isolation;
- propagates effects as defined in §6.

Direct invocation across regimes is prohibited and MUST be mediated by bindings (§10).

---

## 8.11 Nested and Reentrant Execution

Processes MAY invoke other processes within the same regime.

Nested execution:
- inherits applicable constraints and effect permissions;
- MUST respect linearity across call boundaries;
- MUST preserve effect ordering.

Reentrant execution is permitted only if it does not violate resource or linearity constraints.

---

## 8.12 Determinism of Execution

Execution is deterministic unless explicitly stated otherwise.

Sources of non-determinism MUST be:
- explicitly declared,
- justified by the regime,
- and constrained by the specification.

Implicit non-determinism is prohibited.

---

## 8.13 Termination

A process execution terminates when:
- a return statement is executed;
- admissibility fails;
- an unrecoverable execution failure occurs.

Termination semantics are further specified in §11.

---

## 8.14 Execution Observability

The observable behavior of a process consists of:
- its return value (if any),
- the sequence and content of effects performed,
- admissibility success or failure.

No other behavior is observable.

---

## 8.15 Process Model Stability

The process and execution model defined in this section is foundational.

Changes to:
- execution order,
- effect visibility,
- or process isolation,

constitute breaking changes and require a new major specification version.

---

© 2026 Dust LLC


⸻
