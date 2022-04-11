package com.example.gsensor;

import android.os.Bundle;
import android.widget.TextView;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Location;
import android.provider.Settings;
import android.widget.Toast;

import androidx.annotation.NonNull;

import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationResult;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;

public class MainActivity extends Gps {

    FusedLocationProviderClient mFusedLocationClient;

    TextView latitudeTextView;
    TextView longitudeTextView;
    TextView altitudeTextView;
    TextView speedTextView;
    int PERMISSION_ID = 44;

    private Accelerometer accelerometer;
    private Gyroscope gyroscope;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        accelerometer = new Accelerometer(this);
        gyroscope = new Gyroscope(this);
        setContentView(R.layout.activity_main);

        latitudeTextView = findViewById(R.id.latitude);
        longitudeTextView = findViewById(R.id.longitude);
        altitudeTextView = findViewById(R.id.altitude);
        speedTextView = findViewById(R.id.speed);

        mFusedLocationClient = LocationServices.getFusedLocationProviderClient(this);

        getLastLocation();


        accelerometer.setListener(new Accelerometer.Listener() {
            @Override
            public void onTranslation(float tx, float ty, float ts) {
                TextView accData = findViewById(R.id.accelerometerData);
                if (tx > 1.0f) {
                    accData.setText("Acc.: " +  String.valueOf(tx));
                }
                else if (tx < -1.0f) {
                    accData.setText("Acc.: " +  String.valueOf(tx));
                }
            }
        });

        gyroscope.setListener(new Gyroscope.Listener() {
            @Override
            public void onRotation(float rx, float ry, float rz) {
                TextView giroData = findViewById(R.id.gyroscopeData);
                if (ry > 1.0f) {
                    giroData.setText("Gyro.: " +  String.valueOf(ry));
                }
                else if (ry < -1.0f) {
                    giroData.setText("Gyro.: " +  String.valueOf(ry));
                }
            }
        });
    }

    @SuppressLint("MissingPermission")
    public void getLastLocation() {
        if (checkPermissions()) {

            if (isLocationEnabled()) {

                mFusedLocationClient.getLastLocation().addOnCompleteListener(new OnCompleteListener<Location>() {
                    @Override
                    public void onComplete(@NonNull Task<Location> task) {
                        Location location = task.getResult();
                        if (location == null) {
                            requestNewLocationData();
                        } else {
                            latitudeTextView.setText("Lat.: " + location.getLatitude());
                            longitudeTextView.setText("Lng.: " + location.getLongitude());
                            altitudeTextView.setText("Alt.: " + location.getAltitude());
                            speedTextView.setText("Speed: " + location.getSpeed());
                        }
                    }
                });
            } else {
                Toast.makeText(this, "Please turn on" + " your location...", Toast.LENGTH_LONG).show();
                Intent intent = new Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS);
                startActivity(intent);
                System.out.println("False location");
            }
        } else {
            requestPermissions();
        }
    }

    private LocationCallback mLocationCallback = new LocationCallback() {

        @Override
        public void onLocationResult(LocationResult locationResult) {
            Location mLastLocation = locationResult.getLastLocation();
            latitudeTextView.setText("Latitude: " + mLastLocation.getLatitude() + "");
        }
    };
    @Override
    public void
    onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);

        if (requestCode == PERMISSION_ID) {
            if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                getLastLocation();
            }
        }
    }


    @Override
    public void onResume() {
        super.onResume();
        if (checkPermissions()) {
            getLastLocation();
        }
        accelerometer.register();
        gyroscope.register();
    }


    // create on pause method
    @Override
    protected void onPause() {
        super.onPause();

        // this will send notification in
        // both the sensors to unregister
        accelerometer.unregister();
        gyroscope.unregister();
    }
}
