package com.helpshift.faq.dao;

import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public interface FaqEventDAO {
    Map<String, Boolean> getUnSentFaqMarkHelpfulEvents();

    void insertFaqMarkHelpfulEvent(String str, boolean z);

    void removeFaqMarkHelpfulEvent(String str);
}
