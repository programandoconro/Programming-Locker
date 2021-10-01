package com.example.getrequest;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }

    String url = "https://api.github.com/users/programandoconro";

    public String httpRequest() {
        RequestQueue queue = Volley.newRequestQueue(this);


        RequestQueue requestQueue = Volley.newRequestQueue(this);
        StringRequest stringRequest = new StringRequest(Request.Method.GET, url,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        TextView te = findViewById(R.id.text);
                        te.setText("Response is: " + response.substring(0, 500));
                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                TextView te = findViewById(R.id.text);
                te.setText("That didn't work!");
            }
        });

        queue.add(stringRequest);

        return url;
    }


    public void onRequest(View v) {

        String res = httpRequest();
        TextView te = findViewById(R.id.text);
        te.setText(res);
        Log.d("tag", res);

    }
}
