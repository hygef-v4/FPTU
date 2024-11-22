package StudentManagement;

import java.util.HashMap;
import java.util.Map;

public class Student {

    private String id;
    private String studentName;
    private int semester;
    private Map<String, Integer> courses;  // Changed to Map to store courses and their counts

    public Student(String id, String studentName, int semester, String courseName) {
        this.id = id;
        this.studentName = studentName;
        this.semester = semester;
        this.courses = new HashMap<>();
        this.courses.put(courseName.toLowerCase(), 1);  // Initialize with the first course
    }

    public String getId() {
        return id;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public Map<String, Integer> getCourses() {
        return courses;
    }

    public void addCourse(String course) {
        // Ignore case and update the course count
        String courseKey = course.toLowerCase();
        if (this.courses.containsKey(courseKey)) {
            this.courses.put(courseKey, this.courses.get(courseKey) + 1);  // Increase count
            System.out.println("Course \"" + course + "\" already exists. Increased the count to " + this.courses.get(courseKey));
        } else {
            this.courses.put(courseKey, 1);  // Add new course
            System.out.println("New course added: " + course);
        }
    }

    public void removeCourse(String course) {
        // Ignore case when removing a course
        String courseKey = course.toLowerCase();
        if (this.courses.containsKey(courseKey)) {
            int count = this.courses.get(courseKey);
            if (count > 1) {
                this.courses.put(courseKey, count - 1);  // Decrease count
                System.out.println("Decreased the count of course \"" + course + "\" to " + (count - 1));
            } else {
                this.courses.remove(courseKey);  // Remove the course if count is 1
                System.out.println("Course \"" + course + "\" removed.");
            }
        } else {
            System.out.println("Course not found: " + course);
        }
    }

    public void clearCourses() {
        this.courses.clear();
        System.out.println("All courses have been removed.");
    }

    public void printStudent() {
        System.out.printf("%-20s %-10d ", studentName, semester);
        System.out.print("Courses: ");
        for (Map.Entry<String, Integer> entry : courses.entrySet()) {
            System.out.print(entry.getKey() + " (" + entry.getValue() + ") ");
        }
        System.out.println();  // New line after printing courses
    }
}
