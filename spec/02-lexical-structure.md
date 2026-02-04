# §2 Lexical Structure
## Dust Programming Language Specification v0.1

**Status:** Normative  
**Last Updated:** February 2026

This section is part of the Dust Programming Language Specification v0.1.

---

### 2.1 Character Set

The Dust Programming Language source text MUST be encoded in UTF-8.

For v0.1 of the specification, the following restrictions apply:

- Identifiers MUST consist only of ASCII characters.
- Non-ASCII characters MAY appear only in comments.
- Future versions of the specification MAY relax these restrictions.

---

### 2.2 Source Text and Lines

A DPL source file is a sequence of Unicode code points encoded in UTF-8.

Line terminators are defined as one of the following sequences:

- Line Feed (`\n`)
- Carriage Return followed by Line Feed (`\r\n`)

All line terminators are treated equivalently.

---

### 2.3 Whitespace

Whitespace is used to separate lexical tokens and has no semantic meaning beyond that role.

The following characters are considered whitespace:

- Space (`U+0020`)
- Horizontal Tab (`U+0009`)
- Line Feed (`U+000A`)
- Carriage Return (`U+000D`)

Whitespace MAY appear between any two tokens and MAY appear at the beginning or end of a source file.

---

### 2.4 Comments

Comments are treated as whitespace and are ignored by the parser.

DPL supports two forms of comments:

#### 2.4.1 Line Comments

A line comment begins with `//` and continues to the end of the line.

Example:

// This is a line comment

#### 2.4.2 Block Comments

A block comment begins with `/*` and ends with the first subsequent occurrence of `*/`.

Block comments MAY span multiple lines.

Example:

/*
This is a block comment.
It may span multiple lines.
*/

Block comments do not nest.

---

### 2.5 Tokens

The lexical analysis phase converts source text into a sequence of tokens.

Tokens are classified into the following categories:

- identifiers
- keywords
- literals
- operators
- punctuation

Tokenization proceeds greedily, matching the longest valid token at each position.

---

### 2.6 Identifiers

An identifier names a language construct such as a forge, shape, process, variable, or resource.

Identifiers MUST match the following pattern:

- The first character MUST be a letter (`A–Z` or `a–z`)
- Subsequent characters MAY be letters, digits (`0–9`), or underscores (`_`)

Identifiers are case-sensitive.

Examples of valid identifiers:

forge
MyShape
phase_field
K_process_1

Examples of invalid identifiers:

1value
my-value
Φprocess

---

### 2.7 Keywords

Keywords are reserved identifiers with special meaning in the language.

The following keywords are reserved in DPL v0.1 and MUST NOT be used as identifiers:

forge
shape
proc
bind
uses
return
let
constrain
prove
observe
emit
seal
linear
contract
K
Q
Φ

Future versions of the language MAY introduce additional keywords.

---

### 2.8 Literals

Literals represent fixed values in source code.

#### 2.8.1 Integer Literals

An integer literal is a sequence of one or more digits.

Examples:

0
42
1024

Negative integers are expressed using the unary `-` operator and are not separate literals.

---

#### 2.8.2 Floating-Point Literals

A floating-point literal consists of:

- a sequence of digits,
- a decimal point,
- followed by a sequence of digits.

Examples:

0.0
3.14
10.5

Exponent notation is not supported in v0.1.

---

#### 2.8.3 Boolean Literals

The boolean literals are:

true
false

---

### 2.9 Operators

Operators are symbolic tokens that denote operations.

The following operators are defined in DPL v0.1:

	•		•		•	/
==  !=  <   >
=>

Operator precedence and associativity are defined in §3 Grammar.

---

### 2.10 Punctuation

The following punctuation symbols are used in DPL:

{ } ( ) [ ]
; , :

Each punctuation symbol is a distinct token.

---

### 2.11 Token Ambiguity and Disambiguation

Where a sequence of characters could form multiple valid tokens, the longest valid token MUST be selected.

Whitespace or comments MAY be required to disambiguate adjacent tokens.

---

### 2.12 End of Input

The end of a source file is treated as a distinct end-of-input marker.

No token may span beyond the end of input.

---

© 2026 Dust LLC


⸻
