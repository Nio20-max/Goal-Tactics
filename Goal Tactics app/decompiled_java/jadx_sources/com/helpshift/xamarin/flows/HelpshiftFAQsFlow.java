package com.helpshift.xamarin.flows;

import com.helpshift.xamarin.support.HelpshiftAPIConfig;

/* JADX INFO: loaded from: classes2.dex */
public class HelpshiftFAQsFlow implements Flow {
    private final HelpshiftAPIConfig config;
    private final String label;

    public HelpshiftFAQsFlow(String str, HelpshiftAPIConfig helpshiftAPIConfig) {
        this.label = str;
        this.config = helpshiftAPIConfig;
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
