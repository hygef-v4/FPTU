package UserManage;

import java.io.*;
import java.util.*;

public class UserManagement {

    // private static List<User> userList = new ArrayList<>();
    private static final String FILE_NAME = "user.dat";

    public static void menu() {
        System.out.println("1. Create a new account");
        System.out.println("2. Login system");
        System.out.println("3. Exit");
        System.out.print("Enter your choice: ");

    }

    public static void addUser() {
        String username = Inputter.getString("Please enter new username: ", "Please enter valid username").toLowerCase();
        String password = Inputter.getString("Please create a password: ", "Please enter valid password");
        User newUser = new User(username, password);
        if (isUsernameExistsInFile(username)) {
            System.out.println("User is already existed! Please try again");
            return;
        }
        appendToFile(username, password);
        System.out.println("Account added successfully.");
    }

    public static void login() {
        String username = Inputter.getString("Enter username: ", "Please enter valid username").toLowerCase();
        String password = Inputter.getString("Enter Password: ", "Please enter valid password");
        if (isLoginValid(username, password)) {
            System.out.println("Login successfully");
        } else {
            System.out.println("Login failed ! Please try again");
        }
    }

    private static boolean isUsernameExistsInFile(String username) {
        try (BufferedReader input = new BufferedReader(new FileReader(FILE_NAME))) {
            String line;
            while ((line = input.readLine()) != null) {  // Read each line
                String[] accountData = line.split(", ");  // Split the line by space
                if (accountData[0].equals(username)) {   // Check if the first element (username) matches
                    return true;  // Username found
                }
            }
        } catch (IOException e) {
            System.err.println("Error checking username in file: " + e.getMessage());
        }
        return false;  // Username not found
    }

    private static void appendToFile(String username, String password) {
        try {
            BufferedWriter output = new BufferedWriter(new FileWriter(FILE_NAME, true));
            output.write(username + ", " + password);
            output.newLine(); // move to new line
            output.close();
        } catch (IOException e) {
            System.err.println("Error adding account to file: " + e.getMessage());
        }

    }

    private static boolean isLoginValid(String username, String password) {
        try (BufferedReader input = new BufferedReader(new FileReader(FILE_NAME))) {
            String line;
            while ((line = input.readLine()) != null) {

                String[] accounts = line.split(", ");
                if (accounts[0].equals(username) && accounts[1].equals(password)) {
                    return true;
                }
            }
        } catch (IOException e) {
            System.err.println("Error checking credentials in file: " + e.getMessage());
        }
        return false;
    }

    public static void creatFile() {
        File file = new File(FILE_NAME);
        try {
            if (!file.exists()) {
                file.createNewFile();
            }
        } catch (IOException e) {
            System.err.println("Error creating file: " + e.getMessage());
        }
    }
}
