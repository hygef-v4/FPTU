
package bai2;
import java.util.Calendar;
import java.util.Date;

public class BAI2 {

   public static void main(String[] args) {

        Student student = new Student("Khuat Quang Hung", "HE190895", new Date(105, Calendar.FEBRUARY, 17), "Thach That - Ha Noi", "Software Engineer", 3.4);

        student.printAllAttributes();

        // change
        student.setName("Quan Nguyen");
        student.setStudentId("He189929");
        student.setBirthDate(new Date(100, Calendar.OCTOBER, 1));    // offset from 1900 -> 100 = year 2000 
        student.setAddress("Ha Bang");
        student.setMajor("Mathematics");
        student.setGpa(3.1);

        System.out.println();
        // verify
        student.printAllAttributes();
    }
    
}
