package com.goaltactics.app.ui.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.*
import androidx.core.content.ContextCompat
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
    private var allPlayers: List<MatchLineupPlayerData> = emptyList()
    private var startingIds = mutableSetOf<java.util.UUID>()
    private var selectedSystem: String? = null
    private var selectedTactic: String? = null

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_lineup, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        view.findViewById<Button>(R.id.btnSave)?.setOnClickListener { saveLineup() }
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
        val names = lineups.map { (it.opponent ?: "Match") + if (it.isLocked) " (locked)" else "" }
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
                        allPlayers = data.players
                        startingIds = data.players.filter { it.isStarting }.map { it.playerId }.toMutableSet()

                        val locked = view?.findViewById<TextView>(R.id.textLocked)
                        locked?.visibility = if (data.isLocked) View.VISIBLE else View.GONE

                        // System spinner
                        val systemSpinner = view?.findViewById<Spinner>(R.id.spinnerSystem)
                        if (data.systems.isNotEmpty()) {
                            systemSpinner?.adapter = ArrayAdapter(
                                requireContext(), android.R.layout.simple_spinner_dropdown_item, data.systems
                            )
                            systemSpinner?.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
                                override fun onItemSelected(p: AdapterView<*>?, v: View?, pos: Int, id: Long) {
                                    selectedSystem = data.systems[pos]
                                }
                                override fun onNothingSelected(p: AdapterView<*>?) {}
                            }
                        }

                        // Tactic spinner
                        val tacticSpinner = view?.findViewById<Spinner>(R.id.spinnerTactic)
                        if (data.tactics.isNotEmpty()) {
                            tacticSpinner?.adapter = ArrayAdapter(
                                requireContext(), android.R.layout.simple_spinner_dropdown_item, data.tactics
                            )
                            tacticSpinner?.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
                                override fun onItemSelected(p: AdapterView<*>?, v: View?, pos: Int, id: Long) {
                                    selectedTactic = data.tactics[pos]
                                }
                                override fun onNothingSelected(p: AdapterView<*>?) {}
                            }
                        }

                        updateStrengthDisplay()
                        refreshPlayerList(data.isLocked)

                        view?.findViewById<Button>(R.id.btnSave)?.isEnabled = !data.isLocked
                    }
                }
            } catch (_: Exception) {
            }
        }
    }

    private fun refreshPlayerList(isLocked: Boolean) {
        val recycler = view?.findViewById<RecyclerView>(R.id.recyclerLineupPlayers) ?: return
        recycler.layoutManager = LinearLayoutManager(context)
        recycler.adapter = LineupPlayerAdapter(allPlayers, startingIds, isLocked) { player ->
            if (player.isStarting || startingIds.contains(player.playerId)) {
                startingIds.remove(player.playerId)
            } else {
                if (startingIds.size < 11) {
                    startingIds.add(player.playerId)
                } else {
                    Toast.makeText(context, "Max 11 starting players", Toast.LENGTH_SHORT).show()
                    return@LineupPlayerAdapter
                }
            }
            updateStrengthDisplay()
            refreshPlayerList(isLocked)
        }
    }

    private fun updateStrengthDisplay() {
        val strengthText = view?.findViewById<TextView>(R.id.textStrength) ?: return
        val startingCount = startingIds.size
        strengthText.text = "Starting: $startingCount / 11"
    }

    private fun saveLineup() {
        val matchId = currentMatchId ?: return
        val main = requireActivity() as MainActivity

        if (startingIds.size != 11) {
            Toast.makeText(context, "Select exactly 11 starting players", Toast.LENGTH_SHORT).show()
            return
        }

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                main.showLoading(true)
                val request = SaveLineupRequest(matchId, startingIds.toList(), selectedSystem, selectedTactic)
                val response = ApiClient.get().saveLineup(request)
                if (response.isSuccessful) {
                    Toast.makeText(context, "Lineup saved", Toast.LENGTH_SHORT).show()
                } else {
                    Toast.makeText(context, response.body()?.message ?: "Failed to save", Toast.LENGTH_SHORT).show()
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private class LineupPlayerAdapter(
        private val players: List<MatchLineupPlayerData>,
        private val startingIds: Set<java.util.UUID>,
        private val isLocked: Boolean,
        private val onToggle: (MatchLineupPlayerData) -> Unit
    ) : RecyclerView.Adapter<LineupPlayerAdapter.ViewHolder>() {

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
            val isStarting = startingIds.contains(player.playerId)
            holder.name.text = player.name
            holder.position.text = player.position
            holder.strength.text = if (isStarting) "★" else ""
            holder.value.text = if (isStarting) "Starting" else "Bench"

            val bg = if (isStarting) R.color.gt_row_selected else {
                if (position % 2 == 0) R.color.gt_row_even else R.color.gt_row_odd
            }
            holder.itemView.setBackgroundResource(bg)

            if (!isLocked) {
                holder.itemView.setOnClickListener { onToggle(player) }
            }
        }

        override fun getItemCount() = players.size
    }
}
