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
import kotlinx.coroutines.launch

class FinancesFragment : Fragment() {

    private val todayAdapter = FinanceAdapter()
    private val yesterdayAdapter = FinanceAdapter()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_finances, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

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
                        view?.findViewById<TextView>(R.id.textTodayTotal)?.text =
                            "Today: ${formatCurrency(data.today.toLong())}"
                        view?.findViewById<TextView>(R.id.textYesterdayTotal)?.text =
                            "Yesterday: ${formatCurrency(data.yesterday.toLong())}"
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
