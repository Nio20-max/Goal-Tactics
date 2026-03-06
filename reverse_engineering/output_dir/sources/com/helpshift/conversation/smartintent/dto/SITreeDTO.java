package com.helpshift.conversation.smartintent.dto;

import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class SITreeDTO {
    public final String emptySearchDescription;
    public final String emptySearchTitle;
    public final boolean enforceIntentSelection;
    public long lastRefreshedAt;
    public Long localId;
    public final String promptTitle;
    public final List<SmartIntentDTO> rootIntents;
    public final String searchTitle;
    public final String serverId;
    public final String textInputHint;
    public final List<String> tokenDelimiter;
    public final int version;

    public SITreeDTO(String str, int i, String str2, String str3, String str4, String str5, String str6, boolean z, List<String> list, List<SmartIntentDTO> list2) {
        this.serverId = str;
        this.version = i;
        this.promptTitle = str2;
        this.textInputHint = str3;
        this.searchTitle = str4;
        this.emptySearchTitle = str5;
        this.emptySearchDescription = str6;
        this.enforceIntentSelection = z;
        this.tokenDelimiter = list;
        this.rootIntents = list2;
    }
}
