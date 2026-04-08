# Dust Programming Language (DPL)  
## Language Specification v0.2

**Status:** Complete  
**Version:** v0.2  
**Last Updated:** March 2026  
**License:** Dust Open Source License (DOSL)

---

## Copyright

Copyright © 2026 Dust LLC  
All rights reserved.

---

## About This Document

This document is the **authoritative specification** of the **Dust Programming Language (DPL)**, version v0.2.

It defines the syntax, semantics, and conformance requirements of the language.  
Any implementation of DPL **must conform to this specification** to be considered compliant.

If there is a conflict between:
- this specification, and
- any compiler, runtime, tool, or example,

**this specification takes precedence.**

---

## Scope of v0.2

DPL v0.2 defines the **complete core** of the language with systems programming extensions:

- lexical structure (v0.2 keywords)
- grammar (v0.2 extensions: alloc, free, spawn, join, mutex, file I/O)
- regime model (K / Q / Φ with K-regime systems extensions)
- type system (core + Mem, Thread, Mutex, File, Port, Device)
- effect system (core + memory, concurrency, I/O effects)
- binding and contract semantics
- error and failure model
- conformance requirements

The following are **explicitly out of scope** for v0.2:

- macro systems
- generics
- inheritance
- reflection
- exceptions
- dynamic typing
- implicit concurrency
- standard library completeness
- optimization guarantees

These may be addressed in later versions if justified.

---

## Normative Language

The key words **MUST**, **MUST NOT**, **SHOULD**, **SHOULD NOT**, and **MAY** in this document are to be interpreted as described in RFC 2119.

---

## Table of Contents

### 1. Introduction
1.1 Purpose of the Dust Programming Language  
1.2 Design Philosophy  
1.3 Intended Use Cases  
1.4 Non-Goals  
1.5 Relationship to Implementations  

---

### 2. Lexical Structure
2.1 Character Set  
2.2 Tokens  
2.3 Whitespace and Comments  
2.4 Identifiers  
2.5 Keywords and Reserved Words  
2.6 Literals  

---

### 3. Grammar
3.1 Overview  
3.2 Program Structure  
3.3 Forge Declarations  
3.4 Shape Declarations  
3.5 Process Declarations  
3.6 Statements  
3.7 Expressions  
3.8 Binding Declarations  
3.9 Grammar Constraints  

> *This section incorporates the normative grammar defined in*  
> **Grammar v0.2** (including v0.2 additions).

---

### 4. Regime Model
4.1 Overview of Regimes  
4.2 K-Regime (Classical Computation)  
4.3 Q-Regime (Quantum Computation)  
4.4 Φ-Regime (Phase Computation)  
4.5 Regime Isolation Rules  
4.6 Cross-Regime Interaction  
4.7 K-Regime Systems Extensions (v0.2)
4.8 Memory Effects (v0.2)
4.9 Concurrency (v0.2)
4.10 Input/Output (v0.2)
4.11 Unsafe Operations (v0.2)
4.12 Deterministic Scheduling (v0.2)

---

### 5. Type System
5.1 Type Categories  
5.2 Primitive Types  
5.3 Structural Types (`shape`)  
5.4 Linear Types  
5.5 Resource Types (v0.2)
5.6 Generic Types (v0.2)
5.7 Dimensional and Unit Types  
5.8 Determinism Qualifiers  
5.9 Type Validity and Well-Formedness  

---

### 6. Effects and Irreversibility
6.1 Effect Overview  
6.2 Observation (`observe`)  
6.3 Emission (`emit`)  
6.4 Sealing (`seal`)  
6.5 Effect Propagation  
6.6 Effect Restrictions by Regime  
6.7 Memory Effects (v0.2)
6.8 Concurrency Effects (v0.2)
6.9 I/O Effects (v0.2)

---

### 7. Constraints and Admissibility
7.1 Constraint Declarations  
7.2 Global vs Local Constraints  
7.3 Admissibility Conditions  
7.4 Proofs and Witnesses  
7.5 Failure of Admissibility  
7.6 Constraint Types (v0.2)

---

### 8. Processes and Execution
8.1 Process Lifecycle  
8.2 Resource Declaration (`uses`)  
8.3 Linearity Enforcement  
8.4 Evaluation Order  
8.5 Determinism Guarantees  

---

