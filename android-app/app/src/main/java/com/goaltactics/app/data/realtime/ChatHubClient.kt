package com.goaltactics.app.data.realtime

import com.goaltactics.app.BuildConfig
import com.goaltactics.app.data.auth.TokenManager
import com.microsoft.signalr.HubConnection
import com.microsoft.signalr.HubConnectionBuilder
import com.microsoft.signalr.HubConnectionState
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.util.UUID

class ChatHubClient(private val tokenManager: TokenManager) {

    private var connection: HubConnection? = null
    private var onMessageReceived: ((UUID, String?, String?, String?) -> Unit)? = null
    private var onTyping: ((UUID, String?) -> Unit)? = null

    fun setOnMessageReceived(listener: (userId: UUID, userName: String?, text: String?, createdAt: String?) -> Unit) {
        onMessageReceived = listener
    }

    fun setOnTyping(listener: (teamId: UUID, text: String?) -> Unit) {
        onTyping = listener
    }

    suspend fun connect() = withContext(Dispatchers.IO) {
        val token = tokenManager.token ?: return@withContext

        connection = HubConnectionBuilder
            .create(BuildConfig.CHAT_HUB_URL)
            .withAccessTokenProvider(io.reactivex.rxjava3.core.Single.just(token))
            .build()
            .apply {
                on("Post", { teamIdStr: String, messageJson: String ->
                    // Parse from JSON or structured args
                }, String::class.java, String::class.java)

                on("Typing", { teamIdStr: String, text: String ->
                    try {
                        val teamId = UUID.fromString(teamIdStr)
                        onTyping?.invoke(teamId, text)
                    } catch (_: Exception) {}
                }, String::class.java, String::class.java)

                start().blockingAwait()
            }
    }

    suspend fun sendMessage(teamId: UUID, message: String) = withContext(Dispatchers.IO) {
        connection?.send("Post", teamId.toString(), message)
    }

    suspend fun sendTyping(teamId: UUID, text: String) = withContext(Dispatchers.IO) {
        connection?.send("Typing", teamId.toString(), text)
    }

    fun disconnect() {
        connection?.stop()
        connection = null
    }

    val isConnected: Boolean
        get() = connection?.connectionState == HubConnectionState.CONNECTED
}
