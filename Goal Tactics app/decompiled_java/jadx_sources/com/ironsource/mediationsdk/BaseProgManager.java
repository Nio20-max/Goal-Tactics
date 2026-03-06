package com.ironsource.mediationsdk;

import com.ironsource.mediationsdk.impressionData.ImpressionData;
import com.ironsource.mediationsdk.impressionData.ImpressionDataListener;
import com.ironsource.mediationsdk.logger.IronLog;

/* JADX INFO: loaded from: classes2.dex */
public abstract class BaseProgManager {
    private ImpressionDataListener impressionDataListener;

    public BaseProgManager(ImpressionDataListener impressionDataListener) {
        this.impressionDataListener = impressionDataListener;
    }

    public void setImpressionDataListener(ImpressionDataListener impressionDataListener) {
        this.impressionDataListener = impressionDataListener;
    }

    protected void reportImpressionDataToPublisher(AuctionResponseItem auctionResponseItem, String str) {
        if (auctionResponseItem != null && this.impressionDataListener != null) {
            ImpressionData impressionData = auctionResponseItem.getImpressionData(str);
            if (impressionData != null) {
                IronLog.CALLBACK.info("onImpressionSuccess: " + impressionData);
                this.impressionDataListener.onImpressionSuccess(impressionData);
                return;
            }
            return;
        }
        IronLog.INTERNAL.verbose("no auctionResponseItem or listener");
    }
}
