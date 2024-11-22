package ComputerProgram;

import java.util.Scanner;

public class Helper {

    private static final Scanner scanner = new Scanner(System.in);

    public static void displayMenu() {
        System.out.println("========= Calculator Program =========");
        System.out.println("1. Normal Calculator");
        System.out.println("2. BMI Calculator");
        System.out.println("3. Exit");
        System.out.println("Please choice one option:");
    }

    public static void normalCalculator() {
        System.out.println("----- Normal Calculator -----");
        System.out.print("Enter number 1: ");
        double memory = getDoubleNumber();  // Initialize memory with the first number

        while (true) {
            System.out.print("Enter Operator: ");
            String operator = inputOperator();

            // Check if the user wants to get the final result
            if (operator.equals("=")) {
                System.out.println("Result: " + memory);
                break;
            }

            System.out.print("Enter number 2: ");
            double num = getDoubleNumber();  // Get the next number to operate with

            // Calculate the new memory based on the current memory, operator, and new number
            memory = calculate(memory, operator, num);

            // If calculation failed (e.g., due to division by zero), break the loop
            if (Double.isNaN(memory)) {
                System.err.println("Calculation error occurred.");
                break;
            }
            System.out.println("Memory: " + memory);
        }
    }

    public static double calculate(double a, String operator, double b) {
        switch (operator) {
            case "+":
                return a + b;
            case "-":
                return a - b;
            case "*":
                return a * b;
            case "/":
                if (b == 0) {
                    System.err.println("Cannot divide by zero !");
                    return Double.NaN;
                }
                return a / b;
            case "^":
                return Math.pow(a, b);
            default:
                System.err.println("An error has occured !");
                return Double.NaN;
        }
    }

    public static void bmiCalculator() {
        System.out.println("----- BMI Calculator -----");
        System.out.print("Enter Weight(kg): ");
        double weight = getDoubleNumber();
        System.out.print("Enter Height(cm): ");
        double height = getDoubleNumber() / 100;

        double bmi = weight / (height * height);
        String status = bmiStatus(bmi);
        System.out.println("BMI Status: " + status);
    }

    public static String bmiStatus(double bmi) {
        if (bmi < 19) {
            return "UNDER_STANDARD";
        } else if (bmi < 25) {
            return "STANDARD";
        } else if (bmi < 30) {
            return "OVERWEIGHT";
        } else if (bmi < 40) {
            return "FAT";
        } else {
            return "VERY_FAT";
        }
    }

    public static String inputOperator() {
        String operator;
        while (true) {
            operator = scanner.nextLine();
            if (operator.equals("+")
                    || operator.equals("-")
                    || operator.equals("*")
                    || operator.equals("/")
                    || operator.equals("^")
                    || operator.equals("=")) {
                return operator;
            } else {
                System.err.print("Invalid operator. Please enter a valid operator (+, -, *, /, ^, =): ");
            }
        }
    }

    public static double getDoubleNumber() {
        double result;
        do {
            try {
                String input = scanner.nextLine();
                result = Double.parseDouble(input);
                return result;
            } catch (NumberFormatException e) {
                System.err.println("Invalid input ! Please try again!");
            }
        } while (true);
    }

    public static int getIntInRange(int min, int max) {
        int result;
        do {
            try {
                String input = scanner.nextLine();
                result = Integer.parseInt(input);
                if (result < min || result > max) {
                    System.err.println("Input is out of range! Please try again!");
                    continue;
                }
                return result;
            } catch (NumberFormatException e) {
                System.err.println("Invalid input ! Please try again!");
            }
        } while (true);

    }

}
