package com.roro.writetolocal

import android.content.Context
import java.lang.Exception

class WriteReadToLocalStorage(private val context: Context) {

    fun writeToFile(fileName: String, content: String) {
        context.openFileOutput(fileName, Context.MODE_PRIVATE)
            .use {
                it.write(content.toByteArray())
            }
    }

    fun readFile(fileName: String) {
        println("Reading file:")
        context.openFileInput(fileName).readBytes().map {
            try {
                println(it.toInt().toChar())
            } catch (e: Exception) {
                println(e)
            }
        }

    }
}
