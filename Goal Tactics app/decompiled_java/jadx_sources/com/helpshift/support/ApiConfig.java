package com.helpshift.support;

import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.support.Support;
import com.helpshift.support.flows.Flow;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class ApiConfig {
    private final String conversationPrefillText;
    private final List<Flow> customContactUsFlows;
    private final Map<String, String[]> customIssueFields;
    private final Metadata customMetadata;
    private final Integer enableContactUs;
    private final boolean enableFullPrivacy;
    private final boolean enableTypingIndicator;
    private final Map<String, Object> extras;
    private final boolean gotoConversationAfterContactUs;
    private final boolean hideNameAndEmail;
    private final boolean requireEmail;
    private final boolean showConversationInfoScreen;
    private final boolean showConversationResolutionQuestion;
    private final boolean showSearchOnNewConversation;
    private final int toolbarId;
    private final FaqTagFilter withTagsMatching;

    ApiConfig(Integer num, boolean z, boolean z2, boolean z3, String str, boolean z4, boolean z5, boolean z6, List<Flow> list, FaqTagFilter faqTagFilter, Metadata metadata, int i, boolean z7, boolean z8, Map<String, String[]> map, Map<String, Object> map2) {
        this.enableContactUs = num;
        this.gotoConversationAfterContactUs = z;
        this.requireEmail = z2;
        this.hideNameAndEmail = z3;
        this.conversationPrefillText = str;
        this.enableFullPrivacy = z4;
        this.showSearchOnNewConversation = z5;
        this.showConversationResolutionQuestion = z6;
        this.customContactUsFlows = list;
        this.withTagsMatching = faqTagFilter;
        this.customMetadata = metadata;
        this.toolbarId = i;
        this.showConversationInfoScreen = z7;
        this.enableTypingIndicator = z8;
        this.customIssueFields = map;
        this.extras = map2;
    }

    public Map<String, Object> toMap() {
        Map<String, Object> map;
        HashMap map2 = new HashMap();
        map2.put(SDKConfigurationDM.ENABLE_CONTACT_US, this.enableContactUs);
        map2.put(SDKConfigurationDM.GOTO_CONVERSATION_AFTER_CONTACT_US, Boolean.valueOf(this.gotoConversationAfterContactUs));
        map2.put(SDKConfigurationDM.REQUIRE_EMAIL, Boolean.valueOf(this.requireEmail));
        map2.put(SDKConfigurationDM.HIDE_NAME_AND_EMAIL, Boolean.valueOf(this.hideNameAndEmail));
        map2.put("enableFullPrivacy", Boolean.valueOf(this.enableFullPrivacy));
        map2.put(SDKConfigurationDM.SHOW_SEARCH_ON_NEW_CONVERSATION, Boolean.valueOf(this.showSearchOnNewConversation));
        map2.put(SDKConfigurationDM.SHOW_CONVERSATION_RESOLUTION_QUESTION_API, Boolean.valueOf(this.showConversationResolutionQuestion));
        map2.put(SDKConfigurationDM.SHOW_CONVERSATION_INFO_SCREEN, Boolean.valueOf(this.showConversationInfoScreen));
        map2.put(SDKConfigurationDM.ENABLE_TYPING_INDICATOR, Boolean.valueOf(this.enableTypingIndicator));
        String str = this.conversationPrefillText;
        if (str != null && str.length() > 0) {
            map2.put(SDKConfigurationDM.CONVERSATION_PRE_FILL_TEXT, this.conversationPrefillText);
        }
        List<Flow> list = this.customContactUsFlows;
        if (list != null) {
            map2.put("customContactUsFlows", list);
        }
        FaqTagFilter faqTagFilter = this.withTagsMatching;
        if (faqTagFilter != null && (map = faqTagFilter.toMap()) != null) {
            map2.put("withTagsMatching", map);
        }
        Metadata metadata = this.customMetadata;
        if (metadata != null) {
            Map<String, Object> map3 = metadata.toMap();
            if (map3.size() > 0) {
                map2.put("hs-custom-metadata", map3);
            }
        }
        Map<String, String[]> map4 = this.customIssueFields;
        if (map4 != null) {
            map2.put(Support.CustomIssueFieldKey, map4);
        }
        int i = this.toolbarId;
        if (i != 0) {
            map2.put("toolbarId", Integer.valueOf(i));
        }
        Map<String, Object> map5 = this.extras;
        if (map5 != null) {
            for (String str2 : map5.keySet()) {
                if (this.extras.get(str2) != null) {
                    map2.put(str2, this.extras.get(str2));
                }
            }
        }
        return map2;
    }

    public static class Builder {
        private String conversationPrefillText;
        private List<Flow> customContactUsFlows;
        private Map<String, String[]> customIssueFields;
        private Metadata customMetadata;
        private Map<String, Object> extras;
        private int toolbarId;
        private FaqTagFilter withTagsMatching;
        private Integer enableContactUs = Support.EnableContactUs.ALWAYS;
        private boolean gotoConversationAfterContactUs = false;
        private boolean requireEmail = false;
        private boolean hideNameAndEmail = false;
        private boolean enableFullPrivacy = false;
        private boolean showSearchOnNewConversation = false;
        private boolean showConversationResolutionQuestion = false;
        private boolean showConversationInfoScreen = false;
        private boolean isGotoConversationAfterContactUsSet = false;
        private boolean enableTypingIndicator = false;

        public Builder setEnableContactUs(Integer num) {
            if (num != null && Support.EnableContactUs.valueSet.contains(num)) {
                this.enableContactUs = num;
            }
            return this;
        }

        @Deprecated
        public Builder setGotoConversationAfterContactUs(boolean z) {
            this.gotoConversationAfterContactUs = z;
            this.isGotoConversationAfterContactUsSet = true;
            return this;
        }

        @Deprecated
        public Builder setRequireEmail(boolean z) {
            this.requireEmail = z;
            return this;
        }

        @Deprecated
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

        @Deprecated
        public Builder setShowSearchOnNewConversation(boolean z) {
            this.showSearchOnNewConversation = z;
            return this;
        }

        @Deprecated
        public Builder setShowConversationResolutionQuestion(boolean z) {
            this.showConversationResolutionQuestion = z;
            return this;
        }

        public Builder setCustomContactUsFlows(List<Flow> list) {
            this.customContactUsFlows = list;
            return this;
        }

        public Builder setWithTagsMatching(FaqTagFilter faqTagFilter) {
            this.withTagsMatching = faqTagFilter;
            return this;
        }

        public Builder setCustomMetadata(Metadata metadata) {
            this.customMetadata = metadata;
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

        @Deprecated
        public Builder setEnableTypingIndicator(boolean z) {
            this.enableTypingIndicator = z;
            return this;
        }

        public Builder setCustomIssueFields(Map<String, String[]> map) {
            this.customIssueFields = map;
            return this;
        }

        public Builder setExtras(Map<String, Object> map) {
            this.extras = map;
            return this;
        }

        public ApiConfig build() {
            return new ApiConfig(this.enableContactUs, this.gotoConversationAfterContactUs, this.requireEmail, this.hideNameAndEmail, this.conversationPrefillText, this.enableFullPrivacy, this.showSearchOnNewConversation, this.showConversationResolutionQuestion, this.customContactUsFlows, this.withTagsMatching, this.customMetadata, this.toolbarId, this.showConversationInfoScreen, this.enableTypingIndicator, this.customIssueFields, this.extras);
        }
    }
}
