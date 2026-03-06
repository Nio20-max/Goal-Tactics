package com.helpshift.common.poller;

import java.security.SecureRandom;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes2.dex */
public class ExponentialBackoff {
    public static final long STOP = -100;
    private int attempts;
    private final long baseIntervalMillis;
    private long currentBaseIntervalMillis;
    private final int maxAttempts;
    private final long maxIntervalMillis;
    private final float multiplier;
    private final SecureRandom random = new SecureRandom();
    private final float randomness;

    ExponentialBackoff(Builder builder) {
        this.baseIntervalMillis = builder.baseIntervalMillis;
        this.maxIntervalMillis = builder.maxIntervalMillis;
        this.randomness = builder.randomness;
        this.multiplier = builder.multiplier;
        this.maxAttempts = builder.maxAttempts;
        reset();
    }

    public void reset() {
        this.currentBaseIntervalMillis = this.baseIntervalMillis;
        this.attempts = 0;
    }

    public long nextIntervalMillis() {
        int i = this.attempts;
        if (i >= this.maxAttempts) {
            return -100L;
        }
        this.attempts = i + 1;
        long j = this.currentBaseIntervalMillis;
        float f = this.randomness;
        float f2 = j * (1.0f - f);
        float f3 = j * (f + 1.0f);
        long j2 = this.maxIntervalMillis;
        if (j <= j2) {
            this.currentBaseIntervalMillis = Math.min((long) (j * this.multiplier), j2);
        }
        return (long) (f2 + (this.random.nextFloat() * (f3 - f2)));
    }

    public static class Builder {
        public static final String ERROR_BASE_INTERVAL_RANGE = "Base interval can't be negative or zero";
        public static final String ERROR_MAX_ATTEMPTS_RANGE = "Max attempts can't be negative or zero";
        public static final String ERROR_MAX_INTERVAL_LESS_THAN_BASE_INTERVAL = "Max interval can't be less than base interval";
        public static final String ERROR_MAX_INTERVAL_RANGE = "Max interval can't be negative or zero";
        public static final String ERROR_MULTIPLIER_RANGE = "Multiplier can't be less than 1";
        public static final String ERROR_RANDOMNESS_RANGE = "Randomness must be between 0 and 1 (both inclusive)";
        long baseIntervalMillis = TimeUnit.SECONDS.toMillis(10);
        long maxIntervalMillis = TimeUnit.SECONDS.toMillis(60);
        float randomness = 0.5f;
        float multiplier = 2.0f;
        int maxAttempts = Integer.MAX_VALUE;

        public Builder setBaseInterval(Delay delay) {
            this.baseIntervalMillis = delay.timeUnit.toMillis(delay.delay);
            return this;
        }

        public Builder setMaxInterval(Delay delay) {
            this.maxIntervalMillis = delay.timeUnit.toMillis(delay.delay);
            return this;
        }

        public Builder setRandomness(float f) {
            this.randomness = f;
            return this;
        }

        public Builder setMultiplier(float f) {
            this.multiplier = f;
            return this;
        }

        public Builder setMaxAttempts(int i) {
            this.maxAttempts = i;
            return this;
        }

        void validate() {
            long j = this.baseIntervalMillis;
            if (j <= 0) {
                throw new IllegalArgumentException(ERROR_BASE_INTERVAL_RANGE);
            }
            long j2 = this.maxIntervalMillis;
            if (j2 <= 0) {
                throw new IllegalArgumentException(ERROR_MAX_INTERVAL_RANGE);
            }
            if (j2 < j) {
                throw new IllegalArgumentException(ERROR_MAX_INTERVAL_LESS_THAN_BASE_INTERVAL);
            }
            float f = this.randomness;
            if (f < 0.0f || f > 1.0f) {
                throw new IllegalArgumentException(ERROR_RANDOMNESS_RANGE);
            }
            if (this.multiplier < 1.0f) {
                throw new IllegalArgumentException(ERROR_MULTIPLIER_RANGE);
            }
            if (this.maxAttempts <= 0) {
                throw new IllegalArgumentException(ERROR_MAX_ATTEMPTS_RANGE);
            }
        }

        public ExponentialBackoff build() throws IllegalArgumentException {
            validate();
            return new ExponentialBackoff(this);
        }
    }
}
