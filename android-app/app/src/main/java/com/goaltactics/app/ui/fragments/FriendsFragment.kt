package com.goaltactics.app.ui.fragments

import android.app.AlertDialog
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
import com.goaltactics.app.data.model.FriendData
import com.goaltactics.app.data.model.IdRequest
import com.goaltactics.app.data.model.SearchRequest
import com.goaltactics.app.ui.adapters.FriendAdapter
import com.goaltactics.app.ui.shell.MainActivity
import com.google.android.material.tabs.TabLayout
import kotlinx.coroutines.launch

class FriendsFragment : Fragment() {

    private val friendsAdapter = FriendAdapter { friend -> showFriendAction(friend) }
    private val challengesAdapter = FriendAdapter { friend -> sendChallenge(friend) }
    private val searchAdapter = FriendAdapter { friend -> showFriendAction(friend) }
    private val panels = mutableListOf<View>()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_friends, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        // Setup tabs
        val tabLayout = view.findViewById<TabLayout>(R.id.tabLayout)
        tabLayout.addTab(tabLayout.newTab().setText("Friends list"))
        tabLayout.addTab(tabLayout.newTab().setText("Challenges"))
        tabLayout.addTab(tabLayout.newTab().setText("Search friends"))

        panels.add(view.findViewById(R.id.panelFriendsList))
        panels.add(view.findViewById(R.id.panelChallenges))
        panels.add(view.findViewById(R.id.panelSearchFriends))

        tabLayout.addOnTabSelectedListener(object : TabLayout.OnTabSelectedListener {
            override fun onTabSelected(tab: TabLayout.Tab) {
                panels.forEachIndexed { i, p -> p.visibility = if (i == tab.position) View.VISIBLE else View.GONE }
            }
            override fun onTabUnselected(tab: TabLayout.Tab) {}
            override fun onTabReselected(tab: TabLayout.Tab) {}
        })

        // Friends list
        view.findViewById<RecyclerView>(R.id.recyclerFriends).apply {
            layoutManager = LinearLayoutManager(context)
            adapter = friendsAdapter
        }
        // Challenges
        view.findViewById<RecyclerView>(R.id.recyclerChallenges).apply {
            layoutManager = LinearLayoutManager(context)
            adapter = challengesAdapter
        }
        // Search
        view.findViewById<RecyclerView>(R.id.recyclerSearchResults).apply {
            layoutManager = LinearLayoutManager(context)
            adapter = searchAdapter
        }

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
                        friendsAdapter.submitList(data.friends)
                        val noFriends = view?.findViewById<View>(R.id.noFriendsContainer)
                        noFriends?.visibility = if (data.friends.isNullOrEmpty()) View.VISIBLE else View.GONE
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
                        searchAdapter.submitList(data.friends)
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun showFriendAction(friend: FriendData) {
        val ctx = context ?: return
        val actions = mutableListOf<String>()

        if (friend.isFriend) {
            actions.add("Challenge")
            actions.add(if (friend.isLiked) "Unlike" else "Like")
        } else if (friend.isRequestIncoming) {
            actions.add("Accept")
            actions.add("Decline")
        } else if (friend.isRequestOutgoing) {
            actions.add("Request Pending...")
        } else {
            actions.add("Add Friend")
        }

        AlertDialog.Builder(ctx)
            .setTitle(friend.name ?: "Friend")
            .setItems(actions.toTypedArray()) { _, which ->
                when (actions[which]) {
                    "Accept" -> friendAction("Accepted!") { ApiClient.get().acceptFriend(IdRequest(friend.id)) }
                    "Decline" -> friendAction("Declined") { ApiClient.get().declineFriend(IdRequest(friend.id)) }
                    "Like" -> friendAction("Liked!") { ApiClient.get().like(IdRequest(friend.id)) }
                    "Unlike" -> friendAction("Unliked") { ApiClient.get().unlike(IdRequest(friend.id)) }
                    "Challenge" -> sendChallenge(friend)
                }
            }
            .setNegativeButton("Cancel", null)
            .show()
    }

    private fun sendChallenge(friend: FriendData) {
        val ctx = context ?: return
        AlertDialog.Builder(ctx)
            .setTitle("Challenge ${friend.name}?")
            .setMessage("Send a friendly match challenge?")
            .setPositiveButton("Challenge") { _, _ ->
                friendAction("Challenge sent!") { ApiClient.get().sendChallenge(IdRequest(friend.foreignTeamId)) }
            }
            .setNegativeButton("Cancel", null)
            .show()
    }

    private fun friendAction(successMsg: String, action: suspend () -> retrofit2.Response<*>) {
        val main = requireActivity() as MainActivity
        viewLifecycleOwner.lifecycleScope.launch {
            try {
                main.showLoading(true)
                val result = action()
                if (result.isSuccessful) {
                    Toast.makeText(context, successMsg, Toast.LENGTH_SHORT).show()
                }
                loadFriends()
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }
}
