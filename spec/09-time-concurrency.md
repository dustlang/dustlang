# §9 Time and Concurrency
## Dust Programming Language Specification v0.1

**Status:** Normative  
**Last Updated:** February 2026

This section is part of the Dust Programming Language Specification v0.1.

---

## 9.1 Overview

The Dust Programming Language treats **time** as an explicit semantic dimension and **concurrency** as a controlled, deterministic relationship between processes.

DPL does not model concurrency as uncontrolled parallel execution.  
Instead, concurrency is expressed through explicit time domains, scheduling constraints, and synchronization rules that preserve analyzability and reproducibility.

---

## 9.2 Time Domains

### 9.2.1 Logical Time

Logical time represents an ordering of events independent of physical clocks.

Logical time:
- defines relative ordering between operations;
- is deterministic and reproducible;
- is used for reasoning about causality.

Unless otherwise specified, all process execution is ordered by logical time.

---

### 9.2.2 Physical Time

Physical time represents interaction with real-world clocks and durations.

Physical time:
- corresponds to wall-clock or hardware time;
- MAY be approximate or bounded;
- MUST be explicitly declared when used.

Operations that depend on physical time MUST declare that dependency.

---

## 9.3 Time Declarations

Processes MAY declare time-related requirements via qualifiers or contracts.

Examples include:
- clock rates,
- deadlines,
- allowable jitter,
- synchronization domains.

Time declarations do not execute code; they constrain execution.

---

## 9.4 Deterministic Scheduling

DPL mandates **deterministic scheduling**.

For any given program, inputs, and environment assumptions:
- the order of effects MUST be the same across executions;
- scheduling decisions MUST NOT depend on unspecified runtime behavior;
- race conditions are prohibited by construction.

Implementations MAY use parallel execution internally, provided observable behavior remains deterministic.

---

## 9.5 Concurrency Model

### 9.5.1 Definition

Concurrency in DPL refers to the coexistence of multiple active execution contexts whose interactions are explicitly constrained.

Concurrency is expressed through:
- multiple processes,
- bindings with temporal contracts,
- shared time domains.

---

### 9.5.2 Explicitness

No process executes concurrently with another unless concurrency is explicitly established through structure or binding.

Implicit concurrency is prohibited.

---

## 9.6 Synchronization

### 9.6.1 Synchronization Domains

A synchronization domain defines a set of processes that share timing and ordering guarantees.

Within a domain:
- ordering rules are consistent;
- time references are comparable;
- synchronization constraints are enforced.

---

### 9.6.2 Barriers and Coordination

DPL does not define implicit barriers.

Coordination between processes:
- MUST be declared explicitly;
- MAY be enforced through contracts or resource usage;
- MUST preserve determinism.

---

## 9.7 Time and Effects

Effects interact with time as follows:

- effects occur at well-defined points in logical time;
- physical-time effects MUST declare timing assumptions;
- effect ordering MUST be preserved across concurrent contexts.

An effect MUST NOT be observed as occurring earlier or later than permitted by its declared constraints.

---

## 9.8 Time in Different Regimes

### 9.8.1 K-Regime

In the K-regime:
- both logical and physical time MAY be used;
- deadlines and jitter MAY be declared;
- time-sensitive control loops are permitted.

---

### 9.8.2 Q-Regime

In the Q-regime:
- time is treated as a constrained resource;
- ordering of operations MUST preserve linearity;
- physical time MAY be relevant for coherence constraints but MUST be declared explicitly.

---

### 9.8.3 Φ-Regime

In the Φ-regime:
- time is not a driver of execution;
- admissibility is defined independent of temporal ordering;
- time MAY appear only as a constraint parameter.

---

## 9.9 Deadlines and Jitter

Deadlines and jitter bounds may be declared to constrain execution timing.

If timing constraints cannot be met:
- execution MUST NOT proceed;
- no effects may be performed;
- the failure is treated as a timing constraint violation.

Timing failures are not admissibility failures unless explicitly stated.

---

## 9.10 Absence of Data Races

Because:
- mutable shared state is prohibited,
- effects are explicit,
- ordering is deterministic,

data races as traditionally defined cannot occur in well-formed DPL programs.

---

## 9.11 Implementation Freedom

Implementations MAY:
- execute processes in parallel;
- use hardware concurrency features;
- reorder internal computation steps;

provided that:
- all observable behavior matches the specification;
- logical time and effect order are preserved.

---

## 9.12 Time and Concurrency Stability

The time and concurrency model defined in this section is foundational.

Changes to:
- time semantics,
- determinism guarantees,
- concurrency rules,

constitute breaking changes and require a new major specification version.

---

© 2026 Dust LLC


⸻