### 9. Time and Concurrency
9.1 Logical Time  
9.2 Physical Time  
9.3 Clocks and Scheduling  
9.4 Deadlines and Jitter  
9.5 Synchronization Domains  
9.6 Deterministic Scheduling (v0.2)

---

### 10. Binding and Contracts
10.1 Bind Declarations  
10.2 Contract Semantics  
10.3 Cross-Regime Contracts  
10.4 Contract Violations  

---

### 11. Error and Failure Model
11.1 Compile-Time Errors  
11.2 Type Errors  
11.3 Constraint Failures  
11.4 Runtime Traps  
11.5 Undefined Behavior (or Lack Thereof)  

---

### 12. Dust Intermediate Representation (DIR)
12.1 Purpose of DIR  
12.2 Relationship to the Language  
12.3 Semantic Preservation  
12.4 Versioning Rules  

---

### 13. Conformance
13.1 Compiler Conformance  
13.2 Runtime Conformance  
13.3 Observable Behavior  
13.4 Compliance Testing  

---

### 14. Versioning and Evolution
14.1 Specification Versioning  
14.2 Backward Compatibility  
14.3 Experimental Features  

---

### 15. Security and Safety Considerations
15.1 Resource Exhaustion  
15.2 Effect Isolation  
15.3 Safety-Critical Usage  

---

### 16. Glossary
16.1 Terms and Definitions  

---

### Appendix A. Rationale and Design Notes  
### Appendix B. Deferred Features  
### Appendix C. Change Log  

---

## 2. Lexical Structure

### 2.1 Character Set

DPL source files are encoded in UTF-8. All Unicode characters within the valid ranges are permitted in comments and string literals. Identifiers and keywords are restricted to ASCII.

### 2.2 Tokens

The lexical grammar recognizes the following token classes:

- **Identifiers**: `[a-zA-Z_][a-zA-Z0-9_]*`
- **Integer literals**: `[0-9]+` or hex `0x[0-9a-fA-F]+`
- **Float literals**: `[0-9]+\.[0-9]+`
- **Keywords**: reserved words (see below)
- **Symbols**: `+`, `-`, `*`, `/`, `=`, `==`, `!=`, `<`, `>`, `<=`, `>=`, `(`, `)`, `{`, `}`, `[`, `]`, `,`, `;`, `:`, `->`, `=>`

### 2.3 Whitespace and Comments

- Whitespace: spaces, tabs, newlines (ignored except to separate tokens)
- Line comments: `//` to end of line
- Block comments: `/* ... */`

### 2.4 Identifiers

Identifiers follow standard C-style rules: start with letter or underscore, followed by letters, digits, or underscores.

### 2.5 Keywords and Reserved Words

**v0.2 Reserved Keywords:**

```
// Core keywords (v0.1)
forge shape proc emit observe seal return let if else while
K Q Phi constrain prove bind contract

// v0.2 additions
alloc free spawn join mutex_new mutex_lock mutex_unlock
open read write close io_read io_write mmio_read mmio_write
unsafe
```

### 2.6 Literals

- **Integer**: decimal `42`, hex `0xFF`, octal `0o77`
- **Float**: `3.14`, `1.0e-10`
- **Boolean**: `true`, `false`
- **String**: `"hello world"` (double-quoted, UTF-8)
- **Character**: `'a'`

---

## 3. Grammar

### 3.1 Overview

DPL programs consist of **forge** declarations containing shapes, processes, and binds.

### 3.2 Program Structure

```
PROGRAM ::= { FORGE_DECLARATION }
```

### 3.3 Forge Declarations

```
FORGE_DECLARATION ::= "forge" IDENTIFIER "{" { FORGE_ITEM } "}"
```

### 3.4 Forge Items

```
FORGE_ITEM ::= SHAPE_DECLARATION | PROC_DECLARATION | BIND_DECLARATION
```

### 3.5 Shape Declarations

```
SHAPE_DECLARATION ::= "shape" IDENTIFIER "{" { SHAPE_FIELD } "}"
SHAPE_FIELD ::= IDENTIFIER ":" TYPE ";"
```

### 3.6 Types

