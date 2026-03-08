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
import com.goaltactics.app.data.model.ClubNews
import com.goaltactics.app.ui.adapters.formatCurrency
import com.goaltactics.app.ui.shell.MainActivity
import kotlinx.coroutines.launch

class ClubFragment : Fragment() {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_club, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        loadClubData(view)
    }

    private fun setRow(view: View, rowId: Int, label: String, value: String) {
        val row = view.findViewById<View>(rowId)
        row.findViewById<TextView>(R.id.textLabel).text = label
        row.findViewById<TextView>(R.id.textValue).text = value
    }

    private fun loadClubData(view: View) {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getMyTeamExtendedInfo()
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        val team = data.teamData
                        setRow(view, R.id.rowTeamName, "Team", team?.name ?: "My Club")
                        setRow(view, R.id.rowCountry, "Country", team?.countryName ?: team?.country ?: "-")
                        setRow(view, R.id.rowLeague, "League Pos", "${team?.leaguePosition}")
                        setRow(view, R.id.rowMarketValue, "Market Value", formatCurrency(team?.marketValue?.toLong() ?: 0))
                        setRow(view, R.id.rowMood, "Mood", "${team?.teamMood}")
                        setRow(view, R.id.rowStrength, "Strength", "${team?.strength}")
                        setRow(view, R.id.rowWins, "Wins", "${team?.wins}")
                        setRow(view, R.id.rowLosses, "Losses", "${team?.losses}")
                        setRow(view, R.id.rowFans, "Fans", "${team?.fans}")

                        // Load news
                        data.news?.let { newsList ->
                            val recycler = view.findViewById<RecyclerView>(R.id.recyclerNews)
                            recycler.layoutManager = LinearLayoutManager(context)
                            recycler.adapter = NewsAdapter(newsList)
                        }
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private class NewsAdapter(private val news: List<ClubNews>) :
        RecyclerView.Adapter<NewsAdapter.ViewHolder>() {

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
            val item = news[position]
            holder.label.text = item.title
            holder.value.text = item.date
        }

        override fun getItemCount() = news.size
    }
}
