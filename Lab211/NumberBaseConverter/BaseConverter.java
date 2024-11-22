package NumberBaseConverter;

public class BaseConverter {

    // Method to convert input value from any base (Binary, Decimal, Hexadecimal) to decimal
    public static int convertToDecimal(String value, int base) {
        int result = 0;
        String HEX = "0123456789ABCDEF";
        value = value.toUpperCase();  // Handle both lowercase and uppercase inputs

        switch (base) {
            case 1: // Binary (Base 2)
                base = 2;
                break;
            case 2: // Decimal (Base 10)
                base = 10;
                break;
            case 3: // Hexadecimal (Base 16)
                base = 16;
                break;
            case 4: // Octal (base 8)
                base = 8;
                break;
            default:
                throw new NumberFormatException("Unsupported base.");
        }

        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            int digit = HEX.indexOf(c); // Get numeric value of character
            if (digit < 0 || digit >= base) {
                throw new NumberFormatException("Invalid character for base " + base);
            }
            result += digit * Math.pow(base, value.length() - 1 - i);
        }
        return result;
    }

    // Method to convert a decimal value to another base (Binary, Decimal, Hexadecimal)
    public static String convertFromDecimal(int value, int base) {
        if (value == 0) {
            return "0"; // Handle the case when the value is zero
        }

        String result = "";
        String HEX = "0123456789ABCDEF";

        switch (base) {
            case 1: // Binary (Base 2)
                base = 2;
                break;
            case 2: // Decimal (Base 10)
                base = 10;
                break;
            case 3: // Hexadecimal (Base 16)
                base = 16;
                break;
            case 4: // Octal (base 8)
                base = 8;
                break;
            default:
                throw new NumberFormatException("Unsupported base.");
        }

        while (value > 0) {
            result = HEX.charAt(value % base) + result;
            value /= base;
        }

        return result;
    }

}
