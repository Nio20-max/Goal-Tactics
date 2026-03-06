package com.helpshift.common.poller;

import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes2.dex */
public class Delay {
    public final long delay;
    public final TimeUnit timeUnit;

    private Delay(long j, TimeUnit timeUnit) {
        this.delay = j;
        this.timeUnit = timeUnit;
    }

    public static Delay of(long j, TimeUnit timeUnit) {
        return new Delay(j, timeUnit);
    }

    public String toString() {
        return this.delay + " " + this.timeUnit;
    }
}
