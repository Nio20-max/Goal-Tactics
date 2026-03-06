package com.ironsource.mediationsdk;

import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/* JADX INFO: loaded from: classes2.dex */
public class AuctionHistory {
    public static final int DISABLED_FEATURE = 0;
    public static final int NO_LIMIT = -1;
    private ConcurrentHashMap<String, ArrayList<ISAuctionPerformance>> auctionPerformance = new ConcurrentHashMap<>();
    private int historyLimit;

    public enum ISAuctionPerformance {
        ISAuctionPerformanceDidntAttemptToLoad,
        ISAuctionPerformanceFailedToLoad,
        ISAuctionPerformanceLoadedSuccessfully,
        ISAuctionPerformanceFailedToShow,
        ISAuctionPerformanceShowedSuccessfully,
        ISAuctionPerformanceNotPartOfWaterfall
    }

    public AuctionHistory(List<String> list, int i) {
        this.historyLimit = i;
        Iterator<String> it = list.iterator();
        while (it.hasNext()) {
            this.auctionPerformance.put(it.next(), new ArrayList<>());
        }
    }

    public void storeWaterfallPerformance(ConcurrentHashMap<String, ISAuctionPerformance> concurrentHashMap) {
        if (this.historyLimit == 0) {
            return;
        }
        for (String str : this.auctionPerformance.keySet()) {
            ISAuctionPerformance iSAuctionPerformance = ISAuctionPerformance.ISAuctionPerformanceNotPartOfWaterfall;
            if (concurrentHashMap.containsKey(str)) {
                iSAuctionPerformance = concurrentHashMap.get(str);
            }
            ArrayList<ISAuctionPerformance> arrayList = this.auctionPerformance.get(str);
            if (this.historyLimit != -1 && arrayList.size() == this.historyLimit) {
                arrayList.remove(0);
            }
            arrayList.add(iSAuctionPerformance);
        }
    }

    public String getStoredPerformanceForInstance(String str) {
        ArrayList<ISAuctionPerformance> arrayList = this.auctionPerformance.get(str);
        String str2 = "";
        if (arrayList != null && !arrayList.isEmpty()) {
            Iterator<ISAuctionPerformance> it = arrayList.iterator();
            str2 = "" + it.next().ordinal();
            while (it.hasNext()) {
                str2 = (str2 + ",") + it.next().ordinal();
            }
            IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, str + " stored performance: : " + str2, 1);
        }
        return str2;
    }
}
