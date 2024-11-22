package BinarySearch;

import java.util.*;

public class Main {

    public static void main(String[] args) {
        System.out.println("Enter number of array: ");
        int n = Helper.getIntInRange(1, Integer.MAX_VALUE);

        // declare array
        int[] nums = new int[n];

        // assign random values to array
        nums = Helper.intRandomizer(nums);

        // input positive int 
        System.out.println("Enter search value: ");
        int value = Helper.getIntInRange(1, Integer.MAX_VALUE);

        // sort array 
        Helper.bubbleSort(nums);
        System.out.println("Sorted array: " + Arrays.toString(nums));

        // binary search and return index 
        int indexFind = Helper.binarySearch(nums, value);

        // print 
        if (indexFind == -1) {
            System.out.println("Number not found in array!");
        } else {
            System.out.printf("Found %d at index: %d\n", value, indexFind);
        }
    }
}
