package com.helpshift.support.flows;

import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class DynamicFormFlowListHolder {
    private static List<Flow> flowList;

    private DynamicFormFlowListHolder() {
    }

    public static List<Flow> getFlowList() {
        return flowList;
    }

    public static void setFlowList(List<Flow> list) {
        flowList = list;
    }
}
