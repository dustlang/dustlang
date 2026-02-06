# Constraint-First Debugging in DPL
## Understanding Why Programs Cannot Exist

Document Type: Formal Guide / Technical Paper  
Status: Non-Normative (Semantics-Aligned, Explanatory)  
Applies To: Dust Programming Language (DPL)  
Version: v0.1  
Authority: Specification-defined semantics only  
Copyright: © 2026 Dust LLC

---

## Abstract

Debugging traditionally assumes that a program executed and produced incorrect behavior. The Dust Programming Language (DPL) rejects this assumption. In DPL, programs may fail to exist due to inadmissibility, producing no execution, no trace, and no runtime error.

This paper formalizes **constraint-first debugging**: a debugging paradigm centered on explaining *why no admissible execution exists*. It defines debugging as a process of analyzing constraints, admissibility conditions, and regime interactions rather than inspecting runtime state. Constraint-first debugging is essential for DPL’s correctness guarantees, safety claims, and phase-based computation model.

---

## 1. Introduction

Most debugging workflows begin with execution:
- a crash,
- an incorrect value,
- an unexpected side effect.

DPL allows a more fundamental outcome:
> **Nothing happens, correctly.**

In such cases, traditional debugging fails because there is:
- no stack trace,
- no state,
- no execution history.

Constraint-first debugging exists to answer a different question:
> *Why was this program not allowed to exist?*

---

## 2. Debugging Without Execution

### 2.1 Absence as a Signal

In DPL, absence of execution is meaningful. Inadmissibility is not silence caused by error; it is silence caused by correctness.

Debugging must therefore operate on:
- constraints,
- admissibility rules,
- regime semantics.

Not on runtime artifacts.

---

### 2.2 Debugging vs Explanation

DPL distinguishes:
- **debugging** — developer-facing reasoning tools,
- **explanation** — meta-level artifacts produced by tooling.

Explanations do not become program-visible facts.

---

## 3. Constraint-Centered Reasoning

Constraint-first debugging treats a program as a set of declarations:

- temporal constraints,
- resource constraints,
- effect constraints,
- regime constraints,
- admissibility requirements.

Debugging asks:
- which constraints conflict,
- whether any admissible configuration exists,
- which assumptions are mutually exclusive.

---

## 4. Minimal Inadmissible Sets

### 4.1 Definition

A **minimal inadmissible set** is the smallest subset of constraints whose conjunction is unsatisfiable.

Identifying such sets allows:
- precise diagnostics,
- targeted correction,
- avoidance of misleading errors.

---

### 4.2 Diagnostic Output

Tooling may report:
- conflicting constraint pairs,
- unsatisfiable time bounds,
- incompatible effect requirements,
- regime boundary violations.

These diagnostics are explanatory, not semantic.

---

## 5. Counterfactual Admissibility Analysis

### 5.1 Concept

Constraint-first debugging often involves counterfactual questions:
- Would the program exist if constraint X were removed?
- Which single assumption prevents admissibility?

---

### 5.2 Counterfactuals Are Not Executions

Counterfactual analysis does not violate determinism because:
- it does not modify the program,
- it does not produce alternate realities,
- it does not enable probabilistic reasoning.

It is an analysis tool, not a semantic feature.

---

## 6. Debugging Across Regimes

### 6.1 K-Regime Debugging

- Focus on time bounds, effects, and scheduling.
- Failures are often local but may propagate globally.

---

### 6.2 Q-Regime Debugging

- Focus on linearity violations and ownership conflicts.
- Many errors are static and eliminate execution entirely.

---

### 6.3 Φ-Regime Debugging

- Focus on global consistency.
- Debugging answers *why admissibility failed*, not *how execution failed*.

---

## 7. What Debugging Cannot Do

Constraint-first debugging explicitly forbids:
- inspecting internal Φ-resolution state,
- observing inadmissible partial executions,
- extracting hidden causes as program-visible data.

This preserves knowledge boundaries.

---

## 8. Debugging vs Logging

Logging assumes execution.

Constraint-first debugging assumes:
- possible non-existence,
- explanation without instrumentation,
- reasoning without mutation.

Logging is insufficient for inadmissibility.

---

## 9. Programmer Mental Model

Programmers must shift from:
- “What went wrong?”
to:
- “What assumptions cannot coexist?”

This shift is required for:
- large systems,
- safety-critical applications,
- global constraint reasoning.

---

## 10. Tooling Implications

Tooling must:
- operate on static representations,
- preserve determinism,
- avoid semantic leakage,
- explain without executing.

Debugger output is advisory, not authoritative.

---

## 11. Relationship to Other DPL Concepts

Constraint-first debugging depends on:
- non-existence semantics,
- observability boundaries,
- compositionality under constraints.

It enables:
- admissibility-preserving optimization,
- safe refactoring,
- trustworthy verification.

---

## 12. Conclusion

Constraint-first debugging redefines what it means to understand a program.

In DPL, correctness is not proven by execution, and errors are not the only signals of problems. Sometimes, the most important debugging result is understanding why nothing was allowed to happen.

Debugging, in DPL, explains absence.

That explanation is the evidence of correctness.

---

© 2026 Dust LLC