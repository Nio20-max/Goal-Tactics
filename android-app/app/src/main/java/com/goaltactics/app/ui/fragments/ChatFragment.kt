package com.goaltactics.app.ui.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.R
import com.goaltactics.app.GoalTacticsApp
import com.goaltactics.app.data.model.ChatPostRequest
import com.goaltactics.app.ui.adapters.ChatMessageAdapter
import com.goaltactics.app.ui.shell.MainActivity
import kotlinx.coroutines.launch

class ChatFragment : Fragment() {

    private val adapter = ChatMessageAdapter()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_chat, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val recycler = view.findViewById<RecyclerView>(R.id.recyclerMessages)
        recycler.layoutManager = LinearLayoutManager(context).apply { stackFromEnd = true }
        recycler.adapter = adapter

        val editMessage = view.findViewById<EditText>(R.id.editMessage)
        view.findViewById<Button>(R.id.btnSend).setOnClickListener {
            val msg = editMessage.text.toString().trim()
            if (msg.isNotEmpty()) {
                sendMessage(msg)
                editMessage.text.clear()
            }
        }

        loadChatHistory()
        connectToHub()
    }

    private fun loadChatHistory() {

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getChatHistory()
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        adapter.submitList(data.messages)
                        if (data.messages.isNotEmpty()) {
                            val recycler = view?.findViewById<RecyclerView>(R.id.recyclerMessages)
                            recycler?.scrollToPosition(data.messages.size - 1)
                        }
                    }
                }
            } catch (_: Exception) {
            }
        }
    }

    private fun connectToHub() {
        GoalTacticsApp.instance.chatHubClient.setOnMessageReceived { userId, userName, text, createdAt ->
            activity?.runOnUiThread {
                val current = adapter.currentList.toMutableList()
                current.add(
                    com.goaltactics.app.data.model.ChatMessageData(
                        id = java.util.UUID.randomUUID(),
                        userId = userId,
                        userName = userName,
                        message = text,
                        createdAt = createdAt
                    )
                )
                adapter.submitList(current)
                view?.findViewById<RecyclerView>(R.id.recyclerMessages)
                    ?.scrollToPosition(current.size - 1)
            }
        }
        viewLifecycleOwner.lifecycleScope.launch {
            GoalTacticsApp.instance.chatHubClient.connect()
        }
    }

    private fun sendMessage(message: String) {

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().postChatMessage(ChatPostRequest(message))
                if (!response.isSuccessful) {
                    Toast.makeText(context, "Failed to send", Toast.LENGTH_SHORT).show()
                }
            } catch (_: Exception) {
                Toast.makeText(context, "Network error", Toast.LENGTH_SHORT).show()
            }
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        // Don't disconnect hub globally, just clear callback
        GoalTacticsApp.instance.chatHubClient.setOnMessageReceived { _, _, _, _ -> }
    }
}
