package com.helpshift.conversation.dto;

import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public enum IssueState {
    NEW(0),
    NEW_FOR_AGENT(1),
    AGENT_REPLIED(2),
    WAITING_FOR_AGENT(3),
    RESOLUTION_REQUESTED(4),
    REJECTED(5),
    PENDING_REASSIGNMENT(6),
    COMPLETED_ISSUE_CREATED(7),
    RESOLUTION_ACCEPTED(101),
    RESOLUTION_REJECTED(102),
    ARCHIVED(103),
    AUTHOR_MISMATCH(104),
    RESOLUTION_EXPIRED(105),
    CLOSED(106),
    UNKNOWN(-1);

    private static final Map<Integer, IssueState> map = new HashMap();
    private final int value;

    IssueState(int i) {
        this.value = i;
    }

    public static IssueState fromInt(int i) {
        if (map.size() == 0) {
            for (IssueState issueState : values()) {
                map.put(Integer.valueOf(issueState.value), issueState);
            }
        }
        IssueState issueState2 = map.get(Integer.valueOf(i));
        return issueState2 == null ? UNKNOWN : issueState2;
    }

    public int getValue() {
        return this.value;
    }
}
