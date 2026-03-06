package com.ironsource.mediationsdk;

import android.text.TextUtils;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.model.AdapterConfig;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class DemandOnlySmash {
    protected JSONObject mAdUnitSettings;
    protected AbstractAdapter mAdapter;
    protected AdapterConfig mAdapterConfig;
    protected String mDynamicDemandSourceId;
    int mLoadTimeoutSecs;
    private final Object mStateLock = new Object();
    private final Object mTimerLock = new Object();
    private SMASH_STATE mState = SMASH_STATE.NOT_LOADED;
    private Timer mLoadTimer = null;
    protected String mAuctionId = "";
    protected List<String> mBUrl = new ArrayList();

    protected enum SMASH_STATE {
        NOT_LOADED,
        LOAD_IN_PROGRESS,
        LOADED,
        SHOW_IN_PROGRESS
    }

    public DemandOnlySmash(AdapterConfig adapterConfig, AbstractAdapter abstractAdapter) {
        this.mAdapterConfig = adapterConfig;
        this.mAdapter = abstractAdapter;
        this.mAdUnitSettings = adapterConfig.getAdUnitSetings();
    }

    public String getInstanceName() {
        return this.mAdapterConfig.getProviderName();
    }

    public int getInstanceType() {
        return this.mAdapterConfig.getInstanceType();
    }

    public String getSubProviderId() {
        return this.mAdapterConfig.getSubProviderId();
    }

    public String getAuctionId() {
        return this.mAuctionId;
    }

    public List<String> getbURL() {
        return this.mBUrl;
    }

    public Map<String, Object> getProviderEventData() {
        HashMap map = new HashMap();
        try {
            AbstractAdapter abstractAdapter = this.mAdapter;
            map.put("providerAdapterVersion", abstractAdapter != null ? abstractAdapter.getVersion() : "");
            AbstractAdapter abstractAdapter2 = this.mAdapter;
            map.put("providerSDKVersion", abstractAdapter2 != null ? abstractAdapter2.getCoreSDKVersion() : "");
            map.put("spId", this.mAdapterConfig.getSubProviderId());
            map.put("provider", this.mAdapterConfig.getAdSourceNameForEvents());
            map.put(IronSourceConstants.EVENTS_DEMAND_ONLY, 1);
            if (isBidder()) {
                map.put(IronSourceConstants.EVENTS_PROGRAMMATIC, 1);
                map.put(IronSourceConstants.EVENTS_INSTANCE_TYPE, 2);
                if (!TextUtils.isEmpty(this.mAuctionId)) {
                    map.put("auctionId", this.mAuctionId);
                }
            } else {
                map.put(IronSourceConstants.EVENTS_PROGRAMMATIC, 0);
                map.put(IronSourceConstants.EVENTS_INSTANCE_TYPE, 1);
            }
            if (!TextUtils.isEmpty(this.mDynamicDemandSourceId)) {
                map.put(IronSourceConstants.EVENTS_DYNAMIC_DEMAND_SOURCE_ID, this.mDynamicDemandSourceId);
            }
        } catch (Exception e) {
            IronSourceLoggerManager.getLogger().logException(IronSourceLogger.IronSourceTag.NATIVE, "getProviderEventData " + getInstanceName() + ")", e);
        }
        return map;
    }

    boolean compareAndSetState(SMASH_STATE smash_state, SMASH_STATE smash_state2) {
        synchronized (this.mStateLock) {
            if (this.mState != smash_state) {
                return false;
            }
            setState(smash_state2);
            return true;
        }
    }

    SMASH_STATE compareAndSetState(SMASH_STATE[] smash_stateArr, SMASH_STATE smash_state) {
        SMASH_STATE smash_state2;
        synchronized (this.mStateLock) {
            smash_state2 = this.mState;
            if (Arrays.asList(smash_stateArr).contains(this.mState)) {
                setState(smash_state);
            }
        }
        return smash_state2;
    }

    void setState(SMASH_STATE smash_state) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "DemandOnlySmash " + this.mAdapterConfig.getProviderName() + ": current state=" + this.mState + ", new state=" + smash_state, 0);
        synchronized (this.mStateLock) {
            this.mState = smash_state;
        }
    }

    String getStateString() {
        SMASH_STATE smash_state = this.mState;
        return smash_state == null ? "null" : smash_state.toString();
    }

    void startTimer(TimerTask timerTask) {
        synchronized (this.mTimerLock) {
            stopTimer();
            Timer timer = new Timer();
            this.mLoadTimer = timer;
            timer.schedule(timerTask, this.mLoadTimeoutSecs * 1000);
        }
    }

    void stopTimer() {
        synchronized (this.mTimerLock) {
            Timer timer = this.mLoadTimer;
            if (timer != null) {
                timer.cancel();
                this.mLoadTimer = null;
            }
        }
    }

    public boolean isBidder() {
        return this.mAdapterConfig.isBidder();
    }

    public AdapterConfig getAdapterConfig() {
        return this.mAdapterConfig;
    }

    public void setDynamicDemandSourceIdByServerData(String str) {
        this.mDynamicDemandSourceId = AuctionDataUtils.getInstance().getDynamicDemandSourceIdFromServerData(str);
    }
}
