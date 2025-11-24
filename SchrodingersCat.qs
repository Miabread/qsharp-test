operation Main() : Result {
    // Allocate a qubit with value 0
    use schrodingersCat = Qubit();

    // Set the qubit into superposition of 0 and 1 using a "Hadamard" operation
    H(schrodingersCat);

    // In the superposition, the qubit has a 50-50 chance of being measured as either 0 or 1
    let result = M(schrodingersCat);

    // Read the measured result
    if result == One {
        Message("₍^ >⩊< ^₎Ⳋ");
        Message("The cat is alive! Huzzah!");
    } else {
        Message("˗ˏˋ ✸ ˎˊ˗");
        Message("The cat exploded! Oh no!")
    }

    // Reset qubit to 0, needed when deallocating it
    Reset(schrodingersCat);

    // Return back the measurement result
    return result;
}
