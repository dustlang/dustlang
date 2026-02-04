# §11 Error and Failure Model
## Dust Programming Language Specification v0.1

**Status:** Normative  
**Last Updated:** February 2026

This section is part of the Dust Programming Language Specification v0.1.

---

## 11.1 Overview

The Dust Programming Language defines a **total error and failure model**.

All exceptional situations are classified, specified, and observable.  
No behavior in a well-formed DPL program is undefined.

DPL distinguishes between:

- **Compile-time errors**
- **Runtime failures**
- **Constraint and admissibility failures**
- **Contract violations**

Each category has distinct causes, handling rules, and observability.

---

## 11.2 Principles

The error and failure model is governed by the following principles:

- **No Undefined Behavior**  
  All outcomes are specified.

- **Fail Before Effect**  
  No irreversible effect may occur after a failure condition is detected.

- **Deterministic Failure**  
  Given the same inputs and environment, failures occur identically.

- **Explicit Classification**  
  Different failure modes are not conflated.

---

## 11.3 Compile-Time Errors

### 11.3.1 Definition

A compile-time error occurs when a program violates static rules of the language.

Compile-time errors include, but are not limited to:

- syntax violations;
- type errors;
- linearity violations;
- invalid regime usage;
- illegal effect placement;
- invalid bindings or contracts.

---

### 11.3.2 Handling

Programs containing compile-time errors:

- MUST be rejected;
- MUST NOT be executed;
- MUST produce diagnostic output.

Compile-time errors are fatal and non-recoverable.

---

## 11.4 Runtime Failures

### 11.4.1 Definition

A runtime failure occurs during execution when a required condition cannot be satisfied.

Examples include:

- resource unavailability;
- timing constraint violation;
- exhausted linear resource;
- failed effect precondition.

---

### 11.4.2 Semantics

On runtime failure:

- execution terminates immediately;
- no further statements are evaluated;
- no effects may occur after the failure point.

Runtime failures are deterministic.

---

## 11.5 Constraint and Admissibility Failure

### 11.5.1 Definition

An admissibility failure occurs when no configuration satisfies all declared constraints.

Admissibility failure:

- is not an error;
- is not undefined behavior;
- represents a valid semantic outcome.

---

### 11.5.2 Semantics

On admissibility failure:

- the process terminates without results;
- no effects are performed;
- a failure result MAY be produced.

Admissibility failures MAY be propagated across process boundaries when permitted.

---

## 11.6 Contract Violations

### 11.6.1 Definition

A contract violation occurs when the conditions of a binding contract are not met.

Examples include:

- exceeding declared latency bounds;
- attempting prohibited effect propagation;
- invalid witness transfer;
- violating determinism or timing clauses.

---

### 11.6.2 Handling

On contract violation:

- the binding MUST NOT be exercised;
- the violation MUST be reported;
- no effects may occur through the binding.

Contract violations do not imply program errors unless explicitly stated.

---

## 11.7 Effect Failure

If an effect cannot be safely performed due to:

- failed constraints,
- violated contracts,
- unavailable resources,

the effect MUST fail deterministically.

An effect failure:

- prevents the effect from occurring;
- terminates execution;
- MUST NOT partially apply.

---

## 11.8 Failure Propagation

Failures propagate according to the following rules:

- failures propagate outward through call boundaries;
- failures terminate the current execution context;
- no failure is silently ignored.

Propagation does not alter the classification of the failure.

---

## 11.9 Observability of Failures

The observable outcome of execution includes:

- successful completion;
- runtime failure;
- admissibility failure;
- contract violation.

No other failure modes exist.

---

## 11.10 Error Reporting

Implementations SHOULD provide:

- clear classification of failure type;
- location information where applicable;
- sufficient detail for diagnosis.

Error reporting mechanisms do not affect program semantics.

---

## 11.11 Absence of Exception Handling

DPL v0.1 does not define exceptions, try/catch mechanisms, or dynamic recovery.

All failure handling is structural and declarative.

Future versions MAY introduce controlled recovery mechanisms if justified.

---

## 11.12 Error Model Stability

The error and failure model defined in this section is foundational.

Changes to:
- failure classification,
- propagation rules,
- or effect safety guarantees,

constitute breaking changes and require a new major specification version.

---

© 2026 Dust LLC


⸻
