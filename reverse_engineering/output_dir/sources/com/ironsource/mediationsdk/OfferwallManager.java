package com.ironsource.mediationsdk;

import android.text.TextUtils;
import com.ironsource.environment.StringUtils;
import com.ironsource.eventsmodule.EventData;
import com.ironsource.mediationsdk.events.RewardedVideoEventsManager;
import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.model.OfferwallPlacement;
import com.ironsource.mediationsdk.model.ProviderSettings;
import com.ironsource.mediationsdk.sdk.InternalOfferwallApi;
import com.ironsource.mediationsdk.sdk.InternalOfferwallListener;
import com.ironsource.mediationsdk.sdk.OfferwallAdapterApi;
import com.ironsource.mediationsdk.sdk.OfferwallListener;
import com.ironsource.mediationsdk.utils.ContextProvider;
import com.ironsource.mediationsdk.utils.ErrorBuilder;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.mediationsdk.utils.IronSourceUtils;
import com.ironsource.mediationsdk.utils.ServerResponseWrapper;
import com.ironsource.mediationsdk.utils.SessionDepthManager;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
class OfferwallManager implements InternalOfferwallApi, InternalOfferwallListener {
    private OfferwallAdapterApi mAdapter;
    private String mCurrentPlacementName;
    private InternalOfferwallListener mListenersWrapper;
    private ProviderSettings mProviderSettings;
    private ServerResponseWrapper mServerResponseWrapper;
    private final String TAG = getClass().getName();
    private AtomicBoolean mAtomicShouldPerformInit = new AtomicBoolean(true);
    private AtomicBoolean mIsOfferwallAvailable = new AtomicBoolean(false);
    private IronSourceLoggerManager mLoggerManager = IronSourceLoggerManager.getLogger();