```
TYPE ::= PRIMITIVE_TYPE | IDENTIFIER | TYPE "[" INTEGER "]" | MEM_TYPE | THREAD_TYPE | MUTEX_TYPE | FILE_TYPE | PORT_TYPE | DEVICE_TYPE

PRIMITIVE_TYPE ::= "i8" | "i16" | "i32" | "i64" | "i128" | "f32" | "f64" | "bool"

MEM_TYPE ::= "Mem"
THREAD_TYPE ::= "Thread" "<" TYPE ">"
MUTEX_TYPE ::= "Mutex"
FILE_TYPE ::= "File"
PORT_TYPE ::= "Port"
DEVICE_TYPE ::= "Device"
```

### 3.7 Process Declarations

```
PROC_DECLARATION ::= "proc" REGIME "::" IDENTIFIER "(" [ PARAM_LIST ] ")" [ RETURN_TYPE ] [ PROC_QUALIFIERS ] PROC_BODY
REGIME ::= "K" | "Q" | "Φ"
```

### 3.8 Parameters and Return Types

```
PARAM_LIST ::= PARAM { "," PARAM }
PARAM ::= IDENTIFIER ":" TYPE
RETURN_TYPE ::= "->" TYPE
```

### 3.9 Process Qualifiers

```
PROC_QUALIFIERS ::= { "uses" RESOURCE_LIST | "linear" }
RESOURCE_LIST ::= RESOURCE { "," RESOURCE }
RESOURCE ::= IDENTIFIER "(" RESOURCE_ARGS ")"
```

### 3.10 Process Body

```
PROC_BODY ::= "{" { STATEMENT } "}"
```

### 3.11 Statements

```
STATEMENT ::= LET_STATEMENT | CONSTRAINT_STATEMENT | PROVE_STATEMENT | EFFECT_STATEMENT | RETURN_STATEMENT | ALLOC_STATEMENT | FREE_STATEMENT | SPAWN_STATEMENT | JOIN_STATEMENT | MUTEX_STATEMENT | IO_STATEMENT | UNSAFE_BLOCK
```

### 3.12 Let Statements

```
LET_STATEMENT ::= "let" IDENTIFIER "=" EXPRESSION ";"
```

All bindings are immutable.

### 3.13 Constraint Statements

```
CONSTRAINT_STATEMENT ::= "constrain" EXPRESSION ";"
```

### 3.14 Proof Statements

```
PROVE_STATEMENT ::= "prove" IDENTIFIER "from" EXPRESSION ";"
```

### 3.15 Effect Statements

```
EFFECT_STATEMENT ::= "observe" EXPRESSION ";" | "emit" EXPRESSION ";" | "seal" EXPRESSION ";"
```

### 3.16 Memory Statements (v0.2)

```
ALLOC_STATEMENT ::= "let" IDENTIFIER "=" "alloc" "(" EXPRESSION ")" ";"
FREE_STATEMENT ::= "free" "(" EXPRESSION ")" ";"
```

### 3.17 Concurrency Statements (v0.2)

```
SPAWN_STATEMENT ::= "let" IDENTIFIER "=" "spawn" "(" EXPRESSION ["," EXPRESSION] ")" ";"
JOIN_STATEMENT ::= "let" IDENTIFIER "=" "join" "(" EXPRESSION ")" ";"
MUTEX_STATEMENT ::= "mutex_new" "(" ")" | "mutex_lock" "(" EXPRESSION ")" | "mutex_unlock" "(" EXPRESSION ")"
```

### 3.18 I/O Statements (v0.2)

```
IO_STATEMENT ::= "open" "(" EXPRESSION "," EXPRESSION ")" | "read" "(" EXPRESSION "," EXPRESSION "," EXPRESSION ")" | "write" "(" EXPRESSION "," EXPRESSION "," EXPRESSION ")" | "close" "(" EXPRESSION ")" | "io_read" "(" EXPRESSION ")" | "io_write" "(" EXPRESSION "," EXPRESSION ")" | "mmio_read" "(" EXPRESSION ")" | "mmio_write" "(" EXPRESSION "," EXPRESSION ")"
```

### 3.19 Unsafe Blocks (v0.2)

```
UNSAFE_BLOCK ::= "unsafe" "{" { STATEMENT } "}"
```

### 3.20 Return Statements

```
RETURN_STATEMENT ::= "return" EXPRESSION ";"
```

### 3.21 Expressions

```
EXPRESSION ::= LITERAL | IDENTIFIER | FUNCTION_CALL | BINARY_EXPRESSION | UNARY_EXPRESSION | ALLOC_EXPR | SPAWN_EXPR

UNARY_EXPRESSION ::= OPERATOR EXPRESSION
ALLOC_EXPR ::= "alloc" "(" EXPRESSION ")"
SPAWN_EXPR ::= "spawn" "(" EXPRESSION ["," EXPRESSION] ")"
```

