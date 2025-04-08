package model;

import java.security.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.Vector;
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
public class Order {

    private int orderID;
    private int amount;
    private Integer userID; // Nullable field
    private LocalDateTime orderDate;
    private Vector<OrderDetails> listOrderDetails = new Vector<>();
    private String fullname;
    private String address;
    private String phone;
    private String note; // ghi chu 
    private boolean status;  // true = Đã xác nhận, false = Chưa xác nhận

    // Calculate total amount based on order details
    public int getTotalAmount() {
        int total = 0;
        for (OrderDetails detail : listOrderDetails) {
            total += detail.getTotalPrice();
        }
        return total;
    }

    public Date getFormattedDate() {
        return Date.from(orderDate.atZone(ZoneId.systemDefault()).toInstant());
    }

    public String getStatusText() {
        return status ? "Đã giao hàng" : "Đang giao hàng";
    }
}
