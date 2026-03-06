package com.helpshift.xamarin.flows;

import com.helpshift.xamarin.support.HelpshiftAPIConfig;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class HelpshiftDynamicFormFlow implements Flow {
    private final List<Flow> flows;
    private final String label;

    @Override // com.helpshift.xamarin.flows.Flow
    public HelpshiftAPIConfig getApiConfig() {
        return null;
    }

    public HelpshiftDynamicFormFlow(String str, List<Flow> list) {
        this.label = str;
        this.flows = list;
    }

    @Override // com.helpshift.xamarin.flows.Flow
    public String getLabel() {
        return this.label;
    }

    public List<Flow> getFlows() {
        return this.flows;
    }
}
