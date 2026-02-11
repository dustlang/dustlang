# §3 Grammar – v0.2 Additions

## Dust Programming Language Specification v0.2

**Status:** Normative (additive)  
**Last Updated:** February 2026

This document extends the grammar defined in §3 of the v0.1
specification.  The additions introduce new constructs to support
systems‑level programming in the K‑regime.  All changes are
additive; existing grammar productions remain valid and
unchanged【587782563170635†L62-L72】.

### 3.1 New Keywords

The following keywords are reserved in v0.2 and **MUST NOT** be used
as identifiers:

```
alloc free spawn join mutex_new mutex_lock mutex_unlock
open read write close io_read io_write mmio_read mmio_write
unsafe
```

### 3.2 Expression Forms

The `<expr>` nonterminal is extended with the following
productions to support new effects.  In all cases, `E` denotes an
expression of the appropriate type and `n` denotes an integer
expression.

```
<expr> ::= …
        | alloc '(' n ')'
        | free '(' E ')'
        | spawn '(' E [',' seed_expr] ')'
        | join '(' E ')'
        | mutex_new '(' ')'
        | mutex_lock '(' E ')'
        | mutex_unlock '(' E ')'
        | open '(' path_expr ',' mode_expr ')'
        | read '(' file_expr ',' mem_expr ',' n ')'
        | write '(' file_expr ',' mem_expr ',' n ')'
        | close '(' file_expr ')'
        | io_read '(' port_expr ')'
        | io_write '(' port_expr ',' value_expr ')'
        | mmio_read '(' addr_expr ')'
        | mmio_write '(' addr_expr ',' value_expr ')'
        | unsafe_block

<unsafe_block> ::= 'unsafe' '{' <stmt>* '}'
```

The optional `seed_expr` in `spawn` specifies the scheduling seed.

### 3.3 Statement Forms

The `<stmt>` nonterminal is extended so that any of the new effect
expressions may appear as a statement by themselves, terminated by a
semicolon, as in v0.1.

### 3.4 Type Forms

The type grammar is extended with the following type constructors.

```
<type> ::= …
        | Mem
        | Thread '<' <type> '>'
        | Mutex
        | File
        | Port
        | Device
```

These types are defined in the type system extension (§5 additions).

### 3.5 Precedence and Associativity

All new constructs have the same precedence and associativity as
function calls in v0.1.  The `unsafe` block is parsed as a block
expression.

### 3.6 Compatibility

Programs not using any of the new keywords or constructs remain
syntactically valid and retain their original meaning.  The
additional grammar productions do not introduce ambiguity with
existing syntax.