### 3.22 Function Calls

```
FUNCTION_CALL ::= IDENTIFIER "(" [ ARG_LIST ] ")"
ARG_LIST ::= EXPRESSION { "," EXPRESSION }
```

### 3.23 Binary Expressions

```
BINARY_EXPRESSION ::= EXPRESSION OPERATOR EXPRESSION
OPERATOR ::= "+" | "-" | "*" | "/" | "%" | "==" | "!=" | "<" | ">" | "<=" | ">=" | "&&" | "||"
```

### 3.24 Literals

```
LITERAL ::= INTEGER | FLOAT | BOOLEAN | STRING | CHARACTER
```

### 3.25 Bind Declarations

```
BIND_DECLARATION ::= "bind" PROC_REF "->" PROC_REF "contract" "{" { CONTRACT_CLAUSE } "}"
PROC_REF ::= REGIME "::" IDENTIFIER
```

### 3.26 Contract Clauses

```
CONTRACT_CLAUSE ::= IDENTIFIER OPERATOR VALUE ";"
```

### 3.27 Grammar Constraints

1. Processes in the Q regime may operate only on linear types.
2. Processes in the Φ regime may not perform effects without producing admissibility witnesses.
3. Effects may not appear inside pure expressions.
4. Cross-regime invocation requires an explicit bind declaration.
5. All bindings must satisfy their declared contracts.
6. Memory allocation (`alloc`) may only appear in K-regime processes.
7. Unsafe blocks may only appear in K-regime processes.
8. Thread operations (`spawn`, `join`) may only appear in K-regime processes.

Programs violating these constraints are invalid.

---

## 4. Regime Model

### 4.1 Overview of Regimes

DPL defines three computation regimes:
- **K-Regime**: Classical deterministic computation
- **Q-Regime**: Quantum (linear) computation  
- **Φ-Regime**: Phase computation with constraint solving

Every process MUST belong to exactly one regime.

### 4.2 K-Regime (Classical Computation)

The K-regime is for deterministic, time-aware classical computation with copyable values.

**Properties:**
- Values are copyable
- Execution is deterministic
- Time and resource declarations permitted
- Supports memory allocation, threading, I/O (v0.2)
- Supports unsafe operations (v0.2)

### 4.3 Q-Regime (Quantum Computation)

The Q-regime handles quantum/linear computation.

**Properties:**
- Values are linear (used exactly once)
- Measurement is effectful (`observe`)
- Cannot copy or discard values
- Cross-regime requires binding

### 4.4 Φ-Regime (Phase Computation)

The Φ-regime handles constraint solving and proof generation.

**Properties:**
- Constraint declarations permitted
- Proof and witness generation
- Effect-gated computations

### 4.5 Regime Isolation Rules

Regimes are isolated:
- Q-regime values cannot cross to K or Φ
- Φ-regime constraints cannot directly affect K
- Cross-regime requires explicit binds with contracts

### 4.6 Cross-Regime Interaction

Cross-regime interaction requires bind declarations with contracts specifying the interface.

### 4.7 K-Regime Systems Extensions (v0.2)

The K-regime is extended with systems programming capabilities:

- Memory management (`alloc`, `free`)
- Concurrency (`spawn`, `join`, `mutex_*`)
- I/O (`open`, `read`, `write`, `close`, `io_*`, `mmio_*`)
- Unsafe operations (`unsafe` blocks)

### 4.8 Memory Effects (v0.2)

**alloc(size: Int) -> Mem**
- Allocates contiguous memory of `size` bytes
- Returns memory handle of type `Mem`
- Deterministic: succeeds or fails with error effect

**free(mem: Mem)**
- Releases memory handle
- After free, handle is invalid
- Double-free is constraint violation

Memory handles are copyable but lifetime-tracked.

### 4.9 Concurrency (v0.2)

**spawn(f: () -> T, seed?: Int) -> Thread<T>**
- Creates new thread executing `f`
- Optional seed for deterministic scheduling
- Inherits parent's regime and constraints

**join(thread: Thread<T>) -> T**
- Waits for thread completion
- Returns thread's result

**mutex_new() -> Mutex**
- Creates new mutex

