package com.helpshift.conversation.dao;

/* JADX INFO: loaded from: classes2.dex */
public interface FAQSuggestionsDAO {
    Object getFAQ(String str, String str2);

    void insertOrUpdateFAQ(Object obj);

    void removeFAQ(String str, String str2);
}
