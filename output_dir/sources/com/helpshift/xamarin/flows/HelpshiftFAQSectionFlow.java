package com.helpshift.xamarin.flows;

import com.helpshift.xamarin.support.HelpshiftAPIConfig;

/* JADX INFO: loaded from: classes2.dex */
public class HelpshiftFAQSectionFlow implements Flow {
    private final HelpshiftAPIConfig config;
    private final String label;
    private final String sectionPublishId;

    public HelpshiftFAQSectionFlow(String str, String str2, HelpshiftAPIConfig helpshiftAPIConfig) {
        this.sectionPublishId = str;
        this.label = str2;
        this.config = helpshiftAPIConfig;
    }

    public String getSectionPublishId() {
        return this.sectionPublishId;
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
