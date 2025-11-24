import Std.Convert.*;
import Std.Math.*;
import Std.Arrays.*;

operation Main() : String {
    return GeneratePassword(20);
}

operation GeneratePassword(size : Int) : String {
    // Array of all characters we can use
    let charset = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "-", "_"];
    // How many bits do we need to pick a unique character (charset length must be a power of 2!)
    let bitLength = BitSizeI(Length(charset) - 1);

    // For each character
    mutable password = [];
    for i in 1..size {

        // For each bit of each character
        mutable bits = [];
        for i in 1..bitLength {
            let bit = GenerateRandomBit();
            bits += [bit];
        }

        // Convert the new bits into an Int, then index the charset
        let bits = ResultArrayAsInt(bits);
        let char = charset[bits];
        password += [char];
    }

    // Finally use silly method to concat password array into a final string
    let password = Fold((x, y) -> $"{x}{y}", "", password);
    return password;
}

operation GenerateRandomBit() : Result {
    // Allocate a qubit with value 0
    use q = Qubit();

    // Set the qubit into superposition of 0 and 1 using a "Hadamard" operation
    H(q);

    // In the superposition, the qubit has a 50-50 chance of being measured as either 0 or 1
    let result = M(q);

    // Reset qubit to 0, needed when deallocating it
    Reset(q);

    // Return back the measurement result
    return result;
}
