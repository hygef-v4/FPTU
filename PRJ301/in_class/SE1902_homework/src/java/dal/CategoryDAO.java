package dal;

import java.sql.*;
import java.util.Vector;
import models.Category;

public class CategoryDAO extends DBContext {

    public Vector<Category> getAllCategory(String sql) {
        Vector<Category> listCategory = new Vector<>();
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                Category c = new Category(
                        rs.getString(1),  // categoryID
                        rs.getString(2),  // categoryName
                        rs.getString(3),  // describe
                        rs.getInt(4));    // status
                listCategory.add(c);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listCategory;
    }

    public int insertCategory(Category c) {
        String sql = "INSERT INTO [dbo].[tblCategories] ([categoryID], [categoryName], [describe], [status]) VALUES (?, ?, ?, ?)";
        int n = 0;
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, c.getCategoryID());
            ptm.setString(2, c.getCategoryName());
            ptm.setString(3, c.getDescribe());
            ptm.setInt(4, c.getStatus()); // Include status
            n = ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public Category searchCategory(String categoryID) {
        String sql = "SELECT * FROM [dbo].[tblCategories] WHERE categoryID = ?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, categoryID);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                return new Category(
                        rs.getString(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getInt(4)); // Include status
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void updateCategory(Category c) {
        String sql = "UPDATE [dbo].[tblCategories] SET categoryName = ?, describe = ?, status = ? WHERE categoryID = ?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, c.getCategoryName());
            ptm.setString(2, c.getDescribe());
            ptm.setInt(3, c.getStatus()); // Include status update
            ptm.setString(4, c.getCategoryID());
            ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void changeStatus(String categoryID, int status) {
        String sql = "UPDATE [dbo].[tblCategories] SET status = ? WHERE categoryID = ?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setInt(1, status);
            ptm.setString(2, categoryID);
            ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public int deleteCategory(String categoryID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[tblCategories] WHERE categoryID = ?";

        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, categoryID);

            // Check if products exist under this category
            ResultSet rs = getData("SELECT * FROM tblProducts WHERE categoryID = '" + categoryID + "'");
            if (rs.next()) {
                changeStatus(categoryID, 0); // Change status instead of deleting
                return n;
            }

            // If no products exist, proceed with deletion
            n = ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
}
