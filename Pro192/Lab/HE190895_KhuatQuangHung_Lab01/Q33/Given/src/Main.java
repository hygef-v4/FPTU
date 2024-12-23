// ======= DO NOT EDIT MAIN FUNCTION ============
import java.io.*;
import java.util.*;


class Main
{
   public static double[] loadData(int k)  //do not edit this function
   {int n = Lib.readLineToInt("../Testcases/data.txt", k);
   double[] arr = new double[n];
       arr = Lib.readLineToDoubleArray("../Testcases/data.txt", k+1);
   return arr;
   }
    

    public static Double[] f1(double[] sequence) {
        Double[] kq = new Double[2]; //kq[0] = position, kq[1] = second largest number
        
        //#######################################
        //Your code here.
       double largest = Double.NEGATIVE_INFINITY;
        double secondLargest = Double.NEGATIVE_INFINITY;
        int position = -1;
        
        // Find the largest and second largest numbers
        for (int i = 0; i < sequence.length; i++) {
            if (sequence[i] > largest) {
                secondLargest = largest;
                largest = sequence[i];
            } else if (sequence[i] > secondLargest && sequence[i] != largest) {
                secondLargest = sequence[i];
            }
        }
                // Find the position of the second largest number
        for (int i = 0; i < sequence.length; i++) {
            if (sequence[i] == secondLargest) {
                position = i +1;
                break;
            }
        }
        //Integer.parseInt(kq[0])= position; 
            kq[0] = (double) position;
        kq[1] = secondLargest; 


	

        //#######################################
        
        return kq;
    }
   public static void main(String args[]) throws Exception //do not edit this function
   {
       BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
       
       System.out.print("Enter the number of elements (n): ");
       int n = Integer.parseInt( in.readLine());
       
       double[] sequence = new double[n];
        System.out.println("Enter the sequence of real numbers:");
        for (int i = 0; i < n; i++) {
            sequence[i] = Double.parseDouble( in.readLine());
        }
       System.out.println("OUTPUT:");
       System.out.println("The Second Largest in position: " + f1(sequence)[0].intValue());
       System.out.println("The Second Largest is: " + f1(sequence)[1]);
       //------------------------------------------------
       double arr1[] = loadData(0);
       double arr2[] = loadData(2);
       double arr3[] = loadData(4);
       String fname1 = "../Testcases/f1.sys";
       String fname2 = "../Testcases/f2.sys";
       String fname3 = "../Testcases/f3.sys";
       File g123 = new File(fname1);
       if(g123.exists()) g123.delete();
       RandomAccessFile  f = new RandomAccessFile(fname1, "rw"); 
       for (double a: f1(arr1)) f.writeBytes(a + " ");
       f.writeBytes("\n");
       for (double a: f1(arr2)) f.writeBytes(a + " ");
       f.writeBytes("\n");
       for (double a: f1(arr3)) f.writeBytes(a + " ");
       f.close();
       //-------------------------------------------------
   }
 }
