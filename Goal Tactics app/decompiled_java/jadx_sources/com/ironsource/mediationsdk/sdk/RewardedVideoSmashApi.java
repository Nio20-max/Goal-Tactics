package com.ironsource.mediationsdk.sdk;

/* JADX INFO: loaded from: classes2.dex */
public interface RewardedVideoSmashApi {
    void fetchRewardedVideo();

    void initRewardedVideo(String str, String str2);

    boolean isRewardedVideoAvailable();

    void setRewardedVideoManagerListener(RewardedVideoManagerListener rewardedVideoManagerListener);

    void showRewardedVideo();
}
