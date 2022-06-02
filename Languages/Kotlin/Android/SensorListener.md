Right click mouse and create new Service. It will add it to the `AndroidManifest.xml` file. 

Then implement the service and the listener:

`Gsensor.kt`
```
package com.example.myservice

import android.app.Service
import android.content.Context
import android.content.Intent
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.os.IBinder

class Gsensor : Service(), SensorEventListener {

    private lateinit var sensorManager: SensorManager
    private lateinit var gravity: Sensor

    override fun onCreate() {
        super.onCreate()
        sensorManager = getSystemService(Context.SENSOR_SERVICE) as SensorManager
        gravity = sensorManager.getDefaultSensor(Sensor.TYPE_GRAVITY)

        sensorManager.registerListener(this, gravity, SensorManager.SENSOR_DELAY_NORMAL)


    }
    private fun didSensorChange(x: Float, y: Float, z: Float): Boolean {
        return x > 9.0f || x < -9.0f || y > 9.0f || y < -9.0f || z > 9.0f || z < -9.0f
    }

    override fun onSensorChanged(event: SensorEvent?) {
        if (event == null) return
        val x = event.values[0]
        val y = event.values[1]
        val z = event.values[2]

        if(didSensorChange(x,y,z)){
            println("Gsensor: {x: $x, y: $y, z: $z}")

        }

    }

    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {
        //println(accuracy)
    }

    override fun onBind(intent: Intent): IBinder? {
        return null
    }
}
```

Finally, call it on the onResume member of the  MainActivity

`MainActivity.java`

```
   @Override
    public void onResume() {
        super.onResume();
        startService( new Intent(MainActivity.this, Gsensor.class));
     
    
```
