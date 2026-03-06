package com.helpshift.websockets;

import com.helpshift.websockets.StateManager;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

/* JADX INFO: loaded from: classes2.dex */
class ReadingThread extends WebSocketThread {
    private long mCloseDelay;
    private WebSocketFrame mCloseFrame;
    private Object mCloseLock;
    private CloseTask mCloseTask;
    private Timer mCloseTimer;
    private List<WebSocketFrame> mContinuation;
    private boolean mNotWaitForCloseFrame;
    private final PerMessageCompressionExtension mPMCE;
    private boolean mStopRequested;

    public ReadingThread(WebSocket webSocket) {
        super("ReadingThread", webSocket, ThreadType.READING_THREAD);
        this.mContinuation = new ArrayList();
        this.mCloseLock = new Object();
        this.mPMCE = webSocket.getPerMessageCompressionExtension();
    }

    @Override // com.helpshift.websockets.WebSocketThread
    public void runMain() {
        try {
            main();
        } catch (Throwable th) {
            WebSocketException webSocketException = new WebSocketException(WebSocketError.UNEXPECTED_ERROR_IN_READING_THREAD, "An uncaught throwable was detected in the reading thread: " + th.getMessage(), th);
            ListenerManager listenerManager = this.mWebSocket.getListenerManager();
            listenerManager.callOnError(webSocketException);
            listenerManager.callOnUnexpectedError(webSocketException);
        }
        this.mWebSocket.onReadingThreadFinished(this.mCloseFrame);
    }

    private void main() {
        this.mWebSocket.onReadingThreadStarted();
        while (true) {
            synchronized (this) {
                if (!this.mStopRequested) {
                    WebSocketFrame frame = readFrame();
                    if (frame == null || !handleFrame(frame)) {
                        break;
                    }
                } else {
                    break;
                }
            }
        }
        waitForCloseFrame();
        cancelClose();
    }

    void requestStop(long j) {
        synchronized (this) {
            if (this.mStopRequested) {
                return;
            }
            this.mStopRequested = true;
            interrupt();
            this.mCloseDelay = j;
            scheduleClose();
        }
    }

    private void callOnTextMessage(byte[] bArr) {
        try {
            callOnTextMessage(Misc.toStringUTF8(bArr));
        } catch (Throwable th) {
            WebSocketException webSocketException = new WebSocketException(WebSocketError.TEXT_MESSAGE_CONSTRUCTION_ERROR, "Failed to convert payload data into a string: " + th.getMessage(), th);
            callOnError(webSocketException);
            this.mWebSocket.getListenerManager().callOnTextMessageError(webSocketException, bArr);
        }
    }

    private void callOnTextMessage(String str) {
        this.mWebSocket.getListenerManager().callOnTextMessage(str);
    }

    private void callOnBinaryMessage(byte[] bArr) {
        this.mWebSocket.getListenerManager().callOnBinaryMessage(bArr);
    }

