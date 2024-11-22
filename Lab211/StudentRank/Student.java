
package StudentRank;

public class Student {
    private String name;
    private String classes;
    private double maths;
    private double chemistry;
    private double physics;
    private double average;
    private String type;

    // Constructor
    public Student(String name, String classes, double maths, double chemistry, double physics) {
        this.name = name;
        this.classes = classes;
        this.maths = maths;
        this.chemistry = chemistry;
        this.physics = physics;
        calculateAverage();
        classifyStudent();
    }

    // Calculate average marks
    private void calculateAverage() {
        this.average = (maths + chemistry + physics) / 3;
    }

    // Classify student based on average
    private void classifyStudent() {
        if (average > 7.5) {
            this.type = "A";
        } else if (average >= 6) {
            this.type = "B";
        } else if (average >= 4) {
            this.type = "C";
        } else {
            this.type = "D";
        }
    }

    // Getter methods
    public String getType() {
        return type;
    }

    public double getAverage() {
        return average;
    }

    @Override
    public String toString() {
        return "Name: " + name + "\nClass: " + classes + "\nAVG: " + String.format("%.1f", average) + "\nType: " + type;
    }
}

