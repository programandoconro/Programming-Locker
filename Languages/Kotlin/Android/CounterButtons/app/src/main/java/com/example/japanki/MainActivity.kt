package com.example.japanki

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import com.google.android.material.snackbar.Snackbar

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        var nextButton: Button = findViewById(R.id.next_button)
        var previousButton: Button = findViewById(R.id.previous_button)
        var tx: TextView = findViewById(R.id.counter)
        var index: Int = 0

        fun showIndex(){
            tx.text = index.toString()

            Snackbar.make(tx, index.toString(), Snackbar.LENGTH_SHORT)
                .show()
        }

        nextButton.setOnClickListener {
            index++
            showIndex()

        }

        previousButton.setOnClickListener {
            index--
            showIndex()

        }


    }



}



