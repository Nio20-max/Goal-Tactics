package com.helpshift.xamarin.flows;

import com.helpshift.xamarin.support.HelpshiftAPIConfig;

/* JADX INFO: loaded from: classes2.dex */
public class HelpshiftSingleFaqFlow implements Flow {
    private final HelpshiftAPIConfig config;
    private final String faqPublishId;
    private final String label;

    public HelpshiftSingleFaqFlow(String str, String str2, HelpshiftAPIConfig helpshiftAPIConfig) {
        this.faqPublishId = str;
        this.label = str2;
        this.config = helpshiftAPIConfig;
    }

    public String getFaqPublishId() {
        return this.faqPublishId;
    }

    @Override // com.helpshift.xamarin.flows.Flow
    public String getLabel() {
        return this.label;
    }

    @Override // com.helpshift.xamarin.flows.Flow
    public HelpshiftAPIConfig getApiConfig() {
        return this.config;
    }
}
