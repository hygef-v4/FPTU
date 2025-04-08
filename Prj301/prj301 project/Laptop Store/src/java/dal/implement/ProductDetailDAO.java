package dal.implement;

import dal.DBContext;
import model.ProductDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import model.Product;

public class ProductDetailDAO extends DBContext {

    public ProductDetail getProductDetailByProductID(int productID) {
        String sql = "SELECT * FROM tblProductDetails WHERE productID = ?";
        try (PreparedStatement ptm = connection.prepareStatement(sql)) { // Use try-with-resources
            ptm.setInt(1, productID);
            try (ResultSet rs = ptm.executeQuery()) {
                if (rs.next()) {
                    return new ProductDetail(
                            rs.getInt("detailID"),
                            rs.getInt("productID"),
                            rs.getString("cpu"),
                            rs.getString("ram"),
                            rs.getString("storage"),
                            rs.getString("screen"),
                            rs.getString("gpu")
                    );
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Proper error handling (consider logging)
        }
        return null; // Return null if no detail is found
    }

    // If you need a list of details (in case a product can have multiple detail entries):
    public Vector<ProductDetail> getProductDetailsByProductID(int productID) {
        Vector<ProductDetail> details = new Vector<>();
        String sql = "SELECT * FROM tblProductDetails WHERE productID = ?";
        try (PreparedStatement ptm = connection.prepareStatement(sql)) {  // Use try-with-resources
            ptm.setInt(1, productID);
            try (ResultSet rs = ptm.executeQuery()) {
                while (rs.next()) {
                    details.add(new ProductDetail(
                            rs.getInt("detailID"),
                            rs.getInt("productID"),
                            rs.getString("cpu"),
                            rs.getString("ram"),
                            rs.getString("storage"),
                            rs.getString("screen"),
                            rs.getString("gpu")
                    ));
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return details;
    }

    public boolean addProductDetail(ProductDetail productDetail) {
        String sql = "INSERT INTO tblProductDetails (productID, cpu, ram, storage, screen, gpu) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, productDetail.getProductID());
            ps.setString(2, productDetail.getCpu());
            ps.setString(3, productDetail.getRam());
            ps.setString(4, productDetail.getStorage());
            ps.setString(5, productDetail.getScreen());
            ps.setString(6, productDetail.getGpu());

            return ps.executeUpdate() > 0; // Return true if insertion is successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateProductDetail(ProductDetail productDetail) {
        String sql = "UPDATE tblProductDetails SET cpu = ?, ram = ?, storage = ?, screen = ?, gpu = ? WHERE productID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, productDetail.getCpu());
            ps.setString(2, productDetail.getRam());
            ps.setString(3, productDetail.getStorage());
            ps.setString(4, productDetail.getScreen());
            ps.setString(5, productDetail.getGpu());
            ps.setInt(6, productDetail.getProductID());

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("Product details updated successfully for Product ID: " + productDetail.getProductID());
                return true;
            } else {
                System.out.println("No product details updated. Product ID might not exist.");
                return false;
            }
        } catch (SQLException e) {
            System.err.println("Error updating product details: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        // Create an instance of ProductDetailDAO
        ProductDetailDAO productDetailDAO = new ProductDetailDAO();

        // Example product ID (Ensure this product exists in your database)
        int productId = 34; // Replace with an actual product ID

        // Create product details
        ProductDetail productDetail = new ProductDetail(
                0,
                productId,
                "Intel Core i7 12700H",
                "16GB DDR5",
                "1TB SSD",
                "15.6-inch FHD 144Hz",
                "NVIDIA RTX 3060"
        );

        // Add product details
        boolean isDetailAdded = productDetailDAO.addProductDetail(productDetail);

        // Output the result
        if (isDetailAdded) {
            System.out.println("✅ Product details added successfully!");
        } else {
            System.out.println("❌ Failed to add product details.");
        }
    }

}
