package com.helpshift.xamarin.support;

import com.helpshift.xamarin.flows.Flow;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class HelpshiftAPIConfig {
    public final String conversationPrefillText;
    public final List<Flow> customContactUsFlows;
    public final String customIssueFieldsJson;
    public final HelpshiftSupportMetadata customMetadata;
    public final HsEnableContactUs enableContactUs;
    public final boolean enableFullPrivacy;
    public final boolean enableTypingIndicator;
    public final String extrasJson;
    public final boolean gotoConversationAfterContactUs;
    public final boolean hideNameAndEmail;
    public final boolean requireEmail;
    public final boolean showConversationInfoScreen;
    public final boolean showConversationResolutionQuestion;
    public final boolean showSearchOnNewConversation;
    public final int toolbarId;
    public final HelpshiftFAQFilter withTagsMatching;

    HelpshiftAPIConfig(HsEnableContactUs hsEnableContactUs, boolean z, boolean z2, boolean z3, String str, boolean z4, boolean z5, boolean z6, List<Flow> list, HelpshiftFAQFilter helpshiftFAQFilter, HelpshiftSupportMetadata helpshiftSupportMetadata, int i, boolean z7, boolean z8, String str2, String str3) {
        this.enableContactUs = hsEnableContactUs;
        this.gotoConversationAfterContactUs = z;
        this.requireEmail = z2;
        this.hideNameAndEmail = z3;
        this.conversationPrefillText = str;
        this.enableFullPrivacy = z4;
        this.showSearchOnNewConversation = z5;
        this.showConversationResolutionQuestion = z6;
        this.customContactUsFlows = list;
        this.withTagsMatching = helpshiftFAQFilter;
        this.customMetadata = helpshiftSupportMetadata;
        this.toolbarId = i;
        this.showConversationInfoScreen = z7;
        this.enableTypingIndicator = z8;
        this.customIssueFieldsJson = str2;
        this.extrasJson = str3;
    }

    public static class Builder {
        private String conversationPrefillText;
        private List<Flow> customContactUsFlows;
        private String customIssueFieldsJson;
        private HelpshiftSupportMetadata customMetadata;
        private HsEnableContactUs enableContactUs;
        private boolean enableFullPrivacy;
        private boolean enableTypingIndicator;
        private String extrasJson;
        private boolean gotoConversationAfterContactUs;
        private boolean hideNameAndEmail;
        private boolean requireEmail;
        private boolean showConversationInfoScreen;
        private boolean showConversationResolutionQuestion;
        private boolean showSearchOnNewConversation;
        private int toolbarId;
        private HelpshiftFAQFilter withTagsMatching;

        public Builder setEnableContactUs(HsEnableContactUs hsEnableContactUs) {
            this.enableContactUs = hsEnableContactUs;
            return this;
        }

        public Builder setGotoConversationAfterContactUs(boolean z) {
            this.gotoConversationAfterContactUs = z;
            return this;
        }

        public Builder setRequireEmail(boolean z) {
            this.requireEmail = z;
            return this;
        }

        public Builder setHideNameAndEmail(boolean z) {
            this.hideNameAndEmail = z;
            return this;
        }

        public Builder setConversationPrefillText(String str) {
            this.conversationPrefillText = str;
            return this;
        }

        public Builder setEnableFullPrivacy(boolean z) {
            this.enableFullPrivacy = z;
            return this;
        }

        public Builder setShowSearchOnNewConversation(boolean z) {
            this.showSearchOnNewConversation = z;
            return this;
        }

        public Builder setShowConversationResolutionQuestion(boolean z) {
            this.showConversationResolutionQuestion = z;
            return this;
        }

        public Builder setCustomContactUsFlows(List<Flow> list) {
            this.customContactUsFlows = list;
            return this;
        }

        public Builder setWithTagsMatching(HelpshiftFAQFilter helpshiftFAQFilter) {
            this.withTagsMatching = helpshiftFAQFilter;
            return this;
        }

        public Builder setCustomMetadata(HelpshiftSupportMetadata helpshiftSupportMetadata) {
            this.customMetadata = helpshiftSupportMetadata;
            return this;
        }

        public Builder setToolbarId(int i) {
            this.toolbarId = i;
            return this;
        }

        public Builder setShowConversationInfoScreen(boolean z) {
            this.showConversationInfoScreen = z;
            return this;
        }

        public Builder setEnableTypingIndicator(boolean z) {
            this.enableTypingIndicator = z;
            return this;
        }

        public Builder setCustomIssueFieldsJson(String str) {
            this.customIssueFieldsJson = str;
            return this;
        }

        public Builder setExtrasJson(String str) {
            this.extrasJson = str;
            return this;
        }

        public HelpshiftAPIConfig build() {
            return new HelpshiftAPIConfig(this.enableContactUs, this.gotoConversationAfterContactUs, this.requireEmail, this.hideNameAndEmail, this.conversationPrefillText, this.enableFullPrivacy, this.showSearchOnNewConversation, this.showConversationResolutionQuestion, this.customContactUsFlows, this.withTagsMatching, this.customMetadata, this.toolbarId, this.showConversationInfoScreen, this.enableTypingIndicator, this.customIssueFieldsJson, this.extrasJson);
        }
    }
}
