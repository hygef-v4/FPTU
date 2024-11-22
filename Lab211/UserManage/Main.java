package UserManage;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int choice;
        do {
            UserManagement.creatFile();
            UserManagement.menu();
            choice = Inputter.getAnInteger("",
                    "Invalid choice. Please enter a number between 1 and 3.");
            switch (choice) {
                case 1:
                    UserManagement.addUser();
                    break;

                case 2:
                    UserManagement.login();
                    break;
                case 3:
                    System.out.println("Exiting...");
                    break;
                default:
                    System.err.println("Invalid choice. Please try again.");
            }
        } while (choice != 3);
    }
    
}
