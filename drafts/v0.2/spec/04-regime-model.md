# §4 Regime Model – v0.2 Additions

## Dust Programming Language Specification v0.2

**Status:** Normative  
**Last Updated:** February 2026

This section supplements §4 of the v0.1 specification.  It introduces
new semantics and operations for the **K‑regime** (classical
computation) without altering the meaning of existing constructs.  All
additions are strictly additive and preserve backward compatibility
according to the minor versioning rules【587782563170635†L29-L34】.

The original v0.1 regime model defines three regimes—K, Q and Φ—and
requires every process to belong to exactly one regime【709885362819930†L29-L36】.
The K‑regime is intended for deterministic, time‑aware classical
computation and allows copyable values, deterministic execution and
explicit time/resource declarations【709885362819930†L42-L64】.  The
extensions below expand the K‑regime’s capabilities to support
systems‑level programming on typical classical hardware (e.g. x86‑64)
while preserving determinism and constraint‑first semantics.

### 4.3 K‑Regime (Classical Computation)

The subsections below introduce new operations and effects permitted
within K‑regime processes.  Unless stated otherwise, all existing
properties of the K‑regime remain unchanged【709885362819930†L42-L64】.

#### 4.3.4 Memory Effects (v0.2)

The following effects are added for managing classical memory:

- **`alloc(size: Int) → Mem`**
  - Allocates a contiguous block of memory of `size` bytes and returns
    a memory handle of type `Mem`.  The handle represents exclusive
    ownership of the region.  Allocation **MUST** explicitly specify
    the desired size and **MUST** succeed deterministically or fail
    with an error effect; non‑deterministic allocation is
    prohibited.
  - The allocation effect **MAY** declare resource bounds (e.g.
    maximum address, alignment) to enable compile‑time reasoning.

- **`free(mem: Mem)`**
  - Releases ownership of a previously allocated memory region.  After
    `free` is invoked, the `mem` handle becomes invalid and **MUST
    NOT** be used in subsequent operations.  Freeing memory twice is a
    constraint violation.

Memory handles are copyable within the K‑regime; however, multiple
copies **MUST** refer to the same underlying region and the region is
considered freed only once all copies have been released.  The
compiler and constraint checker **MUST** track the lifetime of memory
handles to prevent leaks and double‑free errors.

#### 4.3.5 Concurrency (v0.2)

To enable deterministic concurrency, the K‑regime introduces
spawn/join primitives and a scheduler parameterised by a seed.  The
goal is to allow reproducible thread interleavings: given the same
seed, the scheduler will produce identical execution orders【548468680421956†L121-L129】.

- **`spawn(f: () → T, seed?: Int) → Thread<T>`**
  - Creates a new thread executing the function `f` and returns a
    handle of type `Thread<T>`.  The optional `seed` influences
    scheduling decisions; threads spawned with the same seed will
    interleave identically across runs.
  - The new thread inherits the same K‑regime and resource
    constraints as the parent.  Shared memory regions are permitted,
    but simultaneous access **MUST** obey explicit synchronisation
    primitives (see below).

- **`join(thread: Thread<T>) → T`**
  - Waits for the specified thread to complete and returns its result.
    Joining on a thread more than once is a constraint violation.

- **Synchronisation primitives**
  - **`mutex_new() → Mutex`**, **`mutex_lock(m: Mutex)`**, **`mutex_unlock(m: Mutex)`**
  - A mutex protects shared memory regions.  Locking and unlocking are
    explicit effects.  A mutex is a copyable value; however, the
    underlying lock state is shared across copies.
  - Deadlocks resulting from cyclic lock dependencies are not
    automatically detected; users are encouraged to express ordering
    constraints via the constraint system.

The scheduler is part of the language runtime.  Implementations
**MUST** ensure that, given a fixed seed, thread scheduling is
deterministic and reproducible across runs, enabling debugging and
property‑based testing of concurrent programs【548468680421956†L121-L129】.

#### 4.3.6 Input/Output (v0.2)

The following effects enable explicit interaction with external
systems.  All I/O is deterministic in the sense that timing and
resource usage are declared, but the returned data may vary based on
device state.  I/O effects **MUST** declare potential failure modes
(e.g. end‑of‑file, device not ready) so that they can be handled via
constraints.

- **File operations**
  - **`open(path: Str, mode: FileMode) → File`** opens a file and
    returns a handle.
  - **`read(file: File, buffer: Mem, n: Int) → Int`** reads up to `n`
    bytes into `buffer`, returning the number of bytes read.  Reading
    past end‑of‑file returns zero.
  - **`write(file: File, buffer: Mem, n: Int) → Int`** writes up to
    `n` bytes from `buffer` to the file.  Partial writes are
    reported.
  - **`close(file: File)`** closes the file handle.

- **Device operations**
  - **`io_read(port: Port) → Int`**, **`io_write(port: Port, value: Int)`**
    provide low‑level access to hardware ports.  Port values are
    regime‑typed; misuse results in a constraint violation.
  - **`mmio_read(addr: Mem) → Int`**, **`mmio_write(addr: Mem, value: Int)`**
    perform memory‑mapped I/O.

All I/O handles (files, ports, devices) are copyable.  The effect
system **MUST** track lifetime and ownership to prevent use-after-free
errors.

#### 4.3.7 Hardware Access and Unsafe Operations (v0.2)

Some systems‑level operations inherently require bypassing the type
system or interacting with undefined hardware behaviour.  The K‑regime
introduces the **`unsafe`** block to mark a region of code where
checks are relaxed.  Within an `unsafe` block, the programmer **MAY**
perform unchecked pointer arithmetic, access arbitrary memory
addresses and emit inline assembly.  The following rules apply:

1. An `unsafe` block **MUST** be explicitly annotated with a reason
   describing why the operation is necessary.
2. Code inside `unsafe` blocks is still subject to effect and
   constraint checking, but undefined behaviour in hardware cannot be
   prevented.  Programmers bear full responsibility for correctness.
3. Unsafe operations **MUST** remain within K‑regime processes; they
   cannot cross regime boundaries.

#### 4.3.8 Deterministic Concurrency and Seeds (v0.2)

To facilitate reproducible concurrent programs, every K‑regime process
has an implicit **scheduler seed**.  The seed influences the order in
which ready threads are executed.  The following rules govern the
deterministic scheduler:

1. The seed is inherited by spawned threads unless overridden in the
   `spawn` call.  Using the same seed ensures the same
   interleavings【548468680421956†L121-L129】.
2. If no seed is provided, the implementation may choose a default
   deterministic algorithm (e.g. round‑robin).
3. Changing the seed **MUST NOT** affect the correctness of the
   program; it only affects execution order.  Programs must remain
   free of data races regardless of the seed.
4. The seed and thread interleavings **MUST** be recorded in debugging
   metadata so that failing executions can be reproduced precisely.

### 4.9 Libraries and K‑Regime API (v0.2)

In v0.2 the specification recognises the existence of regime‑specific
libraries.  The **core library** (`dustlib`) provides common types and
utilities for all regimes, while the **K‑regime library**
(`dustlib_k`) provides systems programming APIs built on the effects
defined above.  These libraries are outside the specification but
formally conform to the regime rules.  The compiler may implicitly
link these libraries unless the user opts out.

Implementations **MAY** provide additional libraries for other
regimes, provided they respect regime isolation and semantics【709885362819930†L174-L202】.