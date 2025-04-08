/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import models.Orders;

public class OrderDAO extends DBContext {

    public Vector<Orders> getAllOrder(String sql) {
        Vector<Orders> listOrders = new Vector<>();
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                Orders o = new Orders(rs.getInt(1),
                        rs.getDate(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getInt(5));
                listOrders.add(o);
            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return listOrders;
    }

    public int insertOrder(Orders o) {
        String sql = "INSERT INTO [dbo].[tblOrders]\n"
                + "           ([orderDate]\n"
                + "           ,[total]\n"
                + "           ,[userID]\n"
                + "           ,[status])\n"
                + "     VALUES (?,?,?,?)";
        int n = 0;
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setDate(1, o.getOrderDate());
            ptm.setDouble(2, o.getTotal());
            ptm.setString(3, o.getUserID());
            ptm.setInt(4, o.getStatus());
            n = ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return n;
    }

    public Orders searchOrder(int orderID) {
        String sql = "SELECT *\n"
                + "FROM [dbo].[tblOrders]\n"
                + "WHERE orderID = ? ";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setInt(1, orderID);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                return new Orders(orderID,
                        rs.getDate(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getInt(5));
            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return null;
    }

    public void updateOrder(Orders o) {
        String sql = "UPDATE [dbo].[tblOrders]\n"
                + "   SET [orderDate] = ?\n"
                + "      ,[total] = ?\n"
                + "      ,[userID] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE orderID = ?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setDate(1, o.getOrderDate());
            ptm.setDouble(2, o.getTotal());
            ptm.setString(3, o.getUserID());
            ptm.setInt(4, o.getStatus());
            ptm.setInt(5, o.getOrderID());
            ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
    }

    public void changeStatus(int orderID, int status) {
        String sql = "UPDATE [dbo].[tblOrders]\n"
                + "   SET [status] = ?\n"
                + "WHERE orderID = ?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setInt(1, status);
            ptm.setInt(2, orderID);
            ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
    }

    public int deleteOrder(int orderID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[tblOrders]\n"
                + "      WHERE orderID = ?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setInt(1, orderID);
            ResultSet rs = getData("SELECT *\n"
                    + "  FROM [dbo].[tblOrderDetails]\n"
                    + "  WHERE orderID = " + orderID);
            if (rs.next()) {
                changeStatus(orderID, 0);
                return n;
            }
            n = ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return n;
    }
}
