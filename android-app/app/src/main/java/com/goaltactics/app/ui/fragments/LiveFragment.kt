package com.goaltactics.app.ui.fragments

import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.TextView
import android.widget.ImageView
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.R
import com.goaltactics.app.data.model.IdRequest
import com.goaltactics.app.ui.shell.MainActivity
import kotlinx.coroutines.launch

class LiveFragment : Fragment() {

    private var currentMatchId: java.util.UUID? = null
    private val refreshHandler = Handler(Looper.getMainLooper())
    private val refreshRunnable = object : Runnable {
        override fun run() {
            if (isAdded && currentMatchId != null) {
                refreshMatch()
                refreshHandler.postDelayed(this, 15_000)
            }
        }
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_live, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        view.findViewById<Button>(R.id.btnGameCourse)?.setOnClickListener {
            view.findViewById<View>(R.id.scrollReport)?.visibility = View.VISIBLE
            view.findViewById<View>(R.id.recyclerEvents)?.visibility = View.GONE
        }
        view.findViewById<Button>(R.id.btnPlayers)?.setOnClickListener {
            view.findViewById<View>(R.id.scrollReport)?.visibility = View.GONE
            view.findViewById<View>(R.id.recyclerEvents)?.visibility = View.VISIBLE
        }
        view.findViewById<Button>(R.id.btnStatistics)?.setOnClickListener {
            view.findViewById<View>(R.id.scrollReport)?.visibility = View.GONE
            view.findViewById<View>(R.id.recyclerEvents)?.visibility = View.VISIBLE
        }

        loadLiveMatch()
    }

    private fun loadLiveMatch() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val lineupsResponse = ApiClient.get().getLineups()
                val matchId = lineupsResponse.body()?.lineups?.firstOrNull()?.matchId
                if (matchId != null) {
                    currentMatchId = matchId
                    val response = ApiClient.get().getLiveMatch(IdRequest(matchId))
                    if (response.isSuccessful) {
                        response.body()?.let { data ->
                            data.match?.let { match ->
                                view?.findViewById<TextView>(R.id.textHomeTeam)?.text = match.homeTeam
                                view?.findViewById<TextView>(R.id.textAwayTeam)?.text = match.awayTeam
                                view?.findViewById<TextView>(R.id.textScore)?.text =
                                    "${match.homeScore} : ${match.awayScore}"
                                view?.findViewById<TextView>(R.id.textMatchTime)?.text = "LIVE"

                                val report = match.report
                                if (!report.isNullOrEmpty()) {
                                    view?.findViewById<View>(R.id.scrollReport)?.visibility = View.VISIBLE
                                    view?.findViewById<TextView>(R.id.textReport)?.text = report
                                }

                                // Start auto-refresh for live match
                                refreshHandler.postDelayed(refreshRunnable, 15_000)
                            } ?: run {
                                showNoMatch(data.message ?: "No match currently in progress")
                            }
                        }
                    }
                } else {
                    showNoMatch("No upcoming matches found")
                }
            } catch (_: Exception) {
                showNoMatch("Failed to load match data")
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun refreshMatch() {
        val matchId = currentMatchId ?: return

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getLiveMatch(IdRequest(matchId))
                if (response.isSuccessful) {
                    response.body()?.match?.let { match ->
                        view?.findViewById<TextView>(R.id.textScore)?.text =
                            "${match.homeScore} : ${match.awayScore}"
                        val report = match.report
                        if (!report.isNullOrEmpty()) {
                            view?.findViewById<TextView>(R.id.textReport)?.text = report
                        }
                    }
                }
            } catch (_: Exception) {
            }
        }
    }

    private fun showNoMatch(message: String) {
        view?.findViewById<TextView>(R.id.textScore)?.text = "- : -"
        view?.findViewById<TextView>(R.id.textMatchTime)?.text = "No live match"
        view?.findViewById<View>(R.id.scrollReport)?.visibility = View.VISIBLE
        view?.findViewById<TextView>(R.id.textReport)?.text = message
    }

    override fun onDestroyView() {
        super.onDestroyView()
        refreshHandler.removeCallbacks(refreshRunnable)
    }
}
