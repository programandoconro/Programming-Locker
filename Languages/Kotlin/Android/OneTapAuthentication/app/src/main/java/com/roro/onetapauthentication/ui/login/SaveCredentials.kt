package com.roro.onetapauthentication.ui.login

import android.app.Activity
import com.google.android.gms.auth.api.identity.Identity
import com.google.android.gms.auth.api.identity.SavePasswordRequest
import com.google.android.gms.auth.api.identity.SignInPassword


class SaveCredentials(private val activity: Activity) {
    val requestCode = 2 /* unique request id */

    fun savePassword(userId: String, password: String) {
        val signInPassword = SignInPassword(userId, password)
        val savePasswordRequest =
            SavePasswordRequest.builder().setSignInPassword(signInPassword).build()

        Identity.getCredentialSavingClient(activity)
            .savePassword(savePasswordRequest)
            .addOnFailureListener { result ->
                run {
                    println("Failed becase of $result")

                }

            }
            .addOnSuccessListener { result ->
                println("SUCCESS SAVE")
                run {
                    activity.startIntentSenderForResult(
                        result.pendingIntent.intentSender,
                        requestCode,
                        /* fillInIntent= */ null,
                        /* flagsMask= */ 0,
                        /* flagsValue= */ 0,
                        /* extraFlags= */ 0,
                        /* options= */ null

                    )
                }
            }


    }

}