package com.goaltactics.app.data.auth

import android.content.Context
import android.content.SharedPreferences
import android.util.Base64
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import org.json.JSONObject

class TokenManager(context: Context) {

    private val prefs: SharedPreferences

    init {
        val masterKey = MasterKey.Builder(context)
            .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
            .build()

        prefs = EncryptedSharedPreferences.create(
            context,
            "gt_secure_prefs",
            masterKey,
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
        )
    }

    var token: String?
        get() = prefs.getString(KEY_TOKEN, null)
        set(value) = prefs.edit().putString(KEY_TOKEN, value).apply()

    var managerName: String?
        get() = prefs.getString(KEY_MANAGER_NAME, null)
        set(value) = prefs.edit().putString(KEY_MANAGER_NAME, value).apply()

    val isLoggedIn: Boolean
        get() {
            val t = token ?: return false
            if (t.isBlank()) return false
            return !isTokenExpired(t)
        }

    private fun isTokenExpired(jwt: String): Boolean {
        return try {
            val parts = jwt.split(".")
            if (parts.size != 3) return true
            val payload = String(Base64.decode(parts[1], Base64.URL_SAFE or Base64.NO_WRAP))
            val exp = JSONObject(payload).optLong("exp", 0)
            val now = System.currentTimeMillis() / 1000
            now >= exp
        } catch (_: Exception) {
            true
        }
    }

    fun clear() {
        prefs.edit().clear().apply()
    }

    companion object {
        private const val KEY_TOKEN = "jwt_token"
        private const val KEY_MANAGER_NAME = "manager_name"
    }
}
