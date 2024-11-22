package StudentManagement;

import java.util.*;

public class StudentManagement {

    private static ArrayList<Student> students = new ArrayList<>();
    private static Scanner scanner = new Scanner(System.in);

    public static void createStudent() {
        do {
            String id = Inputter.getString("Enter student ID:", "Invalid input! Try again");

            // Check if student ID already exists
            Student existingStudent = null;
            for (Student student : students) {
                if (student.getId().equalsIgnoreCase(id)) {
                    existingStudent = student;
                    break;
                }
            }

            if (existingStudent != null) {
                // Student ID already exists, ask if user wants to add a new course
                System.out.println("Student ID already exists.");
                String input = Inputter.getString("Do you want to add a new course for this student? (Y/N):", "Invalid input! Enter Y or N", "[YyNn]");

                if (input.equalsIgnoreCase("Y")) {
                    String newCourse = Inputter.getString("Enter new course name: ", "Invalid course name!");
                    existingStudent.addCourse(newCourse);
                    System.out.println("New course added successfully.");
                } else {
                    System.out.println("No new course was added for this student.");
                }
            } else {
                // Create a new student
                String name = Inputter.getString("Enter student name:", "Invalid input! Try again");
                int semester = Inputter.getAnInteger("Enter semester 1-9", "Invalid semester!", 1, 9);
                String course = Inputter.getString("Enter Course: ", "Invalid course!");

                Student newStudent = new Student(id, name, semester, course);
                students.add(newStudent);
                System.out.println("New student added successfully.");
            }

            // Check if user wants to continue adding more students
            if (students.size() >= 1) {
                System.out.print("Do you want to continue adding more students? (Y/N): ");
                String input = scanner.next();
                if (!input.equalsIgnoreCase("Y")) {
                    break;
                }
            }
        } while (true);
    }

    public static void findAndSort() {
        String findName = Inputter.getString("Enter part of student name to search", "Student name is not valid", "[a-zA-Z\\s]+").toLowerCase();
        List<Student> foundStudent = new ArrayList<>();
        for (Student student : students) {
            if (student.getStudentName().toLowerCase().contains(findName)) {
                foundStudent.add(student);
            }
        }

        Collections.sort(foundStudent, Comparator.comparing(Student::getStudentName));
        if (foundStudent.size() != 0) {
            System.out.printf("%-20s %-10s %-15s\n", "Student Name", "Semester", "Course Name(s)");
            foundStudent.forEach(student -> student.printStudent());
        } else {
            System.out.println("No student found!");
        }
    }

    public static void updateOrDelete() {
        String id = Inputter.getString("Enter student id:", "Invalid input! Try again");
        Student foundStudent = null;
        for (Student student : students) {
            if (student.getId().equalsIgnoreCase(id)) {
                foundStudent = student;
                System.out.printf("%-20s %-10s %-15s\n", "Student Name", "Semester", "Course Name(s)");
                foundStudent.printStudent();
                break;
            }
        }

        if (foundStudent != null) {
            String choice = Inputter.getString("Do you want to update (U) or delete (D) the student? ", "Choice should be U or D", "[uUdD]");
            if (choice.equalsIgnoreCase("U")) {
                updateStudent(foundStudent);
            } else if (choice.equalsIgnoreCase("D")) {
                students.remove(foundStudent);
                System.out.println("Student deleted.");
            }
        } else {
            System.out.println("Student not found.");
        }
    }

    private static void updateStudent(Student student) {
        String name = Inputter.getString("Enter student name:", "Invalid input! Try again");
        student.setStudentName(name);

        int semester = Inputter.getAnInteger("Enter semester 1-9", "Invalid semester!", 1, 9);
        student.setSemester(semester);

        String option;
        do {
            option = Inputter.getString("Do you want to (A)dd, (R)emove, (C)lear all courses, or (N)o changes? ",
                    "Invalid input! Try again", "[aArRcCnN]");
            if (option.equalsIgnoreCase("A")) {
                String newCourse = Inputter.getString("Enter new course name: ", "Invalid course name!");
                student.addCourse(newCourse);
            } else if (option.equalsIgnoreCase("R")) {
                String courseToRemove = Inputter.getString("Enter course name to remove: ", "Invalid course name!");
                student.removeCourse(courseToRemove);
            } else if (option.equalsIgnoreCase("C")) {
                student.clearCourses();
            } else if (option.equalsIgnoreCase("N")) {
                System.out.println("No changes made to courses.");
            } else {
                System.out.println("Invalid option. Please try again.");
            }
        } while (!option.equalsIgnoreCase("N"));  // Continue until user enters 'N'
    }

    public static void report() {
        // Print the report header
        System.out.printf("%-20s %-10s %-10s\n", "Student Name", "Course", "Total Courses");

        // Iterate through each student and their courses
        for (Student student : students) {
            for (Map.Entry<String, Integer> entry : student.getCourses().entrySet()) {
                String courseName = entry.getKey();
                int courseCount = entry.getValue();
                System.out.printf("%-20s %-10s %-10d\n", student.getStudentName(), courseName, courseCount);
            }
        }
    }

}
