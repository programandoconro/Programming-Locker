package com.utils

import okhttp3.*
import okhttp3.MediaType.Companion.toMediaTypeOrNull
import okhttp3.RequestBody.Companion.toRequestBody
import java.io.IOException

private val client = OkHttpClient()
private const val url:String = "your_api_server_url"

fun get() {
    val request = Request.Builder()
        .url(url)
        .build()

    client.newCall(request).execute().use { response ->
        if (!response.isSuccessful) throw IOException("Unexpected code $response")

        for ((name, value) in response.headers) {
            println("$name: $value")
        }

        println(response.body!!.string())
    }


}

fun post(data:String) {
    val json = "{\"Data\":\"$data\"}"
    val requestBody = json.toRequestBody("application/json".toMediaTypeOrNull())

    val request = Request.Builder()
        .method("POST", requestBody)
        .url(url)
        .build()
    client.newCall(request).enqueue(object : Callback {
        override fun onFailure(call: Call, e: IOException) {
            println("FAIL POST")
        }

        override fun onResponse(call: Call, response: Response) {
            println("POST: ${response.message}, $response")
        }
    })
