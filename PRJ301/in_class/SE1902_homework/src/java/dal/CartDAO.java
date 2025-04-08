package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import models.Cart;

public class CartDAO extends DBContext {

    public Cart getCart(int productID) {
        Cart cart = null;
        String sql = "SELECT [productID]\n"
                + "      ,[productName]  \n"
                + "      ,[price]\n"
                + "      ,[quantity]    \n"
                + "  FROM [tblProducts] where productID = ? ";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setObject(1, productID);
            ResultSet rs = ptm.executeQuery();
            Cart c = new Cart(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getDouble(3), 0);

        } catch (SQLException ex) {
            ex.getStackTrace();
            }
        return cart;
    }
}
