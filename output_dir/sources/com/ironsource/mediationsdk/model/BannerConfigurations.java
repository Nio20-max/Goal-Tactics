package com.ironsource.mediationsdk.model;

import com.ironsource.mediationsdk.utils.AuctionSettings;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes2.dex */
public class BannerConfigurations {
    private static final int DEFAULT_BN_PLACEMENT_ID = 0;
    private AuctionSettings mAuctionSettings;
    private int mBNAdaptersSmartLoadAmount;
    private long mBNAdaptersTimeoutInMilliseconds;
    private int mBNDelayLoadFailureNotificationInSeconds;
    private ApplicationEvents mBNEvents;
    private ArrayList<BannerPlacement> mBNPlacements;
    private int mBNRefreshInterval;
    private BannerPlacement mDefaultBNPlacement;

    public BannerConfigurations() {
        this.mBNEvents = new ApplicationEvents();
        this.mBNPlacements = new ArrayList<>();
    }

    public BannerConfigurations(int i, long j, ApplicationEvents applicationEvents, int i2, AuctionSettings auctionSettings, int i3) {
        this.mBNPlacements = new ArrayList<>();
        this.mBNAdaptersSmartLoadAmount = i;
        this.mBNAdaptersTimeoutInMilliseconds = j;
        this.mBNEvents = applicationEvents;
        this.mBNRefreshInterval = i2;
        this.mBNDelayLoadFailureNotificationInSeconds = i3;
        this.mAuctionSettings = auctionSettings;
    }

    public int getBannerAdaptersSmartLoadAmount() {
        return this.mBNAdaptersSmartLoadAmount;
    }

    public long getBannerAdaptersSmartLoadTimeout() {
        return this.mBNAdaptersTimeoutInMilliseconds;
    }

    public ApplicationEvents getBannerEventsConfigurations() {
        return this.mBNEvents;
    }

    public void addBannerPlacement(BannerPlacement bannerPlacement) {
        if (bannerPlacement != null) {
            this.mBNPlacements.add(bannerPlacement);
            if (this.mDefaultBNPlacement == null) {
                this.mDefaultBNPlacement = bannerPlacement;
            } else if (bannerPlacement.getPlacementId() == 0) {
                this.mDefaultBNPlacement = bannerPlacement;
            }
        }
    }

    public BannerPlacement getBannerPlacement(String str) {
        for (BannerPlacement bannerPlacement : this.mBNPlacements) {
            if (bannerPlacement.getPlacementName().equals(str)) {
                return bannerPlacement;
            }
        }
        return null;
    }

    public BannerPlacement getDefaultBannerPlacement() {
        for (BannerPlacement bannerPlacement : this.mBNPlacements) {
            if (bannerPlacement.isDefault()) {
                return bannerPlacement;
            }
        }
        return this.mDefaultBNPlacement;
    }

    public int getBannerRefreshInterval() {
        return this.mBNRefreshInterval;
    }

    public int getBannerDelayLoadFailure() {
        return this.mBNDelayLoadFailureNotificationInSeconds;
    }

    public AuctionSettings getBannerAuctionSettings() {
        return this.mAuctionSettings;
    }
}
