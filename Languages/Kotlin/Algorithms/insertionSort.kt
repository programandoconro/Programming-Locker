fun main() {
    val arr: MutableList<Int> = arrayOf(2, 4, 3, 6, 1).toMutableList()
    val sortedList = insertionSort(arr)
    for (value in sortedList) {
        println(value)
    }
}

fun insertionSort(arr: MutableList<Int>): MutableList<Int> {
    var steps = 0

    for (i in 1 until arr.size) {
        val key = arr[i]

        for (j in i - 1 downTo 0) {
            val keyJ = arr[j]

            if (key < keyJ) {
                arr.removeAt(j + 1)
                arr.add(j, key)

                steps++

            }
        }
    }

    println("Steps: $steps")
    return arr

}
