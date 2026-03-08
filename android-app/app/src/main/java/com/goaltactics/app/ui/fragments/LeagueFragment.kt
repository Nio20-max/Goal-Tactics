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
import kotlinx.coroutines.launch
import android.widget.TextView

class LeagueFragment : Fragment() {

    private val adapter = LeagueTableAdapter()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_league, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        val recycler = view.findViewById<RecyclerView>(R.id.recyclerLeague)
        recycler.layoutManager = LinearLayoutManager(context)
        recycler.adapter = adapter
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
                        view?.findViewById<TextView>(R.id.textLeagueName)?.text = data.leagueName
                        adapter.submitList(data.teams)
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }
}
