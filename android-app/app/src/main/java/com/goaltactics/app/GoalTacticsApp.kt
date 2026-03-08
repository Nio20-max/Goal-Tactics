package com.goaltactics.app

import android.app.Application
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.data.auth.TokenManager
import com.goaltactics.app.data.realtime.AuctionHubClient
import com.goaltactics.app.data.realtime.ChatHubClient

class GoalTacticsApp : Application() {

    lateinit var tokenManager: TokenManager
        private set

    lateinit var chatHubClient: ChatHubClient
        private set

    lateinit var auctionHubClient: AuctionHubClient
        private set

    override fun onCreate() {
        super.onCreate()
        instance = this

        tokenManager = TokenManager(this)
        ApiClient.init(tokenManager)
        chatHubClient = ChatHubClient(tokenManager)
        auctionHubClient = AuctionHubClient(tokenManager)
    }

    companion object {
        lateinit var instance: GoalTacticsApp
            private set
    }
}