    private void callOnError(WebSocketException webSocketException) {
        this.mWebSocket.getListenerManager().callOnError(webSocketException);
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0079  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private com.helpshift.websockets.WebSocketFrame readFrame() {
        /*
            r7 = this;
            r0 = 0
            com.helpshift.websockets.WebSocket r1 = r7.mWebSocket     // Catch: com.helpshift.websockets.WebSocketException -> L15 java.io.IOException -> L18 java.io.InterruptedIOException -> L42
            com.helpshift.websockets.WebSocketInputStream r1 = r1.getInput()     // Catch: com.helpshift.websockets.WebSocketException -> L15 java.io.IOException -> L18 java.io.InterruptedIOException -> L42
            com.helpshift.websockets.WebSocketFrame r1 = r1.readFrame()     // Catch: com.helpshift.websockets.WebSocketException -> L15 java.io.IOException -> L18 java.io.InterruptedIOException -> L42
            r7.verifyFrame(r1)     // Catch: com.helpshift.websockets.WebSocketException -> Lf java.io.IOException -> L11 java.io.InterruptedIOException -> L13
            return r1
        Lf:
            r2 = move-exception
            goto L66
        L11:
            r2 = move-exception
            goto L1a
        L13:
            r2 = move-exception
            goto L44
        L15:
            r2 = move-exception
            r1 = r0
            goto L66
        L18:
            r2 = move-exception
            r1 = r0
        L1a:
            boolean r3 = r7.mStopRequested
            if (r3 == 0) goto L25
            boolean r3 = r7.isInterrupted()
            if (r3 == 0) goto L25
            return r0
        L25:
            com.helpshift.websockets.WebSocketException r3 = new com.helpshift.websockets.WebSocketException
            com.helpshift.websockets.WebSocketError r4 = com.helpshift.websockets.WebSocketError.IO_ERROR_IN_READING
            java.lang.StringBuilder r5 = new java.lang.StringBuilder
            r5.<init>()
            java.lang.String r6 = "An I/O error occurred while a frame was being read from the web socket: "
            r5.append(r6)
            java.lang.String r6 = r2.getMessage()
            r5.append(r6)
            java.lang.String r5 = r5.toString()
            r3.<init>(r4, r5, r2)
            goto L65
        L42:
            r2 = move-exception
            r1 = r0
        L44:
            boolean r3 = r7.mStopRequested
            if (r3 == 0) goto L49
            return r0
        L49:
            com.helpshift.websockets.WebSocketException r3 = new com.helpshift.websockets.WebSocketException
            com.helpshift.websockets.WebSocketError r4 = com.helpshift.websockets.WebSocketError.INTERRUPTED_IN_READING
            java.lang.StringBuilder r5 = new java.lang.StringBuilder
            r5.<init>()
            java.lang.String r6 = "Interruption occurred while a frame was being read from the web socket: "
            r5.append(r6)
            java.lang.String r6 = r2.getMessage()
            r5.append(r6)
            java.lang.String r5 = r5.toString()
            r3.<init>(r4, r5, r2)
        L65:
            r2 = r3
        L66:
            boolean r3 = r2 instanceof com.helpshift.websockets.NoMoreFrameException
            r4 = 1
            if (r3 == 0) goto L77
            r7.mNotWaitForCloseFrame = r4
            com.helpshift.websockets.WebSocket r3 = r7.mWebSocket
            boolean r3 = r3.isMissingCloseFrameAllowed()
            if (r3 == 0) goto L77
            r4 = 0
        L77:
            if (r4 == 0) goto L85
            r7.callOnError(r2)
            com.helpshift.websockets.WebSocket r3 = r7.mWebSocket
            com.helpshift.websockets.ListenerManager r3 = r3.getListenerManager()
            r3.callOnFrameError(r2, r1)
        L85:
            com.helpshift.websockets.WebSocketFrame r1 = r7.createCloseFrame(r2)
            com.helpshift.websockets.WebSocket r2 = r7.mWebSocket
            r2.sendFrame(r1)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.websockets.ReadingThread.readFrame():com.helpshift.websockets.WebSocketFrame");
    }

    private void verifyFrame(WebSocketFrame webSocketFrame) throws WebSocketException {
        verifyReservedBits(webSocketFrame);
        verifyFrameOpcode(webSocketFrame);
        verifyFrameMask(webSocketFrame);
        verifyFrameFragmentation(webSocketFrame);
        verifyFrameSize(webSocketFrame);
    }

    private void verifyReservedBits(WebSocketFrame webSocketFrame) throws WebSocketException {
        if (this.mWebSocket.isExtended()) {
            return;
        }
        verifyReservedBit1(webSocketFrame);
        verifyReservedBit2(webSocketFrame);
        verifyReservedBit3(webSocketFrame);
    }

    private void verifyReservedBit1(WebSocketFrame webSocketFrame) throws WebSocketException {
        if ((this.mPMCE == null || !verifyReservedBit1ForPMCE(webSocketFrame)) && webSocketFrame.getRsv1()) {
            throw new WebSocketException(WebSocketError.UNEXPECTED_RESERVED_BIT, "The RSV1 bit of a frame is set unexpectedly.");
        }
    }

    private boolean verifyReservedBit1ForPMCE(WebSocketFrame webSocketFrame) throws WebSocketException {
        return webSocketFrame.isTextFrame() || webSocketFrame.isBinaryFrame();
    }

    private void verifyReservedBit2(WebSocketFrame webSocketFrame) throws WebSocketException {
        if (webSocketFrame.getRsv2()) {
            throw new WebSocketException(WebSocketError.UNEXPECTED_RESERVED_BIT, "The RSV2 bit of a frame is set unexpectedly.");
        }
    }

    private void verifyReservedBit3(WebSocketFrame webSocketFrame) throws WebSocketException {
        if (webSocketFrame.getRsv3()) {
            throw new WebSocketException(WebSocketError.UNEXPECTED_RESERVED_BIT, "The RSV3 bit of a frame is set unexpectedly.");
        }
    }

    private void verifyFrameOpcode(WebSocketFrame webSocketFrame) throws WebSocketException {
        int opcode = webSocketFrame.getOpcode();
        if (opcode == 0 || opcode == 1 || opcode == 2) {
            return;
        }
        switch (opcode) {
            case 8:
            case 9:
            case 10:
                return;
            default:
                if (this.mWebSocket.isExtended()) {
                    return;
                }
                throw new WebSocketException(WebSocketError.UNKNOWN_OPCODE, "A frame has an unknown opcode: 0x" + Integer.toHexString(webSocketFrame.getOpcode()));
        }
    }

    private void verifyFrameMask(WebSocketFrame webSocketFrame) throws WebSocketException {
        if (webSocketFrame.getMask()) {
            throw new WebSocketException(WebSocketError.FRAME_MASKED, "A frame from the server is masked.");
        }
    }

    private void verifyFrameFragmentation(WebSocketFrame webSocketFrame) throws WebSocketException {
        if (webSocketFrame.isControlFrame()) {
            if (!webSocketFrame.getFin()) {
                throw new WebSocketException(WebSocketError.FRAGMENTED_CONTROL_FRAME, "A control frame is fragmented.");
            }
            return;
        }
        boolean z = this.mContinuation.size() != 0;
        if (webSocketFrame.isContinuationFrame()) {
            if (!z) {
                throw new WebSocketException(WebSocketError.UNEXPECTED_CONTINUATION_FRAME, "A continuation frame was detected although a continuation had not started.");
            }
        } else if (z) {
            throw new WebSocketException(WebSocketError.CONTINUATION_NOT_CLOSED, "A non-control frame was detected although the existing continuation had not been closed.");
        }
    }

    private void verifyFrameSize(WebSocketFrame webSocketFrame) throws WebSocketException {
        byte[] payload;
        if (webSocketFrame.isControlFrame() && (payload = webSocketFrame.getPayload()) != null && 125 < payload.length) {
            throw new WebSocketException(WebSocketError.TOO_LONG_CONTROL_FRAME_PAYLOAD, "The payload size of a control frame exceeds the maximum size (125 bytes): " + payload.length);
        }
    }

    /* JADX INFO: renamed from: com.helpshift.websockets.ReadingThread$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$websockets$WebSocketError;

        static {
            int[] iArr = new int[WebSocketError.values().length];
            $SwitchMap$com$helpshift$websockets$WebSocketError = iArr;
            try {
                iArr[WebSocketError.INSUFFICENT_DATA.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$websockets$WebSocketError[WebSocketError.INVALID_PAYLOAD_LENGTH.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$websockets$WebSocketError[WebSocketError.NO_MORE_FRAME.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$helpshift$websockets$WebSocketError[WebSocketError.TOO_LONG_PAYLOAD.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$helpshift$websockets$WebSocketError[WebSocketError.INSUFFICIENT_MEMORY_FOR_PAYLOAD.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$helpshift$websockets$WebSocketError[WebSocketError.NON_ZERO_RESERVED_BITS.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$com$helpshift$websockets$WebSocketError[WebSocketError.UNEXPECTED_RESERVED_BIT.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                $SwitchMap$com$helpshift$websockets$WebSocketError[WebSocketError.UNKNOWN_OPCODE.ordinal()] = 8;
            } catch (NoSuchFieldError unused8) {
            }
            try {
                $SwitchMap$com$helpshift$websockets$WebSocketError[WebSocketError.FRAME_MASKED.ordinal()] = 9;
            } catch (NoSuchFieldError unused9) {
            }
            try {
                $SwitchMap$com$helpshift$websockets$WebSocketError[WebSocketError.FRAGMENTED_CONTROL_FRAME.ordinal()] = 10;
            } catch (NoSuchFieldError unused10) {
            }
            try {
                $SwitchMap$com$helpshift$websockets$WebSocketError[WebSocketError.UNEXPECTED_CONTINUATION_FRAME.ordinal()] = 11;
            } catch (NoSuchFieldError unused11) {
            }
            try {
                $SwitchMap$com$helpshift$websockets$WebSocketError[WebSocketError.CONTINUATION_NOT_CLOSED.ordinal()] = 12;
            } catch (NoSuchFieldError unused12) {
            }
            try {
                $SwitchMap$com$helpshift$websockets$WebSocketError[WebSocketError.TOO_LONG_CONTROL_FRAME_PAYLOAD.ordinal()] = 13;
            } catch (NoSuchFieldError unused13) {
            }
            try {
                $SwitchMap$com$helpshift$websockets$WebSocketError[WebSocketError.INTERRUPTED_IN_READING.ordinal()] = 14;
            } catch (NoSuchFieldError unused14) {
            }
            try {
                $SwitchMap$com$helpshift$websockets$WebSocketError[WebSocketError.IO_ERROR_IN_READING.ordinal()] = 15;
            } catch (NoSuchFieldError unused15) {
            }
        }
    }

    private WebSocketFrame createCloseFrame(WebSocketException webSocketException) {
        int i = 1008;
        switch (AnonymousClass1.$SwitchMap$com$helpshift$websockets$WebSocketError[webSocketException.getError().ordinal()]) {
            case 1:
            case 2:
            case 3:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
                i = 1002;
                break;
            case 4:
            case 5:
                i = 1009;
                break;
        }
        return WebSocketFrame.createCloseFrame(i, webSocketException.getMessage());
    }

    private boolean handleFrame(WebSocketFrame webSocketFrame) {
        this.mWebSocket.getListenerManager().callOnFrame(webSocketFrame);
        int opcode = webSocketFrame.getOpcode();
        if (opcode == 0) {
            return handleContinuationFrame(webSocketFrame);
        }
        if (opcode == 1) {
            return handleTextFrame(webSocketFrame);
        }
        if (opcode == 2) {
            return handleBinaryFrame(webSocketFrame);
        }
        switch (opcode) {
            case 8:
                return handleCloseFrame(webSocketFrame);
            case 9:
                return handlePingFrame(webSocketFrame);
            case 10:
                return handlePongFrame(webSocketFrame);
            default:
                return true;
        }
    }

    private boolean handleContinuationFrame(WebSocketFrame webSocketFrame) {
        this.mWebSocket.getListenerManager().callOnContinuationFrame(webSocketFrame);
        this.mContinuation.add(webSocketFrame);
        if (!webSocketFrame.getFin()) {
            return true;
        }
        byte[] message = getMessage(this.mContinuation);
        if (message == null) {
            return false;
        }
        if (this.mContinuation.get(0).isTextFrame()) {
            callOnTextMessage(message);
        } else {
            callOnBinaryMessage(message);
        }
        this.mContinuation.clear();
        return true;
    }

    private byte[] getMessage(List<WebSocketFrame> list) {
        byte[] bArrConcatenatePayloads = concatenatePayloads(this.mContinuation);
        if (bArrConcatenatePayloads == null) {
            return null;
        }
        return (this.mPMCE == null || !list.get(0).getRsv1()) ? bArrConcatenatePayloads : decompress(bArrConcatenatePayloads);
    }

    private byte[] concatenatePayloads(List<WebSocketFrame> list) {
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            Iterator<WebSocketFrame> it = list.iterator();
            while (it.hasNext()) {
                byte[] payload = it.next().getPayload();
                if (payload != null && payload.length != 0) {
                    byteArrayOutputStream.write(payload);
                }
            }
            return byteArrayOutputStream.toByteArray();
        } catch (IOException | OutOfMemoryError e) {
            WebSocketException webSocketException = new WebSocketException(WebSocketError.MESSAGE_CONSTRUCTION_ERROR, "Failed to concatenate payloads of multiple frames to construct a message: " + e.getMessage(), e);
            callOnError(webSocketException);
            this.mWebSocket.getListenerManager().callOnMessageError(webSocketException, list);
            this.mWebSocket.sendFrame(WebSocketFrame.createCloseFrame(1009, webSocketException.getMessage()));
            return null;
        }
    }

    private byte[] getMessage(WebSocketFrame webSocketFrame) {
        byte[] payload = webSocketFrame.getPayload();
        return (this.mPMCE == null || !webSocketFrame.getRsv1()) ? payload : decompress(payload);
    }

    private byte[] decompress(byte[] bArr) {
        try {
            return this.mPMCE.decompress(bArr);
        } catch (WebSocketException e) {
            callOnError(e);
            this.mWebSocket.getListenerManager().callOnMessageDecompressionError(e, bArr);
            this.mWebSocket.sendFrame(WebSocketFrame.createCloseFrame(1003, e.getMessage()));
            return null;
        }
    }

    private boolean handleTextFrame(WebSocketFrame webSocketFrame) {
        this.mWebSocket.getListenerManager().callOnTextFrame(webSocketFrame);
        if (!webSocketFrame.getFin()) {
            this.mContinuation.add(webSocketFrame);
            return true;
        }
        callOnTextMessage(getMessage(webSocketFrame));
        return true;
    }

    private boolean handleBinaryFrame(WebSocketFrame webSocketFrame) {
        this.mWebSocket.getListenerManager().callOnBinaryFrame(webSocketFrame);
        if (!webSocketFrame.getFin()) {
            this.mContinuation.add(webSocketFrame);
            return true;
        }
        callOnBinaryMessage(getMessage(webSocketFrame));
        return true;
    }

    private boolean handleCloseFrame(WebSocketFrame webSocketFrame) {
        boolean z;
        StateManager stateManager = this.mWebSocket.getStateManager();
        this.mCloseFrame = webSocketFrame;
        synchronized (stateManager) {
            WebSocketState state = stateManager.getState();
            if (state == WebSocketState.CLOSING || state == WebSocketState.CLOSED) {
                z = false;
            } else {
                stateManager.changeToClosing(StateManager.CloseInitiator.SERVER);
                this.mWebSocket.sendFrame(webSocketFrame);
                z = true;
            }
        }
        if (z) {
            this.mWebSocket.getListenerManager().callOnStateChanged(WebSocketState.CLOSING);
        }
        this.mWebSocket.getListenerManager().callOnCloseFrame(webSocketFrame);
        return false;
    }

    private boolean handlePingFrame(WebSocketFrame webSocketFrame) {
        this.mWebSocket.getListenerManager().callOnPingFrame(webSocketFrame);
        this.mWebSocket.sendFrame(WebSocketFrame.createPongFrame(webSocketFrame.getPayload()));
        return true;
    }

    private boolean handlePongFrame(WebSocketFrame webSocketFrame) {
        this.mWebSocket.getListenerManager().callOnPongFrame(webSocketFrame);
        return true;
    }

    private void waitForCloseFrame() {
        if (!this.mNotWaitForCloseFrame && this.mCloseFrame == null) {
            scheduleClose();
            do {
                try {
                    WebSocketFrame frame = this.mWebSocket.getInput().readFrame();
                    if (frame.isCloseFrame()) {
                        this.mCloseFrame = frame;
                        return;
                    }
                } catch (Throwable unused) {
                    return;
                }
            } while (!isInterrupted());
        }
    }

    private void scheduleClose() {
        synchronized (this.mCloseLock) {
            cancelCloseTask();
            scheduleCloseTask();
        }
    }

    private void scheduleCloseTask() {
        this.mCloseTask = new CloseTask();
        Timer timer = new Timer("ReadingThreadCloseTimer");
        this.mCloseTimer = timer;
        timer.schedule(this.mCloseTask, this.mCloseDelay);
    }

    private void cancelClose() {
        synchronized (this.mCloseLock) {
            cancelCloseTask();
        }
    }

    private void cancelCloseTask() {
        Timer timer = this.mCloseTimer;
        if (timer != null) {
            timer.cancel();
            this.mCloseTimer = null;
        }
        CloseTask closeTask = this.mCloseTask;
        if (closeTask != null) {
            closeTask.cancel();
            this.mCloseTask = null;
        }
    }

    private class CloseTask extends TimerTask {
        CloseTask() {
        }

        @Override // java.util.TimerTask, java.lang.Runnable
        public void run() {
            try {
                ReadingThread.this.mWebSocket.getSocket().close();
            } catch (Throwable unused) {
            }
        }
    }
}
