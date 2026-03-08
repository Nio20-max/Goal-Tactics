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
import com.goaltactics.app.data.model.RequestObject
import com.goaltactics.app.ui.adapters.MailAdapter
import com.goaltactics.app.ui.shell.MainActivity
import kotlinx.coroutines.launch

class MailFragment : Fragment() {

    private val adapter = MailAdapter { mail ->
        // Show mail detail in a dialog
        android.app.AlertDialog.Builder(requireContext())
            .setTitle(mail.subject)
            .setMessage("${mail.sender ?: "System"}\n\n${mail.message}")
            .setPositiveButton("OK", null)
            .show()
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        // Reuse a simple RecyclerView layout
        val recycler = RecyclerView(requireContext()).apply {
            layoutManager = LinearLayoutManager(context)
            adapter = this@MailFragment.adapter
            setBackgroundResource(R.color.gt_background_dark)
        }
        return recycler
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
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
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }
}