    @Override // com.ironsource.mediationsdk.sdk.OfferwallApi
    public void setOfferwallListener(OfferwallListener offerwallListener) {
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallApi
    public void showOfferwall() {
    }

    OfferwallManager() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.ironsource.mediationsdk.sdk.OfferwallApi
    public synchronized void initOfferwall(String str, String str2) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.NATIVE, this.TAG + ":initOfferwall(appKey: " + str + ", userId: " + str2 + ")", 1);
        ServerResponseWrapper currentServerResponse = IronSourceObject.getInstance().getCurrentServerResponse();
        this.mServerResponseWrapper = currentServerResponse;
        if (currentServerResponse == null) {
            reportInitFail(ErrorBuilder.buildInitFailedError("Please check configurations for Offerwall adapters", IronSourceConstants.OFFERWALL_AD_UNIT));
            return;
        }
        ProviderSettings providerSettings = currentServerResponse.getProviderSettingsHolder().getProviderSettings(IronSourceConstants.SUPERSONIC_CONFIG_NAME);
        this.mProviderSettings = providerSettings;
        if (providerSettings == null) {
            reportInitFail(ErrorBuilder.buildInitFailedError("Please check configurations for Offerwall adapters", IronSourceConstants.OFFERWALL_AD_UNIT));
            return;
        }
        AbstractAdapter abstractAdapterStartOfferwallAdapter = startOfferwallAdapter();
        if (abstractAdapterStartOfferwallAdapter == 0) {
            reportInitFail(ErrorBuilder.buildInitFailedError("Please check configurations for Offerwall adapters", IronSourceConstants.OFFERWALL_AD_UNIT));
            return;
        }
        setCustomParams(abstractAdapterStartOfferwallAdapter);
        abstractAdapterStartOfferwallAdapter.setLogListener(this.mLoggerManager);
        OfferwallAdapterApi offerwallAdapterApi = (OfferwallAdapterApi) abstractAdapterStartOfferwallAdapter;
        this.mAdapter = offerwallAdapterApi;
        offerwallAdapterApi.setInternalOfferwallListener(this);
        this.mAdapter.initOfferwall(str, str2, this.mProviderSettings.getRewardedVideoSettings());
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallApi
    public void showOfferwall(String str) {
        OfferwallAdapterApi offerwallAdapterApi;
        String str2 = "OWManager:showOfferwall(" + str + ")";
        try {
            if (!IronSourceUtils.isNetworkConnected(ContextProvider.getInstance().getCurrentActiveActivity())) {
                this.mListenersWrapper.onOfferwallShowFailed(ErrorBuilder.buildNoInternetConnectionShowFailError(IronSourceConstants.OFFERWALL_AD_UNIT));
                return;
            }
            this.mCurrentPlacementName = str;
            OfferwallPlacement offerwallPlacement = this.mServerResponseWrapper.getConfigurations().getOfferwallConfigurations().getOfferwallPlacement(str);
            if (offerwallPlacement == null) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "Placement is not valid, please make sure you are using the right placements, using the default placement.", 3);
                offerwallPlacement = this.mServerResponseWrapper.getConfigurations().getOfferwallConfigurations().getDefaultOfferwallPlacement();
                if (offerwallPlacement == null) {
                    this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "Default placement was not found, please make sure you are using the right placements.", 3);
                    return;
                }
            }
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, str2, 1);
            AtomicBoolean atomicBoolean = this.mIsOfferwallAvailable;
            if (atomicBoolean == null || !atomicBoolean.get() || (offerwallAdapterApi = this.mAdapter) == null) {
                return;
            }
            offerwallAdapterApi.showOfferwall(String.valueOf(offerwallPlacement.getPlacementId()), this.mProviderSettings.getRewardedVideoSettings());
        } catch (Exception e) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.INTERNAL, str2, e);
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallApi
    public synchronized boolean isOfferwallAvailable() {
        AtomicBoolean atomicBoolean;
        atomicBoolean = this.mIsOfferwallAvailable;
        return atomicBoolean != null ? atomicBoolean.get() : false;
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallApi
    public void getOfferwallCredits() {
        OfferwallAdapterApi offerwallAdapterApi = this.mAdapter;
        if (offerwallAdapterApi != null) {
            offerwallAdapterApi.getOfferwallCredits();
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.InternalOfferwallApi
    public void setInternalOfferwallListener(InternalOfferwallListener internalOfferwallListener) {
        this.mListenersWrapper = internalOfferwallListener;
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallListener
    public void onOfferwallAvailable(boolean z) {
        onOfferwallAvailable(z, null);
    }

    @Override // com.ironsource.mediationsdk.sdk.InternalOfferwallListener
    public void onOfferwallAvailable(boolean z, IronSourceError ironSourceError) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, "onOfferwallAvailable(isAvailable: " + z + ")", 1);
        if (z) {
            this.mIsOfferwallAvailable.set(true);
            InternalOfferwallListener internalOfferwallListener = this.mListenersWrapper;
            if (internalOfferwallListener != null) {
                internalOfferwallListener.onOfferwallAvailable(true);
                return;
            }
            return;
        }
        reportInitFail(ironSourceError);
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallListener
    public void onOfferwallOpened() {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, "onOfferwallOpened()", 1);
        int sessionDepth = SessionDepthManager.getInstance().getSessionDepth(0);
        JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(false);
        try {
            if (!TextUtils.isEmpty(this.mCurrentPlacementName)) {
                mediationAdditionalData.put(IronSourceConstants.EVENTS_PLACEMENT_NAME, this.mCurrentPlacementName);
            }
            mediationAdditionalData.put("sessionDepth", sessionDepth);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        RewardedVideoEventsManager.getInstance().log(new EventData(305, mediationAdditionalData));
        SessionDepthManager.getInstance().increaseSessionDepth(0);
        InternalOfferwallListener internalOfferwallListener = this.mListenersWrapper;
        if (internalOfferwallListener != null) {
            internalOfferwallListener.onOfferwallOpened();
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallListener
    public void onOfferwallShowFailed(IronSourceError ironSourceError) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, "onOfferwallShowFailed(" + ironSourceError + ")", 1);
        InternalOfferwallListener internalOfferwallListener = this.mListenersWrapper;
        if (internalOfferwallListener != null) {
            internalOfferwallListener.onOfferwallShowFailed(ironSourceError);
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallListener
    public boolean onOfferwallAdCredited(int i, int i2, boolean z) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, "onOfferwallAdCredited()", 1);
        InternalOfferwallListener internalOfferwallListener = this.mListenersWrapper;
        if (internalOfferwallListener != null) {
            return internalOfferwallListener.onOfferwallAdCredited(i, i2, z);
        }
        return false;
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallListener
    public void onGetOfferwallCreditsFailed(IronSourceError ironSourceError) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, "onGetOfferwallCreditsFailed(" + ironSourceError + ")", 1);
        InternalOfferwallListener internalOfferwallListener = this.mListenersWrapper;
        if (internalOfferwallListener != null) {
            internalOfferwallListener.onGetOfferwallCreditsFailed(ironSourceError);
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallListener
    public void onOfferwallClosed() {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, "onOfferwallClosed()", 1);
        InternalOfferwallListener internalOfferwallListener = this.mListenersWrapper;
        if (internalOfferwallListener != null) {
            internalOfferwallListener.onOfferwallClosed();
        }
    }

    private synchronized void reportInitFail(IronSourceError ironSourceError) {
        AtomicBoolean atomicBoolean = this.mIsOfferwallAvailable;
        if (atomicBoolean != null) {
            atomicBoolean.set(false);
        }
        AtomicBoolean atomicBoolean2 = this.mAtomicShouldPerformInit;
        if (atomicBoolean2 != null) {
            atomicBoolean2.set(true);
        }
        InternalOfferwallListener internalOfferwallListener = this.mListenersWrapper;
        if (internalOfferwallListener != null) {
            internalOfferwallListener.onOfferwallAvailable(false, ironSourceError);
        }
    }

    private AbstractAdapter startOfferwallAdapter() {
        try {
            IronSourceObject ironSourceObject = IronSourceObject.getInstance();
            AbstractAdapter offerwallAdapter = ironSourceObject.getOfferwallAdapter(IronSourceConstants.SUPERSONIC_CONFIG_NAME);
            if (offerwallAdapter == null) {
                Class<?> cls = Class.forName("com.ironsource.adapters." + StringUtils.toLowerCase(IronSourceConstants.SUPERSONIC_CONFIG_NAME) + "." + IronSourceConstants.SUPERSONIC_CONFIG_NAME + "Adapter");
                offerwallAdapter = (AbstractAdapter) cls.getMethod(IronSourceConstants.START_ADAPTER, String.class).invoke(cls, IronSourceConstants.SUPERSONIC_CONFIG_NAME);
                if (offerwallAdapter == null) {
                    return null;
                }
            }
            ironSourceObject.addOWAdapter(offerwallAdapter);
            return offerwallAdapter;
        } catch (Throwable th) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "SupersonicAds initialization failed - please verify that required dependencies are in you build path.", 2);
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, this.TAG + ":startOfferwallAdapter", th);
            return null;
        }
    }

    private void setCustomParams(AbstractAdapter abstractAdapter) {
        try {
            String mediationSegment = IronSourceObject.getInstance().getMediationSegment();
            if (mediationSegment != null) {
                abstractAdapter.setMediationSegment(mediationSegment);
            }
            Boolean consent = IronSourceObject.getInstance().getConsent();
            if (consent != null) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_API, "Offerwall | setConsent(consent:" + consent + ")", 1);
                abstractAdapter.setConsent(consent.booleanValue());
            }
        } catch (Exception e) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, ":setCustomParams():" + e.toString(), 3);
        }
    }
}
