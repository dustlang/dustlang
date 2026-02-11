Dust Programming Language
Specification Drafts Directory

Repository: https://github.com/dustlang/dustlang
Directory: /drafts
Status: Living Architectural Record
Applies To: Dust Programming Language (DPL)


Abstract

The drafts/ directory of the Dust Programming Language Specification repository
serves as the formal architectural incubation space for proposed extensions,
semantic refinements, structural evolutions, and regime-level expansions to DPL.

Dust is a constraint-first, regime-typed engineering language whose canonical
semantics compile to Dust IR. As such, its specification must evolve with rigor,
determinism, and architectural continuity.

This directory exists to ensure that innovation is structured, architectural
change is auditable, semantic evolution is deliberate, and production releases
remain stable and canonical.

Drafts represent proposed specification changes. They are not normative.
They are not binding. They are not production. They are architectural candidates.


1. Purpose of the Drafts Directory

The drafts/ directory exists to:

1. Provide a structured pathway for proposing language changes.
2. Preserve deterministic integrity of the canonical specification.
3. Allow regime expansion without destabilizing production releases.
4. Document the reasoning behind architectural evolution.
5. Enable formal review, iteration, and consensus before release.

Dust is not an experimental scripting language. It is an engineering language.

Therefore, language evolution must be traceable, justified, versioned,
deterministic, and backward-aware. The Drafts system formalizes this process.


2. What Constitutes a Draft

A Draft is a self-contained specification proposal that may include:

- New syntax
- Semantic refinements
- Constraint system extensions
- Regime additions
- Type system evolution
- IR transformations
- Execution model adjustments
- Toolchain integration changes
- Trace semantics updates

Each draft must clearly define its scope, specify motivation, provide formal
semantics, describe backward compatibility implications, define transition or
migration strategy where applicable, indicate interactions with Dust IR, and
identify regime impact (classical, quantum, phase).

Drafts must be complete architectural documents, not informal notes.


3. Development Model of DPL

Dust evolves in two primary states.

3.1 Proposed Drafts (Incubation Phase)

Located in:

/drafts/<draft-name>/

These are architectural proposals under discussion. They may replace existing
spec sections, extend the type system, introduce new constraint forms, refine
deterministic execution rules, expand regime typing, or add new IR constructs.

Drafts are isolated to ensure the canonical specification remains stable.

3.2 Production Drafts (Canonical Phase)

Once accepted, a draft may transition into a Production Draft.

Production Drafts incorporate validated architectural changes, update the
canonical specification, maintain deterministic guarantees, preserve Dust IR
compatibility, and align with semantic versioning.

At this stage, the draft ceases to be experimental and becomes part of the
formal DPL specification.


4. Relationship Between Drafts and the Canonical Specification

The root-level DPL specification defines the current authoritative semantics.

Drafts do not override canonical behavior. They do not redefine production
semantics. They do not implicitly modify the language.

Only upon formal integration into a Production Draft do changes become
normative.

This separation ensures compiler stability, IR determinism, trace
reproducibility, toolchain coherence, and ecosystem confidence.


5. Architectural Philosophy

Dust is founded on several core principles:

- Deterministic execution
- Constraint-first semantics
- Regime-typed architecture
- Explicit IR lowering
- Auditable trace behavior

All drafts must preserve these invariants.

Any proposal that compromises determinism, constraint primacy, semantic
clarity, IR coherence, or trace integrity must explicitly justify and formally
redefine its impact.

Drafts are not for speculative abstraction. They are for engineered evolution.


6. Structure of a Draft

Each draft must be placed in its own directory:

/drafts/<short-name>/

And must include at minimum:

- README.md — Full specification paper
- motivation.md (optional but recommended)
- examples/ — Concrete usage examples
- ir-impact.md — Dust IR implications
- regime-analysis.md — Regime typing impact
- compatibility.md — Backward compatibility analysis

A draft must be internally complete.


7. Lifecycle of a Draft

1. Proposal Created
2. Architectural Review
3. Toolchain Feasibility Analysis
4. IR Impact Evaluation
5. Constraint Model Validation
6. Trace Determinism Verification
7. Maintainer or Community Approval
8. Promotion to Production Draft
9. Canonical Integration
10. Versioned Release

Not all drafts will be promoted. Some may remain archived. This is intentional.
Architectural clarity is more important than feature velocity.


8. Versioning Model

Dust follows semantic versioning principles.

Drafts may target minor version updates, major architectural revisions, or
regime expansions.

Production releases reflect consolidated, validated architecture. Drafts do
not change version numbers until promoted.


9. Regime Impact Considerations

DPL is regime-typed.

All drafts must specify impact across:

- Classical regime
- Quantum regime
- Phase-native regime
- Hybrid boundary layers

A draft that introduces regime asymmetry must explicitly define lowering rules,
preserve IR determinism, and maintain trace consistency.


10. Dust IR Compatibility

Dust IR is the canonical lowering target.

Every draft must answer:

- Does this change introduce new IR nodes?
- Does it alter constraint encoding?
- Does it modify trace semantics?
- Does it impact deterministic lowering?

IR stability is foundational. If IR changes are required, they must be
specified formally.


11. Determinism Requirement

Dust is deterministic by design.

All drafts must preserve deterministic compilation, deterministic constraint
resolution, deterministic trace generation, and deterministic IR emission.

Non-deterministic proposals will not be accepted unless they introduce a
formalized deterministic abstraction boundary.


12. Toolchain Integration

DPL interacts with:

- dust (compiler)
- dustviz
- dustdoc
- dusttest
- dustrun
- dustpkg

Drafts must define expected toolchain impact. Specification cannot evolve in
isolation from implementation.


13. Draft Rejection and Archival

Not all proposals will be accepted.

Rejected drafts remain documented, preserve architectural reasoning, provide
historical context, and inform future proposals.

Dust values traceability over deletion.


14. Long-Term Vision

The Drafts directory enables safe architectural scaling, controlled semantic
evolution, cross-regime expansion, and future-proof engineering design.

Dust is engineered not merely as a language, but as a foundational
deterministic engineering substrate for classical, quantum, and phase-native
computation.

The Drafts system ensures that such ambition remains disciplined.


15. Conclusion

The drafts/ directory represents structured innovation, architectural
transparency, deterministic evolution, and formalized language governance.

If the canonical specification is the constitution of Dust, then Drafts are
its legislative process.

They are how Dust grows without breaking itself.

Dust Programming Language
Constraint-First. Regime-Typed. Deterministic by Construction.
