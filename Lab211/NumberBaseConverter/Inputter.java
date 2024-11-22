package NumberBaseConverter;

import java.util.Scanner;

public class Inputter {

    public static Scanner sc = new Scanner(System.in);

    //Những method hỗ trợ việc nhập 
    //1. method ép người dùng nhập số nguyên chuẩn
    public static int getAnInteger(String inpMsg, String errMsg) {
        System.out.println(inpMsg); //hiển thị lời mời
        while (true) {
            try {
                int number = Integer.parseInt(sc.nextLine());
                return number;
            } catch (Exception e) {
                System.out.println(errMsg); //hiển thị câu chửi
            }
        }
    }

    //2. method ép người dùng nhập số nguyên chuẩn nhưng trong khoảng
    public static int getAnInteger(String inpMsg, String errMsg,
            int lowerBound, int upperBound) {
        if (lowerBound > upperBound) { //dành cho người vô treee
            int tmp = lowerBound;
            lowerBound = upperBound;
            upperBound = tmp;
        }
        System.out.println(inpMsg); //hiển thị lời mời
        while (true) {
            try {
                int number = Integer.parseInt(sc.nextLine());
                if (number < lowerBound || number > upperBound) {
                    throw new Exception();
                }
                return number;
            } catch (Exception e) {
                System.out.println(errMsg); //hiển thị câu chửi
            }
        }
    }

    //3. method ép người dùng nhập số thwjc chuẩn
    public static double getADouble(String inpMsg, String errMsg) {
        System.out.println(inpMsg); //hiển thị lời mời
        while (true) {
            try {
                double number = Double.parseDouble(sc.nextLine());
                return number;
            } catch (Exception e) {
                System.out.println(errMsg); //hiển thị câu chửi
            }
        }
    }

    //4. method ép người dùng nhập số nguyên chuẩn nhưng trong khoảng
    public static double getADouble(String inpMsg, String errMsg,
            double lowerBound, double upperBound) {
        if (lowerBound > upperBound) { //dành cho người vô treee
            double tmp = lowerBound;
            lowerBound = upperBound;
            upperBound = tmp;
        }
        System.out.println(inpMsg); //hiển thị lời mời
        while (true) {
            try {
                double number = Double.parseDouble(sc.nextLine());
                if (number < lowerBound || number > upperBound) {
                    throw new Exception();
                }
                return number;
            } catch (Exception e) {
                System.out.println(errMsg); //hiển thị câu chửi
            }
        }
    }

    //5. Hàm nhập chuỗi cấm để trống
    public static String getString(String inpMsg, String errMsg) {
        System.out.println(inpMsg);
        while (true) {
            try {
                String str = sc.nextLine();
                if (str.isEmpty()) {
                    throw new Exception();
                }
                return str;
            } catch (Exception e) {
                System.out.println(errMsg);
            }
        }
    }

    //6. Hàm nhập chuỗi cấm để trống và phải giống regex
    public static String getString(String inpMsg, String errMsg,
            String regex) {
        System.out.println(inpMsg);
        while (true) {
            try {
                String str = sc.nextLine();
                if (str.isEmpty() || !str.matches(regex)) {
                    throw new Exception();
                }
                return str;
            } catch (Exception e) {
                System.out.println(errMsg);
            }
        }
    }

//    public static int getBase(String msg, String err) {
//        while (true) 
//        try {
//
//            int base = Integer.parseInt(sc.nextLine());
//            if (base == 2 || base == 10 || base == 16) {
//                return base;
//            }
//        } catch (Exception e) {
//            System.err.println("Invalid base! Please try again!");
//        }
//
//    }
//
//    public static String getValue(String msg, String err, int base) {
//        while (true) {
//            try {
//                System.out.println(msg);
//                String value = sc.nextLine();
//                switch (base) {
//                    case 2:
//                        if (value.matches("[0-1]+")) {
//                            return value;
//                        }
//                        break;
//                    case 10:
//                        if (value.matches("[0-9]+")) {
//                            return value;
//                        }
//                        break;
//                    case 16:
//                        if (value.matches("[0-9a-fA-F]+")) {
//                            return value;
//                        }
//                        break;
//                }
//            } catch (Exception e) {
//                System.err.println(err);
//            }
//
//        }
//
//    }
}
