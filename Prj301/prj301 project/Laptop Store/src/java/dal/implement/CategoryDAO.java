package dal.implement;

import dal.DBContext;
import java.sql.*;
import java.util.Vector;
import model.Category;

public class CategoryDAO extends DBContext {

    public Vector<Category> getAllCategory(String sql) {
        Vector<Category> listCategory = new Vector<>();
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                Category c = new Category(
                        rs.getString(1), // categoryID
                        rs.getString(2), // categoryName
                        rs.getString(3),
                        rs.getString(4)); // describe
                listCategory.add(c);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listCategory;
    }

}
