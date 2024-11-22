
package molecules;

import java.util.ArrayList;
import java.util.Scanner;


public class Main {

    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ArrayList<Molecule> molecules = new ArrayList<>();

        System.out.println("Enter the number of molecules: ");
        int numberOfMolecules = scanner.nextInt();
        scanner.nextLine();

        for (int i = 1; i <= numberOfMolecules; i++) {
            System.out.println("Enter details for molecule " + i + ":");

            System.out.print("Structure: ");
            String structure = scanner.nextLine();

            System.out.print("Name: ");
            String name = scanner.nextLine();

            System.out.print("Weight: ");
            float weight = scanner.nextFloat();
            scanner.nextLine();   //clear input buffer

            Molecule molecule = new Molecule(structure, name, weight);
            molecules.add(molecule);
        }

        // Display the molecular information
        System.out.printf("%-15s %-30s %-10s\n", "Structure", "Name", "Weight");
        System.out.println("---------------------------------------------------------------");

        for (Molecule molecule : molecules) {
            molecule.display();
        }

        scanner.close();
        
    }
    
}
