# §5 Type System – v0.2 Additions

## Dust Programming Language Specification v0.2

**Status:** Normative (additive)  
**Last Updated:** February 2026

This document introduces new types and typing rules to support
systems‑level programming in the K‑regime.  It supplements, but
does not replace, the v0.1 type system.  All existing types and
rules remain valid.

### 5.1 Resource Types

The following value types are added:

| Type           | Description                                                       |
|---------------|-------------------------------------------------------------------|
| `Mem`         | A handle to a contiguous region of classical memory.               |
| `Thread<T>`   | A handle to a spawned thread that returns a value of type `T`.    |
| `Mutex`       | A mutex used to synchronise access to shared resources.            |
| `File`        | A handle to an open file.                                          |
| `Port`        | A handle to an I/O port.                                           |
| `Device`      | A handle to a hardware device or memory‑mapped peripheral.         |

These types are copyable in the K‑regime.  Copying a handle does not
duplicate the underlying resource; copies refer to the same resource.
Operations on these types are defined via effects (see §6 additions).

### 5.2 Generic Parameters

`Thread<T>` is a generic type parameterised over the return type of
the thread.  Type checking ensures that `join` returns a value of
type `T`.

### 5.3 Lifetime and Ownership

Although `Mem` and other handles are copyable, the constraint system
tracks their lifetime to prevent misuse.  The following rules apply:

1. A `Mem` handle is valid from the point of allocation until it is
   freed.  After `free` the handle becomes invalid and **MUST NOT**
   be used.
2. Multiple copies of a handle share ownership.  The underlying
   resource remains allocated until all copies have been released via
   `free`.  The compiler **MUST** detect attempts to free a region
   that is still referenced by other handles.
3. Handles may be passed between threads.  The ownership rules apply
   across threads; a `Mem` region freed in one thread is invalid in
   all threads.
4. `Mutex` values enforce mutual exclusion but do not convey
   ownership of the data they protect.  Users must ensure that
   underlying resources live at least as long as the mutex.

### 5.4 Regime Restrictions

The new types may be used only in K‑regime processes.  Attempting to
declare or manipulate these types in Q or Φ processes is a
compile‑time error.  Cross‑regime isolation rules remain in force【709885362819930†L174-L202】.

### 5.5 Unsafe Pointers

Within an `unsafe` block, programmers may construct raw pointers to
`Mem` regions and perform unchecked arithmetic.  Such pointers have
no type other than an opaque `Ptr` type and cannot be dereferenced
outside an `unsafe` context.