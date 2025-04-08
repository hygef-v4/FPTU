package model;

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

public class ProductDetail {

    private int detailID;
    private int productID;
    private String cpu;
    private String ram;
    private String storage;
    private String screen;
    private String gpu;

}
