package com.helpshift.common.domain;

import com.helpshift.common.domain.PollFunction;
import com.helpshift.common.domain.network.NetworkErrorCodes;
import com.helpshift.common.poller.Delay;
import com.helpshift.common.poller.HttpBackoff;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes2.dex */
public class Poller {
    private PollFunction activePollFunction;
    private final Domain domain;
    private final F poll;
    private HttpBackoff conservativeBackoff = new HttpBackoff.Builder().setBaseInterval(Delay.of(5, TimeUnit.SECONDS)).setMaxInterval(Delay.of(1, TimeUnit.MINUTES)).setRandomness(0.1f).setMultiplier(2.0f).setRetryPolicy(getPollerRetryPollicy()).build();
    private HttpBackoff aggressiveBackoff = new HttpBackoff.Builder().setBaseInterval(Delay.of(3, TimeUnit.SECONDS)).setMaxInterval(Delay.of(3, TimeUnit.SECONDS)).setRandomness(0.0f).setMultiplier(1.0f).setRetryPolicy(getPollerRetryPollicy()).build();
    private HttpBackoff passiveBackoff = new HttpBackoff.Builder().setBaseInterval(Delay.of(30, TimeUnit.SECONDS)).setMaxInterval(Delay.of(5, TimeUnit.MINUTES)).setRandomness(0.1f).setMultiplier(4.0f).setRetryPolicy(getPollerRetryPollicy()).build();

    public Poller(Domain domain, F f) {
        this.domain = domain;
        this.poll = f;
    }

    public synchronized void start(PollingInterval pollingInterval, long j, PollFunction.PollFunctionListener pollFunctionListener) {
        stop();
        if (pollingInterval == null) {
            return;
        }
        int i = AnonymousClass2.$SwitchMap$com$helpshift$common$domain$PollingInterval[pollingInterval.ordinal()];
        if (i == 1) {
            this.activePollFunction = new PollFunction(this.domain, this.aggressiveBackoff, this.poll, PollingInterval.AGGRESSIVE, pollFunctionListener);
        } else if (i == 2) {
            this.activePollFunction = new PollFunction(this.domain, this.passiveBackoff, this.poll, PollingInterval.PASSIVE, pollFunctionListener);
        } else if (i == 3) {
            this.activePollFunction = new PollFunction(this.domain, this.conservativeBackoff, this.poll, PollingInterval.CONSERVATIVE, pollFunctionListener);
        }
        this.activePollFunction.start(j);
    }

    /* JADX INFO: renamed from: com.helpshift.common.domain.Poller$2, reason: invalid class name */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$common$domain$PollingInterval;

        static {
            int[] iArr = new int[PollingInterval.values().length];
            $SwitchMap$com$helpshift$common$domain$PollingInterval = iArr;
            try {
                iArr[PollingInterval.AGGRESSIVE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$common$domain$PollingInterval[PollingInterval.PASSIVE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$common$domain$PollingInterval[PollingInterval.CONSERVATIVE.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
        }
    }

    public synchronized void stop() {
        PollFunction pollFunction = this.activePollFunction;
        if (pollFunction != null) {
            pollFunction.stop();
            this.activePollFunction = null;
        }
    }

    private HttpBackoff.RetryPolicy getPollerRetryPollicy() {
        return new HttpBackoff.RetryPolicy() { // from class: com.helpshift.common.domain.Poller.1
            @Override // com.helpshift.common.poller.HttpBackoff.RetryPolicy
            public boolean shouldRetry(int i) {
                return (i == NetworkErrorCodes.AUTH_TOKEN_NOT_PROVIDED.intValue() || i == NetworkErrorCodes.INVALID_AUTH_TOKEN.intValue() || NetworkErrorCodes.NOT_RETRIABLE_STATUS_CODES.contains(Integer.valueOf(i))) ? false : true;
            }
        };
    }
}
