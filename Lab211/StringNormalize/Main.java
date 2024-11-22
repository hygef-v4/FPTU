
import java.io.IOException;
import java.util.Scanner;


public class Main {
    public static void main(String[] args) {
        // Define input and output file paths
        while (true) {
            Scanner sc = new Scanner(System.in);
            System.out.print("Enter file name to read: ");
            String inputFile = sc.nextLine().trim();
            String outputFile = "output.txt";

            // Create instances of FileManager and TextNormalizer
            FileManager fileManager = new FileManager(inputFile, outputFile);
            TextNormalizer textNormalizer = new TextNormalizer();

            try {
                // Read the content from the input file
                String content = fileManager.readFile();

                // Normalize the content
                String normalizedText = textNormalizer.normalize(content);

                // Write the normalized content to the output file
                fileManager.writeFile(normalizedText);

                System.out.println("Text normalization completed");
                break;
            } catch (IOException e) {
                // Handle exceptions such as file not found or IO errors
                System.err.println("An error occurred: " + e.getMessage());
            }
        }        
    }
}
