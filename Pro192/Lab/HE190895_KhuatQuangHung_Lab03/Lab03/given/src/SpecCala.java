

 public class SpecCala extends Cala {
    private int color;

    public SpecCala() {
        super("", 0);
        this.color = 0;
    }

    public SpecCala(String owner, int price, int color) {
        super(owner, price);
        this.color = color;
    }

    @Override
    public String toString() {
        return getOwner() + ": " + getPrice() + " " + color;
    }

    public void setData() {
        String[] words = getOwner().split(" ");
        StringBuilder formattedOwner = new StringBuilder();

        for (String word : words) {
            if (!word.isEmpty()) {
                formattedOwner.append(Character.toUpperCase(word.charAt(0)))
                              .append(word.substring(1).toLowerCase())
                              .append(" ");
            }
        }

        // Remove the trailing space
        setOwner(formattedOwner.toString().trim());
    }

    public int getValue() {
        if (color % 2 == 0) {
            return getPrice() + 1;
        } else {
            return getPrice() * 2;
        }
    }
}
        
    

