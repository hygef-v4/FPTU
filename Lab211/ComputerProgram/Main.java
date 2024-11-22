package ComputerProgram;

/**
 *
 * @author Hung
 */
public class Main {

    public static void main(String[] args) {

        while (true) {
            Helper.displayMenu();
            int choice = Helper.getIntInRange(1, 3);
            switch (choice) {
                case 1:
                    Helper.normalCalculator();
                    break;
                case 2:
                    Helper.bmiCalculator();
                    break;
                case 3:
                    System.out.println("Exiting program...");
                    return;
            }
        }
    }
}
