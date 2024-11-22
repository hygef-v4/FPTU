package bubblesort;

import java.util.Random;
import java.util.Scanner;

public class Ultility {

    static void bubbleSort(int arr[]) {
        int n = arr.length;
        int i, j, temp;
        for (i = 0; i < n - 1; i++) {
            for (j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    // Swap arr[j] and arr[j+1]
                    temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }

    static int getIntInRange(int min, int max) {
        Scanner scanner = new Scanner(System.in);
        int result;
        do {
            try {
                String input = scanner.nextLine();
                result = Integer.parseInt(input);
                if (result < min || result > max) {
                    System.err.println("Input is out of range! Please try again!");
                    continue;
                }
                return result;
            } catch (Exception e) {
                System.err.println("Invalid input ! Please try again!");
            }
        } while (true);
    }

    static int[] intRandomizer(int[] arr) {
        Random rand = new Random();
        int n = arr.length;
        for (int i = 0; i < n; i++) {
            arr[i] = rand.nextInt(n);
        }
        return arr;
    }
}
