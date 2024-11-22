package NumberBaseConverter;

public class Menu {

    // Method to display menu and get user's base choice for input value
    public static int getBaseChoice(String type) {
        return Inputter.getAnInteger(
                String.format("Choose the base number of the %s value: \n"
                        + "1. Binary (Base 2)\n"
                        + "2. Decimal (Base 10)\n"
                        + "3. Hexadecimal (Base 16)\n"
                        + "4. Octal (Base 8)\n"
                        + "Enter your choice (1-4):", type),
                "Invalid choice! Please enter 1, 2, 3 or 4.", 1, 4);
    }

    // Method to display menu and get user's base choice for output value
    // This method excludes the base type that matches the input base
    public static int getOutputBaseChoice(int inputBase) {
        String baseOptions = "Choose the base number of the output value:\n";
        // Show the options excluding the input base
        if (inputBase != 1) {
            baseOptions += "1. Binary (Base 2)\n";
        }
        if (inputBase != 2) {
            baseOptions += "2. Decimal (Base 10)\n";
        }
        if (inputBase != 3) {
            baseOptions += "3. Hexadecimal (Base 16)\n";
        }
        if (inputBase != 4) {
            baseOptions += "4. Octal (Base 8)\n";
        }
        baseOptions += "Enter your choice:";

        int outputBase;
        while (true) {
            outputBase = Inputter.getAnInteger(baseOptions,
                    "Invalid choice! Please enter one of the available options.", 1, 4);

            // Ensure output base is different from input base
            if (outputBase != inputBase) {
                break;
            }
            System.out.println("Output base cannot be the same as input base. Please choose a different option.");
        }
        return outputBase;
    }
}
