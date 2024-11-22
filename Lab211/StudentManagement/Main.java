package StudentManagement;

public class Main {

    public static void main(String[] args) {
        while (true) {
            Menu.displayMenu();
            int choice = Inputter.getAnInteger("Enter your choice",
                    "Choice should be 1 -5 !",
                    1, 5);
            switch (choice) {
                case 1:
                    StudentManagement.createStudent();
                    break;
                case 2:
                    StudentManagement.findAndSort();
                    break;
                case 3:
                    StudentManagement.updateOrDelete();
                    break;
                case 4:
                    StudentManagement.report();
                    break;
                case 5:
                    System.out.println("Exiting program...");
                    return; 
                default:
                    System.err.println("Invalid choice!");
            }
        }
    }
}
