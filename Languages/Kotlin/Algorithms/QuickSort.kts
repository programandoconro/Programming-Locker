import java.util.Collections

fun divide(arr: List<Int>, start:Int, end:Int): Int{

    val pivot: Int = arr[end];
    var nextPivotIndex: Int = start-1;

    for(i in start..end){
        val currentValue: Int = arr[i];

        if(currentValue<pivot){
            nextPivotIndex++;
            Collections.swap(arr,nextPivotIndex, i)
        }
    }
    Collections.swap(arr, nextPivotIndex+1, end);
    return nextPivotIndex+1;

}

fun conquer(arr: List<Int>, start:Int, end:Int): List<Int>{
    if(start<end){
        val newPivotIndex: Int = divide(arr, start,end);
        conquer(arr, start, newPivotIndex-1);
        conquer(arr, newPivotIndex+1, end);
    }
    return arr;
}

fun quickSort(){
    val arr: List<Int> = listOf(2,8,7,1,3,5,6,4);
    val start = 0;
    val end: Int = arr.size -1;

    val result: List<Int> = conquer(arr,start, end);

    println(result);

}

quickSort();
