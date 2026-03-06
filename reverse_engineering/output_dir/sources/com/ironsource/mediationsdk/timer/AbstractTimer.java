package com.ironsource.mediationsdk.timer;

import java.util.Timer;
import java.util.TimerTask;

/* JADX INFO: loaded from: classes2.dex */
public abstract class AbstractTimer<T> {
    private long mDuration;
    protected T mListener;
    private Timer mTimer;

    abstract void onTick();

    public AbstractTimer(long j) {
        this.mDuration = j;
    }

    protected boolean isDisabled() {
        return this.mDuration <= 0;
    }

    protected void startTimer(T t) {
        if (isDisabled() || t == null) {
            return;
        }
        this.mListener = t;
        stopTimer();
        Timer timer = new Timer();
        this.mTimer = timer;
        timer.schedule(new TimerTask() { // from class: com.ironsource.mediationsdk.timer.AbstractTimer.1
            @Override // java.util.TimerTask, java.lang.Runnable
            public void run() {
                AbstractTimer.this.onTick();
            }
        }, this.mDuration);
    }

    protected void stopTimer() {
        Timer timer = this.mTimer;
        if (timer != null) {
            timer.cancel();
            this.mTimer = null;
        }
    }
}
