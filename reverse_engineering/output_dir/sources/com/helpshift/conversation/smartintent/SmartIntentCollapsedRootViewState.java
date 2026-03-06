package com.helpshift.conversation.smartintent;

import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class SmartIntentCollapsedRootViewState extends BaseSmartIntentViewState {
    public final List<RootIntentUIModel> rootIntentUIModels;
    public final String typingBoxHint;

    public SmartIntentCollapsedRootViewState(String str, String str2, boolean z, List<RootIntentUIModel> list) {
        super(str, z);
        this.typingBoxHint = str2;
        this.rootIntentUIModels = list;
    }
}
