package dal.implement;

import dal.DBContext;
import java.sql.*;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import model.Order;
import model.OrderDetails;

public class OrderDAO extends DBContext {

    private final OrderDetailDAO orderDetailsDAO = new OrderDetailDAO(); // Use OrderDetailsDAO

    public int insertOrder(Order order) {
        String sql = "INSERT INTO [dbo].[tblOrders] (amount, userID, fullName, address, phone, note) VALUES (?, ?, ?, ?, ?, ?)";
        int orderId = -1; // Default value if insert fails

        try (PreparedStatement ptm = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            // Set amount
            ptm.setInt(1, order.getAmount());

            // Handle nullable userID
            if (order.getUserID() != null) {
                ptm.setInt(2, order.getUserID());
            } else {
                ptm.setNull(2, java.sql.Types.INTEGER);
            }
            ptm.setString(3, order.getFullname());
            ptm.setString(4, order.getAddress());
            ptm.setString(5, order.getPhone());
            ptm.setString(6, order.getNote());

            // Execute the insert
            int n = ptm.executeUpdate();
            if (n > 0) {
                try (ResultSet rs = ptm.getGeneratedKeys()) {
                    if (rs.next()) {
                        orderId = rs.getInt(1); // Get the generated order ID
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return orderId; // Returns order ID if successful, -1 if failed
    }

    /**
     * Retrieves a list of orders for a given user ID, including their order
     * details.
     *
     * @param userId The ID of the user whose orders are to be retrieved.
     * @return A list of Order objects, each containing its associated
     * OrderDetails.
     */
    public Vector<Order> getOrdersByUserId(int userId) {
        Vector<Order> orders = new Vector<>();
        String sql = "SELECT * FROM tblOrders WHERE userID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setOrderID(rs.getInt("orderID"));
                    order.setUserID(rs.getInt("userID"));
                    order.setOrderDate(rs.getTimestamp("orderDate").toLocalDateTime());
                    order.setFullname(rs.getString("fullName"));
                    order.setAddress(rs.getString("address"));
                    order.setPhone(rs.getString("phone"));
                    order.setNote(rs.getString("note"));
                    order.setStatus(rs.getBoolean("status"));  // Read status from DB

                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public void updateOrderStatus(int orderId, boolean newStatus) {
        String sql = "UPDATE tblOrders SET status = ? WHERE orderID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setBoolean(1, newStatus);
            ps.setInt(2, orderId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    // Get all orders for admin

    public Vector<Order> getAllOrders() {
        Vector<Order> orders = new Vector<>();
        String sql = "SELECT * FROM tblOrders";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setOrderID(rs.getInt("orderID"));
                    order.setUserID(rs.getInt("userID"));
                    order.setOrderDate(rs.getTimestamp("orderDate").toLocalDateTime());
                    order.setFullname(rs.getString("fullName"));
                    order.setAddress(rs.getString("address"));
                    order.setPhone(rs.getString("phone"));
                    order.setNote(rs.getString("note"));
                    order.setStatus(rs.getBoolean("status"));  // Read status from DB

                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public Order getOrderById(int orderID) {
        Order order = null;
        String sql = "SELECT * FROM tblOrders WHERE orderID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                order = new Order();
                order.setOrderID(rs.getInt("orderID"));
                order.setAmount(rs.getInt("amount"));
                order.setUserID(rs.getInt("userID"));
                order.setOrderDate(rs.getTimestamp("orderDate").toLocalDateTime());
                order.setFullname(rs.getString("fullname"));
                order.setAddress(rs.getString("address"));
                order.setPhone(rs.getString("phone"));
                order.setNote(rs.getString("note"));
                order.setStatus(rs.getBoolean("status"));

                // Fetch order details using OrderDetailsDAO
                order.setListOrderDetails(orderDetailsDAO.getOrderDetailsByOrderId(order.getOrderID()));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    public static void main(String[] args) {
        OrderDAO orderDAO = new OrderDAO(); // Create OrderDAO instance

        // Test getAllOrders()
        // Create a sample order
        Order newOrder = new Order();
        Order order = new Order();
        order.setAmount(103243240);  // Make sure this is set!
        order.setUserID(2);
        order.setFullname("Nguyen Van A");
        order.setAddress("123 Street, Hanoi");
        order.setPhone("0987654321");
        order.setNote("Please deliver fast!");


        // Insert order and get order ID
        int orderId = orderDAO.insertOrder(newOrder);

        // Check if insertion was successful
        if (orderId > 0) {
            System.out.println("Order inserted successfully! Order ID: " + orderId);
        } else {
            System.out.println("Order insertion failed.");
        }
        
        System.out.println(order.getAmount());
    }
}
