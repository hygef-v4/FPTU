package FruitShop;

import java.util.*;

public class FruitManagement {

    private static List<Fruit> fruitList = new ArrayList<>();

    public static void createFruit() {
        while (true) {
            String id = Inputter.getString("Enter fruit id",
                    "Invalid id! Try again");

            if (isIdExist(id)) {
                System.err.println("Id is already existed. Please try again");
                continue;
            }
            // check name is exist 
            String name;
            while (true) {
                name = Inputter.getString("Enter new fruit name",
                        "Invalid name! Try again", "[a-zA-Z ]+");

                if (isNameExist(name)) {
                    System.err.println("Name is already existed");
                    continue;
                }
                break;
            }

            double price = Inputter.getADouble("Enter fruit price:", "Invalid price!", 0.01, Integer.MAX_VALUE);
            int quantity = Inputter.getAnInteger("Enter quantity of fruit", "Invalid quantity", 1, Integer.MAX_VALUE);
            String origin = Inputter.getString("Enter origin of fruit",
                    "Invalid origin! Try again", "[a-zA-Z ]+");

            fruitList.add(new Fruit(id, name, price, quantity, origin));

            // check continue 
            if (!Inputter.checkInputYN()) {
                return;
            }
        }
    }

    // display fruit list 
    public static void displayFruit() {
        if (fruitList.isEmpty()) {
            System.out.println("No fruits available in the shop");
            return;
        }
        System.out.printf("%-10s %-15s %-10s %-10s %-10s\n", "Item", "Fruit Name", "Origin", "Price", "Quantity");

        // Table content
        for (int i = 0; i < fruitList.size(); i++) {
            Fruit fruit = fruitList.get(i);
            System.out.printf("%-10d %-15s %-10s $%-12.2f %-10d\n",
                    (i + 1), fruit.getName(), fruit.getOrigin(), fruit.getPrice(), fruit.getQuantity());
        }
    }

    public static void shopping() {
        List<Order> currentOrder = new ArrayList<>();
        if (fruitList.isEmpty()) {
            System.out.println("No fruit available in shop.");
            return; // Exit if no fruits are available
        }

        List<Fruit> tempFruitList = new ArrayList<>();     // temporary 

        for (Fruit fruit : fruitList) {
            tempFruitList.add(new Fruit(fruit.getId(), fruit.getName(), fruit.getPrice(),
                    fruit.getQuantity(), fruit.getOrigin()));
        }

        while (true) {

            // Display available fruits
            displayFruit();
            int fruitChoice = Inputter.getAnInteger("Select fruit number in list (0 to exit): ",
                    "Invalid choice. Please enter a valid item number.", 0, fruitList.size());

            if (fruitChoice == 0) {
                System.out.println("Order cancelled. No items were purchased.");
                for (int i = 0; i < fruitList.size(); i++) {
                    fruitList.get(i).setQuantity(tempFruitList.get(i).getQuantity());
                }
                return;

            }

            Fruit selectedFruit = fruitList.get(fruitChoice - 1);
            System.out.println("You selected: " + selectedFruit.getName());

            int quantity = Inputter.getAnInteger("Please input quantity: ", "Invalid quantity.", 1, Integer.MAX_VALUE);

            // Check if there's enough stock
            if (!selectedFruit.hasStock(quantity)) {
                System.out.println("Sorry, we only have " + selectedFruit.getQuantity() + " " + selectedFruit.getName() + "(s) in stock.");
                continue;
            }

            // Check if the product is already in the current order
            boolean itemExists = false;
            for (Order existingOrder : currentOrder) {
                if (existingOrder.getName().equals(selectedFruit.getName())) {
                    existingOrder.setQuantity(existingOrder.getQuantity() + quantity);
                    itemExists = true;
                    break;
                }
            }

            if (!itemExists) {
                // If not found, add the new order to the current order
                currentOrder.add(new Order(selectedFruit.getId(), selectedFruit.getName(), selectedFruit.getPrice(), quantity));
            }

            // Reduce quantity of fruit in stock after buying
            selectedFruit.reduceQuantity(quantity);

            String input = Inputter.getString("Do you want to continue (Y/N or [C]ancel Order)? ", "Invalid input",
                    "[ynYNcC]");
            if (input.equalsIgnoreCase("n")) {
                break;
            } else if (input.equalsIgnoreCase("c")) {
                System.out.println("Order cancelled. No items were purchased.");
                for (int i = 0; i < fruitList.size(); i++) {
                    fruitList.get(i).setQuantity(tempFruitList.get(i).getQuantity());
                }
                return;
            }
        }

        // customer order
        if (!currentOrder.isEmpty()) {
            String customerName = Inputter.getString("Enter your name: ", "Invalid name!", "[a-zA-Z ]+");

            // Add all orders to the order management
            for (Order order : currentOrder) {
                OrderManagement.addOrder(customerName, order);  // Add to HashMap 
            }
            System.out.println("Order placed successfully!");
        } else {
            System.out.println("No items were purchased.");
        }
    }

    private static boolean isIdExist(String id) {
        for (Fruit fruit : fruitList) {
            if (fruit.getId().equalsIgnoreCase(id)) {
                return true;
            }
        }
        return false;
    }

    private static boolean isNameExist(String name) {
        for (Fruit fruit : fruitList) {
            if (fruit.getName().equalsIgnoreCase(name)) {
                return true;
            }
        }
        return false;
    }

    public static void updateStock() {
        String id;
        while (true) {
            id = Inputter.getString("Enter fruit ID to update or press N to cancel", "Invalid ID! Please Try again");
            if (id.equalsIgnoreCase("N")) {
                return;
            }
            if (!isIdExist(id)) {
                System.err.printf("Fruit ID: %s does not exist!\n", id);
                continue;
            }
            break;
        }

        int newQuantity = Inputter.getAnInteger("Enter new quantity of fruit", "Invalid quantity", 1, Integer.MAX_VALUE);
        for (Fruit fruit : fruitList) {
            if (fruit.getId().equalsIgnoreCase(id)) {
                fruit.setQuantity(newQuantity);
                System.out.println("Stock for " + fruit.getName() + " updated to " + newQuantity + ".");
                return;
            }
        }
    }
}
