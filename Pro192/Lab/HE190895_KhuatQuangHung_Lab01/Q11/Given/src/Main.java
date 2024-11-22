// ======= DO NOT EDIT MAIN FUNCTION ============
import java.io.*;
import java.util.*;

class Main
{
   public static int[] loadData(int k)  //do not edit this function
   {int[] arr = Lib.readLineToIntArray("../Testcases/data.txt", k);
   return arr;
   }
    
    public static int f1(int n){
        int tong = 0;
         //#######################################

        //Your code here.
        tong = (n*(n+1))/2; 
        //#######################################
        return tong;
        
   }
   public static void main(String args[]) throws Exception //do not edit this function
   {
       BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
       
       System.out.print("Enter a integer n: ");
       int n = Integer.parseInt( in.readLine());
       System.out.println("OUTPUT:");
       System.out.println(f1(n));
       //------------------------------------------------
       int arr[] = loadData(0);
       String fname = "../Testcases/f1.sys";
       File g123 = new File(fname);
       if(g123.exists()) g123.delete();
       RandomAccessFile  f = new RandomAccessFile(fname, "rw"); 
       for (int a: arr) f.writeBytes(f1(a) + " ");
       f.close();
       //-------------------------------------------------
   }
 }
