package com.goaltactics.app.ui.login

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.data.auth.TokenManager
import com.goaltactics.app.data.model.AuthRequest
import com.goaltactics.app.data.model.RegisterRequest
import kotlinx.coroutines.launch

class LoginViewModel : ViewModel() {

    private val api = ApiClient.get()

    private val _loginState = MutableLiveData<LoginState>()
    val loginState: LiveData<LoginState> = _loginState

    private val _registerState = MutableLiveData<RegisterState>()
    val registerState: LiveData<RegisterState> = _registerState

    fun login(managerName: String, password: String, tokenManager: TokenManager) {
        if (managerName.isBlank() || managerName.length < 2) {
            _loginState.value = LoginState.Error("Please enter your manager name")
            return
        }
        if (password.isBlank()) {
            _loginState.value = LoginState.Error("Please enter your password")
            return
        }

        _loginState.value = LoginState.Loading
        viewModelScope.launch {
            try {
                val response = api.login(AuthRequest(managerName, password))
                if (response.isSuccessful) {
                    val body = response.body()
                    if (body?.success == true && !body.token.isNullOrBlank()) {
                        tokenManager.token = body.token
                        tokenManager.managerName = body.managerName
                        _loginState.value = LoginState.Success(body.managerName ?: "Manager")
                    } else {
                        _loginState.value = LoginState.Error(body?.message ?: "Login failed")
                    }
                } else {
                    _loginState.value = LoginState.Error("Login failed (${response.code()})")
                }
            } catch (e: Exception) {
                _loginState.value = LoginState.Error(e.message ?: "Network error")
            }
        }
    }

    fun quickStart(teamName: String, tokenManager: TokenManager, countryId: String? = null) {
        _loginState.value = LoginState.Loading
        viewModelScope.launch {
            try {
                val response = api.register(RegisterRequest(isGuest = true, teamName = teamName, countryId = countryId))
                if (response.isSuccessful) {
                    val body = response.body()
                    if (body?.success == true && !body.login.isNullOrBlank()) {
                        // Auto-login with the returned credentials
                        val loginResponse = api.login(AuthRequest(body.login!!, body.password ?: ""))
                        if (loginResponse.isSuccessful) {
                            val loginBody = loginResponse.body()
                            if (loginBody?.success == true && !loginBody.token.isNullOrBlank()) {
                                tokenManager.token = loginBody.token
                                tokenManager.managerName = loginBody.managerName
                                _loginState.value = LoginState.Success(loginBody.managerName ?: "Manager")
                            } else {
                                _loginState.value = LoginState.Error(loginBody?.message ?: "Auto-login failed")
                            }
                        } else {
                            _loginState.value = LoginState.Error("Auto-login failed")
                        }
                    } else {
                        _loginState.value = LoginState.Error(body?.message ?: "Quick start failed")
                    }
                } else {
                    _loginState.value = LoginState.Error("Quick start failed (${response.code()})")
                }
            } catch (e: Exception) {
                _loginState.value = LoginState.Error(e.message ?: "Network error")
            }
        }
    }

    fun register(email: String, managerName: String, password: String, passwordConfirm: String) {
        if (email.isBlank()) {
            _registerState.value = RegisterState.Error("Please enter a valid email")
            return
        }
        if (managerName.length < 2 || managerName.length > 64) {
            _registerState.value = RegisterState.Error("Manager name must be 2–64 characters")
            return
        }
        if (password.length < 4) {
            _registerState.value = RegisterState.Error("Password must be at least 4 characters")
            return
        }
        if (password != passwordConfirm) {
            _registerState.value = RegisterState.Error("Passwords don't match")
            return
        }

        _registerState.value = RegisterState.Loading
        viewModelScope.launch {
            try {
                val response = api.register(RegisterRequest(
                    email = email,
                    password = password,
                    managerName = managerName
                ))
                if (response.isSuccessful) {
                    val body = response.body()
                    if (body?.success == true) {
                        _registerState.value = RegisterState.Success
                    } else {
                        _registerState.value = RegisterState.Error(body?.message ?: "Registration failed")
                    }
                } else {
                    _registerState.value = RegisterState.Error("Registration failed (${response.code()})")
                }
            } catch (e: Exception) {
                _registerState.value = RegisterState.Error(e.message ?: "Network error")
            }
        }
    }

    sealed class LoginState {
        data object Loading : LoginState()
        data class Success(val managerName: String) : LoginState()
        data class Error(val message: String) : LoginState()
    }

    sealed class RegisterState {
        data object Loading : RegisterState()
        data object Success : RegisterState()
        data class Error(val message: String) : RegisterState()
    }
}
