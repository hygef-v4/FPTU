package models;

public class OrderDetails {
    private int detailID;
    private double price;
    private int quantity;
    private int orderID;
    private int productID;

    // Default Constructor
    public OrderDetails() {
        this.detailID = 0;
        this.price = 0.0;
        this.quantity = 0;
        this.orderID = 0;
        this.productID = 0;
    }

    // Parameterized Constructor
    public OrderDetails(int detailID, double price, int quantity, int orderID, int productID) {
        this.detailID = detailID;
        this.price = price;
        this.quantity = quantity;
        this.orderID = orderID;
        this.productID = productID;
    }

    // Getters and Setters
    public int getDetailID() {
        return detailID;
    }

    public void setDetailID(int detailID) {
        this.detailID = detailID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    // Override toString() method for debugging
    @Override
    public String toString() {
        return "OrderDetails{" +
                "detailID=" + detailID +
                ", price=" + price +
                ", quantity=" + quantity +
                ", orderID=" + orderID +
                ", productID=" + productID +
                '}';
    }
}
