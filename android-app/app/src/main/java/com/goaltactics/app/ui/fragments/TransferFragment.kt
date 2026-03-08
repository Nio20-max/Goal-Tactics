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
import com.goaltactics.app.data.model.TransferSearchRequest
import com.goaltactics.app.data.model.BidRequest
import com.goaltactics.app.data.model.RequestObject
import com.goaltactics.app.data.model.TransferPlayerData
import com.goaltactics.app.ui.adapters.TransferAdapter
import com.goaltactics.app.ui.shell.MainActivity
import kotlinx.coroutines.launch

class TransferFragment : Fragment() {

    private val adapter = TransferAdapter { player -> showBidDialog(player) }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_transfer, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val recycler = view.findViewById<RecyclerView>(R.id.recyclerTransfers)
        recycler.layoutManager = LinearLayoutManager(context)
        recycler.adapter = adapter

        view.findViewById<Button>(R.id.btnSearch).setOnClickListener {
            searchTransferMarket()
        }

        view.findViewById<Button>(R.id.btnFavourites).setOnClickListener {
            loadFavourites()
        }

        searchTransferMarket()
    }

    private fun searchTransferMarket() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        val minBidText = view?.findViewById<EditText>(R.id.editMinBid)?.text?.toString()
        val strengthText = view?.findViewById<EditText>(R.id.editMinStrength)?.text?.toString()
        val onlyKeeper = view?.findViewById<CheckBox>(R.id.checkKeeper)?.isChecked ?: false

        val request = TransferSearchRequest(
            minimumBid = minBidText?.toIntOrNull(),
            strength = strengthText?.toIntOrNull(),
            onlyKeeper = if (onlyKeeper) true else null
        )

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().searchTransfermarket(request)
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

    private fun showBidDialog(player: TransferPlayerData) {
        val context = context ?: return
        val editBid = EditText(context).apply {
            hint = "Bid amount"
            inputType = android.text.InputType.TYPE_CLASS_NUMBER
            setText(player.minimumBid.toString())
        }

        android.app.AlertDialog.Builder(context)
            .setTitle("Bid on ${player.name}")
            .setView(editBid)
            .setPositiveButton("Bid") { _, _ ->
                val bidAmount = editBid.text.toString().toIntOrNull() ?: return@setPositiveButton
                placeBid(player.id, bidAmount)
            }
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
                    searchTransferMarket()
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
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
                        adapter.submitList(data.players)
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }
}
