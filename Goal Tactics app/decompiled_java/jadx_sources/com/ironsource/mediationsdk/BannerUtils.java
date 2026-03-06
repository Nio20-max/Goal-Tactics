package com.ironsource.mediationsdk;

import android.text.TextUtils;
import com.ironsource.mediationsdk.logger.IronLog;
import com.ironsource.mediationsdk.model.BannerPlacement;
import com.ironsource.mediationsdk.utils.CappingManager;
import com.ironsource.mediationsdk.utils.ContextProvider;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* JADX INFO: loaded from: classes2.dex */
public class BannerUtils {

    interface CreateCandidatesListener {
        void onFinish(Map<String, Object> map, List<String> list, StringBuilder sb);
    }

    interface VerifyBannerListener {
        void failed(String str);

        void success();
    }

    static boolean isBannerLayoutReady(IronSourceBannerLayout ironSourceBannerLayout) {
        return (ironSourceBannerLayout == null || ironSourceBannerLayout.isDestroyed()) ? false : true;
    }

    static void verifyLoadBanner(IronSourceBannerLayout ironSourceBannerLayout, BannerPlacement bannerPlacement, VerifyBannerListener verifyBannerListener) {
        String str;
        if (isBannerLayoutReady(ironSourceBannerLayout)) {
            str = null;
        } else {
            Object[] objArr = new Object[1];
            objArr[0] = ironSourceBannerLayout == null ? "banner is null" : "banner is destroyed";
            str = String.format("can't load banner - %s", objArr);
        }
        if (bannerPlacement == null || TextUtils.isEmpty(bannerPlacement.getPlacementName())) {
            Object[] objArr2 = new Object[1];
            objArr2[0] = bannerPlacement == null ? "placement is null" : "placement name is empty";
            str = String.format("can't load banner - %s", objArr2);
        }
        if (!TextUtils.isEmpty(str)) {
            IronLog.INTERNAL.error(str);
            verifyBannerListener.failed(str);
        } else {
            verifyBannerListener.success();
        }
    }

    static void verifyDestroyBanner(IronSourceBannerLayout ironSourceBannerLayout, VerifyBannerListener verifyBannerListener) {
        if (ironSourceBannerLayout == null || ironSourceBannerLayout.isDestroyed()) {
            Object[] objArr = new Object[1];
            objArr[0] = ironSourceBannerLayout == null ? "banner is null" : "banner is destroyed";
            verifyBannerListener.failed(String.format("can't destroy banner - %s", objArr));
            return;
        }
        verifyBannerListener.success();
    }

    static long getTimeToWaitBeforeFirstAuction(long j, long j2) {
        return j2 - (new Date().getTime() - j);
    }

    static void createAuctionCandidates(String str, ConcurrentHashMap<String, ProgBannerSmash> concurrentHashMap, CreateCandidatesListener createCandidatesListener) {
        HashMap map = new HashMap();
        ArrayList arrayList = new ArrayList();
        StringBuilder sb = new StringBuilder();
        if (!CappingManager.isBnPlacementCapped(ContextProvider.getInstance().getCurrentActiveActivity(), str)) {
            for (ProgBannerSmash progBannerSmash : concurrentHashMap.values()) {
                if (progBannerSmash.isBidder()) {
                    Map<String, Object> biddingData = progBannerSmash.getBiddingData();
                    if (biddingData != null) {
                        map.put(progBannerSmash.getInstanceName(), biddingData);
                        sb.append("2" + progBannerSmash.getInstanceName() + ",");
                    }
                } else if (!progBannerSmash.isBidder()) {
                    arrayList.add(progBannerSmash.getInstanceName());
                    sb.append("1" + progBannerSmash.getInstanceName() + ",");
                }
            }
        }
        createCandidatesListener.onFinish(map, arrayList, sb);
    }
}
