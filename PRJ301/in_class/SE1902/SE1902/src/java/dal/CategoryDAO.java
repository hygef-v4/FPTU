/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import models.Category;
import models.Products;

/**
 *
 * @author Admin
 */
public class CategoryDAO extends DBContext {

    public Vector<Category> getAllCategory(String sql) {
        Vector<Category> listCategory = new Vector<>();
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3));
                listCategory.add(c);
            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return listCategory;
    }
}
