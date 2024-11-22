package FruitShop;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;

public class OrderManagement {

    private static Hashtable<String, ArrayList<Order>> orders = new Hashtable<>();

    private static String generateOrderKey(String customerName) {
        String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        return customerName + "_" + timestamp;
    }

    // hash map cho tung customer co 1 cai list order 
    public static void addOrder(String customerName, Order order) {
        String uniqueOrderKey = generateOrderKey(customerName); 
        
        if (orders.containsKey(uniqueOrderKey)) {
            orders.get(uniqueOrderKey).add(order);
        } else {
            ArrayList<Order> orderList = new ArrayList<>();
            orderList.add(order);
            orders.put(uniqueOrderKey, orderList);
        }
    }

    public static void viewOrders() {
        // neu ko co orders
        if (orders.isEmpty()) {
            System.out.println("No orders to display.");
            return;
        }

        for (String customerKey : orders.keySet()) {
            String customerName = customerKey.split("_")[0]; 
            String orderID = customerKey.split("_")[1]; 
            
            System.out.println("Order ID: " + orderID);
            System.out.println("Customer: " + customerName);
            System.out.printf("%-15s %-11s %-10s %-10s\n", "Product", "Quantity", "Price", "Amount"); // Header

            ArrayList<Order> customerOrder = orders.get(customerKey);
            double total = 0;
            // print customer orders 
            for (int i = 0; i < customerOrder.size(); i++) {
                Order order = customerOrder.get(i);
                System.out.printf("%-17s %-9d $%-9.2f $%-10.2f\n",
                        (i + 1) + ". " + order.getName(), order.getQuantity(), order.getPrice(), order.getAmount());

                total += order.getAmount();

            }
            System.out.printf("Total: %.2f$\n", total);
            System.out.println();
        }
    }
}
