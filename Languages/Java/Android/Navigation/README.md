# Navigate between pages in Android with Java

3 steps:
 * Create button in main activity to navigate to a new activity.
 * Create a new activity and a button inside to return to main activity. Right click on project folder, ``New``, ``Activity``, ``Empty Activity``
 * Create the methods to navigate using ``Intent``:
 ```
 Intent i = new Intent(this, ****ACTIVITYNAME*****.class);
        startActivity(i);
```
## This is the simplest example: 

### MainActivity.java
```
package com.example.nav;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
    public void goToNext(View v) {
        Intent i = new Intent(this, NextPage.class);
        startActivity(i);
    }
}
```
### activity_main.xml:
```
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/next"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Next"
        android:onClick="goToNext"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />
</androidx.constraintlayout.widget.ConstraintLayout>
```

Create a new activity, right click on project folder, ``New``, ``Activity``, ``Empty Activity``. Give it a name, for example ``NextPage.java``

### NextPage.java: 

```
package com.example.nav;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class NextPage extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_next_page);
    }
    public void goBack (View v) {
        Intent i = new Intent(this, MainActivity.class);
        startActivity(i);
    }
}
```
### activity_next_page.xml
```
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".NextPage">

    <Button
        android:id="@+id/back"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:onClick="goBack"
        android:text="Back"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />
</androidx.constraintlayout.widget.ConstraintLayout>
```

# Navigate to a page with kotlin:

Add a click listener and create an intent inside of it. Pretty simple.

```
class DataActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_data)
        val navToMain:Button = findViewById(R.id.nav_to_main)
        navToMain.setOnClickListener {
            val intent = Intent(this@DataActivity, MainActivity::class.java)
            startActivity(intent)
        }
    }

}
```
