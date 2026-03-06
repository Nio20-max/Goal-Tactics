package com.microsoft.appcenter.analytics;

import com.helpshift.analytics.AnalyticsEventKey;
import com.microsoft.appcenter.utils.AppCenterLog;
import com.microsoft.appcenter.utils.HashUtils;
import com.microsoft.appcenter.utils.TicketCache;
import java.util.Date;

/* JADX INFO: loaded from: classes2.dex */
public class AuthenticationProvider {
    private static final long REFRESH_THRESHOLD = 600000;
    private AuthenticationCallback mCallback;
    private Date mExpiryDate;
    private final String mTicketKey;
    private final String mTicketKeyHash;
    private final TokenProvider mTokenProvider;
    private final Type mType;

    public interface AuthenticationCallback {
        void onAuthenticationResult(String tokenValue, Date expiryDate);
    }

    public interface TokenProvider {
        void acquireToken(String ticketKey, AuthenticationCallback callback);
    }

    public AuthenticationProvider(Type type, String ticketKey, TokenProvider tokenProvider) {
        this.mType = type;
        this.mTicketKey = ticketKey;
        this.mTicketKeyHash = ticketKey == null ? null : HashUtils.sha256(ticketKey);
        this.mTokenProvider = tokenProvider;
    }

    Type getType() {
        return this.mType;
    }

    String getTicketKey() {
        return this.mTicketKey;
    }

    String getTicketKeyHash() {
        return this.mTicketKeyHash;
    }

    TokenProvider getTokenProvider() {
        return this.mTokenProvider;
    }

    synchronized void acquireTokenAsync() {
        if (this.mCallback != null) {
            return;
        }
        AppCenterLog.debug(Analytics.LOG_TAG, "Calling token provider=" + this.mType + " callback.");
        AuthenticationCallback authenticationCallback = new AuthenticationCallback() { // from class: com.microsoft.appcenter.analytics.AuthenticationProvider.1
            @Override // com.microsoft.appcenter.analytics.AuthenticationProvider.AuthenticationCallback
            public void onAuthenticationResult(String token, Date expiryDate) {
                AuthenticationProvider.this.handleTokenUpdate(token, expiryDate, this);
            }
        };
        this.mCallback = authenticationCallback;
        this.mTokenProvider.acquireToken(this.mTicketKey, authenticationCallback);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void handleTokenUpdate(String token, Date expiryDate, AuthenticationCallback callback) {
        if (this.mCallback != callback) {
            AppCenterLog.debug(Analytics.LOG_TAG, "Ignore duplicate authentication callback calls, provider=" + this.mType);
            return;
        }
        this.mCallback = null;
        AppCenterLog.debug(Analytics.LOG_TAG, "Got result back from token provider=" + this.mType);
        if (token == null) {
            AppCenterLog.error(Analytics.LOG_TAG, "Authentication failed for ticketKey=" + this.mTicketKey);
            return;
        }
        if (expiryDate == null) {
            AppCenterLog.error(Analytics.LOG_TAG, "No expiry date provided for ticketKey=" + this.mTicketKey);
            return;
        }
        TicketCache.putTicket(this.mTicketKeyHash, this.mType.mTokenPrefix + token);
        this.mExpiryDate = expiryDate;
    }

    synchronized void checkTokenExpiry() {
        Date date = this.mExpiryDate;
        if (date != null && date.getTime() <= System.currentTimeMillis() + 600000) {
            acquireTokenAsync();
        }
    }

    public enum Type {
        MSA_COMPACT(AnalyticsEventKey.PROTOCOL),
        MSA_DELEGATE("d");

        private final String mTokenPrefix;

        Type(String tokenPrefix) {
            this.mTokenPrefix = tokenPrefix + ":";
        }
    }
}
