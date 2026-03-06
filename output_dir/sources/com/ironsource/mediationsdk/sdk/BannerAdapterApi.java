package com.ironsource.mediationsdk.sdk;

import com.ironsource.mediationsdk.IronSourceBannerLayout;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public interface BannerAdapterApi {
    void destroyBanner(JSONObject jSONObject);

    void initBanners(String str, String str2, JSONObject jSONObject, BannerSmashListener bannerSmashListener);

    void loadBanner(IronSourceBannerLayout ironSourceBannerLayout, JSONObject jSONObject, BannerSmashListener bannerSmashListener);

    void reloadBanner(IronSourceBannerLayout ironSourceBannerLayout, JSONObject jSONObject, BannerSmashListener bannerSmashListener);

    boolean shouldBindBannerViewOnReload();
}
