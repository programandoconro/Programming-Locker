class Algorithms {
  
    private static int binarySearch(int left, int right, List<Integer> arr, int target){
        int mid = left + (right-left) /2;
        if(arr.get(mid) == target) return mid;
        if(arr.get(mid) >target) return binarySearch(left, mid-1, arr, target); 
        if(arr.get(mid)<target) return binarySearch(mid+1, right, arr, target);
        return -1; // not found
        
    }

    public static int getIndexWithBinarySearch(int target, List<Integer> arr) {
        int n = arr.size();
        int left = 0;
        int right = n-1;
        
        return binarySearch(left, right, arr, target);
    }

}
