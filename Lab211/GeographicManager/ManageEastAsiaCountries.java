package GeographicManager;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Scanner;

public class ManageEastAsiaCountries {

    private static final Scanner scanner = new Scanner(System.in);
    private static final List<EastAsiaCountries> countries = new ArrayList<>();

    public static void displayMenu() {
        System.out.println("1. Input the information for 11 countries in East Asia");
        System.out.println("2. Display the information of country you've just input");
        System.out.println("3. Search the country according to the entered country's name.");
        System.out.println("4. Display the information of countries sorted name in ascending order");
        System.out.println("5. Exit.");
        System.out.print("Enter your choice: ");
    }

    public static void addCountry() {
            int index = countries.size() + 1; 
            System.out.println("Enter details for country " + (index) + ":");
            System.out.print("Enter country code: ");
            String code = getString();
            System.out.print("Enter country name: ");
            String name = getString();
            System.out.print("Enter total area: ");
            double area = getDoubleInput();
            System.out.print("Enter country terrain: ");
            String terrain = getString();

            if (area > 0) {
                EastAsiaCountries country = new EastAsiaCountries(code, name, area, terrain);
                countries.add(country);
            } else {
                System.err.println("Total area must be greater than 0!");
            }
            System.out.println(); 
    }

    public static void displayRecentCountries() {
        System.out.printf("%-10s %-20s %-15s %-15s%n", "ID", "Name", "Total Area", "Terrain");
        for (EastAsiaCountries country : countries) {
            country.display();
        }
    }

    public static void searchCountryByName() {
        System.out.print("Enter country name to search: ");
        String countryName = getString();
        boolean found = false;
        System.out.printf("%-10s %-20s %-15s %-15s%n", "ID", "Name", "Total Area", "Terrain");
        for (EastAsiaCountries country : countries) {
            if (country.getCountryName().equalsIgnoreCase(countryName)) {
                country.display();
                found = true; 
                break; 
            }
        }
        if (!found ){
            System.err.println("Country is not found !");
        }
        
    }

    public static void sortCountriesByName() {
        List<EastAsiaCountries> sortedList = new ArrayList<>(countries);
        Collections.sort(sortedList, Comparator.comparing(EastAsiaCountries::getCountryName));
        System.out.printf("%-10s %-20s %-15s %-15s%n", "ID", "Name", "Total Area", "Terrain");
        for (EastAsiaCountries country : sortedList) {
            country.display();
        }
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
                System.err.println("Invalid input! Please try again!");
            }
        } while (true);
    }

    public static String getString() {
    String input;
    while (true) {
        input = scanner.nextLine().trim();
        if (input.isEmpty()) {
            System.err.println("Input cannot be empty! Please try again!");
        } else if (!input.matches("[a-zA-Z]+")) {
            System.err.println("Input must only contain letters! Please try again!");
        } else {
            break;
        }
    }
    return input;
}


    public static double getDoubleInput() {
        double input;
        while (true) {
            try {
                input = Double.parseDouble(scanner.nextLine());
                if (input > 0) {
                    break;
                } else {
                    System.out.println("Please enter a positive number.");
                }
            } catch (NumberFormatException e) {
                System.err.println("Invalid input. Please enter a valid number.");
            }
        }
        return input;
    }
}