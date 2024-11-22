// ======= DO NOT EDIT MAIN FUNCTION ============
import java.io.*;
import java.util.*;


class Main
{
   public static String sys_str, sys_substr;
    
    public static void loadData(int k)  //do not edit this function
   {sys_str = Lib.readLineToStr("../Testcases/data.txt", k);
    sys_substr = Lib.readLineToStr("../Testcases/data.txt", k + 1);
   
   }
    

    public static String f1(String str, String substr) {
        
        String res = "";
        
        //#######################################

        //Your code here.
                // Check if the substring exists 
        if (!str.contains(substr)) {
            return substr + " not found!";
        }
        
        // Remove the substring     // 
        String modifiedStr = str.replaceAll(substr, "").trim();
      
        // store string in array 
        String[] words = modifiedStr.split(" ");

        StringBuilder stringStore = new StringBuilder();
        
        for (String word : words) {
            if (!word.isEmpty()) {
                stringStore.append(word).append(" ");
            }
        }
     
        // Remove the trailing space
        res = stringStore.toString().trim();
        return res;

        //#######################################
        
}  
        
    
   public static void main(String args[]) throws Exception //do not edit this function
   {
       BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
       
       System.out.print("Enter the main string: ");
       String str2 = in.readLine();
       
       System.out.print("Enter the sub-string: ");
       String substr2 = in.readLine();
       
        
       System.out.println("OUTPUT:");
       System.out.println(f1(str2,substr2));
       //------------------------------------------------
       loadData(0);
       String fname = "../Testcases/f1.txt";
       File g123 = new File(fname);
       if(g123.exists()) g123.delete();
       RandomAccessFile  f = new RandomAccessFile(fname, "rw"); 
       f.writeBytes(f1(sys_str,sys_substr));
       f.writeBytes("\n");
       loadData(2);
       f.writeBytes(f1(sys_str,sys_substr));
       f.close();
       //-------------------------------------------------
   }
 }
