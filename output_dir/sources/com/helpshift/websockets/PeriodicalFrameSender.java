package com.helpshift.websockets;

import java.util.Timer;
import java.util.TimerTask;

/* JADX INFO: loaded from: classes2.dex */
abstract class PeriodicalFrameSender {
    private PayloadGenerator mGenerator;
    private long mInterval;
    private boolean mScheduled;
    private Timer mTimer;
    private final String mTimerName;
    private final WebSocket mWebSocket;

    protected abstract WebSocketFrame createFrame(byte[] bArr);

    public PeriodicalFrameSender(WebSocket webSocket, String str, PayloadGenerator payloadGenerator) {
        this.mWebSocket = webSocket;
        this.mTimerName = str;
        this.mGenerator = payloadGenerator;
    }

    private static boolean schedule(Timer timer, Task task, long j) {
        try {
            timer.schedule(task, j);
            return true;
        } catch (RuntimeException unused) {
            return false;
        }
    }

    public void start() {
        setInterval(getInterval());
    }

    public void stop() {
        synchronized (this) {
            Timer timer = this.mTimer;
            if (timer == null) {
                return;
            }
            this.mScheduled = false;
            timer.cancel();
        }
    }

    public long getInterval() {
        long j;
        synchronized (this) {
            j = this.mInterval;
        }
        return j;
    }

    public void setInterval(long j) {
        if (j < 0) {
            j = 0;
        }
        synchronized (this) {
            this.mInterval = j;
        }
        if (j != 0 && this.mWebSocket.isOpen()) {
            synchronized (this) {
                if (this.mTimer == null) {
                    this.mTimer = new Timer(this.mTimerName);
                }
                if (!this.mScheduled) {
                    this.mScheduled = schedule(this.mTimer, new Task(), j);
                }
            }
        }
    }

    public PayloadGenerator getPayloadGenerator() {
        PayloadGenerator payloadGenerator;
        synchronized (this) {
            payloadGenerator = this.mGenerator;
        }
        return payloadGenerator;
    }

    public void setPayloadGenerator(PayloadGenerator payloadGenerator) {
        synchronized (this) {
            this.mGenerator = payloadGenerator;
        }
    }

    void doTask() {
        synchronized (this) {
            if (this.mInterval != 0 && this.mWebSocket.isOpen()) {
                this.mWebSocket.sendFrame(createFrame());
                this.mScheduled = schedule(this.mTimer, new Task(), this.mInterval);
                return;
            }
            this.mScheduled = false;
        }
    }

    private WebSocketFrame createFrame() {
        return createFrame(generatePayload());
    }

    private byte[] generatePayload() {
        PayloadGenerator payloadGenerator = this.mGenerator;
        if (payloadGenerator == null) {
            return null;
        }
        try {
            return payloadGenerator.generate();
        } catch (Throwable unused) {
            return null;
        }
    }

    private final class Task extends TimerTask {
        Task() {
        }

        @Override // java.util.TimerTask, java.lang.Runnable
        public void run() {
            PeriodicalFrameSender.this.doTask();
        }
    }
}
