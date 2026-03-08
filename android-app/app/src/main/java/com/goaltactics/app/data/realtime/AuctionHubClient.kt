package com.goaltactics.app.data.realtime

import com.goaltactics.app.BuildConfig
import com.goaltactics.app.data.auth.TokenManager
import com.microsoft.signalr.HubConnection
import com.microsoft.signalr.HubConnectionBuilder
import com.microsoft.signalr.HubConnectionState
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.util.UUID

class AuctionHubClient(private val tokenManager: TokenManager) {

    private var connection: HubConnection? = null
    private var onBidReceived: ((auctionId: UUID, teamId: UUID, bid: Int, createdAt: String?) -> Unit)? = null

    fun setOnBidReceived(listener: (auctionId: UUID, teamId: UUID, bid: Int, createdAt: String?) -> Unit) {
        onBidReceived = listener
    }

    suspend fun connect() = withContext(Dispatchers.IO) {
        val token = tokenManager.token ?: return@withContext

        connection = HubConnectionBuilder
            .create(BuildConfig.AUCTION_HUB_URL)
            .withAccessTokenProvider(io.reactivex.rxjava3.core.Single.just(token))
            .build()
            .apply {
                on("Bidded", { bidJson: String ->
                    // Parse bid data and invoke callback
                }, String::class.java)

                start().blockingAwait()
            }
    }

    suspend fun subscribe(auctionId: UUID) = withContext(Dispatchers.IO) {
        connection?.send("Subscribe", auctionId.toString())
    }

    suspend fun unsubscribe(auctionId: UUID) = withContext(Dispatchers.IO) {
        connection?.send("Unsubscribe", auctionId.toString())
    }

    suspend fun broadcastBid(auctionId: UUID, bid: Int) = withContext(Dispatchers.IO) {
        connection?.send("BroadcastBid", auctionId.toString(), bid)
    }

    fun disconnect() {
        connection?.stop()
        connection = null
    }

    val isConnected: Boolean
        get() = connection?.connectionState == HubConnectionState.CONNECTED
}
