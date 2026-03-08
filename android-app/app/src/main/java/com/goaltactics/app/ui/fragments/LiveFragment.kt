package com.goaltactics.app.ui.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.R
import com.goaltactics.app.data.model.IdRequest
import com.goaltactics.app.ui.shell.MainActivity
import kotlinx.coroutines.launch

class LiveFragment : Fragment() {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_live, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        loadLiveMatch()
    }

    private fun loadLiveMatch() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                // Get lineups to find the current match ID
                val lineupsResponse = ApiClient.get().getLineups()
                val matchId = lineupsResponse.body()?.lineups?.firstOrNull()?.matchId
                if (matchId != null) {
                    val response = ApiClient.get().getLiveMatch(IdRequest(matchId))
                    if (response.isSuccessful) {
                        response.body()?.let { data ->
                            data.match?.let { match ->
                                view?.findViewById<TextView>(R.id.textHomeTeam)?.text = match.homeTeam
                                view?.findViewById<TextView>(R.id.textAwayTeam)?.text = match.awayTeam
                                view?.findViewById<TextView>(R.id.textScore)?.text =
                                    "${match.homeScore} : ${match.awayScore}"
                                view?.findViewById<TextView>(R.id.textReport)?.text =
                                    match.report ?: "No match report available"
                            } ?: run {
                                view?.findViewById<TextView>(R.id.textScore)?.text = "No live match"
                                view?.findViewById<TextView>(R.id.textReport)?.text =
                                    data.message ?: "No match currently in progress"
                            }
                        }
                    }
                } else {
                    view?.findViewById<TextView>(R.id.textScore)?.text = "No matches"
                    view?.findViewById<TextView>(R.id.textReport)?.text = "No upcoming matches found"
                }
            } catch (_: Exception) {
                view?.findViewById<TextView>(R.id.textReport)?.text = "Failed to load match data"
            } finally {
                main.showLoading(false)
            }
        }
    }
}
