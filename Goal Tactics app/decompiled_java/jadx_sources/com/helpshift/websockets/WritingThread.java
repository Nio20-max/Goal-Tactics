package com.helpshift.websockets;

import com.helpshift.websockets.StateManager;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedList;

/* JADX INFO: loaded from: classes2.dex */
class WritingThread extends WebSocketThread {
    private static final int FLUSH_THRESHOLD = 1000;
    private static final int SHOULD_CONTINUE = 2;
    private static final int SHOULD_FLUSH = 3;
    private static final int SHOULD_SEND = 0;
    private static final int SHOULD_STOP = 1;
    private WebSocketFrame mCloseFrame;
    private boolean mFlushNeeded;
    private final LinkedList<WebSocketFrame> mFrames;
    private final PerMessageCompressionExtension mPMCE;
    private boolean mStopRequested;
    private boolean mStopped;

    public WritingThread(WebSocket webSocket) {
        super("WritingThread", webSocket, ThreadType.WRITING_THREAD);
        this.mFrames = new LinkedList<>();
        this.mPMCE = webSocket.getPerMessageCompressionExtension();
    }

    private static boolean isHighPriorityFrame(WebSocketFrame webSocketFrame) {
        return webSocketFrame.isPingFrame() || webSocketFrame.isPongFrame();
    }

    @Override // com.helpshift.websockets.WebSocketThread
    public void runMain() {
        try {
            main();
        } catch (Throwable th) {
            WebSocketException webSocketException = new WebSocketException(WebSocketError.UNEXPECTED_ERROR_IN_WRITING_THREAD, "An uncaught throwable was detected in the writing thread: " + th.getMessage(), th);
            ListenerManager listenerManager = this.mWebSocket.getListenerManager();
            listenerManager.callOnError(webSocketException);
            listenerManager.callOnUnexpectedError(webSocketException);
        }
        synchronized (this) {
            this.mStopped = true;
            notifyAll();
        }
        notifyFinished();
    }

    private void main() {
        this.mWebSocket.onWritingThreadStarted();
        while (true) {
            int iWaitForFrames = waitForFrames();
            if (iWaitForFrames != 1) {
                if (iWaitForFrames == 3) {
                    flushIgnoreError();
                } else if (iWaitForFrames == 2) {
                    continue;
                } else {
                    try {
                        sendFrames(false);
                    } catch (WebSocketException unused) {
                    }
                }
            }
            try {
                sendFrames(true);
                return;
            } catch (WebSocketException unused2) {
                return;
            }
        }
    }

    public void requestStop() {
        synchronized (this) {
            this.mStopRequested = true;
            notifyAll();
        }
    }

    public boolean queueFrame(WebSocketFrame webSocketFrame) {
        int frameQueueSize;
        synchronized (this) {
            while (!this.mStopped) {
                if (!this.mStopRequested && this.mCloseFrame == null && !webSocketFrame.isControlFrame() && (frameQueueSize = this.mWebSocket.getFrameQueueSize()) != 0 && this.mFrames.size() >= frameQueueSize) {
                    try {
                        wait();
                    } catch (InterruptedException unused) {
                    }
                }
                if (isHighPriorityFrame(webSocketFrame)) {
                    addHighPriorityFrame(webSocketFrame);
                } else {
                    this.mFrames.addLast(webSocketFrame);
                }
                notifyAll();
                return true;
            }
            return false;
        }
    }

    private void addHighPriorityFrame(WebSocketFrame webSocketFrame) {
        Iterator<WebSocketFrame> it = this.mFrames.iterator();
        int i = 0;
        while (it.hasNext() && isHighPriorityFrame(it.next())) {
            i++;
        }
        this.mFrames.add(i, webSocketFrame);
    }

    public void queueFlush() {
        synchronized (this) {
            this.mFlushNeeded = true;
            notifyAll();
        }
    }

    private void flushIgnoreError() {
        try {
            flush();
        } catch (IOException unused) {
        }
    }

    private void flush() throws IOException {
        this.mWebSocket.getOutput().flush();
    }

