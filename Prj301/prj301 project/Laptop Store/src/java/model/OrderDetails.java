package model;

import dal.implement.ProductDAO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class OrderDetails {

    private int detailID;
    private Integer quantity; // Nullable field
    private int productID;
    private int orderID;
    private double price;

// Method to calculate total cost of this order detail
    public double getTotalPrice() {
        return (quantity != null ? quantity : 0) * price;
    }
    
    // Fetch product name dynamically
    public String getProductName(ProductDAO productDAO) {
        Product product = productDAO.searchProduct(productID);
        return product != null ? product.getProductName() : "Unknown Product";
    }
}
