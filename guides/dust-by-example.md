# Dust by Example
## Illustrative Programs in the Dust Programming Language

**Status:** Non-Normative Guide  
**Applies To:** Users learning to read and write Dust programs  
**Authority:** None (Illustrative Only)

---

## 1. Purpose

This document provides **small, illustrative examples** of Dust programs.

Its purpose is to:
- demonstrate how Dust programs are structured,
- show how regimes appear in practice,
- illustrate effects, constraints, and admissibility,
- and help readers build intuition.

This guide does **not** define language behavior.  
All semantics are defined in the specification and normative documents.

If an example appears to contradict the specification, the example is wrong.

---

## 2. Reading These Examples

Each example is presented as:

- a minimal Dust fragment,
- followed by a short explanation,
- without attempting to be exhaustive.

Examples are intentionally incomplete where appropriate.

They are meant to be *read*, not copied blindly.

---

## 3. A Minimal Deterministic Computation (K-Regime)

```dust
k let x: Int = 2
k let y: Int = 3
k let z: Int = x + y
```

**What this illustrates:**
- deterministic computation,
- copyable values,
- absence of effects.

No observation occurs.  
This computation is internally meaningful but externally invisible.

---

## 4. Introducing an Effect (Observation)

```dust
k let temperature: Float = read_sensor()

observe temperature
```

**What this illustrates:**
- explicit observation,
- irreversible exposure of state,
- effect-based interaction.

The `observe` construct marks the boundary between computation and observation.

---

## 5. Linear Resource Usage (Q-Regime)

```dust
q let ψ: Qubit = allocate()

q apply hadamard to ψ

observe ψ
```

**What this illustrates:**
- non-copyable resources,
- explicit allocation,
- irreversible measurement.

After observation, `ψ` no longer exists as a usable resource.

---

## 6. Constraint Declaration

```dust
constraint energy_budget <= 10
```

**What this illustrates:**
- constraints as first-class declarations,
- conditions on admissibility,
- absence of control flow.

The program is inadmissible if the constraint cannot be satisfied.

---

## 7. Constraint Failure as Terminal

```dust
constraint time_deadline < now()

emit actuator_signal()
```

**What this illustrates:**
- constraint evaluation,
- inadmissibility as failure,
- prohibition on continuing execution.

If the constraint fails, the emission never occurs.

---

## 8. Admissibility-Based Computation (Φ-Regime)

```dust
phi require consistency(system_state)

observe admissibility
```

**What this illustrates:**
- admissibility as outcome,
- absence of probabilistic branching,
- Φ-regime observation.

The result is whether the system is globally consistent.

---

## 9. Concurrency Without Nondeterminism

```dust
k {
    let a = compute_a()
    let b = compute_b()
}

observe a
observe b
```

**What this illustrates:**
- unordered computation,
- deterministic outcomes,
- explicit observation order.

Concurrency does not imply nondeterminism.

---

## 10. Time-Constrained Execution

```dust
within 10ms {
    emit control_signal()
}
```

**What this illustrates:**
- explicit time bounds,
- semantic deadlines,
- admissibility tied to time.

If the deadline cannot be met, execution is inadmissible.

---

## 11. Effects as the Only Observable Boundary

```dust
k let internal = complex_computation()
```

**What this illustrates:**
- internal computation without effects,
- lack of observability,
- semantic invisibility.

Without effects, nothing is observed.

---

## 12. What This Guide Does Not Do

This guide does not:
- enumerate syntax exhaustively,
- define typing rules,
- explain compiler behavior,
- or describe execution internals.

Those belong to normative documents.

---

## 13. Final Note

Dust by Example exists to build **intuition**, not authority.

If you need to know what Dust *means*, consult the specification.  
If you need to know how Dust *executes*, consult the DVM.

These examples exist to make the structure legible.

---