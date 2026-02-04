// examples/K/k_physical time constraint placeholder.ds
// Demonstrates how a K-regime process can declare a physical-time dependency
// using resource metadata (v0.1 placeholder pattern).
//
// Note: DPL v0.1 does not yet define dedicated time keywords or duration literals.
// This example uses the `uses` resource declaration to express timing intent
// without introducing new syntax.

forge Examples {

    // The Timer resource metadata expresses:
    // - required clock domain
    // - deadline budget (in microseconds, as a conventional numeric unit)
    // - maximum allowed jitter (microseconds)
    //
    // Implementations MAY enforce these as timing constraints. If they cannot be met,
    // execution MUST fail deterministically before any effect occurs.
    proc K::physical_time_constraint_placeholder()
        uses Timer(domain="monotonic", deadline_us=5000, jitter_us=50),
             Console(device="stdout")
        -> i32
    {
        // Deterministic work
        let cycles = 1000;
        let cost = cycles * 2; // 2000

        // If timing constraints cannot be met, none of these effects may occur.
        emit "TIMING-CONSTRAINTS:DECLARED";
        emit cost;

        return cost;
    }

}