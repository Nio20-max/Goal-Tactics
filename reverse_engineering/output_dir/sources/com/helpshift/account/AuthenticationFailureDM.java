package com.helpshift.account;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.exception.ExceptionType;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.delegate.AuthenticationFailureReason;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class AuthenticationFailureDM {
    Domain domain;
    List<AuthenticationFailureObserver> observerList = new ArrayList();

    public interface AuthenticationFailureObserver {
        void onAuthenticationFailure();
    }

    public AuthenticationFailureDM(Domain domain) {
        this.domain = domain;
    }

    public void registerListener(AuthenticationFailureObserver authenticationFailureObserver) {
        if (authenticationFailureObserver != null) {
            this.observerList.add(authenticationFailureObserver);
        }
    }

    public void unregisterListener(AuthenticationFailureObserver authenticationFailureObserver) {
        if (authenticationFailureObserver != null) {
            this.observerList.remove(authenticationFailureObserver);
        }
    }

    public void notifyAuthenticationFailure(UserDM userDM, ExceptionType exceptionType) {
        if (userDM.isActiveUser()) {
            AuthenticationFailureReason authenticationFailureReason = null;
            if (exceptionType == NetworkException.AUTH_TOKEN_NOT_PROVIDED) {
                authenticationFailureReason = AuthenticationFailureReason.AUTH_TOKEN_NOT_PROVIDED;
            } else if (exceptionType == NetworkException.INVALID_AUTH_TOKEN) {
                authenticationFailureReason = AuthenticationFailureReason.INVALID_AUTH_TOKEN;
            }
            if (authenticationFailureReason == null) {
                return;
            }
            notifyObservers();
            this.domain.getDelegate().authenticationFailed(userDM, authenticationFailureReason);
        }
    }

    private void notifyObservers() {
        for (AuthenticationFailureObserver authenticationFailureObserver : this.observerList) {
            if (authenticationFailureObserver != null) {
                authenticationFailureObserver.onAuthenticationFailure();
            }
        }
    }
}
