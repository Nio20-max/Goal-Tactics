package com.helpshift.support.flows;

import com.helpshift.support.controllers.SupportController;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class DynamicFormFlow implements Flow {
    private final List<Flow> flowList;
    private final String label;
    private final int labelResId;
    private SupportController supportController;

    public DynamicFormFlow(int i, List<Flow> list) {
        this.labelResId = i;
        this.flowList = list;
        this.label = null;
    }

    public DynamicFormFlow(String str, List<Flow> list) {
        this.label = str;
        this.flowList = list;
        this.labelResId = 0;
    }

    public void setSupportController(SupportController supportController) {
        this.supportController = supportController;
    }

    @Override // com.helpshift.support.flows.Flow
    public int getLabelResId() {
        return this.labelResId;
    }

    @Override // com.helpshift.support.flows.Flow
    public String getLabel() {
        return this.label;
    }

    @Override // com.helpshift.support.flows.Flow
    public void performAction() {
        int i = this.labelResId;
        if (i != 0) {
            this.supportController.startDynamicForm(i, this.flowList, true);
        } else {
            this.supportController.startDynamicForm(this.label, this.flowList, true);
        }
    }
}
