package com.example.getrequest;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
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
        showProgressBar(false);

    }


    private void showProgressBar(boolean show) {
        View bar = findViewById(R.id.progressBar);
        if (show) {
            bar.setVisibility(View.VISIBLE);
        }
        if (!show) {
            bar.setVisibility(View.GONE);
        }
    }


    private void httpRequest(String url, String destination) {
        TextView wait = findViewById(R.id.text);
        wait.setText("お待ちください");
        RequestQueue queue = Volley.newRequestQueue(this);
        StringRequest stringRequest = new StringRequest(Request.Method.GET, url,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {

                        TextView textBox = findViewById(R.id.text);
                        String[] r = response.substring(1, response.length() - 2)
                                .replace("\"", "").split(",");

                        textBox.setText(destination + "への次の電車: ");

                        textBox.append(System.getProperty("line.separator"));
                        if (r.length > 0) {
                            for (int i = 1; i < r.length; i++) {
                                textBox.append(r[i]);
                                textBox.append(System.getProperty("line.separator"));
                            }
                            textBox.append("時間:分:秒");
                        }
                        showProgressBar(false);
                    }
                }, error -> {
                    TextView te = findViewById(R.id.text);
                    te.setText("That didn't work!");
                });
        queue.add(stringRequest);
    }


    public void onGoHakata(View v) {
        String URL_GO_HAKATA = "https://next-shinkansen.herokuapp.com/hakataminami-hakata";
        String destination = "博多駅";
        httpRequest(URL_GO_HAKATA, destination);
        showProgressBar(true);

    }


    public void onGoHome(View v) {
        String URL_GO_HOME = "https://next-shinkansen.herokuapp.com/hakata-hakataminami";
        String destination = "自宅";
        httpRequest(URL_GO_HOME, destination);
        showProgressBar(true);

    }

}