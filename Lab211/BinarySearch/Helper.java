package BinarySearch;

import java.util.Random;
import java.util.Scanner;

public class Helper {

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

    static int binarySearch(int[] arr, int value) {
        int n = arr.length;
        int left = 0;
        int right = n - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;
            if (arr[mid] == value) {
                return mid;
            } else if (value > arr[mid]) {
                left = mid + 1;

            } else {
                right = mid - 1;

            }
        }
        return -1; // value not found 
    }

    static int linearSearch(int[] arr, int value) {
        for (int i = 0; i < arr.length; i++) {
            if (value == arr[i]) {
                return i;
            }
        }
        return -1;
    }
}
