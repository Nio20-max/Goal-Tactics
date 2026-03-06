package com.helpshift.common.poller;

import com.helpshift.common.domain.network.NetworkErrorCodes;
import com.helpshift.common.poller.ExponentialBackoff;

/* JADX INFO: loaded from: classes2.dex */
public class HttpBackoff {
    private final ExponentialBackoff exponentialBackoff;
    private final RetryPolicy retryPolicy;

    public interface RetryPolicy {
        public static final RetryPolicy FAILURE = new RetryPolicy() { // from class: com.helpshift.common.poller.HttpBackoff.RetryPolicy.1
            @Override // com.helpshift.common.poller.HttpBackoff.RetryPolicy
            public boolean shouldRetry(int i) {
                return !NetworkErrorCodes.NOT_RETRIABLE_STATUS_CODES.contains(Integer.valueOf(i));
            }
        };
        public static final RetryPolicy ALWAYS = new RetryPolicy() { // from class: com.helpshift.common.poller.HttpBackoff.RetryPolicy.2
            @Override // com.helpshift.common.poller.HttpBackoff.RetryPolicy
            public boolean shouldRetry(int i) {
                return true;
            }
        };
        public static final RetryPolicy NEVER = new RetryPolicy() { // from class: com.helpshift.common.poller.HttpBackoff.RetryPolicy.3
            @Override // com.helpshift.common.poller.HttpBackoff.RetryPolicy
            public boolean shouldRetry(int i) {
                return false;
            }
        };

        boolean shouldRetry(int i);
    }

    HttpBackoff(Builder builder) {
        this.exponentialBackoff = new ExponentialBackoff(builder.exponentialBackoffBuilder);
        this.retryPolicy = builder.retryPolicy;
    }

    public void reset() {
        this.exponentialBackoff.reset();
    }

    public long nextIntervalMillis(int i) {
        long jNextIntervalMillis = this.exponentialBackoff.nextIntervalMillis();
        if (this.retryPolicy.shouldRetry(i)) {
            return jNextIntervalMillis;
        }
        return -100L;
    }

    public static class Builder {
        final ExponentialBackoff.Builder exponentialBackoffBuilder = new ExponentialBackoff.Builder();
        RetryPolicy retryPolicy = RetryPolicy.ALWAYS;

        public Builder setRetryPolicy(RetryPolicy retryPolicy) {
            this.retryPolicy = retryPolicy;
            return this;
        }

        public Builder setBaseInterval(Delay delay) {
            this.exponentialBackoffBuilder.setBaseInterval(delay);
            return this;
        }

        public Builder setMaxInterval(Delay delay) {
            this.exponentialBackoffBuilder.setMaxInterval(delay);
            return this;
        }

        public Builder setRandomness(float f) {
            this.exponentialBackoffBuilder.setRandomness(f);
            return this;
        }

        public Builder setMultiplier(float f) {
            this.exponentialBackoffBuilder.setMultiplier(f);
            return this;
        }

        public Builder setMaxAttempts(int i) {
            this.exponentialBackoffBuilder.setMaxAttempts(i);
            return this;
        }

        public HttpBackoff build() throws IllegalArgumentException {
            this.exponentialBackoffBuilder.validate();
            return new HttpBackoff(this);
        }
    }
}
