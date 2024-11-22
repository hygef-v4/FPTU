public class Cala {
    private String owner;
    private int price;

    // Constructor
    public Cala(String owner, int price) {
        this.owner = owner;
        this.price = price;
    }

    // Getter for owner
    public String getOwner() {
        return owner;
    }

    // Getter for price
    public int getPrice() {
        return price;
    }

    // Setter for owner
    public void setOwner(String owner) {
        this.owner = owner;
    }

    // toString method
    @Override
    public String toString() {
        return owner + ": " + price;
    }
}
