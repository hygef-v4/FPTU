
package molecules;

public class Molecule {
    private String structure;
    private String name;
    private float weight;

    // Default constructor
    public Molecule() {
        this.structure = "";
        this.name = "";
        this.weight = 0.0f;
    }
    public Molecule(String structure, String name, float weight) {
        this.structure = structure;
        this.name = name;
        this.weight = weight;

    }

    // display in4
    public void display() {
        System.out.printf("%-15s %-30s %-10.2f\n", structure, name, weight);
    }
}
