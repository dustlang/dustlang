# §7 Constraints – v0.2 Additions

## Dust Programming Language Specification v0.2

**Status:** Normative (additive)  
**Last Updated:** February 2026

This document extends the constraint system defined in §7 of the v0.1
specification.  The new constraints ensure correctness of the
additional types and effects introduced for systems programming.

### 7.1 Memory Safety Constraints

The following constraints apply to `Mem` handles and memory effects:

1. **Exact Freeing**: Every allocated memory region **MUST** be
   freed exactly once.  Double free is an error.  Memory regions
   that remain allocated at process termination are considered
   leaks and are constraint violations.
2. **Use‑After‑Free**: Using a `Mem` handle after it has been freed
   is a constraint violation.
3. **Alias Tracking**: When a `Mem` handle is copied, all copies are
   considered aliases.  A region is freed when the last alias is
   explicitly freed.  Using any alias after freeing is invalid.
4. **Bounds**: Reads and writes through a `Mem` handle **MUST** stay
   within the allocated size.  Out‑of‑bounds access is a constraint
   violation.

### 7.2 Concurrency Constraints

The deterministic concurrency model imposes the following constraints:

1. **Join Safety**: A thread handle passed to `join` **MUST** refer
   to a currently running or finished thread.  Joining the same
   thread more than once is invalid.
2. **Mutex Correctness**: Every `mutex_lock` **MUST** be paired with
   a corresponding `mutex_unlock` in the same thread.  Unlocking a
   mutex not held by the current thread is invalid.
3. **Deadlock Avoidance**: The language does not enforce deadlock
   prevention, but programmers **MAY** express ordering constraints
   among mutexes to enable static deadlock analysis.
4. **Seed Consistency**: If a process specifies a scheduler seed, all
   spawned threads inherit it unless overridden.  Changing the seed
   during execution is a constraint violation.

### 7.3 I/O Constraints

I/O operations must declare and adhere to resource and timing
constraints:

1. **File Lifetimes**: A `File` handle is valid from the moment of
   `open` until `close`.  Reading or writing a closed file is a
   constraint violation.
2. **Port Validity**: Operations on a `Port` handle are valid only
   if the port exists on the target architecture.  Compilers may
   reject code targeting invalid ports.
3. **MMIO Region Validity**: Addresses passed to `mmio_read` and
   `mmio_write` must refer to valid device memory regions.  Out‑of‑
   range accesses are invalid.

### 7.4 Unsafe Code Responsibilities

Within `unsafe` blocks, certain safety constraints are relaxed but
others remain in force:

1. Memory safety constraints still apply when using `Mem` handles.
2. Programmers are responsible for ensuring that any raw pointers
   derived from handles respect the underlying lifetimes and bounds.
3. Violations inside `unsafe` code may lead to undefined behaviour
   without being caught by the compiler.

### 7.5 Cross‑Regime Isolation

The existing regime isolation rules【709885362819930†L174-L202】 remain
unchanged.  None of the new constructs may be used to circumvent
isolation.  `Mem`, `Thread`, `Mutex`, `File`, `Port` and `Device`
handles **MUST NOT** cross regime boundaries directly; interaction
between regimes continues to be governed by explicit bindings.