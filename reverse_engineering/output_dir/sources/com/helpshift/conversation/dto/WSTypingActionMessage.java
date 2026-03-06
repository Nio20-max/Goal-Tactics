package com.helpshift.conversation.dto;

/* JADX INFO: loaded from: classes2.dex */
public class WSTypingActionMessage implements WebSocketMessage {
    public final boolean isAgentTyping;
    public final long typingActionTimeoutMillis;

    public WSTypingActionMessage(boolean z, long j) {
        this.isAgentTyping = z;
        this.typingActionTimeoutMillis = j;
    }
}
