# §3 Grammar
## Dust Programming Language Specification v0.1

**Status:** Normative  
**Last Updated:** February 2026

This section is part of the Dust Programming Language Specification v0.1.

---

## 3.1 Overview

This section defines the **syntactic grammar** of the Dust Programming Language (DPL).

The grammar specifies how valid programs are formed from lexical tokens.  
It does not define the meaning of programs; semantic rules are defined in later sections of this specification.

Unless otherwise stated, the grammar is expressed using **Extended Backus–Naur Form (EBNF)**.

---

## 3.2 Program Structure

A DPL program consists of one or more forge declarations.

```ebnf
PROGRAM ::= { FORGE_DECLARATION }


⸻

3.3 Forge Declarations

A forge is the unit of compilation, ownership, and verification.

FORGE_DECLARATION ::=
    "forge" IDENTIFIER "{" { FORGE_ITEM } "}"

A forge MAY contain shape declarations, process declarations, and bind declarations.

⸻

3.4 Forge Items

FORGE_ITEM ::=
      SHAPE_DECLARATION
    | PROC_DECLARATION
    | BIND_DECLARATION


⸻

3.5 Shape Declarations

A shape defines a structural type.

SHAPE_DECLARATION ::=
    "shape" IDENTIFIER "{" { SHAPE_FIELD } "}"

SHAPE_FIELD ::=
    IDENTIFIER ":" TYPE ";"

Shapes do not support inheritance or implicit constructors in v0.1.

⸻

3.6 Types

TYPE ::=
      PRIMITIVE_TYPE
    | IDENTIFIER
    | TYPE "[" INTEGER "]"

Array types are fixed-size.

3.6.1 Primitive Types

The following primitive types are defined in v0.1:

i32   i64
f32   f64
bool


⸻

3.7 Process Declarations

A process defines executable behavior and is explicitly associated with a computation regime.

PROC_DECLARATION ::=
    "proc" REGIME "::" IDENTIFIER
    "(" [ PARAM_LIST ] ")"
    [ RETURN_TYPE ]
    [ PROC_QUALIFIERS ]
    PROC_BODY


⸻

3.8 Regimes

REGIME ::= "K" | "Q" | "Φ"

Each process MUST declare exactly one regime.

⸻

3.9 Parameters and Return Types

PARAM_LIST ::= PARAM { "," PARAM }

PARAM ::= IDENTIFIER ":" TYPE

RETURN_TYPE ::= "->" TYPE


⸻

3.10 Process Qualifiers

Process qualifiers declare additional constraints or properties.

PROC_QUALIFIERS ::=
    { "uses" RESOURCE_LIST | "linear" }

RESOURCE_LIST ::= RESOURCE { "," RESOURCE }

RESOURCE ::= IDENTIFIER "(" RESOURCE_ARGS ")"

RESOURCE_ARGS ::= IDENTIFIER "=" VALUE


⸻

3.11 Process Body

PROC_BODY ::= "{" { STATEMENT } "}"


⸻

3.12 Statements

STATEMENT ::=
      LET_STATEMENT
    | CONSTRAINT_STATEMENT
    | PROVE_STATEMENT
    | EFFECT_STATEMENT
    | RETURN_STATEMENT


⸻

3.13 Let Statements

LET_STATEMENT ::= "let" IDENTIFIER "=" EXPRESSION ";"

All bindings are immutable.

⸻

3.14 Constraint Statements

Constraint statements are permitted only in Φ-regime processes.

CONSTRAINT_STATEMENT ::=
    "constrain" EXPRESSION ";"


⸻

3.15 Proof Statements

PROVE_STATEMENT ::=
    "prove" IDENTIFIER "from" EXPRESSION ";"

Proof statements produce admissibility witnesses.

⸻

3.16 Effect Statements

EFFECT_STATEMENT ::=
      "observe" EXPRESSION ";"
    | "emit" EXPRESSION ";"
    | "seal" EXPRESSION ";"

Effect semantics are defined in §6.

⸻

3.17 Return Statements

RETURN_STATEMENT ::= "return" EXPRESSION ";"


⸻

3.18 Expressions

EXPRESSION ::=
      LITERAL
    | IDENTIFIER
    | FUNCTION_CALL
    | BINARY_EXPRESSION


⸻

3.19 Function Calls

FUNCTION_CALL ::= IDENTIFIER "(" [ ARG_LIST ] ")"

ARG_LIST ::= EXPRESSION { "," EXPRESSION }


⸻

3.20 Binary Expressions

BINARY_EXPRESSION ::=
    EXPRESSION OPERATOR EXPRESSION

OPERATOR ::= "+" | "-" | "*" | "/" | "==" | "!=" | "<" | ">"

Operator precedence and associativity are fixed and minimal in v0.1.

⸻

3.21 Literals

LITERAL ::=
      INTEGER
    | FLOAT
    | BOOLEAN

Literal forms are defined in §2 Lexical Structure.

⸻

3.22 Bind Declarations

Bind declarations define explicit connections between processes.

BIND_DECLARATION ::=
    "bind" PROC_REF "->" PROC_REF
    "contract" "{" { CONTRACT_CLAUSE } "}"

PROC_REF ::= REGIME "::" IDENTIFIER


⸻

3.23 Contract Clauses

CONTRACT_CLAUSE ::=
    IDENTIFIER OPERATOR VALUE ";"

Contract semantics are defined in §10.

⸻

3.24 Grammar Constraints (Normative)

The following constraints are semantic and are enforced outside the grammar:
	1.	Processes in the Q regime may operate only on linear types.
	2.	Processes in the Φ regime may not perform effects without producing admissibility witnesses.
	3.	Effects may not appear inside pure expressions.
	4.	Cross-regime invocation requires an explicit bind declaration.
	5.	All bindings must satisfy their declared contracts.

Programs violating these constraints are invalid.

⸻

3.25 Grammar Stability

This grammar defines DPL Grammar v0.1.

Changes to syntax or grammatical structure require a new grammar version and an update to the specification versioning section.

⸻

© 2026 Dust LLC

---
