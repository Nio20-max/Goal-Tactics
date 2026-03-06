package com.helpshift.conversation.activeconversation;

import com.helpshift.conversation.dto.IssueState;

/* JADX INFO: loaded from: classes2.dex */
public class UIConversation {
    public final String createdAt;
    public final long epochCreateTime;
    public final int index;
    public final boolean isInPreIssueMode;
    public final boolean isRedacted;
    public final IssueState issueState;
    public final long localID;
    public final String publishId;

    public UIConversation(long j, int i, String str, long j2, String str2, boolean z, IssueState issueState, boolean z2) {
        this.localID = j;
        this.index = i;
        this.createdAt = str;
        this.publishId = str2;
        this.isInPreIssueMode = z;
        this.issueState = issueState;
        this.isRedacted = z2;
        this.epochCreateTime = j2;
    }
}
