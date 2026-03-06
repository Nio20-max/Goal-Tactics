package com.helpshift.configuration.response;

import java.util.ArrayList;

/* JADX INFO: loaded from: classes2.dex */
public class RootServerConfig {
    public final boolean activelySyncAppLaunchEvent;
    public final boolean allowUserAttachments;
    public final boolean autoFillFirstPreissueMessage;
    public final AvatarConfig avatarConfig;
    public final int breadcrumbLimit;
    public final String conversationGreetingMessage;
    public final String conversationHeaderImageUrl;
    public final String conversationHeaderTitleText;
    public final boolean conversationalIssueFiling;
    public final boolean customerSatisfactionSurvey;
    public final int debugLogLimit;
    public final boolean disableHelpshiftBranding;
    public final boolean disableInAppConversation;
    public final boolean enableTypingIndicator;
    public final boolean isShowConversationHeaderEnabled;
    public final boolean isSmartIntentEnabled;
    public final boolean issueExists;
    public final Long lastRedactionAt;
    public final int logLevel;
    public final long periodicFetchInterval;
    public final PeriodicReview periodicReview;
    public final long periodicSyncAppLaunchEventInterval;
    public final long preissueResetInterval;
    public final Long profileCreatedAt;
    public final boolean profileFormEnable;
    public final boolean requireNameAndEmail;
    public final String reviewUrl;
    public final boolean shouldShowConversationHistory;
    public final boolean showConversationResolutionQuestion;
    public final Long smartIntentClientCacheInterval;
    public final Long smartIntentSearchModelRefreshInterval;
    public final Long smartIntentTreeRefreshInterval;
    public final ArrayList<ArrayList<String>> whiteListedAttachments;

    public RootServerConfig(boolean z, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6, int i, int i2, String str, PeriodicReview periodicReview, boolean z7, String str2, boolean z8, boolean z9, boolean z10, Long l, Long l2, boolean z11, long j, long j2, boolean z12, boolean z13, Long l3, Long l4, Long l5, ArrayList<ArrayList<String>> arrayList, int i3, boolean z14, String str3, String str4, AvatarConfig avatarConfig, boolean z15, long j3) {
        this.requireNameAndEmail = z;
        this.profileFormEnable = z2;
        this.customerSatisfactionSurvey = z3;
        this.disableInAppConversation = z4;
        this.disableHelpshiftBranding = z5;
        this.issueExists = z6;
        this.debugLogLimit = i;
        this.breadcrumbLimit = i2;
        this.reviewUrl = str;
        this.periodicReview = periodicReview;
        this.conversationalIssueFiling = z7;
        this.conversationGreetingMessage = str2;
        this.enableTypingIndicator = z8;
        this.showConversationResolutionQuestion = z9;
        this.shouldShowConversationHistory = z10;
        this.lastRedactionAt = l;
        this.profileCreatedAt = l2;
        this.allowUserAttachments = z11;
        this.periodicFetchInterval = j;
        this.preissueResetInterval = j2;
        this.autoFillFirstPreissueMessage = z12;
        this.isSmartIntentEnabled = z13;
        this.smartIntentSearchModelRefreshInterval = l3;
        this.smartIntentTreeRefreshInterval = l4;
        this.smartIntentClientCacheInterval = l5;
        this.whiteListedAttachments = arrayList;
        this.logLevel = i3;
        this.isShowConversationHeaderEnabled = z14;
        this.conversationHeaderTitleText = str3;
        this.conversationHeaderImageUrl = str4;
        this.avatarConfig = avatarConfig;
        this.activelySyncAppLaunchEvent = z15;
        this.periodicSyncAppLaunchEventInterval = j3;
    }
}
