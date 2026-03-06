package com.ironsource.mediationsdk;

import android.app.Activity;
import android.content.Context;
import com.ironsource.mediationsdk.impressionData.ImpressionDataListener;
import com.ironsource.mediationsdk.logger.LogListener;
import com.ironsource.mediationsdk.model.InterstitialPlacement;
import com.ironsource.mediationsdk.model.Placement;
import com.ironsource.mediationsdk.sdk.ISDemandOnlyInterstitialListener;
import com.ironsource.mediationsdk.sdk.ISDemandOnlyRewardedVideoListener;
import com.ironsource.mediationsdk.sdk.InterstitialListener;
import com.ironsource.mediationsdk.sdk.OfferwallListener;
import com.ironsource.mediationsdk.sdk.RewardedVideoListener;
import com.ironsource.mediationsdk.sdk.SegmentListener;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public abstract class IronSource {

    public enum AD_UNIT {
        REWARDED_VIDEO("rewardedVideo"),
        INTERSTITIAL(IronSourceConstants.AD_UNIT_IS_MEDIATION_STATE),
        OFFERWALL("offerwall"),
        BANNER("banner");

        private String mValue;

        AD_UNIT(String str) {
            this.mValue = str;
        }

        @Override // java.lang.Enum
        public String toString() {
            return this.mValue;
        }
    }

    public static void setUserId(String str) {
        IronSourceObject.getInstance().setIronSourceUserId(str, true);
    }

    public static void init(Activity activity, String str) {
        init(activity, str, (AD_UNIT[]) null);
    }

    public static void init(Activity activity, String str, AD_UNIT... ad_unitArr) {
        IronSourceObject.getInstance().init(activity, str, false, ad_unitArr);
    }

    public static void initISDemandOnly(Activity activity, String str, AD_UNIT... ad_unitArr) {
        IronSourceObject.getInstance().initISDemandOnly(activity, str, ad_unitArr);
    }

    public static void onResume(Activity activity) {
        IronSourceObject.getInstance().onResume(activity);
    }

    public static void onPause(Activity activity) {
        IronSourceObject.getInstance().onPause(activity);
    }

    public static void setMediationSegment(String str) {
        IronSourceObject.getInstance().setMediationSegment(str);
    }

    public static void setSegment(IronSourceSegment ironSourceSegment) {
        IronSourceObject.getInstance().setSegment(ironSourceSegment);
    }

    public static boolean setDynamicUserId(String str) {
        return IronSourceObject.getInstance().setDynamicUserId(str);
    }

    public static void setMediationType(String str) {
        IronSourceObject.getInstance().setMediationType(str);
    }

    public static void removeRewardedVideoListener() {
        IronSourceObject.getInstance().removeRewardedVideoListener();
    }

    public static void removeInterstitialListener() {
        IronSourceObject.getInstance().removeInterstitialListener();
    }

    public static void removeOfferwallListener() {
        IronSourceObject.getInstance().removeOfferwallListener();
    }

    public static InterstitialPlacement getInterstitialPlacementInfo(String str) {
        return IronSourceObject.getInstance().getInterstitialPlacementInfo(str);
    }

    public static Placement getRewardedVideoPlacementInfo(String str) {
        return IronSourceObject.getInstance().getRewardedVideoPlacementInfo(str);
    }

    public static String getAdvertiserId(Context context) {
        return IronSourceObject.getInstance().getAdvertiserId(context);
    }

    public static void shouldTrackNetworkState(Context context, boolean z) {
        IronSourceObject.getInstance().shouldTrackNetworkState(context, z);
    }

    public static void setLogListener(LogListener logListener) {
        IronSourceObject.getInstance().setLogListener(logListener);
    }

    public static void setAdaptersDebug(boolean z) {
        IronSourceObject.getInstance().setAdaptersDebug(z);
    }

    public static synchronized String getISDemandOnlyBiddingData() {
        return IronSourceObject.getInstance().getISDemandOnlyBiddingData();
    }

    public static void showRewardedVideo() {
        IronSourceObject.getInstance().showRewardedVideo();
    }

    public static void showRewardedVideo(String str) {
        IronSourceObject.getInstance().showRewardedVideo(str);
    }

    public static boolean isRewardedVideoAvailable() {
        return IronSourceObject.getInstance().isRewardedVideoAvailable();
    }

    public static void setRewardedVideoListener(RewardedVideoListener rewardedVideoListener) {
        IronSourceObject.getInstance().setRewardedVideoListener(rewardedVideoListener);
    }

    public static boolean isRewardedVideoPlacementCapped(String str) {
        return IronSourceObject.getInstance().isRewardedVideoPlacementCapped(str);
    }

    public static void setRewardedVideoServerParameters(Map<String, String> map) {
        IronSourceObject.getInstance().setRewardedVideoServerParameters(map);
    }

    public static void clearRewardedVideoServerParameters() {
        IronSourceObject.getInstance().clearRewardedVideoServerParameters();
    }

    public static void loadISDemandOnlyRewardedVideo(String str) {
        IronSourceObject.getInstance().loadISDemandOnlyRewardedVideo(str, null);
    }

    public static void loadISDemandOnlyRewardedVideoWithAdm(String str, String str2) {
        IronSourceObject.getInstance().loadISDemandOnlyRewardedVideoWithAdm(str, str2);
    }

    public static void showISDemandOnlyRewardedVideo(String str) {
        IronSourceObject.getInstance().showDemandOnlyRewardedVideo(str);
    }

    public static boolean isISDemandOnlyRewardedVideoAvailable(String str) {
        return IronSourceObject.getInstance().isDemandOnlyRewardedVideoAvailable(str);
    }

    public static void setISDemandOnlyRewardedVideoListener(ISDemandOnlyRewardedVideoListener iSDemandOnlyRewardedVideoListener) {
        IronSourceObject.getInstance().setISDemandOnlyRewardedVideoListener(iSDemandOnlyRewardedVideoListener);
    }

    public static void loadInterstitial() {
        IronSourceObject.getInstance().loadInterstitial();
    }

    public static void showInterstitial() {
        IronSourceObject.getInstance().showInterstitial();
    }

    public static void showInterstitial(String str) {
        IronSourceObject.getInstance().showInterstitial(str);
    }

    public static boolean isInterstitialReady() {
        return IronSourceObject.getInstance().isInterstitialReady();
    }

    public static void setInterstitialListener(InterstitialListener interstitialListener) {
        IronSourceObject.getInstance().setInterstitialListener(interstitialListener);
    }

    public static boolean isInterstitialPlacementCapped(String str) {
        return IronSourceObject.getInstance().isInterstitialPlacementCapped(str);
    }

    public static void loadISDemandOnlyInterstitial(String str) {
        IronSourceObject.getInstance().loadDemandOnlyInterstitial(str, null);
    }

    public static void loadISDemandOnlyInterstitialWithAdm(String str, String str2) {
        IronSourceObject.getInstance().loadISDemandOnlyInterstitialWithAdm(str, str2);
    }

    public static void showISDemandOnlyInterstitial(String str) {
        IronSourceObject.getInstance().showDemandOnlyInterstitial(str);
    }

    public static boolean isISDemandOnlyInterstitialReady(String str) {
        return IronSourceObject.getInstance().isDemandOnlyInterstitialReady(str);
    }

    public static void setISDemandOnlyInterstitialListener(ISDemandOnlyInterstitialListener iSDemandOnlyInterstitialListener) {
        IronSourceObject.getInstance().setISDemandOnlyInterstitialListener(iSDemandOnlyInterstitialListener);
    }

    public static void showOfferwall() {
        IronSourceObject.getInstance().showOfferwall();
    }

    public static void showOfferwall(String str) {
        IronSourceObject.getInstance().showOfferwall(str);
    }

    public static boolean isOfferwallAvailable() {
        return IronSourceObject.getInstance().isOfferwallAvailable();
    }

    public static void getOfferwallCredits() {
        IronSourceObject.getInstance().getOfferwallCredits();
    }

    public static void setOfferwallListener(OfferwallListener offerwallListener) {
        IronSourceObject.getInstance().setOfferwallListener(offerwallListener);
    }

    public static IronSourceBannerLayout createBanner(Activity activity, ISBannerSize iSBannerSize) {
        return IronSourceObject.getInstance().createBanner(activity, iSBannerSize);
    }

    public static void loadBanner(IronSourceBannerLayout ironSourceBannerLayout) {
        IronSourceObject.getInstance().loadBanner(ironSourceBannerLayout);
    }

    public static void loadBanner(IronSourceBannerLayout ironSourceBannerLayout, String str) {
        IronSourceObject.getInstance().loadBanner(ironSourceBannerLayout, str);
    }

    public static void destroyBanner(IronSourceBannerLayout ironSourceBannerLayout) {
        IronSourceObject.getInstance().destroyBanner(ironSourceBannerLayout);
    }

    public static boolean isBannerPlacementCapped(String str) {
        return IronSourceObject.getInstance().isBannerPlacementCapped(str);
    }

    public static void setSegmentListener(SegmentListener segmentListener) {
        IronSourceObject.getInstance().setSegmentListener(segmentListener);
    }

    public static void setConsent(boolean z) {
        IronSourceObject.getInstance().setConsent(z);
    }

    public static void setMetaData(String str, String str2) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(str2);
        IronSourceObject.getInstance().setMetaData(str, arrayList);
    }

    public static void setMetaData(String str, List<String> list) {
        IronSourceObject.getInstance().setMetaData(str, list);
    }

    public static void setImpressionDataListener(ImpressionDataListener impressionDataListener) {
        IronSourceObject.getInstance().setImpressionDataListener(impressionDataListener);
    }
}
