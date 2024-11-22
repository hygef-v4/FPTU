
package atoms;


import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Atom> atoms = new ArrayList<>();

        while(true){
            Atom atom = new Atom();
            if(!atom.accept()){
                break;
            }
            atoms.add(atom);
        }
        // Display the atomic information
        System.out.println("\n\t\tAtomic Information");
        System.out.println("\t\t==================");

        for (Atom atom : atoms){
            atom.display();
        }
    }
}