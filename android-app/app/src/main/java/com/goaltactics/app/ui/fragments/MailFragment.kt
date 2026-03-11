package com.goaltactics.app.ui.fragments

import android.app.AlertDialog
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.R
import com.goaltactics.app.data.model.IdRequest
import com.goaltactics.app.data.model.MailData
import com.goaltactics.app.ui.adapters.MailAdapter
import com.goaltactics.app.ui.shell.MainActivity
import kotlinx.coroutines.launch

class MailFragment : Fragment() {

    private val adapter = MailAdapter { mail -> showMailDetail(mail) }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_mail, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        view.findViewById<RecyclerView>(R.id.recyclerMail).apply {
            layoutManager = LinearLayoutManager(context)
            adapter = this@MailFragment.adapter
        }
        loadMail()
    }

    private fun loadMail() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getMyMail()
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        adapter.submitList(data.mails)
                        view?.findViewById<View>(R.id.textNoMail)?.visibility =
                            if (data.mails.isEmpty()) View.VISIBLE else View.GONE
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun showMailDetail(mail: MailData) {
        val ctx = context ?: return

        // Mark as read
        if (mail.isNew) {
            viewLifecycleOwner.lifecycleScope.launch {
                try { ApiClient.get().markAsRead(IdRequest(mail.id)) } catch (_: Exception) {}
            }
        }

        AlertDialog.Builder(ctx)
            .setTitle(mail.subject)
            .setMessage(buildString {
                append("From: ${mail.sender ?: "System"}\n")
                append("Date: ${mail.date ?: "-"}\n\n")
                append(mail.message ?: "")
                if (!mail.extra.isNullOrEmpty()) {
                    append("\n\n${mail.extra}")
                }
            })
            .setPositiveButton("OK") { _, _ -> loadMail() }
            .setNeutralButton("Delete") { _, _ -> deleteMail(mail) }
            .show()
    }

    private fun deleteMail(mail: MailData) {
        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().deleteMail(IdRequest(mail.id))
                if (response.isSuccessful) {
                    Toast.makeText(context, "Mail deleted", Toast.LENGTH_SHORT).show()
                    loadMail()
                }
            } catch (_: Exception) {
            }
        }
    }
}
