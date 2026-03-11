package com.goaltactics.app.ui.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.R
import com.goaltactics.app.data.model.IdRequest
import com.goaltactics.app.ui.adapters.LeagueTableAdapter
import com.goaltactics.app.ui.shell.MainActivity
import com.google.android.material.tabs.TabLayout
import kotlinx.coroutines.launch

class LeagueFragment : Fragment() {

    private val adapter = LeagueTableAdapter()
    private val panels = mutableListOf<View>()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_league, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val tabLayout = view.findViewById<TabLayout>(R.id.tabLayout)
        tabLayout.addTab(tabLayout.newTab().setText("League"))
        tabLayout.addTab(tabLayout.newTab().setText("Matches"))
        tabLayout.addTab(tabLayout.newTab().setText("Fixture list"))
        tabLayout.addTab(tabLayout.newTab().setText("Goalscorers' list"))

        panels.add(view.findViewById(R.id.panelLeague))
        panels.add(view.findViewById(R.id.panelMatches))
        panels.add(view.findViewById(R.id.panelFixtures))
        panels.add(view.findViewById(R.id.panelGoalscorers))

        tabLayout.addOnTabSelectedListener(object : TabLayout.OnTabSelectedListener {
            override fun onTabSelected(tab: TabLayout.Tab) {
                panels.forEachIndexed { i, p -> p.visibility = if (i == tab.position) View.VISIBLE else View.GONE }
            }
            override fun onTabUnselected(tab: TabLayout.Tab) {}
            override fun onTabReselected(tab: TabLayout.Tab) {}
        })

        val recycler = view.findViewById<RecyclerView>(R.id.recyclerLeague)
        recycler.layoutManager = LinearLayoutManager(context)
        recycler.adapter = adapter

        view.findViewById<RecyclerView>(R.id.recyclerMatches)?.layoutManager = LinearLayoutManager(context)
        view.findViewById<RecyclerView>(R.id.recyclerFixtures)?.layoutManager = LinearLayoutManager(context)
        view.findViewById<RecyclerView>(R.id.recyclerGoalscorers)?.layoutManager = LinearLayoutManager(context)

        loadLeague()
    }

    private fun loadLeague() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)
        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getLeagueTable(IdRequest(java.util.UUID(0, 0)))
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        adapter.submitList(data.teams)
                        val myIndex = data.teams.indexOfFirst { it.isMine }
                        if (myIndex >= 0) {
                            view?.findViewById<RecyclerView>(R.id.recyclerLeague)?.scrollToPosition(myIndex)
                        }
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }
}
