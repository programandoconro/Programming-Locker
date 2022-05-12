import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class QuickSortJava_2 {
    static void swap(List<Integer> arr, int i, int j){
        Collections.swap(arr,i,j);
    }

    static int divide(List<Integer> arr, int start, int end){
        // This quicksort algorithm uses the first item as pivot.
        int pivot = arr.get(start);
        int pivotFinalIndex = end + 1;

        for(int i = end; i>=0;i--){
            int valueToCompare = arr.get(i);

            if(valueToCompare > pivot){
                pivotFinalIndex--;
                swap(arr,i,pivotFinalIndex);
            }
        }
        swap(arr, pivotFinalIndex-1, start);
        return pivotFinalIndex -1;
    }

    static List<Integer> conquer(List<Integer> arr, int start, int end){
        if(start<end){
            int pivotNewIndex = divide(arr, start, end);
            conquer(arr, pivotNewIndex +1, end);
            conquer(arr, start, pivotNewIndex -1);
        }
        return arr;
    }

    public static void main(String[] args){
        List<Integer> arr = Arrays.asList(2,8,7,1,3,5,6,4);

        List<Integer> sorted = conquer(arr, 0, arr.size()-1 );

        System.out.println(sorted);
    }

}
