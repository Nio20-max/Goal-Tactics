package com.helpshift.support.flows;

import com.helpshift.support.ApiConfig;
import com.helpshift.support.SupportInternal;
import com.helpshift.support.controllers.SupportController;
import com.helpshift.support.util.ConfigUtil;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationFlow implements Flow {
    private final HashMap config;
    private final String label;
    private final int labelResId;
    private SupportController supportController;

    public ConversationFlow(int i) {
        this(i, new HashMap());
    }

    public ConversationFlow(int i, Map map) {
        this.labelResId = i;
        this.config = new HashMap(map);
        this.label = null;
    }

    public ConversationFlow(int i, ApiConfig apiConfig) {
        this(i, ConfigUtil.validateAndConvertToMap(apiConfig));
    }

    public ConversationFlow(String str) {
        this(str, new HashMap());
    }

    public ConversationFlow(String str, Map map) {
        this.label = str;
        this.config = new HashMap(map);
        this.labelResId = 0;
    }

    public ConversationFlow(String str, ApiConfig apiConfig) {
        this(str, ConfigUtil.validateAndConvertToMap(apiConfig));
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
        this.supportController.startConversationFlow(SupportInternal.cleanConfig(SupportInternal.removeShowConversationUnsupportedConfigs(this.config)), true);
    }
}
