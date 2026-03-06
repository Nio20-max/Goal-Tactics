package com.helpshift.configuration.domainmodel;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.account.domainmodel.UserManagerDM;
import com.helpshift.common.AutoRetriableDM;
import com.helpshift.common.AutoRetryFailedEventDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.domain.network.ETagNetwork;
import com.helpshift.common.domain.network.FailedAPICallNetworkDecorator;
import com.helpshift.common.domain.network.GETNetwork;
import com.helpshift.common.domain.network.GuardOKNetwork;
import com.helpshift.common.domain.network.NetworkConstants;
import com.helpshift.common.domain.network.NetworkDataRequestUtil;
import com.helpshift.common.domain.network.NetworkErrorCodes;
import com.helpshift.common.domain.network.TSCorrectedNetwork;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.platform.network.RequestData;
import com.helpshift.common.platform.network.Response;
import com.helpshift.common.platform.network.ResponseParser;
import com.helpshift.configuration.response.RootServerConfig;
import com.helpshift.redaction.RedactionAgent;
import com.helpshift.util.Callback;
import com.helpshift.util.HSLogger;
import com.helpshift.util.StringUtils;
import java.lang.ref.WeakReference;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: loaded from: classes2.dex */
public class ConfigFetchDM implements AutoRetriableDM {
    private static final String TAG = "Helpshift_CnfgFtch";
    private Domain domain;
    private final AtomicBoolean isInProgress;
    private WeakReference<Callback<Void, Void>> listener;
    private Platform platform;
    private ResponseParser responseParser;
    private SDKConfigurationDM sdkConfigurationDM;

    public ConfigFetchDM(Platform platform, Domain domain) {
        this.platform = platform;
        this.domain = domain;
        this.sdkConfigurationDM = domain.getSDKConfigurationDM();
        this.responseParser = platform.getResponseParser();
        this.domain.getAutoRetryFailedEventDM().register(AutoRetryFailedEventDM.EventType.CONFIG, this);
        this.isInProgress = new AtomicBoolean(false);
    }

    public void setListener(Callback<Void, Void> callback) {
        this.listener = callback == null ? null : new WeakReference<>(callback);
    }

    public boolean isFetchInProgress() {
        return this.isInProgress.get();
    }

    public void fetchServerConfig(final boolean z) {
        if (this.isInProgress.get()) {
            HSLogger.d(TAG, "Config fetch already in progress, skipping.");
        } else {
            this.domain.runParallel(new F() { // from class: com.helpshift.configuration.domainmodel.ConfigFetchDM.1
                @Override // com.helpshift.common.domain.F
                public void f() {
                    try {
                        ConfigFetchDM.this.fetchServerConfigInternal();
                    } catch (RootAPIException e) {
                        if (z && e.exceptionType != NetworkException.NON_RETRIABLE) {
                            ConfigFetchDM.this.domain.getAutoRetryFailedEventDM().scheduleRetryTaskForEventType(AutoRetryFailedEventDM.EventType.CONFIG, e.getServerStatusCode());
                        }
                        ConfigFetchDM.this.callListener(false);
                        throw e;
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void fetchServerConfigInternal() {
        this.isInProgress.set(true);
        HSLogger.d(TAG, "Fetching config.");
        UserManagerDM userManagerDM = this.domain.getUserManagerDM();
        UserDM activeUser = userManagerDM.getActiveUser();
        String str = NetworkConstants.SUPPORT_CONFIG_ROUTE;
        RootServerConfig configResponse = null;
        try {
            try {
                Response responseMakeRequest = new GuardOKNetwork(new ETagNetwork(new TSCorrectedNetwork(new FailedAPICallNetworkDecorator(new GETNetwork(str, this.domain, this.platform)), this.platform), this.platform, str)).makeRequest(new RequestData(NetworkDataRequestUtil.getUserRequestData(activeUser)));
                HSLogger.d(TAG, "SDK config fetched successfully");
                configResponse = this.responseParser.parseConfigResponse(responseMakeRequest.responseString);
                this.sdkConfigurationDM.updateServerConfig(configResponse);
                this.sdkConfigurationDM.updateUserConfig(activeUser, configResponse, userManagerDM);
                this.sdkConfigurationDM.updateLastSuccessfulConfigFetchTime();
                HSLogger.d(TAG, "SDK config data updated successfully");
                callListener(true);
            } catch (RootAPIException e) {
                if ((e.exceptionType instanceof NetworkException) && ((NetworkException) e.exceptionType).serverStatusCode == NetworkErrorCodes.CONTENT_UNCHANGED.intValue()) {
                    HSLogger.d(TAG, "SDK config fetched successfully, content unchanged");
                    this.sdkConfigurationDM.updateLastSuccessfulConfigFetchTime();
                    callListener(true);
                } else if (e.exceptionType != NetworkException.NON_RETRIABLE) {
                    throw e;
                }
            }
            if (configResponse != null) {
                new RedactionAgent(this.platform, this.domain).checkAndUpdateRedactionState(activeUser, configResponse.profileCreatedAt, configResponse.lastRedactionAt);
            }
        } finally {
            this.isInProgress.set(false);
        }
    }

    @Override // com.helpshift.common.AutoRetriableDM
    public void sendFailedApiCalls(AutoRetryFailedEventDM.EventType eventType) {
        if (eventType == AutoRetryFailedEventDM.EventType.CONFIG && !this.isInProgress.get() && StringUtils.isEmpty(this.platform.getNetworkRequestDAO().getETag(NetworkConstants.SUPPORT_CONFIG_ROUTE))) {
            HSLogger.d(TAG, "Retrying failed api call for config: " + this.listener);
            fetchServerConfigInternal();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void callListener(boolean z) {
        Callback<Void, Void> callback;
        WeakReference<Callback<Void, Void>> weakReference = this.listener;
        if (weakReference == null || (callback = weakReference.get()) == null) {
            return;
        }
        if (z) {
            callback.onSuccess(null);
        } else {
            callback.onFailure(null);
        }
    }
}
