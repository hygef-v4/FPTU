package FruitShop;

public class Main {

    public static void main(String[] args) {
        while (true) {
            Menu.displayMenu();
            int choice = Inputter.getAnInteger("Enter choice 1-5",
                    "Choice should be 1-5", 1, 5);
            switch (choice) {
                case 1:
                    FruitManagement.createFruit();
                    break;
                case 2:
                    OrderManagement.viewOrders();
                    break;
                case 3:
                    FruitManagement.shopping();
                    break;
                case 4:
                    FruitManagement.updateStock();
                    break; 
                case 5:
                    System.out.println("Exiting program...");
                    return;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }
    }
}
