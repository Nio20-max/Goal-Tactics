package com.goaltactics.app.ui.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.CheckBox
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.R
import com.goaltactics.app.data.model.NotificationSettings
import com.goaltactics.app.data.model.PreferencesRequest
import com.goaltactics.app.data.model.RequestObject
import com.goaltactics.app.ui.shell.MainActivity
import kotlinx.coroutines.launch

class SettingsFragment : Fragment() {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_settings, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        view.findViewById<Button>(R.id.btnSavePrefs).setOnClickListener { saveSettings() }
        view.findViewById<Button>(R.id.btnDailyReward)?.setOnClickListener { claimDailyReward() }
        view.findViewById<Button>(R.id.btnLogout).setOnClickListener {
            (requireActivity() as MainActivity).logout()
        }
        view.findViewById<Button>(R.id.btnDeleteAccount).setOnClickListener {
            android.app.AlertDialog.Builder(requireContext())
                .setTitle("Delete Account")
                .setMessage("Are you sure? This cannot be undone.")
                .setPositiveButton("Delete") { _, _ -> deleteAccount() }
                .setNegativeButton("Cancel", null)
                .show()
        }

        loadSettings()
    }

    private fun loadSettings() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getPreferences()
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        data.notificationSettings?.let { ns ->
                            view?.findViewById<CheckBox>(R.id.checkAuctionOverbid)?.isChecked = ns.auctionOverbid
                            view?.findViewById<CheckBox>(R.id.checkMatchResults)?.isChecked = ns.matchResults
                            view?.findViewById<CheckBox>(R.id.checkLineupIncomplete)?.isChecked = ns.lineupIncomplete
                            view?.findViewById<CheckBox>(R.id.checkFriendInvite)?.isChecked = ns.friendInvite
                            view?.findViewById<CheckBox>(R.id.checkIneffectiveTraining)?.isChecked = ns.ineffectiveTraining
                            view?.findViewById<CheckBox>(R.id.checkFriendlyMatch)?.isChecked = ns.friendlyMatch
                            view?.findViewById<CheckBox>(R.id.checkSystem)?.isChecked = ns.system
                            view?.findViewById<CheckBox>(R.id.checkAuctionEnd)?.isChecked = ns.auctionEnd
                        }
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun saveSettings() {
        val main = requireActivity() as MainActivity

        val settings = NotificationSettings(
            auctionOverbid = view?.findViewById<CheckBox>(R.id.checkAuctionOverbid)?.isChecked ?: false,
            matchResults = view?.findViewById<CheckBox>(R.id.checkMatchResults)?.isChecked ?: false,
            lineupIncomplete = view?.findViewById<CheckBox>(R.id.checkLineupIncomplete)?.isChecked ?: false,
            friendInvite = view?.findViewById<CheckBox>(R.id.checkFriendInvite)?.isChecked ?: false,
            ineffectiveTraining = view?.findViewById<CheckBox>(R.id.checkIneffectiveTraining)?.isChecked ?: false,
            friendlyMatch = view?.findViewById<CheckBox>(R.id.checkFriendlyMatch)?.isChecked ?: false,
            system = view?.findViewById<CheckBox>(R.id.checkSystem)?.isChecked ?: false,
            auctionEnd = view?.findViewById<CheckBox>(R.id.checkAuctionEnd)?.isChecked ?: false
        )

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                main.showLoading(true)
                val response = ApiClient.get().savePreferences(PreferencesRequest(settings))
                if (response.isSuccessful) {
                    Toast.makeText(context, "Settings saved", Toast.LENGTH_SHORT).show()
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun deleteAccount() {
        val main = requireActivity() as MainActivity

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                main.showLoading(true)
                val response = ApiClient.get().deleteAccount()
                if (response.isSuccessful) {
                    main.logout()
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun claimDailyReward() {
        val main = requireActivity() as MainActivity

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                main.showLoading(true)
                val response = ApiClient.get().claimDailyReward()
                if (response.isSuccessful) {
                    Toast.makeText(context, "Daily reward claimed!", Toast.LENGTH_SHORT).show()
                    main.refreshResources()
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }
}
