
package bai2;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Student {
    
    private String name;
    private String studentId;
    private Date birthDate;
    private String address;
    private String major;
    private double gpa;

    // Constructor
    public Student(String name, String studentId, Date birthDate, String address, String major, double gpa) {
        this.name = name;
        this.studentId = studentId;
        this.birthDate = birthDate;
        this.address = address;
        this.major = major;
        this.gpa = gpa;
    }

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public double getGpa() {
        return gpa;
    }

    public void setGpa(double gpa) {
        this.gpa = gpa;
    }

    // print all in4
    public void printAllAttributes() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        System.out.println("Student Name: " + name);
        System.out.println("Student ID: " + studentId);
        System.out.println("Birth Date: " + dateFormat.format(birthDate));
        System.out.println("Address: " + address);
        System.out.println("Major: " + major);
        System.out.println("GPA: " + gpa);
    }
}

