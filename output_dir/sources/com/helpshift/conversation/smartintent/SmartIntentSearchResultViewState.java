package com.helpshift.conversation.smartintent;

import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class SmartIntentSearchResultViewState extends BaseSmartIntentViewState {
    public final String emptySearchDescription;
    public final List<SearchIntentUIModel> searchIntentUIModels;

    public SmartIntentSearchResultViewState(String str, String str2, boolean z, List<SearchIntentUIModel> list) {
        super(str, z);
        this.emptySearchDescription = str2;
        this.searchIntentUIModels = list;
    }
}
