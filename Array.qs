operation Main() : Result[] {
    let length = 2;

    // Allocate the two qubits that will be entangled.
    use qubits = Qubit[length];

    // Set each qubit into superposition of 0 and 1 using a "Hadamard" operation
    for qubit in qubits {
        H(qubit);
    }

    // Print out all the superpositions
    Std.Diagnostics.DumpMachine();

    // Measure the array, reset all to 0, and return results
    MResetEachZ(qubits)
}
