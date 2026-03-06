package com.helpshift.support.contracts;

import java.util.ArrayList;

/* JADX INFO: loaded from: classes2.dex */
public interface SearchResultListener {
    void onQuestionSelected(String str, ArrayList<String> arrayList);

    void sendAnyway();
}
