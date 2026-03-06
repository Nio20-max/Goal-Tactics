package com.helpshift.conversation.smartintent.dto;

import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class SmartIntentDTO {
    public List<SmartIntentDTO> children;
    public final String label;
    public Long localId;
    public final String parentServerId;
    public final String serverId;

    public SmartIntentDTO(String str, String str2, String str3, List<SmartIntentDTO> list) {
        this.label = str;
        this.serverId = str2;
        this.parentServerId = str3;
        this.children = list;
    }
}
