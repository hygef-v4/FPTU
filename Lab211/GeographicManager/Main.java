package GeographicManager;

public class Main {

    public static void main(String[] args) {
        while (true) {
            ManageEastAsiaCountries.displayMenu();
            int choice = ManageEastAsiaCountries.getIntInRange(1, 5);

            switch (choice) {
                case 1:
                    ManageEastAsiaCountries.addCountry();
                    break;
                case 2:
                    ManageEastAsiaCountries.displayRecentCountries();
                    break;
                case 3:
                    ManageEastAsiaCountries.searchCountryByName();
                    break;
                case 4:
                    ManageEastAsiaCountries.sortCountriesByName();
                    break;
                case 5:
                    System.out.println("Exiting program...");
                    return;
                default:
                    System.out.println("Invalid choice! Please try again.");
            }
        }
    }
}
