import java.io.*;
import java.io.IOException;

public class saveFile {

    public static void main(String args[]) {
        // Create a new file
        File file = new File("src/saveFile.txt");

        // Create a new file writer
        FileWriter fw = null;
        try {
            fw = new FileWriter(file);
        } catch (IOException ex) {
            System.out.println("Error");
        }

        // Create a new buffered writer
        BufferedWriter bw = new BufferedWriter(fw);

        // Write to the file
        try {
            bw.write("Hello World");
        } catch (IOException ex) {
            System.out.println("Error");
        }

        // Close the file
        try {
            bw.close();
        } catch (IOException ex) {
            System.out.println("Error");
        }
    }
}
