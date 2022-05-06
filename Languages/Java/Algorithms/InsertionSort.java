import java.util.ArrayList;
import java.util.List;

// My try:
public class Solution {
    public static List<Integer> insertionSort(List<Integer> a) {

        for (int i = 1; i < a.size(); i++) {
            int key = a.get(i);
            System.out.println(key);

            // {5,1,7,3,8,4,6,2,9};

            for (int j = i - 1; j >= 0; j--) {
                int keyJ = a.get(j);
                if (key < keyJ) {
                    a.remove(j + 1);
                    a.add(j, key);
                }
                System.out.println(a);
            }
        }
        return a;
    }


    public static void main(String[] args) {

        List<Integer> c = new ArrayList<>();
        int[] newA = {5, 1, 7, 3, 8, 4, 6, 2, 9};

        for (int ele : newA) c.add(ele);

        List<Integer> solution = insertionSort(c);

        for (int ele : solution) System.out.print(ele + " ");

    }
}
