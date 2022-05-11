import java.util.*;

class Result {
    int divide(List<Integer> arr, int start, int end) {
        int pivot = arr.get(end);
        int finalPivotPosition = start - 1;

        // Partition into two groups depending on pivot;
        for (int i = start; i < end; i++) {
            int valueToCompare = arr.get(i);

            if (valueToCompare <= pivot) {
                finalPivotPosition++;
                Collections.swap(arr, i, finalPivotPosition);
            }
        }
        // Put pivot in its correct position
        Collections.swap(arr, finalPivotPosition + 1, end);
        return finalPivotPosition + 1;
    }

    List<Integer> quickSort(List<Integer> arr, int start, int end) {

        if (start < end) {

            int newPivotIndex = divide(arr, start, end);
            quickSort(arr, start, newPivotIndex - 1);
            quickSort(arr, newPivotIndex + 1, end);

        }

        return arr;
    }

}

public class QuickSort_1 {
    public static void main(String[] args) {

        List<Integer> arr = Arrays.asList(2, 8, 7, 1, 3, 5, 6, 4);
        Result result = new Result();

        List<Integer> sorted = result.quickSort(arr, 0, arr.size() - 1);

        System.out.print(sorted);


    }
}
