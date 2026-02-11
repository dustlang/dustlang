# §6 Effects – v0.2 Additions

## Dust Programming Language Specification v0.2

**Status:** Normative (additive)  
**Last Updated:** February 2026

This document adds new effects to the DPL effect system to support
systems programming in the K‑regime.  All existing effects remain
unchanged.

### 6.1 Memory Effects

| Effect                | Description and Rules                                                                            |
|----------------------|--------------------------------------------------------------------------------------------------|
| `alloc(size: Int)`   | Allocates `size` bytes of classical memory and returns a `Mem` handle.  Must succeed or raise a deterministic error.  Allocation has no side effects beyond reserving memory. |
| `free(mem: Mem)`     | Releases the memory associated with `mem`.  Invalid if `mem` is already freed or has outstanding copies. |

### 6.2 Concurrency Effects

| Effect                              | Description and Rules                                                                                                     |
|------------------------------------|---------------------------------------------------------------------------------------------------------------------------|
| `spawn(f: () → T, seed?: Int)`     | Spawns a new K‑regime thread to execute `f`.  Returns a `Thread<T>` handle.  The optional `seed` parameter determines deterministic scheduling【548468680421956†L121-L129】. |
| `join(thread: Thread<T>)`          | Waits for the given thread to complete and returns its result of type `T`.  Joining a thread more than once is invalid. |
| `mutex_new()`                      | Creates a new `Mutex`.  Multiple copies of the returned value refer to the same lock. |
| `mutex_lock(m: Mutex)`             | Acquires the mutex.  Blocks deterministically until the lock can be taken.  Must be paired with `mutex_unlock`. |
| `mutex_unlock(m: Mutex)`           | Releases the mutex.  Unlocking a mutex that is not held by the current thread is a constraint violation. |

### 6.3 Input/Output Effects

| Effect                                | Description and Rules                                                                                                                     |
|--------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| `open(path: Str, mode: FileMode)`     | Opens the file at `path` in the specified `mode` (`read`, `write`, `append`, etc.).  Returns a `File` handle or raises an error.           |
| `read(file: File, buf: Mem, n: Int)`  | Reads up to `n` bytes from `file` into the memory region pointed to by `buf`.  Returns the number of bytes read.  Must handle end‑of‑file gracefully. |
| `write(file: File, buf: Mem, n: Int)` | Writes up to `n` bytes from `buf` to `file`.  Returns the number of bytes written.  May return less than `n` if the device cannot accept more data. |
| `close(file: File)`                   | Closes the file handle.  After closing, the `File` handle becomes invalid.                                                                |
| `io_read(port: Port)`                 | Reads a value from the I/O port.  Port must be valid for the current system.                                                             |
| `io_write(port: Port, value: Int)`    | Writes `value` to the I/O port.                                                                                                          |
| `mmio_read(addr: Mem)`                | Reads an integer from a memory‑mapped I/O address.  The memory handle must refer to the device’s mapped region.                          |
| `mmio_write(addr: Mem, value: Int)`   | Writes an integer to a memory‑mapped I/O address.                                                                                        |

### 6.4 Unsafe Operations

The `unsafe` block is an effectful construct that relaxes certain
safety checks.  Within an `unsafe` block, programmers may perform
raw pointer arithmetic, embed inline assembly or interact with
hardware in ways that the type system cannot verify.  The following
rules apply:

1. An `unsafe` block **MUST** be annotated with a justification for
   review.  Tooling may surface these justifications to auditors.
2. Within `unsafe`, memory and thread safety guarantees are the
   programmer’s responsibility.  Violations may lead to undefined
   behaviour.
3. The block is lexically scoped; safety rules resume after its end.

### 6.5 Regime and Scope

All new effects may only be invoked from K‑regime processes.
Invoking these effects from Q or Φ regimes is a compile‑time error.
Effects are statically visible in source and are subject to the
constraint system.