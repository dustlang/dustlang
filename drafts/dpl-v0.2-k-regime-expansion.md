# DPL v0.2 K Regime Expansion Specification (Draft)

**Document Type:** Specification Draft  
**Status:** Draft for Review  
**Target:** DPL v0.2  
**Section:** Enhanced K Regime Semantics  
**Date:** 2026-02-12  
**Copyright:** © 2026 Dust LLC

---

## Overview

This specification defines the expansion of the K Regime for DPL v0.2, enabling it to serve as the primary classical computation regime for systems programming, including operating system kernel development.

---

## Current v0.1 K Regime Capabilities

The K Regime in v0.1 supports:
- Entry point declaration: `K main { ... }`
- Effect emission: `emit "<string>"`
- Ordered execution of effects

**Example:**
```dust
K main {
    emit "Hello, Dust";
    emit "Second line";
}
```

---

## v0.2 K Regime Expansion Goals

### 2.1 Primary Objectives

1. **Full Classical Computation Support**
   - Variables and bindings
   - Primitive data types
   - Control flow structures
   - Functions and procedures
   - Memory management

2. **Systems Programming Capabilities**
   - Direct memory access
   - Hardware interaction
   - Interrupt handling
   - Low-level data structures

3. **Type Safety and Determinism**
   - Compile-time type checking
   - Memory safety guarantees
   - Deterministic execution
   - Resource management

---

## Enhanced K Regime Semantics

### 3.1 Variable Bindings and Types

**Syntax:**
```dust
// Variable declarations with explicit types
let variable_name: K[TypeName] = expression

// Immutable bindings (default)
let x: K[Int] = 42

// Mutable bindings (explicit)
mut let counter: K[Int] = 0
```

**Type System:**
```dust
// Primitive types
K[Int8], K[Int16], K[Int32], K[Int64]    // Signed integers
K[UInt8], K[UInt16], K[UInt32], K[UInt64] // Unsigned integers
K[Float32], K[Float64]                    // Floating point
K[Bool]                                   // Boolean
K[String]                                 // Text strings

// Pointer types (for systems programming)
K[Ptr[T]]                                // Pointer to type T
K[Ptr[K[Unit]]]                          // Void pointer

// Composite types
K[Array[T, N]]                           // Fixed-size array
K[Struct { ... }]                        // User-defined structures
```

### 3.2 Control Flow Structures

**Conditional Statements:**
```dust
K main {
    let x: K[Int] = 42
    
    if x > 0 {
        emit "Positive";
    } else if x < 0 {
        emit "Negative";
    } else {
        emit "Zero";
    }
}
```

**Loop Structures:**
```dust
K main {
    // For loop with range
    for i in 0..5 {
        emit "Iteration {i}";
    }
    
    // While loop
    mut let i: K[Int] = 0
    while i < 5 {
        emit "While iteration {i}";
        i = i + 1;
    }
    
    // Loop with break and continue
    for i in 0..10 {
        if i == 3 {
            continue;
        }
        if i == 7 {
            break;
        }
        emit "Value {i}";
    }
}
```

### 3.3 Functions and Procedures

**Function Definitions:**
```dust
// Pure functions
K add(K[Int] a, K[Int] b) -> K[Int] {
    a + b
}

// Procedures with effects
K print_greeting(K[String] name) -> K[Unit] {
    emit "Hello, {name}!";
}

// Function with multiple parameters
K compute(K[Int] base, K[Int] exponent) -> K[Int] {
    mut let result: K[Int] = 1
    mut let i: K[Int] = 0
    
    while i < exponent {
        result = result * base;
        i = i + 1;
    }
    
    result
}
```

**Function Calls:**
```dust
K main {
    let sum: K[Int] = add(5, 3);
    emit "Sum: {sum}";
    
    print_greeting("World");
    
    let power: K[Int] = compute(2, 4);
    emit "2^4 = {power}";
}
```

### 3.4 Memory Management

**Memory Operations:**
```dust
// Memory allocation
K alloc(K[Size] size) -> K[Ptr[K[Byte]]]

// Memory deallocation
K dealloc(K[Ptr[K[Byte]]] ptr, K[Size] size) -> K[Unit]

// Pointer operations
K ptr_read[K[T]](K[Ptr[T]] ptr) -> K[T]
K ptr_write[K[T]](K[Ptr[T]] ptr, K[T] value) -> K[Unit]

// Pointer arithmetic
K ptr_add(K[Ptr[T]] ptr, K[Int] offset) -> K[Ptr[T]]
K ptr_sub(K[Ptr[T]] ptr, K[Int] offset) -> K[Ptr[T]]
```

