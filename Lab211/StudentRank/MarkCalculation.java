package StudentRank;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class MarkCalculation {

    // Create student function
    public static Student createStudent(String name, String classes, double maths, double chemistry, double physics) {
        return new Student(name, classes, maths, chemistry, physics);
    }

    // Classify students based on their average
    public static List<Student> averageStudent(List<Student> students) {
        for (Student student : students) {
            // The classification is done during object creation, so no need for extra processing here
        }
        return students;
    }

    // Get percentage of each type
    public static HashMap<String, Double> getPercentTypeStudent(List<Student> students) {
        int totalStudents = students.size();
        HashMap<String, Integer> countMap = new HashMap<>();
        countMap.put("A", 0);
        countMap.put("B", 0);
        countMap.put("C", 0);
        countMap.put("D", 0);

        for (Student student : students) {
            String type = student.getType();
            countMap.put(type, countMap.get(type) + 1);
        }

        HashMap<String, Double> percentageMap = new HashMap<>();
        for (String type : countMap.keySet()) {
            double percent = (countMap.get(type) * 100.0) / totalStudents;
            percentageMap.put(type, percent);
        }

        return percentageMap;
    }

    public static void main(String[] args) {
        List<Student> students = new ArrayList<>();
        students.add(createStudent("Nghia", "FU1", 10, 10, 10));
        students.add(createStudent("Nghia 2", "FU1", 10, 10, 10));

        List<Student> classifiedStudents = averageStudent(students);

        // Display each student's information
        for (Student student : classifiedStudents) {
            System.out.println(student);
        }

        // Get and display student classification statistics
        HashMap<String, Double> stats = getPercentTypeStudent(classifiedStudents);
        System.out.println("\n--------Classification Info -----");
        for (String type : stats.keySet()) {
            System.out.println(type + ": " + String.format("%.1f", stats.get(type)) + "%");
        }
    }
}
