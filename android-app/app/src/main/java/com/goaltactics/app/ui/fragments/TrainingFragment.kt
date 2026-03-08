package com.goaltactics.app.ui.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.*
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.R
import com.goaltactics.app.data.model.TeamTrainingSaveRequest
import com.goaltactics.app.ui.shell.MainActivity
import kotlinx.coroutines.launch

class TrainingFragment : Fragment() {

    private val mainSkills = listOf("Defence", "Keeper", "Shots", "Playmaking")
    private val subSkills = listOf("Passing", "BallControl", "Duel", "OneOnOne", "Header", "Speed", "Flanks", "Cornerkick", "Freekick", "Penalty")

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_training, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val spinnerMain = view.findViewById<Spinner>(R.id.spinnerMainSkill)
        spinnerMain.adapter = ArrayAdapter(requireContext(), android.R.layout.simple_spinner_dropdown_item, mainSkills)

        val spinnerSub = view.findViewById<Spinner>(R.id.spinnerSubSkill)
        spinnerSub.adapter = ArrayAdapter(requireContext(), android.R.layout.simple_spinner_dropdown_item, subSkills)

        view.findViewById<Button>(R.id.btnSaveTraining).setOnClickListener {
            saveTraining(spinnerMain.selectedItemPosition, spinnerSub.selectedItemPosition)
        }

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
                                ?.text = training.efficiencyText ?: "${training.efficiencyValue}%"
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
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }
}
