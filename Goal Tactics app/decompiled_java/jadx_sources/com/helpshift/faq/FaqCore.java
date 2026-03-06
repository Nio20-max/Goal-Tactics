package com.helpshift.faq;

import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public final class FaqCore {
    public final String body;
    public final List<String> categoryTags;
    public final int is_helpful;
    public final Boolean is_rtl;
    public final String language;
    public final String publish_id;
    public final String qId;
    public final String section_id;
    public final List<String> tags;
    public final String title;

    public FaqCore(String str, String str2, String str3, String str4, String str5, String str6, int i, Boolean bool, List<String> list, List<String> list2) {
        this.qId = str;
        this.publish_id = str2;
        this.language = str3;
        this.section_id = str4;
        this.title = str5;
        this.body = str6;
        this.is_helpful = i;
        this.is_rtl = bool;
        this.tags = list;
        this.categoryTags = list2;
    }
}
