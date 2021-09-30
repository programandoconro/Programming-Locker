package com.example.login;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void loginButton(View v) {
        EditText inputMail = findViewById(R.id.mail);
        EditText inputPassword = findViewById(R.id.password);
        EditText inputCompany = findViewById(R.id.company);

        String mail = inputMail.getText().toString();
        String password = inputPassword.getText().toString();
        String company = inputCompany.getText().toString();

        Log.d("tag", company);
        Log.d("tag", mail);
        Log.d("tag", password);
    }

}
