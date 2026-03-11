package com.goaltactics.app.ui.fragments

import android.app.AlertDialog
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.R
import com.goaltactics.app.data.model.BuildPlaceData
import com.goaltactics.app.data.model.IdRequest
import com.goaltactics.app.data.model.TextRequest
import com.goaltactics.app.ui.adapters.BuildPlaceAdapter
import com.goaltactics.app.ui.shell.MainActivity
import kotlinx.coroutines.launch

class StadiumFragment : Fragment() {

    private val adapter = BuildPlaceAdapter { place -> showBuildDialog(place) }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_stadium, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        val recycler = view.findViewById<RecyclerView>(R.id.recyclerBuildPlaces)
        recycler.layoutManager = LinearLayoutManager(context)
        recycler.adapter = adapter

        view.findViewById<Button>(R.id.btnRenewGrass).setOnClickListener { renewGrass() }
        view.findViewById<Button>(R.id.btnRename).setOnClickListener { showRenameDialog() }

        loadStadium()
    }

    private fun setRow(view: View, rowId: Int, label: String, value: String) {
        val row = view.findViewById<View>(rowId)
        row.findViewById<TextView>(R.id.textLabel).text = label
        row.findViewById<TextView>(R.id.textValue).text = value
    }

    private fun loadStadium() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val stadiumResponse = ApiClient.get().getStadium()
                if (stadiumResponse.isSuccessful) {
                    stadiumResponse.body()?.let { data ->
                        data.stadium?.let { stadium ->
                            view?.let { v ->
                                setRow(v, R.id.rowStadiumName, "Stadium", stadium.name ?: "-")
                                setRow(v, R.id.rowCapacity, "Capacity", "${stadium.capacity}")
                                setRow(v, R.id.rowGrassQuality, "Grass Quality", "${stadium.grassQuality}%")
                                setRow(v, R.id.rowEarnings, "Avg Earnings", "${stadium.earningsAverage}")
                            }
                        }
                    }
                }

                val buildResponse = ApiClient.get().getBuildPlaces()
                if (buildResponse.isSuccessful) {
                    buildResponse.body()?.let { data ->
                        adapter.submitList(data.places)
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun showBuildDialog(place: BuildPlaceData) {
        val ctx = context ?: return
        val title = place.buildingType ?: "Empty Slot"
        val actions = mutableListOf<String>()
        if (place.canBuild) actions.add("Build / Upgrade")
        actions.add("Speedup (GT Stars)")

        AlertDialog.Builder(ctx)
            .setTitle(title)
            .setMessage("Level: ${place.level}")
            .setItems(actions.toTypedArray()) { _, which ->
                when (actions[which]) {
                    "Build / Upgrade" -> buildSlot(place.id)
                    "Speedup (GT Stars)" -> speedupBuilding(place.id)
                }
            }
            .setNegativeButton("Cancel", null)
            .show()
    }

    private fun renewGrass() {
        val ctx = context ?: return
        AlertDialog.Builder(ctx)
            .setTitle("Renew Grass")
            .setMessage("Renew the stadium grass?")
            .setPositiveButton("Renew") { _, _ ->
                val main = requireActivity() as MainActivity
                viewLifecycleOwner.lifecycleScope.launch {
                    try {
                        main.showLoading(true)
                        val response = ApiClient.get().renewStadiumGrass()
                        if (response.isSuccessful) {
                            Toast.makeText(context, "Grass renewed!", Toast.LENGTH_SHORT).show()
                            main.refreshResources()
                            loadStadium()
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

    private fun showRenameDialog() {
        val ctx = context ?: return
        val editName = EditText(ctx).apply { hint = "New stadium name" }
        AlertDialog.Builder(ctx)
            .setTitle("Rename Stadium")
            .setView(editName)
            .setPositiveButton("Rename") { _, _ ->
                val name = editName.text.toString().trim()
                if (name.isNotEmpty()) renameStadium(name)
            }
            .setNegativeButton("Cancel", null)
            .show()
    }

    private fun renameStadium(name: String) {
        val main = requireActivity() as MainActivity
        viewLifecycleOwner.lifecycleScope.launch {
            try {
                main.showLoading(true)
                val response = ApiClient.get().renameStadium(TextRequest(name))
                if (response.isSuccessful) {
                    Toast.makeText(context, "Stadium renamed!", Toast.LENGTH_SHORT).show()
                    loadStadium()
                } else {
                    Toast.makeText(context, response.body()?.message ?: "Failed", Toast.LENGTH_SHORT).show()
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun buildSlot(slotId: java.util.UUID) {
        val main = requireActivity() as MainActivity
        viewLifecycleOwner.lifecycleScope.launch {
            try {
                main.showLoading(true)
                val response = ApiClient.get().buildStadium(IdRequest(slotId))
                if (response.isSuccessful) {
                    Toast.makeText(context, "Building started!", Toast.LENGTH_SHORT).show()
                    main.refreshResources()
                    loadStadium()
                } else {
                    Toast.makeText(context, response.body()?.message ?: "Failed", Toast.LENGTH_SHORT).show()
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun speedupBuilding(slotId: java.util.UUID) {
        val main = requireActivity() as MainActivity
        viewLifecycleOwner.lifecycleScope.launch {
            try {
                main.showLoading(true)
                val response = ApiClient.get().speedupBuilding(IdRequest(slotId))
                if (response.isSuccessful) {
                    Toast.makeText(context, "Construction speedup!", Toast.LENGTH_SHORT).show()
                    main.refreshResources()
                    loadStadium()
                } else {
                    Toast.makeText(context, response.body()?.message ?: "Failed", Toast.LENGTH_SHORT).show()
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }
}
