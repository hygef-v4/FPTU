package bubblesort;

import java.util.*;

public class Main {

    public static void main(String[] args) {
        System.out.println("Enter number of array");
        int n = Ultility.getIntInRange(1, Integer.MAX_VALUE);
        int[] nums = new int[n];
        nums = Ultility.intRandomizer(nums); 
        System.out.println("Unsorted array: " + Arrays.toString(nums));
        Ultility.bubbleSort(nums);
        System.out.print("Sorted array: " + Arrays.toString(nums));
    }
}
