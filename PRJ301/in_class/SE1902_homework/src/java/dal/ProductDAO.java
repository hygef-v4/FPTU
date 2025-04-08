/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.Vector;
import models.Products;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

public class ProductDAO extends DBContext {

    public Vector<Products> getAllProduct(String sql) {
        Vector<Products> listProduct = new Vector<>();
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                Products p = new Products(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getInt(9));
                listProduct.add(p);
            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return listProduct;
    }

    public int insertProduct(Products p) {
        String sql = "INSERT INTO [dbo].[tblProducts]\n"
                + "           ([productName]\n"
                + "           ,[image]\n"
                + "           ,[price]\n"
                + "           ,[quantity]\n"
                + "           ,[categoryID]\n"
                + "           ,[importDate]\n"
                + "           ,[usingDate]\n"
                + "           ,[status])\n"
                + "     VALUES(?,?,?,?,?,?,?,?)";
        int n = 0;
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, p.getProductName());
            ptm.setString(2, p.getImage());
            ptm.setDouble(3, p.getPrice());
            ptm.setInt(4, p.getQuantity());
            ptm.setString(5, p.getCategoryID());
            ptm.setDate(6, p.getImportDate());
            ptm.setDate(7, p.getUsingDate());
            ptm.setInt(8, p.getStatus());
            n = ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return n;
    }

    public Products searchProduct(int productID) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[tblProducts]\n"
                + "  WHERE productID=?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setInt(1, productID);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                Products pro = new Products(productID,
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getInt(9));
                return pro;
            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return null;
    }

    public void updateProduct(Products p) {
        String sql = "UPDATE [dbo].[tblProducts]\n"
                + "   SET [productName] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[categoryID] = ?\n"
                + "      ,[importDate] = ?\n"
                + "      ,[usingDate] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE productID=?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, p.getProductName());
            ptm.setString(2, p.getImage());
            ptm.setDouble(3, p.getPrice());
            ptm.setInt(4, p.getQuantity());
            ptm.setString(5, p.getCategoryID());
            ptm.setDate(6, p.getImportDate());
            ptm.setDate(7, p.getUsingDate());
            ptm.setInt(8, p.getStatus());
            ptm.setInt(9, p.getProductID());
            ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
    }

    public void changeStatus(int productID, int newStatus) {
        //code here
        String sql = "update tblProducts\n"
                + "set status =?\n"
                + "where productID=?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setInt(1, newStatus);
            ptm.setInt(2, productID);
            ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }

    }

    public int delelteProducts(int productID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[tblProducts]\n"
                + "      WHERE productID = ?";

        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setInt(1, productID);
            ResultSet rs = getData("select *\n"
                    + "From tblOrderDetails\n"
                    + "Where productID=" + productID);
            if (rs.next()) {
                changeStatus(productID, 0);
                return n;
            }
            n = ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return n;
    }

    public static void main(String[] args) {
        String sql = "SELECT * FROM [dbo].[tblProducts]";
        ProductDAO pDAO = new ProductDAO();
        Vector<Products> plist = pDAO.getAllProduct(sql);
        for (Products products : plist) {
            System.out.println(products);
        }
        Products pro = new Products("Bep nuong",
                "http//SE1902",
                100, 50, "C004",
                new Date(2025 - 1900, 1, 15),
                new Date(2025 - 1900, 1, 15), 1);
        int n = pDAO.insertProduct(pro);
        if (n > 0) {
            System.out.println("Inserted!");
            plist = pDAO.getAllProduct(sql);
            for (Products products : plist) {
                System.out.println(products);
            }
        } else {
            System.out.println("Insert fail!");
        }
        Products pr = pDAO.searchProduct(15);
        if (pr != null) {
            pDAO.updateProduct(new Products(15,
                    "Samsung Galaxy100",
                    "http//SE1902", 1000, 100,
                    "C001", new Date(2025 - 1900, 1, 15),
                    new Date(2025 - 1900, 1, 15), 1));
            System.out.println("Updated!");
            plist = pDAO.getAllProduct(sql);
            for (Products products : plist) {
                System.out.println(products);
            }
        } else {
            System.out.println("Not Found!");
        }

        Products prod = pDAO.searchProduct(14);
        if (prod != null) {
            pDAO.delelteProducts(6);
            System.out.println("Deleted");
            plist = pDAO.getAllProduct(sql);
            for (Products products : plist) {
                System.out.println(products);
            }
        } else {
            System.out.println("Not Found!");
        }
    }

}
