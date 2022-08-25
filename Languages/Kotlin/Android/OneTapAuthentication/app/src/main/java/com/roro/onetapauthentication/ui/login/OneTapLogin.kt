package com.roro.onetapauthentication.ui.login

import android.app.Activity
import android.content.IntentSender
import com.google.android.gms.auth.api.identity.BeginSignInRequest
import com.google.android.gms.auth.api.identity.Identity
import com.google.android.gms.auth.api.identity.SignInClient

class OneTapLogin(private val activity: Activity) {
    private lateinit var oneTapClient: SignInClient
    private lateinit var signInRequest: BeginSignInRequest
    val requestCode = 4

    fun showDialog() {
        oneTapClient = Identity.getSignInClient(activity)
        signInRequest = BeginSignInRequest.builder()
            .setPasswordRequestOptions(
                BeginSignInRequest.PasswordRequestOptions.builder()
                    .setSupported(true)
                    .build()
            )
            // Automatically sign in when exactly one credential is retrieved.
            //.setAutoSelectEnabled(true)
            .build()

        oneTapClient.beginSignIn(signInRequest)
            .addOnFailureListener { reason ->
                run {
                    println("Failed because $reason")
                }
            }
            .addOnSuccessListener { response ->
                run {
                    try {
                        activity.startIntentSenderForResult(
                            response.pendingIntent.intentSender,
                            requestCode,
                            /* fillInIntent= */ null,
                            /* flagsMask= */ 0,
                            /* flagsValue= */ 0,
                            /* extraFlags= */ 0,
                            /* options= */ null

                        )
                    } catch (e: IntentSender.SendIntentException) {
                        println(e)
                    }
                }
            }

    }

}