**mutex_lock(m: Mutex)**
- Acquires mutex lock

**mutex_unlock(m: Mutex)**
- Releases mutex lock

### 4.10 Input/Output (v0.2)

**File operations:**
- `open(path: String, mode: FileMode) -> File`
- `read(file: File, buffer: Mem, n: Int) -> Int`
- `write(file: File, buffer: Mem, n: Int) -> Int`
- `close(file: File)`

**Device operations:**
- `io_read(port: Port) -> Int`
- `io_write(port: Port, value: Int)`
- `mmio_read(addr: Mem) -> Int`
- `mmio_write(addr: Mem, value: Int)`

### 4.11 Unsafe Operations (v0.2)

```
unsafe { /* unchecked operations */ }
```

Within unsafe blocks:
- Pointer arithmetic permitted
- Arbitrary memory access permitted
- Inline assembly (implementation-defined)
- Type checking still applies

**Rules:**
1. Must annotate with reason comment
2. Still subject to effect checking
3. Cannot cross regime boundaries

### 4.12 Deterministic Scheduling (v0.2)

Every K-regime process has an implicit scheduler seed:
- Seed inherited by spawned threads
- Same seed = same thread interleaving
- Enables reproducible concurrent execution

---

## 5. Type System

### 5.1 Type Categories

- **Primitive types**: i8, i16, i32, i64, i128, f32, f64, bool
- **Structural types**: shape declarations
- **Linear types**: Q-regime types (implicitly linear)
- **Resource types**: Mem, Thread<T>, Mutex, File, Port, Device (v0.2)
- **Function types**: (TYPE, ...) -> TYPE

### 5.2 Primitive Types

| Type | Size | Signed |
|------|------|--------|
| i8 | 8-bit | Yes |
| i16 | 16-bit | Yes |
| i32 | 32-bit | Yes |
| i64 | 64-bit | Yes |
| i128 | 128-bit | Yes |
| f32 | 32-bit | Float |
| f64 | 64-bit | Float |
| bool | 8-bit | No |

### 5.3 Structural Types (shape)

```dust
shape Point {
    x: i32;
    y: i32;
}
```

Shapes are nominal structural types.

### 5.4 Linear Types

Q-regime types are linear:
- Must be used exactly once
- Cannot be copied
- Cannot be discarded

### 5.5 Resource Types (v0.2)

| Type | Description |
|------|-------------|
| Mem | Memory handle |
| Thread<T> | Thread handle returning T |
| Mutex | Synchronization primitive |
| File | Open file handle |
| Port | I/O port |
| Device | Hardware device |

Resource types are copyable but lifetime-tracked.

### 5.6 Generic Types (v0.2)

Thread<T> is generic over return type.

### 5.7 Dimensional and Unit Types

Not specified in v0.2.

### 5.8 Determinism Qualifiers

Not specified in v0.2.

### 5.9 Type Validity and Well-Formedness

- Types must be declared before use
- Generic parameters must be bound
- Linear types cannot be used in K or Φ regimes

---

## 6. Effects and Irreversibility

### 6.1 Effect Overview

Effects are observable side effects:
- `emit`: Output effect
- `observe`: Measurement effect (Q-regime)
- `seal`: Commitment effect (Φ-regime)

### 6.2 Observation (observe)

Q-regime only. Represents quantum measurement.

### 6.3 Emission (emit)

Outputs a value. Used for logging, output, side effects.

### 6.4 Sealing (seal)

Φ-regime. Commits to a value.

### 6.5 Effect Propagation

Effects propagate outward: effect in called procedure affects caller.

### 6.6 Effect Restrictions by Regime

- K: emit only
- Q: observe, emit, seal
- Φ: constrain, prove, seal, emit

### 6.7 Memory Effects (v0.2)

- `alloc`: Memory allocation
- `free`: Memory deallocation

### 6.8 Concurrency Effects (v0.2)

- `spawn`: Thread creation
- `join`: Thread synchronization
- `mutex_lock`/`mutex_unlock`: Synchronization

### 6.9 I/O Effects (v0.2)

- File I/O: open, read, write, close
- Device I/O: io_read, io_write, mmio_read, mmio_write

---

## 7. Constraints and Admissibility

### 7.1 Constraint Declarations

Φ-regime only. Express properties that must hold.

### 7.2 Global vs Local Constraints

