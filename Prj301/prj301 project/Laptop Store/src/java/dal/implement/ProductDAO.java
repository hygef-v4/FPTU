package dal.implement;

import dal.DBContext;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Vector;
import model.Product;

public class ProductDAO extends DBContext {

    public Vector<Product> getAllProduct(String sql) {
        Vector<Product> listProduct = new Vector<>();
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1), // productID
                        rs.getString(2), // productName
                        rs.getString(3), // image
                        rs.getDouble(4), // price
                        rs.getInt(5), // quantity
                        rs.getString(6), // categoryID
                        rs.getString(7), // brandID (added)
                        rs.getDate(8), // importDate
                        rs.getInt(9), // warrantyMonths (nullable)
                        rs.getBoolean(10),
                        rs.getString(11)
                );

                listProduct.add(p);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Properly print the stack trace
        }
        return listProduct;
    }

    public Product searchProduct(int productID) {
        String sql = "SELECT * FROM [dbo].[tblProducts] WHERE productID=?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setInt(1, productID);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                Integer warranty = rs.getObject(9) != null ? rs.getInt(9) : null; // Handle nullable warrantyMonths
                boolean isFeatured = rs.getBoolean(10); // Retrieve boolean value

                Product pro = new Product(
                        productID,
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        warranty,
                        isFeatured,
                        rs.getString(11)
                );
                return pro;
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Ensure proper error logging
        }
        return null;
    }

    // lay ra san pham cung danh muc
    public Vector<Product> getRelatedProducts(int productID) {
        Vector<Product> relatedProducts = new Vector<>();
        String categoryID = null;
        Product targetProduct = searchProduct(productID);

        if (targetProduct == null) {
            return relatedProducts; // Or throw an exception if the productID is invalid
        }
        categoryID = targetProduct.getCategoryID();

        String sql = "SELECT * FROM [dbo].[tblProducts] WHERE categoryID = ? AND productID <> ?"; // Exclude the original product

        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, categoryID);
            ptm.setInt(2, productID); // Exclude the target product itself
            ResultSet rs = ptm.executeQuery();

            while (rs.next()) {
                Integer warranty = rs.getObject(9) != null ? rs.getInt(9) : null;
                boolean isFeatured = rs.getBoolean(10);

                Product p = new Product(
                        rs.getInt(1), // productID
                        rs.getString(2), // productName
                        rs.getString(3), // image
                        rs.getDouble(4), // price
                        rs.getInt(5), // quantity
                        rs.getString(6), // categoryID
                        rs.getString(7), // brandID
                        rs.getDate(8), // importDate
                        warranty, // warrantyMonths
                        isFeatured, //isFetured
                        rs.getString(11) // description
                );
                relatedProducts.add(p);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();  // Proper error handling
        }

        return relatedProducts;
    }

    // lay ra san pham cung danh muc hoac cung hang 
    public Vector<Product> getRelatedProducts2(int productID) {
        Vector<Product> relatedProducts = new Vector<>();
        Product targetProduct = searchProduct(productID);

        if (targetProduct == null) {
            return relatedProducts; // Or throw an exception
        }

        String categoryID = targetProduct.getCategoryID();
        String brandID = targetProduct.getBrandID();

        // Using OR to get products with the same category OR the same brand.
        String sql = "SELECT * FROM tblProducts WHERE (categoryID = ? OR brandID = ?) AND productID <> ?";

        try (PreparedStatement ptm = connection.prepareStatement(sql)) {
            ptm.setString(1, categoryID);
            ptm.setString(2, brandID);
            ptm.setInt(3, productID);

            try (ResultSet rs = ptm.executeQuery()) {
                while (rs.next()) {
                    // Correctly handle nullable warrantyMonths
                    Integer warranty = rs.getObject(9) != null ? rs.getInt(9) : null;
                    boolean isFeatured = rs.getBoolean("isFeatured");

                    Product p = new Product(
                            rs.getInt("productID"),
                            rs.getString("productName"),
                            rs.getString("image"),
                            rs.getDouble("price"),
                            rs.getInt("quantity"),
                            rs.getString("categoryID"),
                            rs.getString("brandID"),
                            rs.getDate("importDate"),
                            warranty, // Use the correctly retrieved value
                            isFeatured,
                            rs.getString("description")
                    );
                    relatedProducts.add(p);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return relatedProducts;
    }

    public String getCategoryNameByProductID(int productID) {
        String sql = "SELECT c.categoryName FROM [dbo].[tblProducts] p JOIN [dbo].tblCategories c ON p.categoryID = c.categoryID WHERE p.productID = ?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setInt(1, productID);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                return rs.getString("categoryName");
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Proper error handling
        }
        return null; // Return null if no category is found or on error
    }

    public String getBrandNameByProductID(int productID) {
        String sql = "SELECT b.brandName\n"
                + "  FROM [dbo].[tblProducts] p\n"
                + "  join [dbo].tblBrands b\n"
                + "  on p.brandID = b.brandID\n"
                + "  where p.productID = ?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setInt(1, productID);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                return rs.getString("brandName");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null; // Return null if no brand is found or on error
    }

    public Vector<Product> findByCategory(String categoryID) {
        Vector<Product> products = new Vector<>();
        String sql = "SELECT * FROM [dbo].[tblProducts] WHERE categoryID = ?";

        try (PreparedStatement ptm = connection.prepareStatement(sql)) {
            ptm.setString(1, categoryID);
            try (ResultSet rs = ptm.executeQuery()) {
                while (rs.next()) {
                    Integer warranty = rs.getObject(9) != null ? rs.getInt(9) : null;
                    boolean isFeatured = rs.getBoolean(10);

                    Product p = new Product(
                            rs.getInt(1), // productID
                            rs.getString(2), // productName
                            rs.getString(3), // image
                            rs.getDouble(4), // price
                            rs.getInt(5), // quantity
                            rs.getString(6), // categoryID
                            rs.getString(7), // brandID
                            rs.getDate(8), // importDate
                            warranty, // warrantyMonths
                            isFeatured, // isFeatured
                            rs.getString(11) // description
                    );
                    products.add(p);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Proper error handling
        }

        return products;
    }

    public Vector<Product> findByBrandID(String brandID) {
        Vector<Product> products = new Vector<>();
        String sql = "SELECT * FROM [dbo].[tblProducts] WHERE brandID = ?";

        try (PreparedStatement ptm = connection.prepareStatement(sql)) {
            ptm.setString(1, brandID);
            try (ResultSet rs = ptm.executeQuery()) {
                while (rs.next()) {
                    Integer warranty = rs.getObject(9) != null ? rs.getInt(9) : null;
                    boolean isFeatured = rs.getBoolean(10);

                    Product p = new Product(
                            rs.getInt(1), // productID
                            rs.getString(2), // productName
                            rs.getString(3), // image
                            rs.getDouble(4), // price
                            rs.getInt(5), // quantity
                            rs.getString(6), // categoryID
                            rs.getString(7), // brandID
                            rs.getDate(8), // importDate
                            warranty, // warrantyMonths
                            isFeatured, // isFeatured
                            rs.getString(11) // description
                    );
                    products.add(p);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Proper error handling
        }

        return products;
    }

    // search by keyword or description 
    public Vector<Product> searchByKeyword(String keyword) {
        Vector<Product> products = new Vector<>();
        String sql = "SELECT * FROM [dbo].[tblProducts] WHERE productName LIKE ? OR description LIKE ?";

        try (PreparedStatement ptm = connection.prepareStatement(sql)) {
            // Use '%' to allow for partial matches
            String searchKeyword = "%" + keyword + "%";
            ptm.setString(1, searchKeyword);
            ptm.setString(2, searchKeyword);

            try (ResultSet rs = ptm.executeQuery()) {
                while (rs.next()) {
                    Integer warranty = rs.getObject(9) != null ? rs.getInt(9) : null;
                    boolean isFeatured = rs.getBoolean(10);

                    Product p = new Product(
                            rs.getInt(1), // productID
                            rs.getString(2), // productName
                            rs.getString(3), // image
                            rs.getDouble(4), // price
                            rs.getInt(5), // quantity
                            rs.getString(6), // categoryID
                            rs.getString(7), // brandID
                            rs.getDate(8), // importDate
                            warranty, // warrantyMonths
                            isFeatured, // isFeatured
                            rs.getString(11) // description
                    );
                    products.add(p);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Proper error handling
        }

        return products;
    }

    public Vector<Product> findByPriceRange(double minPrice, double maxPrice) {
        Vector<Product> products = new Vector<>();
        String sql = "SELECT * FROM [dbo].[tblProducts] WHERE price BETWEEN ? AND ?";

        try (PreparedStatement ptm = connection.prepareStatement(sql)) {
            ptm.setDouble(1, minPrice);
            ptm.setDouble(2, maxPrice);

            try (ResultSet rs = ptm.executeQuery()) {
                while (rs.next()) {
                    Integer warranty = rs.getObject(9) != null ? rs.getInt(9) : null;
                    boolean isFeatured = rs.getBoolean(10);

                    Product p = new Product(
                            rs.getInt(1), // productID
                            rs.getString(2), // productName
                            rs.getString(3), // image
                            rs.getDouble(4), // price
                            rs.getInt(5), // quantity
                            rs.getString(6), // categoryID
                            rs.getString(7), // brandID
                            rs.getDate(8), // importDate
                            warranty, // warrantyMonths
                            isFeatured, // isFeatured
                            rs.getString(11) // description
                    );
                    products.add(p);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Proper error handling
        }

        return products;
    }

    public Vector<Product> sortProducts(String orderby) {
        Vector<Product> products = new Vector<>();
        String sql;

        switch (orderby) {
            case "featured":
                sql = "SELECT * FROM [dbo].[tblProducts] ORDER BY isFeatured DESC, productID ASC";
                break;
            case "date":
                sql = "SELECT * FROM [dbo].[tblProducts] ORDER BY importDate DESC";
                break;
            case "price":
                sql = "SELECT * FROM [dbo].[tblProducts] ORDER BY price ASC";
                break;
            case "price-desc":
                sql = "SELECT * FROM [dbo].[tblProducts] ORDER BY price DESC";
                break;
            default:
                sql = "SELECT * FROM [dbo].[tblProducts]"; // Default sorting
        }

        try (PreparedStatement ptm = connection.prepareStatement(sql)) {
            try (ResultSet rs = ptm.executeQuery()) {
                while (rs.next()) {
                    Integer warranty = rs.getObject(9) != null ? rs.getInt(9) : null;
                    boolean isFeatured = rs.getBoolean(10);

                    Product p = new Product(
                            rs.getInt(1), // productID
                            rs.getString(2), // productName
                            rs.getString(3), // image
                            rs.getDouble(4), // price
                            rs.getInt(5), // quantity
                            rs.getString(6), // categoryID
                            rs.getString(7), // brandID
                            rs.getDate(8), // importDate
                            warranty, // warrantyMonths
                            isFeatured, // isFeatured
                            rs.getString(11) // description
                    );
                    products.add(p);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return products;
    }

    public void updateProductQuantity(int productID, int newQuantity) {
        String sql = "UPDATE tblProducts SET quantity = ? WHERE productID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, newQuantity);
            ps.setInt(2, productID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Log the error for debugging
        }
    }

    public int addProduct(Product product) {
        String sql = "INSERT INTO tblProducts (productName, image, price, quantity, categoryID, brandID, importDate, warrantyMonths, isFeatured, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getImage());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getQuantity());
            ps.setString(5, product.getCategoryID());
            ps.setString(6, product.getBrandID());
            ps.setDate(7, product.getImportDate());
            ps.setObject(8, product.getWarrantyMonths(), java.sql.Types.INTEGER); // Handle nullable warranty
            ps.setBoolean(9, product.isIsFeatured());
            ps.setString(10, product.getDescription());

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1); // Return the generated productID
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Return -1 if insertion fails
    }

    public boolean deleteProduct(int productId) {
        String sql = "DELETE FROM tblProducts WHERE productID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, productId);

            int affectedRows = ps.executeUpdate();
            return affectedRows > 0; // Return true if deletion was successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Return false if deletion fails
    }

    public void updateProduct(Product product) {
        String sql = "UPDATE tblProducts SET productName = ?, image = ?, price = ?, quantity = ?, categoryID = ?, brandID = ?, importDate = ?, warrantyMonths = ?, isFeatured = ?, description = ? WHERE productID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getImage());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getQuantity());
            ps.setString(5, product.getCategoryID());
            ps.setString(6, product.getBrandID());
            ps.setDate(7, product.getImportDate());
            ps.setObject(8, product.getWarrantyMonths(), java.sql.Types.INTEGER); // Handle nullable warranty
            ps.setBoolean(9, product.isIsFeatured());
            ps.setString(10, product.getDescription());
            ps.setInt(11, product.getProductID());

            int affectedRows = ps.executeUpdate();

            if (affectedRows == 0) {
                System.out.println("No product updated. Product ID might not exist.");
            } else {
                System.out.println("Product updated successfully.");
            }
        } catch (SQLException e) {
            System.err.println("Error updating product: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        // Create an instance of ProductDAO
        ProductDAO productDAO = new ProductDAO();
        Date importDate = Date.valueOf("2035-03-25");

        // Sample product data
        Product newProduct = new Product(
                0, // Auto-incremented in DB, can be ignored if handled in DAO
                "Test Product22",
                "test_image.jpg",
                199.99,
                50,
                "C001", // Example Category ID
                "B001", // Example Brand ID
                importDate,
                12, // Warranty in months
                true, // isFeatured
                "This is a test product for checking add functionality."
        );

        int productId = productDAO.addProduct(newProduct);

        if (productId != -1) {
            System.out.println("Product added successfully with ID: " + productId);
        } else {
            System.out.println("Failed to add product.");
        }
    }

}
