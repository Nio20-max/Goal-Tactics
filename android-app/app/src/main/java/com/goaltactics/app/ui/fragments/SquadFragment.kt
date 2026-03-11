package com.goaltactics.app.ui.fragments

import android.app.AlertDialog
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.R
import com.goaltactics.app.data.model.IdRequest
import com.goaltactics.app.data.model.SquadPlayerData
import com.goaltactics.app.ui.adapters.PlayerAdapter
import com.goaltactics.app.ui.adapters.formatCurrency
import com.goaltactics.app.ui.shell.MainActivity
import com.google.android.material.tabs.TabLayout
import kotlinx.coroutines.launch

class SquadFragment : Fragment() {

    private val adapter = PlayerAdapter { player -> showPlayerDetail(player) }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_squad, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        val recycler = view.findViewById<RecyclerView>(R.id.recyclerPlayers)
        recycler.layoutManager = LinearLayoutManager(context)
        recycler.adapter = adapter
        loadSquad()
    }

    private fun loadSquad() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getSquad()
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        adapter.submitList(data.players.sortedBy { it.position })
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun setRow(view: View, rowId: Int, label: String, value: String) {
        val row = view.findViewById<View>(rowId)
        row.findViewById<TextView>(R.id.textLabel).text = label
        row.findViewById<TextView>(R.id.textValue).text = value
    }

    private fun showPlayerDetail(player: SquadPlayerData) {
        val container = view?.findViewById<ViewGroup>(R.id.playerDetailContainer) ?: return
        container.removeAllViews()

        val detailView = LayoutInflater.from(context).inflate(R.layout.layout_player_detail, container, false)
        container.addView(detailView)

        val tabLayout = detailView.findViewById<TabLayout>(R.id.playerDetailTabs)
        val tabs = listOf("Info", "Details", "Sell", "Skill Cards", "Upgrade")
        tabs.forEach { tabLayout.addTab(tabLayout.newTab().setText(it)) }

        val panels = listOf(
            detailView.findViewById<View>(R.id.panelInfo),
            detailView.findViewById<View>(R.id.panelDetails),
            detailView.findViewById<View>(R.id.panelSell),
            detailView.findViewById<View>(R.id.panelSkillCards),
            detailView.findViewById<View>(R.id.panelUpgrade)
        )

        tabLayout.addOnTabSelectedListener(object : TabLayout.OnTabSelectedListener {
            override fun onTabSelected(tab: TabLayout.Tab) {
                panels.forEachIndexed { i, p -> p.visibility = if (i == tab.position) View.VISIBLE else View.GONE }
            }
            override fun onTabUnselected(tab: TabLayout.Tab) {}
            override fun onTabReselected(tab: TabLayout.Tab) {}
        })

        // Info tab
        detailView.findViewById<TextView>(R.id.textPlayerName).text = player.name ?: "Unknown"
        setRow(detailView, R.id.rowPosition, "Position", player.positionName)
        setRow(detailView, R.id.rowStrength, "Strength", String.format("%.1f", player.strength))
        setRow(detailView, R.id.rowFitness, "Fitness", String.format("%.0f%%", player.fitness))
        setRow(detailView, R.id.rowAge, "Age", "${player.age}")
        setRow(detailView, R.id.rowNationality, "Nationality", player.country ?: "-")
        setRow(detailView, R.id.rowMarketValue, "Market Value", formatCurrency(player.marketValue))
        setRow(detailView, R.id.rowMood, "Talent", "${player.talent}")
        setRow(detailView, R.id.rowSalary, "Salary", formatCurrency(player.salary))
        setRow(detailView, R.id.rowGoals, "Experience", "${player.experience}")
        setRow(detailView, R.id.rowAssists, "Contract", player.endDate ?: "-")

        // Details tab
        setRow(detailView, R.id.rowKeeping, "Keeping", String.format("%.1f", player.keeping))
        setRow(detailView, R.id.rowDefending, "Defending", String.format("%.1f", player.defending))
        setRow(detailView, R.id.rowPlaymaking, "Playmaking", String.format("%.1f", player.playmaking))
        setRow(detailView, R.id.rowPassing, "Passing", String.format("%.1f", player.passing))
        setRow(detailView, R.id.rowScoring, "Scoring", String.format("%.1f", player.scoring))
        setRow(detailView, R.id.rowSpeed, "Speed", String.format("%.1f", player.speed))
        setRow(detailView, R.id.rowStamina, "Stamina", String.format("%.1f", player.stamina))
        setRow(detailView, R.id.rowTalent, "Talent", "${player.talent}")

        // Sell tab
        val sellInfo = buildString {
            append("Market Value: ${formatCurrency(player.marketValue)}\n")
            if (player.isForSale) {
                append("Already listed for sale\n")
                append("Current price: ${formatCurrency(player.sellPrice)}")
            } else {
                append("Fee: ${formatCurrency(player.transfermarketFee)}\n")
                append("Min offer: ${formatCurrency(player.transfermarketMinOffer)}\n")
                append("Max offer: ${formatCurrency(player.transfermarketMaxOffer)}\n")
                append("Duration: ${player.transfermarketMaxHours}h")
            }
        }
        detailView.findViewById<TextView>(R.id.textSellPrice).text = sellInfo
        val btnSell = detailView.findViewById<Button>(R.id.btnSellPlayer)
        btnSell.isEnabled = !player.isForSale
        btnSell.text = if (player.isForSale) "Already Listed" else "Sell on Transfer Market"
        btnSell.setOnClickListener { sellPlayer(player) }

        // Upgrade tab
        val upgradeInfo = if (player.isUpgraded) {
            "Already upgraded"
        } else {
            "Upgrade ${player.name}\nMax strength after upgrade: ${String.format("%.1f", player.maxUpgradeStrength)}"
        }
        detailView.findViewById<TextView>(R.id.textUpgradeInfo).text = upgradeInfo
        val btnUpgrade = detailView.findViewById<Button>(R.id.btnUpgradePlayer)
        btnUpgrade.isEnabled = !player.isUpgraded
        btnUpgrade.text = if (player.isUpgraded) "Already Upgraded" else "Upgrade Player"
        btnUpgrade.setOnClickListener { upgradePlayer(player) }
    }

    private fun sellPlayer(player: SquadPlayerData) {
        val ctx = context ?: return
        AlertDialog.Builder(ctx)
            .setTitle("Sell ${player.name}?")
            .setMessage("List on transfer market for ${formatCurrency(player.marketValue)}?\nFee: ${formatCurrency(player.transfermarketFee)}")
            .setPositiveButton("Sell") { _, _ ->
                viewLifecycleOwner.lifecycleScope.launch {
                    val main = requireActivity() as MainActivity
                    try {
                        main.showLoading(true)
                        val response = ApiClient.get().sellPlayer(IdRequest(player.id))
                        if (response.isSuccessful) {
                            Toast.makeText(context, "${player.name} listed!", Toast.LENGTH_SHORT).show()
                            main.refreshResources()
                            loadSquad()
                        } else {
                            Toast.makeText(context, response.body()?.message ?: "Failed", Toast.LENGTH_SHORT).show()
                        }
                    } catch (_: Exception) {
                    } finally {
                        main.showLoading(false)
                    }
                }
            }
            .setNegativeButton("Cancel", null)
            .show()
    }

    private fun upgradePlayer(player: SquadPlayerData) {
        val ctx = context ?: return
        AlertDialog.Builder(ctx)
            .setTitle("Upgrade ${player.name}?")
            .setMessage("Max strength: ${String.format("%.1f", player.maxUpgradeStrength)}")
            .setPositiveButton("Upgrade") { _, _ ->
                viewLifecycleOwner.lifecycleScope.launch {
                    val main = requireActivity() as MainActivity
                    try {
                        main.showLoading(true)
                        val response = ApiClient.get().upgradePlayer(IdRequest(player.id))
                        if (response.isSuccessful) {
                            Toast.makeText(context, "${player.name} upgraded!", Toast.LENGTH_SHORT).show()
                            main.refreshResources()
                            loadSquad()
                        } else {
                            Toast.makeText(context, response.body()?.message ?: "Failed", Toast.LENGTH_SHORT).show()
                        }
                    } catch (_: Exception) {
                    } finally {
                        main.showLoading(false)
                    }
                }
            }
            .setNegativeButton("Cancel", null)
            .show()
    }
}
