package dal;

import java.sql.*;
import java.util.Vector;
import models.OrderDetails;

public class OrderDetailsDAO extends DBContext {

    // Retrieve all OrderDetails
    public Vector<OrderDetails> getAllOrderDetails() {
        Vector<OrderDetails> list = new Vector<>();
        String sql = "SELECT * FROM tblOrderDetails";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetails od = new OrderDetails(
                        rs.getInt("detailID"),
                        rs.getDouble("price"),
                        rs.getInt("quantity"),
                        rs.getInt("orderID"),
                        rs.getInt("productID")
                );
                list.add(od);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Insert new OrderDetail
    public void insertOrderDetail(OrderDetails od) {
        // Removed detailID from the insert columns since it's auto-incremented
        String sql = "INSERT INTO tblOrderDetails (price, quantity, orderID, productID) VALUES (?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDouble(1, od.getPrice());
            ps.setInt(2, od.getQuantity());
            ps.setInt(3, od.getOrderID());
            ps.setInt(4, od.getProductID());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Search by detailID
    public OrderDetails searchOrderDetail(int detailID) {
        String sql = "SELECT * FROM tblOrderDetails WHERE detailID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, detailID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new OrderDetails(
                        rs.getInt("detailID"),
                        rs.getDouble("price"),
                        rs.getInt("quantity"),
                        rs.getInt("orderID"),
                        rs.getInt("productID")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update (only price & quantity in this example)
    public void updateOrderDetail(OrderDetails od) {
        String sql = "UPDATE tblOrderDetails SET price=?, quantity=? WHERE detailID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDouble(1, od.getPrice());
            ps.setInt(2, od.getQuantity());
            ps.setInt(3, od.getDetailID());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete an OrderDetail
    public void deleteOrderDetail(int detailID) {
        String sql = "DELETE FROM tblOrderDetails WHERE detailID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, detailID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Search by OrderID (if you want a separate search)
    public Vector<OrderDetails> searchOrderDetailsByOrderID(int orderID) {
        Vector<OrderDetails> list = new Vector<>();
        String sql = "SELECT * FROM tblOrderDetails WHERE orderID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetails(
                        rs.getInt("detailID"),
                        rs.getDouble("price"),
                        rs.getInt("quantity"),
                        rs.getInt("orderID"),
                        rs.getInt("productID")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
