package com.ironsource.mediationsdk;

import android.text.TextUtils;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.model.AdapterConfig;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public abstract class ProgSmash {
    protected JSONObject mAdUnitSettings;
    protected AbstractAdapter mAdapter;
    protected AdapterConfig mAdapterConfig;
    protected String mDynamicDemandSourceId;
    private boolean mIsLoadCandidate;

    public int getProgrammaticValue() {
        return 1;
    }

    ProgSmash(AdapterConfig adapterConfig, AbstractAdapter abstractAdapter) {
        this.mAdapterConfig = adapterConfig;
        this.mAdapter = abstractAdapter;
        this.mAdUnitSettings = adapterConfig.getAdUnitSetings();
    }

    public boolean isBidder() {
        return this.mAdapterConfig.isBidder();
    }

    public int getInstanceType() {
        return this.mAdapterConfig.getInstanceType();
    }

    public int getMaxAdsPerSession() {
        return this.mAdapterConfig.getMaxAdsPerSession();
    }

    public String getInstanceName() {
        return this.mAdapterConfig.getProviderName();
    }

    public String getNameForReflection() {
        return this.mAdapterConfig.getProviderNameForReflection();
    }

    public void setIsLoadCandidate(boolean z) {
        this.mIsLoadCandidate = z;
    }

    public boolean getIsLoadCandidate() {
        return this.mIsLoadCandidate;
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
            map.put(IronSourceConstants.EVENTS_INSTANCE_TYPE, Integer.valueOf(isBidder() ? 2 : 1));
            map.put(IronSourceConstants.EVENTS_PROGRAMMATIC, Integer.valueOf(getProgrammaticValue()));
            if (!TextUtils.isEmpty(this.mDynamicDemandSourceId)) {
                map.put(IronSourceConstants.EVENTS_DYNAMIC_DEMAND_SOURCE_ID, this.mDynamicDemandSourceId);
            }
        } catch (Exception e) {
            IronSourceLoggerManager.getLogger().logException(IronSourceLogger.IronSourceTag.NATIVE, "getProviderEventData " + getInstanceName() + ")", e);
        }
        return map;
    }

    public void setDynamicDemandSourceIdByServerData(String str) {
        this.mDynamicDemandSourceId = AuctionDataUtils.getInstance().getDynamicDemandSourceIdFromServerData(str);
    }
}
