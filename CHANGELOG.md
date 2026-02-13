# Changelog - Dust Programming Language Specification

All notable changes to the DPL Specification are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - Unreleased (DPL v0.2)

### Added

#### K Regime Expansion
- Enhanced variable bindings with explicit typing (`let`, `mut let`)
- Full control flow structures (`if/else`, `for`, `while`, `break`, `continue`)
- Function definitions with parameters and return types
- User-defined structure types (`K[Struct { ... }]`)
- Memory management operations (`alloc`, `dealloc`, pointer operations)
- Complete primitive type system (integers, floats, booleans, characters, strings)

#### Type System
- Extended type annotations (`K[T]`)
- Pointer types with type safety (`K[Ptr[T]]`)
- Fixed-size arrays (`K[Array[T, N]]`)
- Function types and signatures
- Type inference support

#### New Draft Specifications
- `dpl-v0.2-k-regime-expansion.md` - Complete K Regime semantics
- `dpl-toolchain-v0.2-enhancements.md` - Toolchain specification updates

### Changed

#### Regime Model
- K Regime now supports full classical computation
- Expanded from minimal emit-only subset to complete systems programming capabilities
- Maintains deterministic execution guarantees
- Enhanced memory safety guarantees

#### Specification Structure
- Draft specifications moved to `drafts/` directory
- New library-specific specifications in `dustlib/spec/` and `dustlib_k/spec/`

### Fixed

- Clarified K Regime determinism requirements
- Defined memory safety semantics for pointer operations
- Specified error handling requirements for library functions

## [0.1.0] - 2026-02-12

### Added

- Initial DPL Specification v0.1 (frozen)
- Three computation regimes: K (Classical), Q (Quantum), Φ (Phase)
- Basic K Regime with `emit` effects
- Regime model semantics
- Type system foundation
- Dust IR (DIR) specification
- DVM reference semantics

### Known Issues

- K Regime limited to emit-only effects in v0.1
- No user-defined types or functions in v0.1
- Memory operations require v0.2 expansion

---

Copyright © 2026 Dust LLC