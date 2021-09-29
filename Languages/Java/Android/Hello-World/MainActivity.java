package com.example.buttom_app;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
  
    private static final String TAG = "MyActivity";
    public void logger(String a, String b, String c) {
       
        Log.e(TAG, a);
        Log.e(TAG, b);
        Log.e(TAG, c);
    }
  
    int color = 0;
    String my_text = "hello android";

    public void add(View v) {
        color = color + 1;
        String s = Integer.toString(color);
        String t = findViewById(R.id.textView).toString();
        TextView te = (TextView) findViewById(R.id.textView);
        te.setText(s);
        logger(s, t, my_text);

    }

    public void substract(View v) {
        color = color - 1;
        String s = Integer.toString(color);
        String t = findViewById(R.id.textView).toString();
        TextView te = (TextView) findViewById(R.id.textView);
        te.setText(s);
        logger(s, t, my_text);
    }


}
