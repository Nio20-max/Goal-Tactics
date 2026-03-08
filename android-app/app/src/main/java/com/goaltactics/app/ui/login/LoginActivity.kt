package com.goaltactics.app.ui.login

import android.app.AlertDialog
import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import com.goaltactics.app.GoalTacticsApp
import com.goaltactics.app.R
import com.goaltactics.app.databinding.ActivityLoginBinding
import com.goaltactics.app.ui.shell.MainActivity

class LoginActivity : AppCompatActivity() {

    private lateinit var binding: ActivityLoginBinding
    private val viewModel: LoginViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val app = application as GoalTacticsApp
        if (app.tokenManager.isLoggedIn) {
            navigateToMain()
            return
        }

        binding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setupListeners()
        observeState()
    }

    private fun setupListeners() {
        binding.btnLogin.setOnClickListener {
            val email = binding.editEmail.text.toString().trim()
            val password = binding.editPassword.text.toString()
            val app = application as GoalTacticsApp
            viewModel.login(email, password, app.tokenManager)
        }

        binding.btnRegister.setOnClickListener {
            showRegisterDialog()
        }

        binding.btnQuickStart.setOnClickListener {
            // Quick-start creates a temporary account and logs in
            val app = application as GoalTacticsApp
            viewModel.login("quickstart@goaltactics.com", "quickstart_temp", app.tokenManager)
        }
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
    }

    private fun showRegisterDialog() {
        val dialogView = LayoutInflater.from(this).inflate(R.layout.dialog_register, null)
        val dialog = AlertDialog.Builder(this, R.style.GT_Dialog)
            .setView(dialogView)
            .create()

        val editEmail = dialogView.findViewById<EditText>(R.id.editRegEmail)
        val editName = dialogView.findViewById<EditText>(R.id.editRegManagerName)
        val editPassword = dialogView.findViewById<EditText>(R.id.editRegPassword)
        val editPasswordConfirm = dialogView.findViewById<EditText>(R.id.editRegPasswordConfirm)
        val textError = dialogView.findViewById<TextView>(R.id.textRegError)
        val btnRegister = dialogView.findViewById<Button>(R.id.btnDoRegister)
        val btnCancel = dialogView.findViewById<Button>(R.id.btnRegCancel)

        btnRegister.setOnClickListener {
            viewModel.register(
                editEmail.text.toString().trim(),
                editName.text.toString().trim(),
                editPassword.text.toString(),
                editPasswordConfirm.text.toString()
            )
        }

        btnCancel.setOnClickListener { dialog.dismiss() }

        viewModel.registerState.observe(this) { state ->
            when (state) {
                is LoginViewModel.RegisterState.Loading -> {
                    textError.visibility = View.GONE
                }
                is LoginViewModel.RegisterState.Success -> {
                    dialog.dismiss()
                    // Auto-fill login fields after successful registration
                    binding.editEmail.setText(editEmail.text.toString().trim())
                }
                is LoginViewModel.RegisterState.Error -> {
                    textError.text = state.message
                    textError.visibility = View.VISIBLE
                }
            }
        }

        dialog.show()
    }

    private fun navigateToMain() {
        startActivity(Intent(this, MainActivity::class.java))
        finish()
    }
}
