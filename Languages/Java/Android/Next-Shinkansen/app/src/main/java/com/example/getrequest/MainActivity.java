package com.example.getrequest;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import com.android.volley.NetworkResponse;
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

    public void httpRequest(String url, String destination) {
        RequestQueue queue = Volley.newRequestQueue(this);
        StringRequest stringRequest = new StringRequest(Request.Method.GET, url,
                new Response.Listener<String>() {
                    public void onResponse(String response) {
                        TextView te = findViewById(R.id.text);
                        String r = response.substring(1,response.length() - 2).replace("\"","");
                        te.setText("Next Shinkansen to " + destination + " are in: " + r + " hrs:mins:secs");


                    }


                }, new Response.ErrorListener() {

            public void onErrorResponse(VolleyError error) {
                TextView te = findViewById(R.id.text);
                te.setText("That didn't work!");
            }


        });
        queue.add(stringRequest);

    }

    public void onGoHakata(View v) {
        String URL_GO_HAKATA = "https://next-shinkansen.herokuapp.com/hakataminami-hakata";
        String destination = "Hakata-station";
        httpRequest(URL_GO_HAKATA, destination);

    }

    public void onGoHome(View v) {
        String URL_GO_HOME = "https://next-shinkansen.herokuapp.com/hakata-hakataminami";
        String destination = "my home";
        httpRequest(URL_GO_HOME, destination);

    }

}