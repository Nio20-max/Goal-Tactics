package com.ironsource.mediationsdk;

import com.ironsource.mediationsdk.AbstractSmash;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.logger.LogListener;
import com.ironsource.mediationsdk.logger.LoggingApi;
import com.ironsource.mediationsdk.sdk.BannerAdapterApi;
import com.ironsource.mediationsdk.sdk.BannerSmashListener;
import com.ironsource.mediationsdk.sdk.BaseApi;
import com.ironsource.mediationsdk.sdk.InterstitialAdapterApi;
import com.ironsource.mediationsdk.sdk.InterstitialSmashListener;
import com.ironsource.mediationsdk.sdk.RewardedVideoAdapterApi;
import com.ironsource.mediationsdk.sdk.RewardedVideoSmashListener;
import com.ironsource.mediationsdk.utils.ContextProvider;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public abstract class AbstractAdapter implements BaseApi, InterstitialAdapterApi, RewardedVideoAdapterApi, BannerAdapterApi, LoggingApi {
    private static Boolean mAdapterDebug;
    protected BannerSmashListener mActiveBannerSmash;
    protected InterstitialSmashListener mActiveInterstitialSmash;
    protected RewardedVideoSmashListener mActiveRewardedVideoSmash;
    private String mPluginFrameworkVersion;
    private String mPluginType;
    private String mProviderName;
    protected LoadWhileShowSupportState mLWSSupportState = LoadWhileShowSupportState.NONE;
    private IronSourceLoggerManager mLoggerManager = IronSourceLoggerManager.getLogger();
    protected CopyOnWriteArrayList<RewardedVideoSmashListener> mAllRewardedVideoSmashes = new CopyOnWriteArrayList<>();
    protected CopyOnWriteArrayList<InterstitialSmashListener> mAllInterstitialSmashes = new CopyOnWriteArrayList<>();
    protected CopyOnWriteArrayList<BannerSmashListener> mAllBannerSmashes = new CopyOnWriteArrayList<>();
    protected ConcurrentHashMap<String, RewardedVideoSmashListener> mRewardedVideoPlacementToListenerMap = new ConcurrentHashMap<>();
    protected ConcurrentHashMap<String, InterstitialSmashListener> mInterstitialPlacementToListenerMap = new ConcurrentHashMap<>();
    protected ConcurrentHashMap<String, BannerSmashListener> mBannerPlacementToListenerMap = new ConcurrentHashMap<>();

    protected void addBannerListener(BannerSmashListener bannerSmashListener) {
    }

    public void destroyBanner(JSONObject jSONObject) {
    }

    public void earlyInit(String str, String str2, JSONObject jSONObject) {
    }

    public Map<String, Object> getBannerBiddingData(JSONObject jSONObject) {
        return null;
    }

    public abstract String getCoreSDKVersion();

    public Map<String, Object> getInterstitialBiddingData(JSONObject jSONObject) {
        return null;
    }

    public JSONObject getPlayerBiddingData() {
        return null;
    }

    public Map<String, Object> getRewardedVideoBiddingData(JSONObject jSONObject) {
        return null;
    }

    public abstract String getVersion();

    public void initBannerForBidding(String str, String str2, JSONObject jSONObject, BannerSmashListener bannerSmashListener) {
    }

    public void initBanners(String str, String str2, JSONObject jSONObject, BannerSmashListener bannerSmashListener) {
    }

    public void initInterstitialForBidding(String str, String str2, JSONObject jSONObject, InterstitialSmashListener interstitialSmashListener) {
    }

    public void initRewardedVideoForBidding(String str, String str2, JSONObject jSONObject, RewardedVideoSmashListener rewardedVideoSmashListener) {
    }

    public void initRewardedVideoForDemandOnly(String str, String str2, JSONObject jSONObject, RewardedVideoSmashListener rewardedVideoSmashListener) {
    }

    public void loadBanner(IronSourceBannerLayout ironSourceBannerLayout, JSONObject jSONObject, BannerSmashListener bannerSmashListener) {
    }

    public void loadBannerForBidding(IronSourceBannerLayout ironSourceBannerLayout, JSONObject jSONObject, BannerSmashListener bannerSmashListener, String str) {
    }

    public void loadInterstitialForBidding(JSONObject jSONObject, InterstitialSmashListener interstitialSmashListener, String str) {
    }

    public void loadRewardedVideoForBidding(JSONObject jSONObject, RewardedVideoSmashListener rewardedVideoSmashListener, String str) {
    }

    public void loadRewardedVideoForDemandOnly(JSONObject jSONObject, RewardedVideoSmashListener rewardedVideoSmashListener) {
    }

    public void loadRewardedVideoForDemandOnlyForBidding(JSONObject jSONObject, RewardedVideoSmashListener rewardedVideoSmashListener, String str) {
    }

    public void reloadBanner(IronSourceBannerLayout ironSourceBannerLayout, JSONObject jSONObject, BannerSmashListener bannerSmashListener) {
    }

    protected void removeBannerListener(BannerSmashListener bannerSmashListener) {
    }

    public void setAge(int i) {
    }

    protected void setConsent(boolean z) {
    }

    public void setGender(String str) {
    }

    @Override // com.ironsource.mediationsdk.logger.LoggingApi
    public void setLogListener(LogListener logListener) {
    }

    @Override // com.ironsource.mediationsdk.sdk.BaseApi
    public void setMediationSegment(String str) {
    }

    protected void setMediationState(AbstractSmash.MEDIATION_STATE mediation_state, String str) {
    }

    protected void setMetaData(String str, String str2) {
    }

    @Override // com.ironsource.mediationsdk.sdk.BannerAdapterApi
    public boolean shouldBindBannerViewOnReload() {
        return false;
    }

    public AbstractAdapter(String str) {
        this.mProviderName = str;
    }

    public String getProviderName() {
        return this.mProviderName;
    }

    protected String getDynamicUserId() {
        return IronSourceObject.getInstance().getDynamicUserId();
    }

    void setPluginData(String str, String str2) {
        this.mPluginType = str;
        this.mPluginFrameworkVersion = str2;
    }

    public String getPluginType() {
        return this.mPluginType;
    }

    public String getPluginFrameworkVersion() {
        return this.mPluginFrameworkVersion;
    }

    protected boolean isAdaptersDebugEnabled() {
        Boolean bool = mAdapterDebug;
        return bool != null && bool.booleanValue();
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoAdapterApi
    public void addRewardedVideoListener(RewardedVideoSmashListener rewardedVideoSmashListener) {
        this.mAllRewardedVideoSmashes.add(rewardedVideoSmashListener);
    }

    public void updateRewardedVideoListener(RewardedVideoSmashListener rewardedVideoSmashListener) {
        this.mAllRewardedVideoSmashes.clear();
        this.mAllRewardedVideoSmashes.add(rewardedVideoSmashListener);
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoAdapterApi
    public void removeRewardedVideoListener(RewardedVideoSmashListener rewardedVideoSmashListener) {
        this.mAllRewardedVideoSmashes.remove(rewardedVideoSmashListener);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialAdapterApi
    public void addInterstitialListener(InterstitialSmashListener interstitialSmashListener) {
        this.mAllInterstitialSmashes.add(interstitialSmashListener);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialAdapterApi
    public void removeInterstitialListener(InterstitialSmashListener interstitialSmashListener) {
        this.mAllInterstitialSmashes.remove(interstitialSmashListener);
    }

    protected void setAdapterDebug(Boolean bool) {
        mAdapterDebug = bool;
    }

    protected void setMetaData(String str, List<String> list) {
        Iterator<String> it = list.iterator();
        while (it.hasNext()) {
            setMetaData(str, it.next());
        }
    }

    public LoadWhileShowSupportState getLoadWhileShowSupportState() {
        return this.mLWSSupportState;
    }

    protected void postOnUIThread(Runnable runnable) {
        ContextProvider.getInstance().postOnUIThread(runnable);
    }

    protected void runOnUIThread(Runnable runnable) {
        ContextProvider.getInstance().runOnUIThread(runnable);
    }
}