- Global: Apply across program
- Local: Apply within scope

### 7.3 Admissibility Conditions

Constraints define admissible states.

### 7.4 Proofs and Witnesses

Proof statements produce witnesses for admissibility.

### 7.5 Failure of Admissibility

Constraint violation = program invalid.

### 7.6 Constraint Types (v0.2)

Additional constraint types may be defined for systems programming:
- Memory bounds
- Timing constraints
- Resource limits

---

## 8. Processes and Execution

### 8.1 Process Lifecycle

Processes are top-level executable units.

### 8.2 Resource Declaration (uses)

Declare required resources.

### 8.3 Linearity Enforcement

Q-regime enforces linear usage.

### 8.4 Evaluation Order

Sequential within processes, effects ordered.

### 8.5 Determinism Guarantees

K-regime is deterministic unless I/O effects used.

---

## 9. Time and Concurrency

### 9.1 Logical Time

Φ-regime uses logical time ordering.

### 9.2 Physical Time

K-regime may declare physical time constraints.

### 9.3 Clocks and Scheduling

Scheduler with deterministic seeds (v0.2).

### 9.4 Deadlines and Jitter

Not specified in v0.2.

### 9.5 Synchronization Domains

Mutex provides synchronization.

### 9.6 Deterministic Scheduling (v0.2)

Seed-based scheduling ensures reproducibility.

---

## 10. Binding and Contracts

### 10.1 Bind Declarations

Cross-regime bindings define interfaces.

### 10.2 Contract Semantics

Contracts specify behavior at regime boundaries.

### 10.3 Cross-Regime Contracts

Φ contracts can constrain K and Q processes.

### 10.4 Contract Violations

Contract failure = compile-time error.

---

## 11. Error and Failure Model

### 11.1 Compile-Time Errors

Syntax, type, constraint errors.

### 11.2 Type Errors

Type mismatches, invalid conversions.

### 11.3 Constraint Failures

Φ-regime constraint violations.

### 11.4 Runtime Traps

Division by zero, out-of-bounds, etc.

### 11.5 Undefined Behavior

v0.2 has no undefined behavior - all paths are defined.

---

## 12. Dust Intermediate Representation (DIR)

### 12.1 Purpose of DIR

Intermediate representation for compilation.

### 12.2 Relationship to the Language

DIR captures DPL semantics.

### 12.3 Semantic Preservation

Compilers must preserve semantics.

### 12.4 Versioning Rules

DIR versions correspond to language versions.

---

## 13. Conformance

### 13.1 Compiler Conformance

Must implement all specified features.

### 13.2 Runtime Conformance

Must implement specified effects.

### 13.3 Observable Behavior

Defined by specification.

### 13.4 Compliance Testing

Conformance tests required.

---

## 14. Versioning and Evolution

### 14.1 Specification Versioning

Semantic versioning: MAJOR.MINOR.PATCH

### 14.2 Backward Compatibility

Minor versions backward compatible.

### 14.3 Experimental Features

Marked as experimental until stable.

---

## 15. Security and Safety Considerations

### 15.1 Resource Exhaustion

Memory exhaustion = error effect.

### 15.2 Effect Isolation

Effects are bounded and explicit.

### 15.3 Safety-Critical Usage

v0.2 suitable for safety-critical (with constraints).

---

## 16. Glossary

**Admissibility**: Whether a state satisfies constraints  
**Bind**: Cross-regime connection with contract  
**Constraint**: Property that must hold  
**Effect**: Observable side effect  
**Forge**: Compilation unit  
**K-Regime**: Classical deterministic computation  
**Linear Type**: Used exactly once  
**Phi-Regime**: Phase/constraint computation  
**Process**: Executable unit  
**Q-Regime**: Quantum/linear computation  
**Regime**: Computation model (K, Q, Φ)  
**Shape**: Structural type  
**Witness**: Proof of admissibility  

---

## Change Log

- **v0.2** — Complete specification with systems programming extensions
  - Added memory effects (alloc, free)
  - Added concurrency (spawn, join, mutex)
  - Added I/O (file, device operations)
  - Added unsafe blocks
  - Added resource types (Mem, Thread, Mutex, File, Port, Device)
  - Added deterministic scheduling with seeds
  - Merged all v0.1 content with v0.2 additions

- **v0.1** — Initial specification structure defined.

---

© 2026 Dust LLC
