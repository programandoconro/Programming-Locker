package com.example.gsensor;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;


import android.widget.TextView;


public class Gyroscope {

    // create an interface with one method
    public interface Listener {
        // create method with all 3
        // axis translation as argument
        void onRotation(float tx, float ty, float ts);
    }

    // create an instance
    private Listener listener;

    // method to set the instance
    public void setListener(Listener l) {
        listener = l;
    }

    private SensorManager sensorManager;
    private Sensor sensor;
    private SensorEventListener sensorEventListener;

    // create constructor with context as argument
    Gyroscope(Context context) {

        // create instance of sensor manager
        sensorManager = (SensorManager) context.getSystemService(Context.SENSOR_SERVICE);

        // create instance of sensor with type gyroscope
        sensor = sensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE);

        // create the sensor listener
        sensorEventListener = new SensorEventListener() {

            // this method is called when
            // the device's position changes
            @Override
            public void onSensorChanged(SensorEvent sensorEvent) {
                // check if listener is different from null
                if (listener != null) {
                    // pass the three floats in listener on rotation of axis
                    listener.onRotation(sensorEvent.values[0], sensorEvent.values[1], sensorEvent.values[2]);
                    if(sensorEvent.values[0] != 0.0 || sensorEvent.values[1] != 0.0 || sensorEvent.values[2] != 0.0  ) {




                        System.out.println("x: " + sensorEvent.values[0]);
                        System.out.println("y: " + sensorEvent.values[1]);
                        System.out.println("z: " + sensorEvent.values[2]);
                    }
                }
            }

            @Override
            public void onAccuracyChanged(Sensor sensor, int i) {

            }
        };
    }

    // create register method
    // for sensor notifications
    public void register() {
        // call sensor manger's register listener and pass the required arguments
        sensorManager.registerListener(sensorEventListener, sensor, SensorManager.SENSOR_DELAY_NORMAL);
    }

    // create method to unregister
    // from sensor notifications
    public void unregister() {
        // call sensor manger's unregister listener
        // and pass the required arguments
        sensorManager.unregisterListener(sensorEventListener);
    }
}
