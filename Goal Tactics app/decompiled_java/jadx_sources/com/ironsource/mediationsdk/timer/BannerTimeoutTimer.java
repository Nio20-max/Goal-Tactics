package com.ironsource.mediationsdk.timer;

/* JADX INFO: loaded from: classes2.dex */
public class BannerTimeoutTimer extends AbstractTimer<TimeoutInterface> {

    public interface TimeoutInterface {
        void onTimeout();
    }

    public BannerTimeoutTimer(long j) {
        super(j);
    }

    @Override // com.ironsource.mediationsdk.timer.AbstractTimer
    void onTick() {
        if (this.mListener != 0) {
            ((TimeoutInterface) this.mListener).onTimeout();
        }
    }

    public void startTimeoutTimer(TimeoutInterface timeoutInterface) {
        startTimer(timeoutInterface);
    }

    public void stopTimeoutTimer() {
        stopTimer();
    }
}
