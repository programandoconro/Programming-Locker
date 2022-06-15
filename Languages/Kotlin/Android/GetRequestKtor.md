# Get request with Ktor in Kotlin for Android
## Example using openWeather API and coroutines

Add ktor dependency to gradle: https://medium.com/google-developer-experts/how-to-use-ktor-client-on-android-dcdeddc066b9
Get your openweather api: https://openweathermap.org/api

`Requests.kt`
```
package com.programandoconro.weather

import io.ktor.client.*
import io.ktor.client.request.*
import io.ktor.client.statement.*

class Requests {

    suspend fun getCurrentWeather(lat: String, lon: String): String? {
        val apiKey = "add_your_openweather_api_key_here";
        val url =
            "https://api.openweathermap.org/data/2.5/weather";

        val client = HttpClient()
        var response: HttpResponse? = null
        try {
            response = client.get(url) {
                url {
                    parameters.append("appid", apiKey)
                    parameters.append("lat", lat)
                    parameters.append("lon", lon)
                    parameters.append("units", "metric")

                }
            }
            println(response)
            println("Weather: ${response?.readText()}")

        } catch (e: Exception) {
            println(e)
        }
        
        return response?.readText()
    }
}
```
`MainActivity.kt`
```
package com.programandoconro.weather

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import kotlinx.coroutines.launch
import kotlinx.coroutines.runBlocking

class MainActivity : AppCompatActivity() {
    private val requests = Requests()
    private var lat = "33.5858"
    private val lon = "130.432"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        runBlocking {
            launch {
                requests.getCurrentWeather(lat, lon)
            }
        }

    }
}
```

You can check the Logcat for your response.
