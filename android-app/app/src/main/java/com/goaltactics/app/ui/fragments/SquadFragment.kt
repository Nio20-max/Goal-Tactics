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
import com.goaltactics.app.data.model.SquadPlayerData
import com.goaltactics.app.ui.adapters.PlayerAdapter
import com.goaltactics.app.ui.shell.MainActivity
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
                        adapter.submitList(data.players)
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun showPlayerDetail(player: SquadPlayerData) {
        val detailView = view?.findViewById<ViewGroup>(R.id.playerDetailContainer) ?: return
        detailView.removeAllViews()
        val tv = TextView(context).apply {
            text = "${player.name}\nPos: ${player.position}\nSTR: ${player.strength}\nFIT: ${player.fitness}"
            setTextColor(resources.getColor(R.color.gt_text_primary, null))
            textSize = 14f
            setPadding(16, 16, 16, 16)
        }
        detailView.addView(tv)
    }
}
