package StudentManagement;
import NumberBaseConverter.*;
import java.util.Scanner;

/*
Inputter: là 1 cái khuôn 
nhưng anh không thích dùng inputter để đúc ra object
mà anh dùng Inputter để lưu những hàm tiện ích hỗ trợ cho việc nhập 

nhưng trong java thì lại không có hàm .-.
*/

public class Inputter {
    public static Scanner sc = new Scanner (System.in);
    
    //Những method hỗ trợ việc nhập 
    //1. method ép người dùng nhập số nguyên chuẩn
    public static int getAnInteger(String inpMsg, String errMsg){
        System.out.println(inpMsg); //hiển thị lời mời
        while(true){
            try{
                int number = Integer.parseInt(sc.nextLine());
                return number;
            }catch (Exception e){
                System.out.println(errMsg); //hiển thị câu chửi
            }
        }
    }
    
    //2. method ép người dùng nhập số nguyên chuẩn nhưng trong khoảng
    public static int getAnInteger(String inpMsg, String errMsg, 
                                int lowerBound, int upperBound){
        if(lowerBound > upperBound){ //dành cho người vô treee
            int tmp = lowerBound;
            lowerBound = upperBound;
            upperBound = tmp;
        }
        System.out.println(inpMsg); //hiển thị lời mời
        while(true){
            try{
                int number = Integer.parseInt(sc.nextLine());
                if(number < lowerBound || number > upperBound){
                    throw new Exception();
                }
                return number;
            }catch (Exception e){
                System.out.println(errMsg); //hiển thị câu chửi
            }
        }
    }
    
    //3. method ép người dùng nhập số thwjc chuẩn
    public static double getADouble(String inpMsg, String errMsg){
        System.out.println(inpMsg); //hiển thị lời mời
        while(true){
            try{
                double number = Double.parseDouble(sc.nextLine());
                return number;
            }catch (Exception e){
                System.out.println(errMsg); //hiển thị câu chửi
            }
        }
    }
    
    //4. method ép người dùng nhập số nguyên chuẩn nhưng trong khoảng
    public static double getADouble(String inpMsg, String errMsg, 
                                double lowerBound, double upperBound){
        if(lowerBound > upperBound){ //dành cho người vô treee
            double tmp = lowerBound;
            lowerBound = upperBound;
            upperBound = tmp;
        }
        System.out.println(inpMsg); //hiển thị lời mời
        while(true){
            try{
                double number = Double.parseDouble(sc.nextLine());
                if(number < lowerBound || number > upperBound){
                    throw new Exception();
                }
                return number;
            }catch (Exception e){
                System.out.println(errMsg); //hiển thị câu chửi
            }
        }
    }
    
    //5. Hàm nhập chuỗi cấm để trống
    public static String getString(String inpMsg, String errMsg){
        System.out.println(inpMsg);
        while(true){
            try{
                String str = sc.nextLine();
                if (str.isEmpty()){
                    throw new Exception();
                }
                return str; 
            }catch (Exception e){
                System.out.println(errMsg);
            }
        }
    }
    
    //6. Hàm nhập chuỗi cấm để trống và phải giống regex
    public static String getString(String inpMsg, String errMsg,
                                    String regex){
        System.out.println(inpMsg);
        while(true){
            try{
                String str = sc.nextLine();
                if (str.isEmpty() || !str.matches(regex)){
                    throw new Exception();
                }
                return str; 
            }catch (Exception e){
                System.out.println(errMsg);
            }
        }
    }
}   


//hàm nhập ngày tháng năm theo chuẩn format 
//f("nhap ngay thang nam nhe: ", "ngu", "DD-MM-YYYY", "YYYY-MM-DD")
//compareDate




