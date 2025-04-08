package model;

import java.sql.Date;
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

public class Product {
    private int productID;
    private String productName;
    private String image;
    private double price;
    private int quantity;
    private String categoryID;
    private String brandID;
    private Date importDate;
    private int warrantyMonths; // Nullable field
    private boolean isFeatured;
    private String description;

    public boolean isIsFeatured() {
        return isFeatured;
    }
    
    
}
