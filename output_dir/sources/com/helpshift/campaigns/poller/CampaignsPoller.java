package com.helpshift.campaigns.poller;

import com.helpshift.common.domain.HSThreadFactory;
import com.helpshift.common.poller.Delay;
import com.helpshift.common.poller.HttpBackoff;
import com.helpshift.network.errors.NetworkError;
import com.helpshift.poller.Poller;
import java.util.concurrent.Callable;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public class CampaignsPoller extends Poller {
    private final HttpBackoff failureBackoff;
    private final HttpBackoff successBackoff;

    public CampaignsPoller(Callable callable) {
        super(callable, Executors.newSingleThreadExecutor(new HSThreadFactory("cmpoll-a")), Executors.newSingleThreadScheduledExecutor(new HSThreadFactory("cmpoll-b")));
        this.successBackoff = new HttpBackoff.Builder().setBaseInterval(Delay.of(3L, TimeUnit.MINUTES)).setMaxInterval(Delay.of(3L, TimeUnit.MINUTES)).setRandomness(0.0f).setMultiplier(1.0f).build();
        this.failureBackoff = new HttpBackoff.Builder().setBaseInterval(Delay.of(5L, TimeUnit.SECONDS)).setMaxInterval(Delay.of(10L, TimeUnit.MINUTES)).setRetryPolicy(HttpBackoff.RetryPolicy.FAILURE).build();
    }

    @Override // com.helpshift.poller.Poller
    public Delay getSuccessDelay(Object obj) {
        this.failureBackoff.reset();
        long jNextIntervalMillis = this.successBackoff.nextIntervalMillis(200);
        if (jNextIntervalMillis != -100) {
            return Delay.of(jNextIntervalMillis, TimeUnit.MILLISECONDS);
        }
        return null;
    }

    @Override // com.helpshift.poller.Poller
    public Delay getFailDelay(Exception exc) {
        Integer reason;
        this.successBackoff.reset();
        long jNextIntervalMillis = (!(exc instanceof NetworkError) || (reason = ((NetworkError) exc).getReason()) == null) ? -100L : this.failureBackoff.nextIntervalMillis(reason.intValue());
        if (jNextIntervalMillis != -100) {
            return Delay.of(jNextIntervalMillis, TimeUnit.MILLISECONDS);
        }
        return null;
    }
}
