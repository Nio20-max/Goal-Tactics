package com.helpshift.conversation.dto;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationDetailDTO {
    public final long timestamp;
    public final String title;
    public final int type;

    public interface Type {
        public static final int ARCHIVAL_TEXT = 3;
        public static final int NONE = 0;
        public static final int PREFILL_CONFIG = 2;
        public static final int USER_INPUT = 1;
    }

    public ConversationDetailDTO(String str, long j, int i) {
        this.title = str;
        this.timestamp = j;
        this.type = i;
    }
}