**Memory Safety Example:**
```dust
K main {
    // Allocate 100 bytes
    let ptr: K[Ptr[K[Byte]]] = alloc(100);
    
    // Write data
    let int_ptr: K[Ptr[K[Int]]] = ptr as K[Ptr[K[Int]]];
    ptr_write(int_ptr, 42);
    
    // Read data
    let value: K[Int] = ptr_read(int_ptr);
    emit "Value: {value}";
    
    // Deallocate
    dealloc(ptr, 100);
}
```

### 3.5 Structures and Data Layout

**Structure Definitions:**
```dust
// Define a simple structure
K Point = K[Struct {
    x: K[Int],
    y: K[Int]
}];

// Define a complex structure
K Process = K[Struct {
    id: K[UInt32],
    name: K[String],
    state: K[UInt8],
    stack_ptr: K[Ptr[K[Byte]]],
    heap_ptr: K[Ptr[K[Byte]]]
}];
```

**Structure Usage:**
```dust
K create_point(K[Int] x, K[Int] y) -> K[Point] {
    K[Struct {
        x: x,
        y: y
    }]
}

K main {
    let p: K[Point] = create_point(10, 20);
    emit "Point: ({p.x}, {p.y})";
}
```

---

## K Regime Constraints and Guarantees

### 4.1 Determinism

All K Regime programs must be deterministic:
- No undefined behavior
- No data races (in single-threaded execution)
- Predictable memory layout
- Defined order of evaluation

### 4.2 Memory Safety

The compiler must enforce:
- No dangling pointers
- No use-after-free
- No buffer overflows
- Proper pointer alignment

### 4.3 Type Safety

Compile-time verification of:
- Type correctness
- No implicit conversions between incompatible types
- Proper function parameter types
- Return type matching

---

## Integration with DPL Ecosystem

### 5.1 Relationship to dustlib

The enhanced K Regime will serve as the foundation for:
- dustlib core functionality
- dustlib_k specialized features
- XDV kernel implementation

### 5.2 Compilation Pipeline

Enhanced compilation steps:
1. Parse and type check
2. Verify K Regime constraints
3. Generate Dust IR (DIR)
4. Optimize for K Regime determinism
5. Generate native code for target architecture

### 5.3 Tool Support

Required tooling updates:
- **dust:** Enhanced K Regime compiler
- **dustfmt:** Formatting for expanded syntax
- **dusttest:** Testing framework for K Regime
- **dustviz:** Visualization of K Regime execution

---

## Migration Path from v0.1

### 6.1 Backward Compatibility

All v0.1 K Regime programs must compile without modification:
- `emit` effects continue to work
- `K main` entry point unchanged
- Existing type system subset preserved

### 6.2 Incremental Adoption

New features can be adopted incrementally:
- Start with variables and basic types
- Add control flow structures
- Introduce functions and memory management
- Progress to complex systems programming

---

## Implementation Considerations

### 7.1 Compiler Architecture

Required components:
- Enhanced parser for new syntax
- Type inference and checking system
- Memory safety analyzer
- K Regime constraint verifier
- x64 code generation backend

### 7.2 Runtime Support

Minimal runtime for K Regime:
- Memory allocation/deallocation
- Stack unwinding for errors
- Basic I/O operations
- Interrupt handling for systems programming

---

## Examples

### 8.1 Complete Program Example

```dust
// factorial.ds - Compute factorial using K Regime

K factorial(K[Int] n) -> K[Int] {
    if n <= 1 {
        1
    } else {
        n * factorial(n - 1)
    }
}

K main {
    let n: K[Int] = 5;
    let result: K[Int] = factorial(n);
    emit "Factorial of {n} is {result}";
}
```

### 8.2 Systems Programming Example

```dust
// memory_viewer.ds - Display memory contents

K read_memory(K[Ptr[K[Byte]]] ptr, K[Size] size) -> K[Unit] {
    mut let i: K[Size] = 0
    
    emit "Memory at address {ptr}:";
    
    while i < size {
        let value: K[Byte] = ptr_read(ptr + i);
        emit "  +{i}: 0x{value:x2}";
        i = i + 1;
    }
}

K main {
    // Allocate some memory
    let ptr: K[Ptr[K[Byte]]] = alloc(16);
    
    // Write some values
    mut let i: K[Int] = 0
    while i < 16 {
        ptr_write(ptr + i, i as K[Byte]);
        i = i + 1;
    }
    
    // Display memory
    read_memory(ptr, 16);
    
    // Clean up
    dealloc(ptr, 16);
}
```

---

## Conclusion

This expansion transforms the K Regime from a minimal proof-of-concept into a comprehensive classical computation regime capable of building complex systems, including operating system kernels, while maintaining DPL's core principles of determinism, type safety, and verifiability.

The enhanced K Regime provides the foundation for dustlib, dustlib_k, and the XDV kernel, establishing Dust as a practical language for systems programming and classical computation.

---

© 2026 Dust LLC