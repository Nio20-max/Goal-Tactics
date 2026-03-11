package com.goaltactics.app.ui.shell

import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.AdapterView
import android.widget.FrameLayout
import android.widget.ImageButton
import android.widget.ListView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import com.goaltactics.app.R
import com.goaltactics.app.GoalTacticsApp
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.ui.adapters.NavMenuAdapter
import com.goaltactics.app.ui.fragments.*
import com.goaltactics.app.ui.login.LoginActivity
import kotlinx.coroutines.launch

class MainActivity : AppCompatActivity() {

    private lateinit var navMenu: ListView
    private lateinit var topBar: TextView
    private lateinit var contentFrame: FrameLayout
    private lateinit var loadingOverlay: FrameLayout
    private lateinit var textMedipacks: TextView
    private lateinit var textStars: TextView
    private lateinit var textMoney: TextView
    private lateinit var btnBack: ImageButton
    private lateinit var btnChat: ImageButton

    private val navItems = listOf(
        // Shop section
        NavItem("Shop", 0, "", isSection = true),
        NavItem("SHOP", R.id.nav_shop, "menu_shop_logo"),
        NavItem("VIDEO", R.id.nav_video, "menu_videos"),
        // Club management section
        NavItem("Club management", 0, "", isSection = true),
        NavItem("CLUB", R.id.nav_club, "menu_team"),
        NavItem("FINANCES", R.id.nav_finances, "menu_finance"),
        NavItem("STADIUM", R.id.nav_stadium, "menu_stadium"),
        NavItem("EQUIPMENT", R.id.nav_equipment, "menu_emblem_jersey"),
        // Team management section
        NavItem("Team Management", 0, "", isSection = true),
        NavItem("SQUAD", R.id.nav_squad, "menu_player"),
        NavItem("LINEUP", R.id.nav_lineup, "menu_formation"),
        NavItem("TRAINING", R.id.nav_training, "menu_training"),
        NavItem("SCOUTING", R.id.nav_scouting, "menu_youth"),
        NavItem("TRANSFER MARKET", R.id.nav_transfer, "menu_transfermarket"),
        // Matches section
        NavItem("Matches", 0, "", isSection = true),
        NavItem("LEAGUE", R.id.nav_league, "menu_league"),
        NavItem("GT LADDER", R.id.nav_ladder, "menu_ladder"),
        NavItem("FRIENDS", R.id.nav_friends, "menu_friends"),
        NavItem("LIVE", R.id.nav_live, "menu_live"),
        // Other section
        NavItem("Other", 0, "", isSection = true),
        NavItem("SUPPORT", R.id.nav_support, "menu_support"),
        NavItem("SETTINGS", R.id.nav_settings, "menu_settings")
    )

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Bind views manually (no view binding since layout changed)
        navMenu = findViewById(R.id.navMenu)
        topBar = findViewById(R.id.topBar)
        contentFrame = findViewById(R.id.contentFrame)
        loadingOverlay = findViewById(R.id.loadingOverlay)
        textMedipacks = findViewById(R.id.textMedipacks)
        textStars = findViewById(R.id.textStars)
        textMoney = findViewById(R.id.textMoney)
        btnBack = findViewById(R.id.btnBack)
        btnChat = findViewById(R.id.btnChat)

        setupNavigation()
        setupBottomBar()

        if (savedInstanceState == null) {
            navigateTo(ClubFragment(), "Club")
            navMenu.setItemChecked(0, true)
        }

        refreshResources()
    }

    private fun setupNavigation() {
        navMenu.adapter = NavMenuAdapter(this, navItems)
        navMenu.onItemClickListener = AdapterView.OnItemClickListener { _, _, position, _ ->
            onNavItemSelected(navItems[position])
            navMenu.setItemChecked(position, true)
        }
    }

    private fun setupBottomBar() {
        btnBack.setOnClickListener {
            onBackPressedDispatcher.onBackPressed()
        }

        btnChat.setOnClickListener {
            navigateTo(ChatFragment(), "Chat")
        }

        // Medipacks/Stars buttons go to shop
        findViewById<View>(R.id.medipacksButton)?.setOnClickListener {
            navigateTo(ShopFragment(), "Shop")
        }
        findViewById<View>(R.id.starsButton)?.setOnClickListener {
            navigateTo(ShopFragment(), "Shop")
        }
    }

    private fun onNavItemSelected(item: NavItem) {
        if (item.isSection) return
        val fragment: Fragment = when (item.id) {
            R.id.nav_club -> ClubFragment()
            R.id.nav_squad -> SquadFragment()
            R.id.nav_lineup -> LineupFragment()
            R.id.nav_training -> TrainingFragment()
            R.id.nav_scouting -> ScoutingFragment()
            R.id.nav_transfer -> TransferFragment()
            R.id.nav_stadium -> StadiumFragment()
            R.id.nav_finances -> FinancesFragment()
            R.id.nav_equipment -> ShopFragment() // Equipment reuses shop for now
            R.id.nav_league -> LeagueFragment()
            R.id.nav_ladder -> LadderFragment()
            R.id.nav_friends -> FriendsFragment()
            R.id.nav_live -> LiveFragment()
            R.id.nav_chat -> ChatFragment()
            R.id.nav_shop -> ShopFragment()
            R.id.nav_video -> ShopFragment() // Video reuses shop for now
            R.id.nav_support -> ChatFragment() // Support opens chat/mail
            R.id.nav_settings -> SettingsFragment()
            R.id.nav_mail -> MailFragment()
            else -> ClubFragment()
        }
        navigateTo(fragment, item.title)
    }

    fun navigateTo(fragment: Fragment, title: String) {
        topBar.text = title
        supportFragmentManager.beginTransaction()
            .replace(R.id.contentFrame, fragment)
            .addToBackStack(null)
            .commit()
    }

    fun refreshResources() {
        lifecycleScope.launch {
            try {
                val response = ApiClient.get().getMyResources()
                if (response.isSuccessful) {
                    response.body()?.let { res ->
                        textMedipacks.text = res.medipacks.toInt().toString()
                        textStars.text = res.gtStars.toInt().toString()
                        textMoney.text = formatMoney(res.money.toLong())
                    }
                }
            } catch (_: Exception) { }
        }
    }

    fun showLoading(show: Boolean) {
        loadingOverlay.visibility = if (show) View.VISIBLE else View.GONE
    }

    fun logout() {
        GoalTacticsApp.instance.tokenManager.clear()
        GoalTacticsApp.instance.chatHubClient.disconnect()
        GoalTacticsApp.instance.auctionHubClient.disconnect()
        startActivity(Intent(this, LoginActivity::class.java))
        finish()
    }

    private fun formatMoney(amount: Long): String {
        return when {
            amount >= 1_000_000 -> String.format("%.1fM", amount / 1_000_000.0)
            amount >= 1_000 -> String.format("%.1fK", amount / 1_000.0)
            else -> amount.toString()
        }
    }

    @Suppress("DEPRECATION")
    override fun onBackPressed() {
        if (supportFragmentManager.backStackEntryCount > 1) {
            supportFragmentManager.popBackStack()
        } else {
            super.onBackPressed()
        }
    }

    data class NavItem(val title: String, val id: Int, val iconName: String, val isSection: Boolean = false)
}
