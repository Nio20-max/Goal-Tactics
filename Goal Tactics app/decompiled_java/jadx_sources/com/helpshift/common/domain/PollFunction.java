package com.helpshift.common.domain;

import com.helpshift.common.domain.network.NetworkErrorCodes;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.poller.HttpBackoff;
import com.helpshift.util.HSLogger;

/* JADX INFO: loaded from: classes2.dex */
public class PollFunction extends F {
    private static final String TAG = "Helpshift_PollFunc";
    private HttpBackoff backoff;
    private final Domain domain;
    private final PollFunctionListener listener;
    private final F poll;
    private final PollingInterval pollingInterval;
    private boolean shouldPoll;

    public interface PollFunctionListener {
        void onPollingStoppedViaBackoffStrategy();
    }

    public PollFunction(Domain domain, HttpBackoff httpBackoff, F f, PollingInterval pollingInterval, PollFunctionListener pollFunctionListener) {
        this.backoff = httpBackoff;
        this.poll = f;
        this.domain = domain;
        this.pollingInterval = pollingInterval;
        this.listener = pollFunctionListener;
    }

    @Override // com.helpshift.common.domain.F
    public void f() {
        int serverStatusCode;
        if (this.shouldPoll) {
            try {
                HSLogger.d(TAG, "Running:" + this.pollingInterval.name());
                this.poll.f();
                serverStatusCode = NetworkErrorCodes.OK.intValue();
            } catch (RootAPIException e) {
                if (e.exceptionType instanceof NetworkException) {
                    serverStatusCode = e.getServerStatusCode();
                } else {
                    throw e;
                }
            }
            long jNextIntervalMillis = this.backoff.nextIntervalMillis(serverStatusCode);
            if (jNextIntervalMillis == -100) {
                PollFunctionListener pollFunctionListener = this.listener;
                if (pollFunctionListener != null) {
                    pollFunctionListener.onPollingStoppedViaBackoffStrategy();
                    return;
                }
                return;
            }
            schedulePoll(jNextIntervalMillis);
        }
    }

    void schedulePoll(long j) {
        this.domain.runDelayedInParallel(this, j);
    }

    public void start(long j) {
        HSLogger.d(TAG, "Start: " + this.pollingInterval.name());
        if (this.shouldPoll) {
            return;
        }
        this.shouldPoll = true;
        schedulePoll(j);
    }

    public void stop() {
        HSLogger.d(TAG, "Stop: " + this.pollingInterval.name());
        this.shouldPoll = false;
        this.backoff.reset();
    }
}
