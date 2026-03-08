package com.goaltactics.app.ui.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.*
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.R
import com.goaltactics.app.data.model.*
import com.goaltactics.app.ui.shell.MainActivity
import kotlinx.coroutines.launch

class LineupFragment : Fragment() {

    private var lineups: List<LineupSummaryData> = emptyList()
    private var currentMatchId: java.util.UUID? = null

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_lineup, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        loadLineups()
    }

    private fun loadLineups() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getLineups()
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        lineups = data.lineups
                        setupMatchSelector()
                        if (lineups.isNotEmpty()) {
                            currentMatchId = lineups[0].matchId
                            loadLineupForMatch(lineups[0].matchId)
                        }
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun setupMatchSelector() {
        val spinner = view?.findViewById<Spinner>(R.id.spinnerMatch) ?: return
        val names = lineups.map { it.opponent ?: "Match" }
        spinner.adapter = ArrayAdapter(requireContext(), android.R.layout.simple_spinner_dropdown_item, names)
        spinner.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
            override fun onItemSelected(parent: AdapterView<*>?, v: View?, position: Int, id: Long) {
                currentMatchId = lineups[position].matchId
                loadLineupForMatch(lineups[position].matchId)
            }
            override fun onNothingSelected(parent: AdapterView<*>?) {}
        }
    }

    private fun loadLineupForMatch(matchId: java.util.UUID) {

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getMatchLineup(LineupRequest(matchId))
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        val locked = view?.findViewById<TextView>(R.id.textLocked)
                        locked?.visibility = if (data.isLocked) View.VISIBLE else View.GONE

                        // Setup system spinner
                        val systemSpinner = view?.findViewById<Spinner>(R.id.spinnerSystem)
                        systemSpinner?.adapter = ArrayAdapter(
                            requireContext(),
                            android.R.layout.simple_spinner_dropdown_item,
                            data.systems
                        )

                        // Setup tactic spinner
                        val tacticSpinner = view?.findViewById<Spinner>(R.id.spinnerTactic)
                        tacticSpinner?.adapter = ArrayAdapter(
                            requireContext(),
                            android.R.layout.simple_spinner_dropdown_item,
                            data.tactics
                        )

                        // Show players
                        val recycler = view?.findViewById<RecyclerView>(R.id.recyclerLineupPlayers)
                        recycler?.layoutManager = LinearLayoutManager(context)
                        recycler?.adapter = LineupPlayerAdapter(data.players)

                        // Save button
                        val btnSave = view?.findViewById<Button>(R.id.btnSave)
                        btnSave?.isEnabled = !data.isLocked
                        btnSave?.setOnClickListener {
                            saveLineup(
                                matchId,
                                data.players.filter { it.isStarting }.map { it.playerId },
                                systemSpinner?.selectedItem?.toString(),
                                tacticSpinner?.selectedItem?.toString()
                            )
                        }
                    }
                }
            } catch (_: Exception) {
            }
        }
    }

    private fun saveLineup(matchId: java.util.UUID, playerIds: List<java.util.UUID>, system: String?, tactic: String?) {
        val main = requireActivity() as MainActivity

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                main.showLoading(true)
                val request = SaveLineupRequest(matchId, playerIds, system, tactic)
                val response = ApiClient.get().saveLineup(request)
                if (response.isSuccessful) {
                    Toast.makeText(context, "Lineup saved", Toast.LENGTH_SHORT).show()
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private class LineupPlayerAdapter(private val players: List<MatchLineupPlayerData>) :
        RecyclerView.Adapter<LineupPlayerAdapter.ViewHolder>() {

        class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
            val name: TextView = view.findViewById(R.id.textPlayerName)
            val position: TextView = view.findViewById(R.id.textPosition)
            val strength: TextView = view.findViewById(R.id.textStrength)
            val value: TextView = view.findViewById(R.id.textFitness)
        }

        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
            val view = LayoutInflater.from(parent.context)
                .inflate(R.layout.item_player_row, parent, false)
            return ViewHolder(view)
        }

        override fun onBindViewHolder(holder: ViewHolder, position: Int) {
            val player = players[position]
            holder.name.text = player.name
            holder.position.text = player.position
            holder.strength.text = if (player.isStarting) "★" else ""
            holder.value.text = if (player.isStarting) "Starting" else "Bench"
        }

        override fun getItemCount() = players.size
    }
}
