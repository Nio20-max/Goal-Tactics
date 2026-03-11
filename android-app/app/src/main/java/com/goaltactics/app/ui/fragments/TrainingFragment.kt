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
import com.goaltactics.app.data.model.TeamTrainingSaveRequest
import com.goaltactics.app.data.model.TrainingCampRequest
import com.goaltactics.app.ui.shell.MainActivity
import com.google.android.material.tabs.TabLayout
import kotlinx.coroutines.launch

class TrainingFragment : Fragment() {

    private val mainSkills = listOf("Defence", "Keeper", "Shots", "Playmaking")
    private val subSkills = listOf("Passing", "BallControl", "Duel", "OneOnOne", "Header", "Speed", "Flanks", "Cornerkick", "Freekick", "Penalty")
    private val campTypes = listOf("Basic Camp", "Professional Camp", "World Class Camp")

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_training, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        // Setup tabs
        val tabLayout = view.findViewById<TabLayout>(R.id.tabLayout)
        listOf("Team Training", "Training Camp").forEach {
            tabLayout.addTab(tabLayout.newTab().setText(it))
        }

        val teamPanel = view.findViewById<View>(R.id.teamTrainingPanel)
        tabLayout.addOnTabSelectedListener(object : TabLayout.OnTabSelectedListener {
            override fun onTabSelected(tab: TabLayout.Tab) {
                // Both panels are in the same layout, toggle visibility
                teamPanel.visibility = View.VISIBLE
            }
            override fun onTabUnselected(tab: TabLayout.Tab) {}
            override fun onTabReselected(tab: TabLayout.Tab) {}
        })

        val spinnerMain = view.findViewById<Spinner>(R.id.spinnerMainSkill)
        spinnerMain.adapter = ArrayAdapter(requireContext(), android.R.layout.simple_spinner_dropdown_item, mainSkills)

        val spinnerSub = view.findViewById<Spinner>(R.id.spinnerSubSkill)
        spinnerSub.adapter = ArrayAdapter(requireContext(), android.R.layout.simple_spinner_dropdown_item, subSkills)

        view.findViewById<Button>(R.id.btnSaveTraining).setOnClickListener {
            saveTraining(spinnerMain.selectedItemPosition, spinnerSub.selectedItemPosition)
        }

        // Setup camp list
        val recyclerCamps = view.findViewById<RecyclerView>(R.id.recyclerCamps)
        recyclerCamps?.layoutManager = LinearLayoutManager(context)
        recyclerCamps?.adapter = CampAdapter(campTypes) { campType -> bookCamp(campType) }

        loadTraining()
    }

    private fun loadTraining() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getTeamTraining()
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        data.teamTraining?.let { training ->
                            view?.findViewById<Spinner>(R.id.spinnerMainSkill)
                                ?.setSelection(training.mainSkillIndex.coerceIn(0, mainSkills.size - 1))
                            view?.findViewById<Spinner>(R.id.spinnerSubSkill)
                                ?.setSelection(training.subSkillIndex.coerceIn(0, subSkills.size - 1))
                            view?.findViewById<ProgressBar>(R.id.progressEfficiency)
                                ?.progress = training.efficiencyValue
                            view?.findViewById<TextView>(R.id.textEfficiency)
                                ?.text = "Efficiency: ${training.efficiencyText ?: "${training.efficiencyValue}%"}"
                        }
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun saveTraining(mainIdx: Int, subIdx: Int) {
        val main = requireActivity() as MainActivity

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                main.showLoading(true)
                val request = TeamTrainingSaveRequest(mainIdx, subIdx)
                val response = ApiClient.get().saveTeamTraining(request)
                if (response.isSuccessful) {
                    Toast.makeText(context, "Training saved", Toast.LENGTH_SHORT).show()
                    loadTraining()
                } else {
                    Toast.makeText(context, response.body()?.message ?: "Failed", Toast.LENGTH_SHORT).show()
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun bookCamp(campType: String) {
        val ctx = context ?: return
        android.app.AlertDialog.Builder(ctx)
            .setTitle("Book Training Camp")
            .setMessage("Book $campType for your team?")
            .setPositiveButton("Book") { _, _ ->
                val main = requireActivity() as MainActivity
                viewLifecycleOwner.lifecycleScope.launch {
                    try {
                        main.showLoading(true)
                        val response = ApiClient.get().bookTrainingCamp(TrainingCampRequest(campType))
                        if (response.isSuccessful) {
                            Toast.makeText(context, "Camp booked!", Toast.LENGTH_SHORT).show()
                            main.refreshResources()
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

    private class CampAdapter(
        private val camps: List<String>,
        private val onBook: (String) -> Unit
    ) : RecyclerView.Adapter<CampAdapter.ViewHolder>() {

        class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
            val label: TextView = view.findViewById(R.id.textLabel)
            val value: TextView = view.findViewById(R.id.textValue)
        }

        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
            val view = LayoutInflater.from(parent.context)
                .inflate(R.layout.item_stat_row, parent, false)
            return ViewHolder(view)
        }

        override fun onBindViewHolder(holder: ViewHolder, position: Int) {
            holder.label.text = camps[position]
            holder.value.text = "Book"
            holder.itemView.setOnClickListener { onBook(camps[position]) }
            val bg = if (position % 2 == 0) R.color.gt_row_even else R.color.gt_row_odd
            holder.itemView.setBackgroundResource(bg)
        }

        override fun getItemCount() = camps.size
    }
}
