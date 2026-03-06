package com.ironsource.mediationsdk;

import com.ironsource.mediationsdk.utils.AuctionSettings;
import java.util.Timer;
import java.util.TimerTask;

/* JADX INFO: loaded from: classes2.dex */
public class RvLoadTrigger {
    private AuctionSettings mAuctionSettings;
    private RvLoadTriggerCallback mListener;
    private Timer mTimer = null;

    public RvLoadTrigger(AuctionSettings auctionSettings, RvLoadTriggerCallback rvLoadTriggerCallback) {
        this.mAuctionSettings = auctionSettings;
        this.mListener = rvLoadTriggerCallback;
    }

    public synchronized void showStart() {
        if (this.mAuctionSettings.getIsAuctionOnShowStart()) {
            stopTimer();
            Timer timer = new Timer();
            this.mTimer = timer;
            timer.schedule(new TimerTask() { // from class: com.ironsource.mediationsdk.RvLoadTrigger.1
                @Override // java.util.TimerTask, java.lang.Runnable
                public void run() {
                    RvLoadTrigger.this.mListener.onLoadTriggered();
                }
            }, this.mAuctionSettings.getTimeToWaitBeforeAuctionMs());
        }
    }

    public synchronized void showEnd() {
        if (!this.mAuctionSettings.getIsAuctionOnShowStart()) {
            stopTimer();
            Timer timer = new Timer();
            this.mTimer = timer;
            timer.schedule(new TimerTask() { // from class: com.ironsource.mediationsdk.RvLoadTrigger.2
                @Override // java.util.TimerTask, java.lang.Runnable
                public void run() {
                    RvLoadTrigger.this.mListener.onLoadTriggered();
                }
            }, this.mAuctionSettings.getTimeToWaitBeforeAuctionMs());
        }
    }

    public void showError() {
        synchronized (this) {
            stopTimer();
        }
        this.mListener.onLoadTriggered();
    }

    public synchronized void loadError() {
        stopTimer();
        Timer timer = new Timer();
        this.mTimer = timer;
        timer.schedule(new TimerTask() { // from class: com.ironsource.mediationsdk.RvLoadTrigger.3
            @Override // java.util.TimerTask, java.lang.Runnable
            public void run() {
                RvLoadTrigger.this.mListener.onLoadTriggered();
            }
        }, this.mAuctionSettings.getAuctionRetryInterval());
    }

    private void stopTimer() {
        Timer timer = this.mTimer;
        if (timer != null) {
            timer.cancel();
            this.mTimer = null;
        }
    }
}
