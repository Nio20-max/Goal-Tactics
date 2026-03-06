package com.ironsource.mediationsdk.timer;

/* JADX INFO: loaded from: classes2.dex */
public class BannerReloadTimer extends AbstractTimer<ReloadIntervalInterface> {

    public interface ReloadIntervalInterface {
        void onReloadInterval();
    }

    public BannerReloadTimer(int i) {
        super(i * 1000);
    }

    @Override // com.ironsource.mediationsdk.timer.AbstractTimer
    void onTick() {
        if (this.mListener != 0) {
            ((ReloadIntervalInterface) this.mListener).onReloadInterval();
        }
    }

    public void startReloadTimer(ReloadIntervalInterface reloadIntervalInterface) {
        startTimer(reloadIntervalInterface);
    }

    public void stopReloadTimer() {
        stopTimer();
    }
}
