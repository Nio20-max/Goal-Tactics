package com.helpshift.conversation.smartintent;

import java.io.Serializable;

/* JADX INFO: loaded from: classes2.dex */
public class SmartIntentSavedState implements Serializable {
    public final boolean isBottomSheetInExpandedState;
    public final boolean isSearchUIVisible;
    public final boolean isShowingTAI;
    public final Long selectedRootIntentLocalId;
    public final String userTypedQuery;

    public SmartIntentSavedState(boolean z, Long l, String str, boolean z2, boolean z3) {
        this.isBottomSheetInExpandedState = z;
        this.selectedRootIntentLocalId = l;
        this.userTypedQuery = str;
        this.isSearchUIVisible = z2;
        this.isShowingTAI = z3;
    }
}
