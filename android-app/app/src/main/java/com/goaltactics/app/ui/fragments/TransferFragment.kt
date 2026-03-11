package com.goaltactics.app.ui.fragments

import android.app.AlertDialog
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
import com.goaltactics.app.data.model.BidRequest
import com.goaltactics.app.data.model.IdRequest
import com.goaltactics.app.data.model.TransferPlayerData
import com.goaltactics.app.data.model.TransferSearchRequest
import com.goaltactics.app.ui.adapters.TransferAdapter
import com.goaltactics.app.ui.shell.MainActivity
import com.google.android.material.tabs.TabLayout
import kotlinx.coroutines.launch

class TransferFragment : Fragment() {

    private val searchAdapter = TransferAdapter { player -> showBidDialog(player) }
    private val bidsAdapter = TransferAdapter { player -> showBidDialog(player) }
    private val myAuctionsAdapter = TransferAdapter { player -> showBidDialog(player) }
    private val panels = mutableListOf<View>()
    private val positions = listOf("Any", "GK", "DEF", "MID", "ATT")

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_transfer, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        // Setup tabs
        val tabLayout = view.findViewById<TabLayout>(R.id.tabLayout)
        tabLayout.addTab(tabLayout.newTab().setText("Search result"))
        tabLayout.addTab(tabLayout.newTab().setText("Quick search"))
        tabLayout.addTab(tabLayout.newTab().setText("Bids & Favourites"))
        tabLayout.addTab(tabLayout.newTab().setText("My auctions"))

        panels.add(view.findViewById(R.id.panelSearchResult))
        panels.add(view.findViewById(R.id.panelQuickSearch))
        panels.add(view.findViewById(R.id.panelBidsFavourites))
        panels.add(view.findViewById(R.id.panelMyAuctions))

        tabLayout.addOnTabSelectedListener(object : TabLayout.OnTabSelectedListener {
            override fun onTabSelected(tab: TabLayout.Tab) {
                panels.forEachIndexed { i, p -> p.visibility = if (i == tab.position) View.VISIBLE else View.GONE }
                when (tab.position) {
                    2 -> loadFavourites()
                    3 -> loadMyAuctions()
                }
            }
            override fun onTabUnselected(tab: TabLayout.Tab) {}
            override fun onTabReselected(tab: TabLayout.Tab) {}
        })

        // Setup recyclers
        view.findViewById<RecyclerView>(R.id.recyclerTransfers).apply {
            layoutManager = LinearLayoutManager(context)
            adapter = searchAdapter
        }
        view.findViewById<RecyclerView>(R.id.recyclerBids).apply {
            layoutManager = LinearLayoutManager(context)
            adapter = bidsAdapter
        }
        view.findViewById<RecyclerView>(R.id.recyclerMyAuctions).apply {
            layoutManager = LinearLayoutManager(context)
            adapter = myAuctionsAdapter
        }

        // Position spinner
        val spinnerPosition = view.findViewById<Spinner>(R.id.spinnerPosition)
        spinnerPosition.adapter = ArrayAdapter(requireContext(), android.R.layout.simple_spinner_dropdown_item, positions)

        // Search button → do search then switch to results tab
        view.findViewById<Button>(R.id.btnSearch).setOnClickListener {
            searchTransferMarket()
            tabLayout.getTabAt(0)?.select()
        }
        view.findViewById<Button>(R.id.btnReset).setOnClickListener {
            spinnerPosition.setSelection(0)
            view.findViewById<Switch>(R.id.switchBudget)?.isChecked = false
        }

        // Start on Quick Search tab (index 1)
        tabLayout.getTabAt(1)?.select()
    }

    private fun searchTransferMarket() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        val positionIndex = view?.findViewById<Spinner>(R.id.spinnerPosition)?.selectedItemPosition ?: 0
        val position = if (positionIndex > 0) positions[positionIndex] else null
        val budgetLimit = view?.findViewById<Switch>(R.id.switchBudget)?.isChecked ?: false

        val request = TransferSearchRequest(
            minimumBid = null,
            strength = null,
            onlyKeeper = if (position == "GK") true else null
        )

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().searchTransfermarket(request)
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        searchAdapter.submitList(data.players)
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun showBidDialog(player: TransferPlayerData) {
        val context = context ?: return
        val layout = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(48, 32, 48, 16)
        }
        val editBid = EditText(context).apply {
            hint = "Bid amount"
            inputType = android.text.InputType.TYPE_CLASS_NUMBER
            setText(player.minimumBid.toString())
        }
        layout.addView(editBid)

        AlertDialog.Builder(context)
            .setTitle("Bid on ${player.name}")
            .setMessage("Position: ${player.position}\nStrength: ${player.strength}\nMin Bid: ${player.minimumBid}\nEnds: ${player.endDate ?: "-"}")
            .setView(layout)
            .setPositiveButton("Bid") { _, _ ->
                val bidAmount = editBid.text.toString().toIntOrNull() ?: return@setPositiveButton
                if (bidAmount < player.minimumBid) {
                    Toast.makeText(context, "Bid must be at least ${player.minimumBid}", Toast.LENGTH_SHORT).show()
                    return@setPositiveButton
                }
                placeBid(player.id, bidAmount)
            }
            .setNeutralButton("★ Favourite") { _, _ -> toggleFavourite(player.id) }
            .setNegativeButton("Cancel", null)
            .show()
    }

    private fun placeBid(playerId: java.util.UUID, amount: Int) {
        val main = requireActivity() as MainActivity
        viewLifecycleOwner.lifecycleScope.launch {
            try {
                main.showLoading(true)
                val response = ApiClient.get().bidPlayer(BidRequest(playerId, amount))
                if (response.isSuccessful) {
                    Toast.makeText(context, "Bid placed!", Toast.LENGTH_SHORT).show()
                    main.refreshResources()
                    loadFavourites()
                } else {
                    Toast.makeText(context, response.body()?.message ?: "Bid failed", Toast.LENGTH_SHORT).show()
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun toggleFavourite(playerId: java.util.UUID) {
        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().updateTransfermarketFavourites(IdRequest(playerId))
                if (response.isSuccessful) {
                    Toast.makeText(context, "Favourite updated!", Toast.LENGTH_SHORT).show()
                }
            } catch (_: Exception) {
            }
        }
    }

    private fun loadFavourites() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)
        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getTransfermarketFavourites()
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        bidsAdapter.submitList(data.players)
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun loadMyAuctions() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)
        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getMyTransfermarketAuctions()
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        myAuctionsAdapter.submitList(data.players)
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }
}
