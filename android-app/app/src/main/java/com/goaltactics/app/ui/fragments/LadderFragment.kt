package com.goaltactics.app.ui.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.R
import com.goaltactics.app.data.model.IdRequest
import com.goaltactics.app.ui.adapters.LadderAdapter
import com.goaltactics.app.ui.shell.MainActivity
import kotlinx.coroutines.launch

class LadderFragment : Fragment() {

    private val adapter = LadderAdapter()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_ladder, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        val recycler = view.findViewById<RecyclerView>(R.id.recyclerLadder)
        recycler.layoutManager = LinearLayoutManager(context)
        recycler.adapter = adapter
        loadLadder()
    }

    private fun loadLadder() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getLadder(IdRequest(java.util.UUID(0, 0)))
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        view?.findViewById<android.widget.TextView>(R.id.textLadderEnd)?.text = data.endDate ?: ""
                        adapter.submitList(data.teams)
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }
}
