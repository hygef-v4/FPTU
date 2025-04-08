package Model;

import java.util.ArrayList;
import java.util.List;

public class StudentDataUtil {

    public static List<Student> getStudents() {
        // creaTE STUDENT LIST 
        List<Student> students = new ArrayList<>();
        // add student to list 
        students.add(new Student("Hung", "Quang", "hungsct1702@gmai.com"));
        students.add(new Student("Tuan", "Pham", "tuna123@gmai.com"));
        students.add(new Student("Hoang", "Viet", "hoanghehe@gmai.com"));
        
        // return list 
        return students; 
    }

}
