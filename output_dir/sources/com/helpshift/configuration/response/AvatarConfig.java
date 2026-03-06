package com.helpshift.configuration.response;

/* JADX INFO: loaded from: classes2.dex */
public class AvatarConfig {
    public final String agentFallbackImageUrl;
    public final String botFallbackImageUrl;
    public final long cacheExpiry;
    public final boolean isPersonalisedAgentEnabled;
    public final boolean isPersonalisedBotEnabled;
    public final boolean isShowAvatarInChatFeedEnabled;
    public final String systemMessageNickname;
    public final String templateUrl;

    public AvatarConfig(boolean z, boolean z2, String str, boolean z3, String str2, String str3, String str4, long j) {
        this.isShowAvatarInChatFeedEnabled = z;
        this.isPersonalisedAgentEnabled = z2;
        this.agentFallbackImageUrl = str;
        this.isPersonalisedBotEnabled = z3;
        this.botFallbackImageUrl = str2;
        this.systemMessageNickname = str3;
        this.templateUrl = str4;
        this.cacheExpiry = j;
    }
}
