
package atoms;

import java.util.Scanner;

public class Atom {
    private int number;
    private String symbol;
    private String fullName;
    private double weight;

    // default constructor
    Atom(){
        this.number = 0;
        this.symbol = "";
        this.fullName = "";
        this.weight = 0.0;
    }
    // bool accept 0 then break
    public boolean accept(){
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter atomic number : ");
        this.number = scanner.nextInt();

        if(this.number == 0){
            return false;
        }

        System.out.println("Enter symbol: ");
        this.symbol = scanner.next();

        System.out.print("Enter full name : ");
        this.fullName = scanner.next();

        System.out.print("Enter atomic weight : ");
        this.weight = scanner.nextDouble();
        System.out.println();
        return true;
    }
    // display in4

    public void display(){

        System.out.printf("%3d  %-2s  %-10s  %.3f%n", this.number, this.symbol, this.fullName, this.weight);
    }
}
