package com.goaltactics.app.ui.login

import android.app.AlertDialog
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import com.goaltactics.app.BuildConfig
import com.goaltactics.app.GoalTacticsApp
import com.goaltactics.app.R
import com.goaltactics.app.databinding.ActivityLoginBinding
import com.goaltactics.app.ui.shell.MainActivity

class LoginActivity : AppCompatActivity() {

    private lateinit var binding: ActivityLoginBinding
    private val viewModel: LoginViewModel by viewModels()

    // Which page is currently visible (0=create team, 1=login, 2=register)
    private var currentPage = 0

    // Available countries: code → display name, matching flag_XX drawables
    private val countries = listOf(
        "ar" to "Argentina", "at" to "Austria", "be" to "Belgium", "bg" to "Bulgaria",
        "br" to "Brazil", "by" to "Belarus", "ch" to "Switzerland", "cl" to "Chile",
        "co" to "Colombia", "cr" to "Costa Rica", "cy" to "Cyprus", "cz" to "Czech Republic",
        "de" to "Germany", "dk" to "Denmark", "ec" to "Ecuador", "ee" to "Estonia",
        "el" to "Greece", "es" to "Spain", "fi" to "Finland", "fr" to "France",
        "gb" to "Great Britain", "hn" to "Honduras", "hu" to "Hungary", "ie" to "Ireland",
        "it" to "Italy", "lt" to "Lithuania", "lu" to "Luxembourg", "lv" to "Latvia",
        "mt" to "Malta", "mx" to "Mexico", "nl" to "Netherlands", "pl" to "Poland",
        "pt" to "Portugal", "ro" to "Romania", "ru" to "Russia", "sa" to "Saudi Arabia",
        "se" to "Sweden", "si" to "Slovenia", "sk" to "Slovakia", "tr" to "Turkey",
        "ua" to "Ukraine", "uy" to "Uruguay"
    )
    private var selectedCountry = "de"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val app = application as GoalTacticsApp
        if (app.tokenManager.isLoggedIn) {
            navigateToMain()
            return
        }

        binding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.textVersion.text = "${BuildConfig.VERSION_NAME} (${BuildConfig.VERSION_CODE})"
        setupListeners()
        observeState()
        showPage(0)
    }

    @Deprecated("Deprecated in Java")
    override fun onBackPressed() {
        when (currentPage) {
            1 -> showPage(0)  // Login → Create Team
            2 -> showPage(1)  // Register → Login
            else -> super.onBackPressed()
        }
    }

    private fun showPage(page: Int) {
        currentPage = page
        binding.pageCreateTeam.visibility = if (page == 0) View.VISIBLE else View.GONE
        binding.pageLogin.visibility = if (page == 1) View.VISIBLE else View.GONE
        binding.pageRegister.visibility = if (page == 2) View.VISIBLE else View.GONE
    }

    private fun setupListeners() {
        // ── Page 0: Create Team ──
        binding.imgCountrySelect.setOnClickListener { showCountryPicker() }
        binding.btnStart.setOnClickListener {
            val teamName = binding.editTeamName.text.toString().trim()
            if (teamName.length < 2) return@setOnClickListener
            val app = application as GoalTacticsApp
            viewModel.quickStart(teamName, app.tokenManager, selectedCountry)
        }
        binding.btnGoToLogin.setOnClickListener { showPage(1) }

        // ── Page 1: Login ──
        binding.btnLogin.setOnClickListener {
            val managerName = binding.editEmail.text.toString().trim()
            val password = binding.editPassword.text.toString()
            val app = application as GoalTacticsApp
            viewModel.login(managerName, password, app.tokenManager)
        }
        binding.btnFacebook.setOnClickListener {
            AlertDialog.Builder(this, R.style.GT_Dialog)
                .setTitle("Facebook Login")
                .setMessage("Facebook login is not available in this version.")
                .setPositiveButton(R.string.ok, null)
                .show()
        }
        binding.btnSupport.setOnClickListener {
            AlertDialog.Builder(this, R.style.GT_Dialog)
                .setTitle("Support")
                .setMessage("Need help? Visit our website or contact support.")
                .setPositiveButton(R.string.ok, null)
                .show()
        }
        binding.btnQuickStart.setOnClickListener { showPage(0) }
        binding.btnRegister.setOnClickListener { showPage(2) }

        // ── Page 2: Register ──
        binding.btnDoRegister.setOnClickListener {
            viewModel.register(
                binding.editRegEmail.text.toString().trim(),
                binding.editRegManagerName.text.toString().trim(),
                binding.editRegPassword.text.toString(),
                binding.editRegPasswordConfirm.text.toString()
            )
        }
        binding.btnRegCancel.setOnClickListener { showPage(1) }
    }

    private fun observeState() {
        viewModel.loginState.observe(this) { state ->
            when (state) {
                is LoginViewModel.LoginState.Loading -> {
                    binding.loadingOverlay.visibility = View.VISIBLE
                    binding.textError.visibility = View.GONE
                }
                is LoginViewModel.LoginState.Success -> {
                    binding.loadingOverlay.visibility = View.GONE
                    navigateToMain()
                }
                is LoginViewModel.LoginState.Error -> {
                    binding.loadingOverlay.visibility = View.GONE
                    binding.textError.text = state.message
                    binding.textError.visibility = View.VISIBLE
                }
            }
        }

        viewModel.registerState.observe(this) { state ->
            when (state) {
                is LoginViewModel.RegisterState.Loading -> {
                    binding.loadingOverlay.visibility = View.VISIBLE
                    binding.textRegError.visibility = View.GONE
                }
                is LoginViewModel.RegisterState.Success -> {
                    binding.loadingOverlay.visibility = View.GONE
                    // Go back to login, pre-fill the manager name
                    binding.editEmail.setText(binding.editRegManagerName.text.toString().trim())
                    showPage(1)
                }
                is LoginViewModel.RegisterState.Error -> {
                    binding.loadingOverlay.visibility = View.GONE
                    binding.textRegError.text = state.message
                    binding.textRegError.visibility = View.VISIBLE
                }
            }
        }
    }

    private fun showCountryPicker() {
        val names = countries.map { it.second }.toTypedArray()
        AlertDialog.Builder(this, R.style.GT_Dialog)
            .setTitle("Select a country")
            .setItems(names) { _, which ->
                selectedCountry = countries[which].first
                val resId = resources.getIdentifier("flag_$selectedCountry", "drawable", packageName)
                if (resId != 0) binding.imgCountrySelect.setImageResource(resId)
            }
            .show()
    }

    private fun navigateToMain() {
        startActivity(Intent(this, MainActivity::class.java))
        finish()
    }
}
