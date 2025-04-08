package model;

public class Student {

    private int id;
    private String name, dob;
    private boolean gender;

    public Student(int id, String name, String job, boolean gender) {
        this.id = id;
        this.name = name;
        this.dob = job;
        this.gender = gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getJob() {
        return dob;
    }

    public void setJob(String job) {
        this.dob = job;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

}
