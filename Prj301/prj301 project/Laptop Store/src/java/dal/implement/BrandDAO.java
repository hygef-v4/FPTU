package dal.implement;

import dal.DBContext;
import java.sql.*;
import java.util.Vector;
import model.Brand;

public class BrandDAO extends DBContext {

    public Vector<Brand> getAllBrands(String sql) {
        Vector<Brand> listBrands = new Vector<>();
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                Brand b = new Brand(
                        rs.getString(1), // brandID
                        rs.getString(2)); // brandName
                listBrands.add(b);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listBrands;
    }
}
