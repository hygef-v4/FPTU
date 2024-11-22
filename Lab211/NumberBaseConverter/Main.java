package NumberBaseConverter;

public class Main {

    public static void main(String[] args) {
        while (true) {
            int inputBase = Menu.getBaseChoice("input");
            int outputBase = Menu.getOutputBaseChoice(inputBase);

            String inputValue;
            int decimalValue;

            while (true) {
                inputValue = Inputter.getString(
                        "Enter the input value in the chosen base:",
                        "Invalid input! Please enter a valid value.");
                try {
                    decimalValue = BaseConverter.convertToDecimal(inputValue, inputBase);
                    break;

                } catch (NumberFormatException e) {
                    System.err.println("Error: Invalid input for the selected base system. Please try again.");
                }
            }

            String result = BaseConverter.convertFromDecimal(decimalValue, outputBase);

            System.out.println("The equivalent value in the chosen output base is: " + result);
            String continueChoice = Inputter.getString(
                    "Do you want to perform another conversion? (Y/N):",
                    "Invalid input! Please enter 'Y' or 'N'.", "^[YyNn]$");

            if (continueChoice.equalsIgnoreCase("N")) {
                System.out.println("Exiting the program. Thank you!");
                break;
            }
        }
    }
}
