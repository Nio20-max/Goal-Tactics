package com.goaltactics.app.ui.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.R
import com.goaltactics.app.ui.adapters.FinanceAdapter
import com.goaltactics.app.ui.adapters.formatCurrency
import com.goaltactics.app.ui.shell.MainActivity
import com.google.android.material.tabs.TabLayout
import kotlinx.coroutines.launch

class FinancesFragment : Fragment() {

    private val todayAdapter = FinanceAdapter()
    private val yesterdayAdapter = FinanceAdapter()
    private val panels = mutableListOf<View>()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_finances, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        // Setup tabs
        val tabLayout = view.findViewById<TabLayout>(R.id.tabLayout)
        tabLayout.addTab(tabLayout.newTab().setText("Finance history"))
        tabLayout.addTab(tabLayout.newTab().setText("Matchday (Yesterday)"))
        tabLayout.addTab(tabLayout.newTab().setText("Matchday (Today)"))

        panels.add(view.findViewById(R.id.panelHistory))
        panels.add(view.findViewById(R.id.panelYesterday))
        panels.add(view.findViewById(R.id.panelToday))

        tabLayout.addOnTabSelectedListener(object : TabLayout.OnTabSelectedListener {
            override fun onTabSelected(tab: TabLayout.Tab) {
                panels.forEachIndexed { i, p -> p.visibility = if (i == tab.position) View.VISIBLE else View.GONE }
            }
            override fun onTabUnselected(tab: TabLayout.Tab) {}
            override fun onTabReselected(tab: TabLayout.Tab) {}
        })

        view.findViewById<RecyclerView>(R.id.recyclerToday).apply {
            layoutManager = LinearLayoutManager(context)
            adapter = todayAdapter
        }
        view.findViewById<RecyclerView>(R.id.recyclerYesterday).apply {
            layoutManager = LinearLayoutManager(context)
            adapter = yesterdayAdapter
        }

        loadFinances()
    }

    private fun loadFinances() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)
        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getFinances()
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        view?.findViewById<TextView>(R.id.textTodayTotal)?.text = formatCurrency(data.today.toLong())
                        view?.findViewById<TextView>(R.id.textYesterdayTotal)?.text = formatCurrency(data.yesterday.toLong())
                        todayAdapter.submitList(data.todays)
                        yesterdayAdapter.submitList(data.yesterdays)
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }
}
