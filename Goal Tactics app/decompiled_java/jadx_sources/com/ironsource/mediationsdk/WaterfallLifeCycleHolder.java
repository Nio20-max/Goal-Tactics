package com.ironsource.mediationsdk;

import android.text.TextUtils;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: loaded from: classes2.dex */
public class WaterfallLifeCycleHolder {
    private static String TAG = "WaterfallLifeCycleHolder";
    private List<String> disableLoadWhileShowSupportNetworks;
    private LWSProgRvSmash showingSmash;
    private int timeToDeleteOldWaterfallAfterAuction;
    ConcurrentHashMap<String, CopyOnWriteArrayList<LWSProgRvSmash>> waterfalls = new ConcurrentHashMap<>();
    private String currentWaterfallId = "";
    private String previousWaterfallId = "";
    private Timer timer = new Timer();

    public WaterfallLifeCycleHolder(List<String> list, int i) {
        this.disableLoadWhileShowSupportNetworks = list;
        this.timeToDeleteOldWaterfallAfterAuction = i;
    }

    public void setShowingSmash(LWSProgRvSmash lWSProgRvSmash) {
        this.showingSmash = lWSProgRvSmash;
    }

    public LWSProgRvSmash getShowingSmash() {
        return this.showingSmash;
    }

    public CopyOnWriteArrayList<LWSProgRvSmash> getCurrentWaterfall() {
        CopyOnWriteArrayList<LWSProgRvSmash> copyOnWriteArrayList = this.waterfalls.get(this.currentWaterfallId);
        return copyOnWriteArrayList == null ? new CopyOnWriteArrayList<>() : copyOnWriteArrayList;
    }

    public String getCurrentWaterfallId() {
        return this.currentWaterfallId;
    }

    public boolean shouldAddSmashToWaterfallRequest(LWSProgRvSmash lWSProgRvSmash) {
        boolean z = false;
        if (lWSProgRvSmash == null || (this.showingSmash != null && ((lWSProgRvSmash.getLoadWhileShowSupportState() == LoadWhileShowSupportState.LOAD_WHILE_SHOW_BY_NETWORK && this.showingSmash.getInstanceName().equals(lWSProgRvSmash.getInstanceName())) || ((lWSProgRvSmash.getLoadWhileShowSupportState() == LoadWhileShowSupportState.NONE || this.disableLoadWhileShowSupportNetworks.contains(lWSProgRvSmash.getNameForReflection())) && this.showingSmash.getNameForReflection().equals(lWSProgRvSmash.getNameForReflection()))))) {
            z = true;
        }
        if (z && lWSProgRvSmash != null) {
            IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, TAG + " " + lWSProgRvSmash.getInstanceName() + " does not support load while show and will not be added to the auction request", 1);
        }
        return !z;
    }

    public void updateWaterFall(CopyOnWriteArrayList<LWSProgRvSmash> copyOnWriteArrayList, String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, TAG + " updating new  waterfall with id " + str, 1);
        this.waterfalls.put(str, copyOnWriteArrayList);
        if (!TextUtils.isEmpty(this.previousWaterfallId)) {
            final String str2 = this.previousWaterfallId;
            this.timer.schedule(new TimerTask() { // from class: com.ironsource.mediationsdk.WaterfallLifeCycleHolder.1
                @Override // java.util.TimerTask, java.lang.Runnable
                public void run() {
                    try {
                        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, WaterfallLifeCycleHolder.TAG + " removing waterfall with id " + str2 + " from memory", 1);
                        WaterfallLifeCycleHolder.this.waterfalls.remove(str2);
                        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, WaterfallLifeCycleHolder.TAG + " waterfall size is currently " + WaterfallLifeCycleHolder.this.waterfalls.size(), 1);
                    } finally {
                        cancel();
                    }
                }
            }, this.timeToDeleteOldWaterfallAfterAuction);
        }
        this.previousWaterfallId = this.currentWaterfallId;
        this.currentWaterfallId = str;
    }

    public int getNumberOfWaterfalls() {
        return this.waterfalls.size();
    }

    public boolean areWaterFallsOverMaximum() {
        return this.waterfalls.size() > 5;
    }
}
