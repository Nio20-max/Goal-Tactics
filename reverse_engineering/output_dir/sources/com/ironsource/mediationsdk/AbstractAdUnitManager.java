package com.ironsource.mediationsdk;

import android.content.Context;
import android.text.TextUtils;
import com.ironsource.mediationsdk.config.ConfigFile;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.sdk.BaseApi;
import com.ironsource.mediationsdk.utils.DailyCappingManager;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: loaded from: classes2.dex */
abstract class AbstractAdUnitManager implements BaseApi {
    String mAppKey;
    boolean mBackFillInitStarted;
    private AbstractSmash mBackfillSmash;
    Boolean mLastMediationAvailabilityState;
    private AbstractSmash mPremiumSmash;
    int mSmartLoadAmount;
    String mUserId;
    final String KEY_REASON = IronSourceConstants.EVENTS_ERROR_REASON;
    final String KEY_STATUS = "status";
    final String KEY_PLACEMENT = IronSourceConstants.EVENTS_PLACEMENT_NAME;
    final String KEY_REWARD_NAME = IronSourceConstants.EVENTS_REWARD_NAME;
    final String KEY_REWARD_AMOUNT = IronSourceConstants.EVENTS_REWARD_AMOUNT;
    final String KEY_PROVIDER_PRIORITY = "providerPriority";
    boolean mShouldTrackNetworkState = false;
    boolean mCanShowPremium = true;
    final CopyOnWriteArrayList<AbstractSmash> mSmashArray = new CopyOnWriteArrayList<>();
    IronSourceLoggerManager mLoggerManager = IronSourceLoggerManager.getLogger();
    DailyCappingManager mDailyCappingManager = null;

    @Override // com.ironsource.mediationsdk.sdk.BaseApi
    public void setMediationSegment(String str) {
    }

    abstract void shouldTrackNetworkState(Context context, boolean z);

    AbstractAdUnitManager() {
    }

    void setSmartLoadAmount(int i) {
        this.mSmartLoadAmount = i;
    }

    void addSmashToArray(AbstractSmash abstractSmash) {
        this.mSmashArray.add(abstractSmash);
        DailyCappingManager dailyCappingManager = this.mDailyCappingManager;
        if (dailyCappingManager != null) {
            dailyCappingManager.addSmash(abstractSmash);
        }
    }

    void setBackfillSmash(AbstractSmash abstractSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, abstractSmash.getInstanceName() + " is set as backfill", 0);
        this.mBackfillSmash = abstractSmash;
    }

    void setPremiumSmash(AbstractSmash abstractSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, abstractSmash.getInstanceName() + " is set as premium", 0);
        this.mPremiumSmash = abstractSmash;
    }

    AbstractSmash getBackfillSmash() {
        return this.mBackfillSmash;
    }

    AbstractSmash getPremiumSmash() {
        return this.mPremiumSmash;
    }

    void setCustomParams(AbstractSmash abstractSmash) {
        try {
            String mediationSegment = IronSourceObject.getInstance().getMediationSegment();
            if (!TextUtils.isEmpty(mediationSegment)) {
                abstractSmash.setMediationSegment(mediationSegment);
            }
            String pluginType = ConfigFile.getConfigFile().getPluginType();
            if (TextUtils.isEmpty(pluginType)) {
                return;
            }
            abstractSmash.setPluginData(pluginType, ConfigFile.getConfigFile().getPluginFrameworkVersion());
        } catch (Exception e) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, ":setCustomParams():" + e.toString(), 3);
        }
    }

    synchronized boolean canShowPremium() {
        return this.mCanShowPremium;
    }

    synchronized void disablePremiumForCurrentSession() {
        this.mCanShowPremium = false;
    }
}
