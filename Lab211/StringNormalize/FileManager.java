
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;


public class FileManager {
    private String inputFile;
    private String outputFile;

    // Constructor to initialize file paths
    public FileManager(String inputFile, String outputFile) {
        this.inputFile = inputFile;
        this.outputFile = outputFile;
    }

    public String getInputFile() {
        return inputFile;
    }

    public void setInputFile(String inputFile) {
        this.inputFile = inputFile;
    }

    public String getOutputFile() {
        return outputFile;
    }

    public void setOutputFile(String outputFile) {
        this.outputFile = outputFile;
    }

    // Method to read content from the input file
    public String readFile() throws IOException {
        String content = "";
        try (BufferedReader reader = new BufferedReader(new FileReader(inputFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    content += line + "\n";
                }
            }
            content = content.trim();
        } catch (IOException e) {
            throw new IOException("Error reading input file: " + e.getMessage());
        }
        return content;
    }

    // Method to write content to the output file
    public void writeFile(String content) throws IOException {
        try (FileWriter writer = new FileWriter(outputFile)) {
            writer.write(content);
        } catch (IOException e) {
            throw new IOException("Error writing to output file: " + e.getMessage());
        }
    }
}