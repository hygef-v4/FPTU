package dal.implement;

import model.OrderDetails;
import dal.DBContext;
import java.sql.*;
import java.util.Vector;

/**
 *
 * @author hungs
 */
public class OrderDetailDAO extends DBContext {

    public int insert(OrderDetails od) {
        String sql = "INSERT INTO [dbo].[tblOrderDetails] (quantity, productID, orderID, price) VALUES (?, ?, ?, ?)";
        int n = 0;
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);

            // Set quantity
            ptm.setInt(1, od.getQuantity());

            // Set productID
            ptm.setInt(2, od.getProductID());

            // Set orderID (handle null case if necessary)
            ptm.setInt(3, od.getOrderID());

            ptm.setDouble(4, od.getPrice());

            // Execute update
            n = ptm.executeUpdate();

            // Close resources
            ptm.close();

        } catch (SQLException ex) {
            ex.printStackTrace(); // Log error
        }
        return n;
    }

    public Vector<OrderDetails> getOrderDetailsByOrderId(int orderId) {
        Vector<OrderDetails> detailsList = new Vector<>();
        String sql = "SELECT * FROM tblOrderDetails WHERE orderID = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderDetails detail = new OrderDetails();
                detail.setDetailID(rs.getInt("detailID"));
                detail.setOrderID(rs.getInt("orderID"));
                detail.setProductID(rs.getInt("productID"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setPrice(rs.getDouble("price"));
                detailsList.add(detail);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return detailsList;
    }

}
