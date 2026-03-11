package com.goaltactics.app.ui.fragments

import android.app.AlertDialog
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.R
import com.goaltactics.app.data.model.IdRequest
import com.goaltactics.app.data.model.LadderChallengeRequest
import com.goaltactics.app.data.model.LadderTeamData
import com.goaltactics.app.ui.adapters.LadderAdapter
import com.goaltactics.app.ui.shell.MainActivity
import com.google.android.material.tabs.TabLayout
import kotlinx.coroutines.launch

class LadderFragment : Fragment() {

    private val adapter = LadderAdapter()
    private var ladderTeams: List<LadderTeamData> = emptyList()
    private val panels = mutableListOf<View>()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_ladder, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        // Setup tabs
        val tabLayout = view.findViewById<TabLayout>(R.id.tabLayout)
        tabLayout.addTab(tabLayout.newTab().setText("Ladder"))
        tabLayout.addTab(tabLayout.newTab().setText("Rewards"))

        panels.add(view.findViewById(R.id.panelLadder))
        panels.add(view.findViewById(R.id.panelRewards))

        tabLayout.addOnTabSelectedListener(object : TabLayout.OnTabSelectedListener {
            override fun onTabSelected(tab: TabLayout.Tab) {
                panels.forEachIndexed { i, p -> p.visibility = if (i == tab.position) View.VISIBLE else View.GONE }
            }
            override fun onTabUnselected(tab: TabLayout.Tab) {}
            override fun onTabReselected(tab: TabLayout.Tab) {}
        })

        val recycler = view.findViewById<RecyclerView>(R.id.recyclerLadder)
        recycler.layoutManager = LinearLayoutManager(context)
        recycler.adapter = adapter

        view.findViewById<RecyclerView>(R.id.recyclerRewards)?.apply {
            layoutManager = LinearLayoutManager(context)
        }

        // Make rows clickable for challenge
        adapter.registerAdapterDataObserver(object : RecyclerView.AdapterDataObserver() {
            override fun onChanged() { setupRowClickListeners(recycler) }
            override fun onItemRangeInserted(start: Int, count: Int) { setupRowClickListeners(recycler) }
        })

        loadLadder()
    }

    private fun setupRowClickListeners(recycler: RecyclerView) {
        recycler.post {
            for (i in 0 until recycler.childCount) {
                val child = recycler.getChildAt(i) ?: continue
                val pos = recycler.getChildAdapterPosition(child)
                if (pos in ladderTeams.indices) {
                    val team = ladderTeams[pos]
                    if (!team.isMine) {
                        child.setOnClickListener { showChallengeDialog(team) }
                    }
                }
            }
        }
    }

    private fun loadLadder() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getLadder(IdRequest(java.util.UUID(0, 0)))
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        ladderTeams = data.teams
                        adapter.submitList(data.teams)
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun showChallengeDialog(team: LadderTeamData) {
        val ctx = context ?: return
        val main = requireActivity() as MainActivity

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                main.showLoading(true)
                val response = ApiClient.get().getLadderChallenge(LadderChallengeRequest(team.teamId))
                if (response.isSuccessful) {
                    response.body()?.let { challenge ->
                        main.showLoading(false)
                        AlertDialog.Builder(ctx)
                            .setTitle("Challenge ${team.teamName}?")
                            .setMessage(buildString {
                                append("Strength: ${team.strength}\n")
                                append("Win: +${challenge.winPoints} pts\n")
                                append("Lose: ${challenge.losePoints} pts\n")
                                append("Stamina cost: ${challenge.staminaCost}\n")
                                append("Your stamina: ${challenge.stamina}")
                            })
                            .setPositiveButton("Fight") { _, _ -> runMatch(team.teamId) }
                            .setNegativeButton("Cancel", null)
                            .show()
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun runMatch(teamId: java.util.UUID) {
        val main = requireActivity() as MainActivity

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                main.showLoading(true)
                val response = ApiClient.get().runMatch(LadderChallengeRequest(teamId))
                if (response.isSuccessful) {
                    response.body()?.let { result ->
                        Toast.makeText(context, result.matchReport ?: "Match complete!", Toast.LENGTH_LONG).show()
                        main.refreshResources()
                        loadLadder()
                    }
                } else {
                    Toast.makeText(context, "Challenge failed", Toast.LENGTH_SHORT).show()
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }
}