    private int waitForFrames() {
        synchronized (this) {
            if (this.mStopRequested) {
                return 1;
            }
            if (this.mCloseFrame != null) {
                return 1;
            }
            if (this.mFrames.size() == 0) {
                if (this.mFlushNeeded) {
                    this.mFlushNeeded = false;
                    return 3;
                }
                try {
                    wait();
                } catch (InterruptedException unused) {
                }
            }
            if (this.mStopRequested) {
                return 1;
            }
            if (this.mFrames.size() != 0) {
                return 0;
            }
            if (!this.mFlushNeeded) {
                return 2;
            }
            this.mFlushNeeded = false;
            return 3;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x001e, code lost:
    
        sendFrame(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0025, code lost:
    
        if (r2.isPingFrame() != false) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x002b, code lost:
    
        if (r2.isPongFrame() == false) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0032, code lost:
    
        if (isFlushNeeded(r5) != false) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0035, code lost:
    
        r0 = flushIfLongInterval(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x003a, code lost:
    
        doFlush();
        r0 = java.lang.System.currentTimeMillis();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void sendFrames(boolean r5) throws com.helpshift.websockets.WebSocketException {
        /*
            r4 = this;
            long r0 = java.lang.System.currentTimeMillis()
        L4:
            monitor-enter(r4)
            java.util.LinkedList<com.helpshift.websockets.WebSocketFrame> r2 = r4.mFrames     // Catch: java.lang.Throwable -> L42
            java.lang.Object r2 = r2.poll()     // Catch: java.lang.Throwable -> L42
            com.helpshift.websockets.WebSocketFrame r2 = (com.helpshift.websockets.WebSocketFrame) r2     // Catch: java.lang.Throwable -> L42
            r4.notifyAll()     // Catch: java.lang.Throwable -> L42
            if (r2 != 0) goto L1d
            monitor-exit(r4)     // Catch: java.lang.Throwable -> L42
            boolean r5 = r4.isFlushNeeded(r5)
            if (r5 == 0) goto L1c
            r4.doFlush()
        L1c:
            return
        L1d:
            monitor-exit(r4)     // Catch: java.lang.Throwable -> L42
            r4.sendFrame(r2)
            boolean r3 = r2.isPingFrame()
            if (r3 != 0) goto L3a
            boolean r2 = r2.isPongFrame()
            if (r2 == 0) goto L2e
            goto L3a
        L2e:
            boolean r2 = r4.isFlushNeeded(r5)
            if (r2 != 0) goto L35
            goto L4
        L35:
            long r0 = r4.flushIfLongInterval(r0)
            goto L4
        L3a:
            r4.doFlush()
            long r0 = java.lang.System.currentTimeMillis()
            goto L4
        L42:
            r5 = move-exception
            monitor-exit(r4)     // Catch: java.lang.Throwable -> L42
            throw r5
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.websockets.WritingThread.sendFrames(boolean):void");
    }

    private boolean isFlushNeeded(boolean z) {
        return z || this.mWebSocket.isAutoFlush() || this.mFlushNeeded || this.mCloseFrame != null;
    }

    private long flushIfLongInterval(long j) throws WebSocketException {
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (1000 >= jCurrentTimeMillis - j) {
            return j;
        }
        doFlush();
        return jCurrentTimeMillis;
    }

    private void doFlush() throws WebSocketException {
        try {
            flush();
            synchronized (this) {
                this.mFlushNeeded = false;
            }
        } catch (IOException e) {
            WebSocketException webSocketException = new WebSocketException(WebSocketError.FLUSH_ERROR, "Flushing frames to the server failed: " + e.getMessage(), e);
            ListenerManager listenerManager = this.mWebSocket.getListenerManager();
            listenerManager.callOnError(webSocketException);
            listenerManager.callOnSendError(webSocketException, null);
            throw webSocketException;
        }
    }

    private void sendFrame(WebSocketFrame webSocketFrame) throws WebSocketException {
        boolean z;
        WebSocketFrame webSocketFrameCompressFrame = WebSocketFrame.compressFrame(webSocketFrame, this.mPMCE);
        this.mWebSocket.getListenerManager().callOnSendingFrame(webSocketFrameCompressFrame);
        if (this.mCloseFrame != null) {
            z = true;
        } else {
            if (webSocketFrameCompressFrame.isCloseFrame()) {
                this.mCloseFrame = webSocketFrameCompressFrame;
            }
            z = false;
        }
        if (z) {
            this.mWebSocket.getListenerManager().callOnFrameUnsent(webSocketFrameCompressFrame);
            return;
        }
        if (webSocketFrameCompressFrame.isCloseFrame()) {
            changeToClosing();
        }
        try {
            this.mWebSocket.getOutput().write(webSocketFrameCompressFrame);
            this.mWebSocket.getListenerManager().callOnFrameSent(webSocketFrameCompressFrame);
        } catch (IOException e) {
            WebSocketException webSocketException = new WebSocketException(WebSocketError.IO_ERROR_IN_WRITING, "An I/O error occurred when a frame was tried to be sent: " + e.getMessage(), e);
            ListenerManager listenerManager = this.mWebSocket.getListenerManager();
            listenerManager.callOnError(webSocketException);
            listenerManager.callOnSendError(webSocketException, webSocketFrameCompressFrame);
            throw webSocketException;
        }
    }

    private void changeToClosing() {
        boolean z;
        StateManager stateManager = this.mWebSocket.getStateManager();
        synchronized (stateManager) {
            WebSocketState state = stateManager.getState();
            if (state == WebSocketState.CLOSING || state == WebSocketState.CLOSED) {
                z = false;
            } else {
                stateManager.changeToClosing(StateManager.CloseInitiator.CLIENT);
                z = true;
            }
        }
        if (z) {
            this.mWebSocket.getListenerManager().callOnStateChanged(WebSocketState.CLOSING);
        }
    }

    private void notifyFinished() {
        this.mWebSocket.onWritingThreadFinished(this.mCloseFrame);
    }
}
