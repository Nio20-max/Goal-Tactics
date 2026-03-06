package com.helpshift.conversation.smartintent;

import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class SmartIntentLeafViewState extends BaseSmartIntentViewState {
    public final List<LeafIntentUIModel> leafIntentUIModels;
    public final long parentIntentId;
    public final String typingBoxHint;

    public SmartIntentLeafViewState(String str, String str2, boolean z, long j, List<LeafIntentUIModel> list) {
        super(str, z);
        this.typingBoxHint = str2;
        this.parentIntentId = j;
        this.leafIntentUIModels = list;
    }
}
