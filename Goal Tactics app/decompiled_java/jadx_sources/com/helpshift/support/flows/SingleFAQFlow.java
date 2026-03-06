package com.helpshift.support.flows;

import android.os.Bundle;
import com.helpshift.support.ApiConfig;
import com.helpshift.support.SupportInternal;
import com.helpshift.support.controllers.SupportController;
import com.helpshift.support.fragments.SingleQuestionFragment;
import com.helpshift.support.fragments.SupportFragment;
import com.helpshift.support.fragments.SupportFragmentConstants;
import com.helpshift.support.util.ConfigUtil;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class SingleFAQFlow implements Flow {
    private final HashMap config;
    private final String label;
    private final int labelResId;
    private final String questionPublishId;
    private SupportController supportController;

    public SingleFAQFlow(int i, String str) {
        this(i, str, new HashMap());
    }

    public SingleFAQFlow(int i, String str, Map map) {
        this.labelResId = i;
        this.questionPublishId = str;
        this.config = new HashMap(map);
        this.label = null;
    }

    public SingleFAQFlow(int i, String str, ApiConfig apiConfig) {
        this(i, str, ConfigUtil.validateAndConvertToMap(apiConfig));
    }

    public SingleFAQFlow(String str, String str2) {
        this(str, str2, new HashMap());
    }

    public SingleFAQFlow(String str, String str2, Map map) {
        this.label = str;
        this.questionPublishId = str2;
        this.config = new HashMap(map);
        this.labelResId = 0;
    }

    public SingleFAQFlow(String str, String str2, ApiConfig apiConfig) {
        this(str, str2, ConfigUtil.validateAndConvertToMap(apiConfig));
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
        Bundle bundleCleanConfig = SupportInternal.cleanConfig(SupportInternal.removeFAQFlowUnsupportedConfigs(this.config));
        bundleCleanConfig.putString(SingleQuestionFragment.BUNDLE_ARG_QUESTION_PUBLISH_ID, this.questionPublishId);
        bundleCleanConfig.putInt(SupportFragment.SUPPORT_MODE, 3);
        bundleCleanConfig.putBoolean(SupportFragmentConstants.DECOMPOSED, true);
        this.supportController.startFaqFlow(bundleCleanConfig, true, (List) this.config.get("customContactUsFlows"));
    }
}
