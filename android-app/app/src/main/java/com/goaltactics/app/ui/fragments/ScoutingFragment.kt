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
import com.goaltactics.app.data.model.IdRequest
import com.goaltactics.app.data.model.ScoutInstructionRequest
import com.goaltactics.app.ui.adapters.ScoutedPlayerAdapter
import com.goaltactics.app.ui.shell.MainActivity
import kotlinx.coroutines.launch

class ScoutingFragment : Fragment() {

    private val adapter = ScoutedPlayerAdapter { player -> recruitPlayer(player) }
    private val scoutTypes = listOf("Normal", "Intensive", "World Class")
    private val positions = listOf("Any", "GK", "DEF", "MID", "ATT")

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_scouting, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val spinnerType = view.findViewById<Spinner>(R.id.spinnerScoutType)
        spinnerType.adapter = ArrayAdapter(requireContext(), android.R.layout.simple_spinner_dropdown_item, scoutTypes)

        val spinnerPosition = view.findViewById<Spinner>(R.id.spinnerPositionFilter)
        spinnerPosition.adapter = ArrayAdapter(requireContext(), android.R.layout.simple_spinner_dropdown_item, positions)

        val recycler = view.findViewById<RecyclerView>(R.id.recyclerScouted)
        recycler.layoutManager = LinearLayoutManager(context)
        recycler.adapter = adapter

        view.findViewById<Button>(R.id.btnInstruct).setOnClickListener {
            startScouting(
                scoutTypes[spinnerType.selectedItemPosition],
                positions[spinnerPosition.selectedItemPosition]
            )
        }

        loadScoutedPlayers()
    }

    private fun loadScoutedPlayers() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getScoutedPlayers()
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

    private fun startScouting(scoutType: String, position: String) {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val request = ScoutInstructionRequest(
                    scoutType = scoutType,
                    positionFilter = if (position == "Any") null else position
                )
                val response = ApiClient.get().instructScout(request)
                if (response.isSuccessful) {
                    Toast.makeText(context, "Scout sent!", Toast.LENGTH_SHORT).show()
                    loadScoutedPlayers()
                    main.refreshResources()
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun recruitPlayer(player: com.goaltactics.app.data.model.ScoutedPlayerData) {
        val ctx = context ?: return
        android.app.AlertDialog.Builder(ctx)
            .setTitle("Recruit ${player.name}?")
            .setMessage("Position: ${player.position}\nStrength: ${player.strength}\nTalent: ${player.talent}")
            .setPositiveButton("Recruit") { _, _ ->
                val main = requireActivity() as MainActivity
                viewLifecycleOwner.lifecycleScope.launch {
                    try {
                        main.showLoading(true)
                        val response = ApiClient.get().recruitScoutedPlayer(IdRequest(player.id))
                        if (response.isSuccessful) {
                            Toast.makeText(context, "Player recruited!", Toast.LENGTH_SHORT).show()
                            main.refreshResources()
                            loadScoutedPlayers()
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
