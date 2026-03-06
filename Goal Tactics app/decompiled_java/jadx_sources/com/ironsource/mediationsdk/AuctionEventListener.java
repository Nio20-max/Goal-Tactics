package com.ironsource.mediationsdk;

import java.util.List;

/* JADX INFO: compiled from: AuctionHandler.java */
/* JADX INFO: loaded from: classes2.dex */
interface AuctionEventListener {
    void onAuctionFailed(int i, String str, int i2, String str2, long j);

    void onAuctionSuccess(List<AuctionResponseItem> list, String str, AuctionResponseItem auctionResponseItem, int i, long j);
}
