package com.goaltactics.app.ui.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.R
import com.goaltactics.app.data.model.*
import com.goaltactics.app.ui.adapters.MailAdapter
import com.goaltactics.app.ui.adapters.formatCurrency
import com.goaltactics.app.ui.shell.MainActivity
import com.google.android.material.tabs.TabLayout
import kotlinx.coroutines.launch

class ClubFragment : Fragment() {

    private val tabPanels = mutableListOf<View>()
    private var lastMatch: MatchData? = null
    private var nextMatch: MatchData? = null
    private var showingNextMatch = true

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_club, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setupTabs(view)
        setupMatchButtons(view)
        loadClubData(view)
    }

    private fun setupTabs(view: View) {
        val tabLayout = view.findViewById<TabLayout>(R.id.tabLayout)
        tabLayout.addTab(tabLayout.newTab().setText("My Club"))
        tabLayout.addTab(tabLayout.newTab().setText("Sponsors"))
        tabLayout.addTab(tabLayout.newTab().setText("Inbox"))
        tabLayout.addTab(tabLayout.newTab().setText("Accomplishments"))

        tabPanels.add(view.findViewById(R.id.panelMyClub))
        tabPanels.add(view.findViewById(R.id.panelSponsors))
        tabPanels.add(view.findViewById(R.id.panelInbox))
        tabPanels.add(view.findViewById(R.id.panelAccomplishments))

        tabLayout.addOnTabSelectedListener(object : TabLayout.OnTabSelectedListener {
            override fun onTabSelected(tab: TabLayout.Tab) {
                tabPanels.forEachIndexed { i, panel ->
                    panel.visibility = if (i == tab.position) View.VISIBLE else View.GONE
                }
                when (tab.position) {
                    1 -> loadSponsors()
                    2 -> loadInbox()
                    3 -> loadAccomplishments()
                }
            }
            override fun onTabUnselected(tab: TabLayout.Tab) {}
            override fun onTabReselected(tab: TabLayout.Tab) {}
        })
    }

    private fun setupMatchButtons(view: View) {
        view.findViewById<Button>(R.id.btnLastMatch).setOnClickListener {
            showingNextMatch = false
            displayMatch(view, lastMatch)
        }
        view.findViewById<Button>(R.id.btnNextMatch).setOnClickListener {
            showingNextMatch = true
            displayMatch(view, nextMatch)
        }
        view.findViewById<Button>(R.id.btnLineup).setOnClickListener {
            (requireActivity() as MainActivity).navigateTo(LineupFragment(), "Lineup")
        }
        view.findViewById<Button>(R.id.btnCompare).setOnClickListener {
            val match = if (showingNextMatch) nextMatch else lastMatch
            match?.opponentTeamId?.let { teamId ->
                Toast.makeText(context, "Comparing with opponent...", Toast.LENGTH_SHORT).show()
            }
        }
    }

    private fun displayMatch(view: View, match: MatchData?) {
        if (match == null) {
            view.findViewById<TextView>(R.id.matchStatus).text = "—"
            view.findViewById<TextView>(R.id.matchHomeName).text = ""
            view.findViewById<TextView>(R.id.matchAwayName).text = ""
            view.findViewById<TextView>(R.id.matchDate).text = "No match"
            return
        }
        view.findViewById<TextView>(R.id.matchHomeName).text = match.homeName ?: ""
        view.findViewById<TextView>(R.id.matchAwayName).text = match.awayName ?: ""
        view.findViewById<TextView>(R.id.matchDate).text = match.date ?: ""
        view.findViewById<TextView>(R.id.matchStatus).text =
            if (match.homeScore > 0 || match.awayScore > 0)
                "${match.homeScore} : ${match.awayScore}"
            else "vs"
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
                        setRow(view, R.id.rowLeague, "League", team?.leagueName ?: "Pos ${team?.leaguePosition}")
                        setRow(view, R.id.rowMarketValue, "Market Value", formatCurrency(team?.marketValue?.toLong() ?: 0))
                        setRow(view, R.id.rowMood, "Mood", team?.teamMood ?: "${team?.mood}")
                        setRow(view, R.id.rowStrength, "Strength", "${team?.strength}")
                        setRow(view, R.id.rowWins, "Wins", "${team?.wins}")
                        setRow(view, R.id.rowLosses, "Losses", "${team?.losses}")
                        setRow(view, R.id.rowFans, "Fans", "${team?.fans}")

                        view.findViewById<TextView>(R.id.textClubName).text = team?.name ?: ""
                        view.findViewById<TextView>(R.id.textSeasonInfo).text =
                            data.season?.let { "Season $it — Matchday ${data.matchday}" } ?: ""

                        lastMatch = data.lastMatch
                        nextMatch = data.nextMatch
                        displayMatch(view, if (showingNextMatch) nextMatch else lastMatch)

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

    private fun loadSponsors() {
        val recycler = view?.findViewById<RecyclerView>(R.id.recyclerSponsors) ?: return
        recycler.layoutManager = LinearLayoutManager(context)
        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getSponsorOffers()
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        recycler.adapter = SponsorAdapter(data.offers) { sponsor ->
                            acceptSponsor(sponsor)
                        }
                    }
                }
            } catch (_: Exception) {}
        }
    }

    private fun acceptSponsor(sponsor: SponsorOfferData) {
        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().acceptSponsor(IdRequest(sponsor.id))
                if (response.isSuccessful) {
                    Toast.makeText(context, "Sponsor accepted!", Toast.LENGTH_SHORT).show()
                    (activity as? MainActivity)?.refreshResources()
                    loadSponsors()
                }
            } catch (_: Exception) {}
        }
    }

    private fun loadInbox() {
        val recycler = view?.findViewById<RecyclerView>(R.id.recyclerInbox) ?: return
        recycler.layoutManager = LinearLayoutManager(context)
        val adapter = MailAdapter { mail ->
            android.app.AlertDialog.Builder(requireContext())
                .setTitle(mail.subject)
                .setMessage("${mail.sender ?: "System"}\n\n${mail.message}")
                .setPositiveButton("OK", null)
                .show()
        }
        recycler.adapter = adapter
        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getMyMail()
                if (response.isSuccessful) {
                    response.body()?.let { data -> adapter.submitList(data.mails) }
                }
            } catch (_: Exception) {}
        }
    }

    private fun loadAccomplishments() {
        val recycler = view?.findViewById<RecyclerView>(R.id.recyclerAccomplishments) ?: return
        recycler.layoutManager = LinearLayoutManager(context)
        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getAccomplishments()
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        recycler.adapter = AccomplishmentAdapter(data.accomplishments)
                    }
                }
            } catch (_: Exception) {}
        }
    }

    // -- Inline adapters --

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
            val bg = if (position % 2 == 0) R.color.gt_row_even else R.color.gt_row_odd
            holder.itemView.setBackgroundResource(bg)
        }

        override fun getItemCount() = news.size
    }

    private class SponsorAdapter(
        private val offers: List<SponsorOfferData>,
        private val onAccept: (SponsorOfferData) -> Unit
    ) : RecyclerView.Adapter<SponsorAdapter.ViewHolder>() {

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
            val offer = offers[position]
            holder.label.text = offer.name ?: "Sponsor"
            holder.value.text = "${formatCurrency(offer.money.toLong())} + ${offer.stars}★"
            holder.itemView.setOnClickListener { onAccept(offer) }
            val bg = if (position % 2 == 0) R.color.gt_row_even else R.color.gt_row_odd
            holder.itemView.setBackgroundResource(bg)
        }

        override fun getItemCount() = offers.size
    }

    private class AccomplishmentAdapter(
        private val items: List<AccomplishmentData>
    ) : RecyclerView.Adapter<AccomplishmentAdapter.ViewHolder>() {

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
            val item = items[position]
            holder.label.text = item.name ?: "Achievement"
            holder.value.text = "✓"
            val bg = if (position % 2 == 0) R.color.gt_row_even else R.color.gt_row_odd
            holder.itemView.setBackgroundResource(bg)
        }

        override fun getItemCount() = items.size
    }
}
