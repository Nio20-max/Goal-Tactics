package com.goaltactics.app.ui.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.EditText
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.R
import com.goaltactics.app.data.model.IdRequest
import com.goaltactics.app.data.model.SearchRequest
import com.goaltactics.app.ui.adapters.FriendAdapter
import com.goaltactics.app.ui.shell.MainActivity
import kotlinx.coroutines.launch

class FriendsFragment : Fragment() {

    private val adapter = FriendAdapter { friend -> showFriendAction(friend) }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_friends, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val recycler = view.findViewById<RecyclerView>(R.id.recyclerFriends)
        recycler.layoutManager = LinearLayoutManager(context)
        recycler.adapter = adapter

        view.findViewById<View>(R.id.btnSearchFriends)?.setOnClickListener {
            val query = view.findViewById<EditText>(R.id.editSearch)?.text?.toString()?.trim()
            if (!query.isNullOrEmpty()) {
                searchFriends(query)
            }
        }

        loadFriends()
    }

    private fun loadFriends() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getFriends(SearchRequest(text = null, value = 0, language = null))
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        adapter.submitList(data.friends)
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun searchFriends(query: String) {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val request = SearchRequest(text = query, value = 0, language = null)
                val response = ApiClient.get().getFriends(request)
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        adapter.submitList(data.friends)
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun showFriendAction(friend: com.goaltactics.app.data.model.FriendData) {
        val ctx = context ?: return
        val actions = if (friend.isFriend) {
            arrayOf("Like", "Unlike")
        } else {
            arrayOf("Accept", "Decline")
        }
        android.app.AlertDialog.Builder(ctx)
            .setTitle(friend.name ?: "Friend")
            .setItems(actions) { _, which ->
                when (actions[which]) {
                    "Accept" -> friendAction { ApiClient.get().acceptFriend(IdRequest(friend.id)) }
                    "Decline" -> friendAction { ApiClient.get().declineFriend(IdRequest(friend.id)) }
                    "Like" -> friendAction { ApiClient.get().like(IdRequest(friend.id)) }
                    "Unlike" -> friendAction { ApiClient.get().unlike(IdRequest(friend.id)) }
                }
            }
            .setNegativeButton("Cancel", null)
            .show()
    }

    private fun friendAction(action: suspend () -> retrofit2.Response<*>) {
        val main = requireActivity() as MainActivity
        viewLifecycleOwner.lifecycleScope.launch {
            try {
                main.showLoading(true)
                action()
                loadFriends()
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }
}
