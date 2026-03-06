package com.helpshift.configuration.domainmodel;

import com.facebook.AuthenticationTokenClaims;
import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.account.domainmodel.UserManagerDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.network.NetworkConstants;
import com.helpshift.common.platform.KVStore;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.platform.network.ResponseParser;
import com.helpshift.configuration.dto.RootApiConfig;
import com.helpshift.configuration.dto.RootInstallConfig;
import com.helpshift.configuration.response.AvatarConfig;
import com.helpshift.configuration.response.PeriodicReview;
import com.helpshift.configuration.response.RootServerConfig;
import com.helpshift.conversation.activeconversation.message.AvatarImageDownloader;
import com.helpshift.logger.constants.LogLevel;
import com.helpshift.util.AttachmentConstants;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import java.io.Serializable;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class SDKConfigurationDM {
    public static final String ACTIVELY_SYNC_APP_LAUNCH_EVENT = "activelySyncAppLaunchEvent";
    public static final String AGENT_FALLBACK_IMAGE_LOCAL_PATH = "agentFallbackImageLocalPath";
    public static final String AGENT_FALLBACK_IMAGE_URL = "agentFallbackImageUrl";
    public static final String ALLOW_USER_ATTACHMENTS = "allowUserAttachments";
    public static final String API_KEY = "apiKey";
    public static final String APP_REVIEWED = "app_reviewed";
    public static final String AUTO_FILL_FIRST_PREISSUE_MESSAGE = "autoFillFirstPreIssueMessage";
    public static final String AVATAR_CACHE_EXPIRY = "avatarCacheExpiry";
    private static final long AVATAR_IMAGE_CACHE_DEFAULT_INTERVAL = 14400000;
    public static final String AVATAR_IMAGE_LOCAL_PATH = "avatar_image_local_path";
    public static final String AVATAR_IMAGE_TEMPLATE_URL = "avatarTemplateUrl";
    public static final String AVATAR_IMAGE_URL = "avatar_image_url";
    public static final String BOT_FALLBACK_IMAGE_LOCAL_PATH = "botFallbackImageLocalPath";
    public static final String BOT_FALLBACK_IMAGE_URL = "botFallbackImageUrl";
    public static final String BREADCRUMB_LIMIT = "breadcrumbLimit";
    public static final String CONVERSATIONAL_ISSUE_FILING = "conversationalIssueFiling";
    public static final String CONVERSATION_GREETING_MESSAGE = "conversationGreetingMessage";
    public static final String CONVERSATION_PRE_FILL_TEXT = "conversationPrefillText";
    public static final String CUSTOMER_SATISFACTION_SURVEY = "customerSatisfactionSurvey";
    public static final String DEBUG_LOG_LIMIT = "debugLogLimit";
    public static final String DEFAULT_FALLBACK_LANGUAGE_ENABLE = "defaultFallbackLanguageEnable";
    public static final String DISABLE_ANIMATION = "disableAnimations";
    public static final String DISABLE_APP_LAUNCH_EVENT = "disableAppLaunchEvent";
    public static final String DISABLE_ERROR_LOGGING = "disableErrorLogging";
    public static final String DISABLE_IN_APP_CONVERSATION = "disableInAppConversation";
    public static final String DOMAIN_NAME = "domainName";
    public static final String ENABLE_CONTACT_US = "enableContactUs";
    public static final String ENABLE_DEFAULT_CONVERSATIONAL_FILING = "enableDefaultConversationalFiling";
    public static final String ENABLE_FULL_PRIVACY = "fullPrivacy";
    public static final String ENABLE_IN_APP_NOTIFICATION = "enableInAppNotification";
    public static final String ENABLE_TYPING_INDICATOR = "enableTypingIndicator";
    public static final String ENABLE_TYPING_INDICATOR_AGENT = "enableTypingIndicatorAgent";
    public static final String FONT_PATH = "fontPath";
    public static final String GOTO_CONVERSATION_AFTER_CONTACT_US = "gotoConversationAfterContactUs";
    public static final String HEADER_IMAGE_LOCAL_PATH = "headerImageLocalPath";
    public static final String HEADER_IMAGE_URL = "headerImageUrl";
    public static final String HEADER_TITLE_TEXT = "headerText";
    public static final String HELPSHIFT_BRANDING_DISABLE_AGENT = "disableHelpshiftBrandingAgent";
    public static final String HELPSHIFT_BRANDING_DISABLE_INSTALL = "disableHelpshiftBranding";
    public static final String HIDE_NAME_AND_EMAIL = "hideNameAndEmail";
    public static final String INBOX_POLLING_ENABLE = "inboxPollingEnable";
    public static final String INITIAL_USER_MESSAGE_TO_AUTOSEND_IN_PREISSUE = "initialUserMessageToAutoSendInPreissue";
    public static final String IS_AVATAR_ENABLED_IN_CHAT_FEED = "showAvatarEnabled";
    public static final String IS_CUSTOM_HEADER_ENABLED = "showHeaderEnabled";
    public static final String IS_PERSONALISED_CONVERSATION_ENABLED = "personalisedConversationEnabled";
    public static final String IS_SMART_INTENT_ENABLED = "smartIntentEnabled";
    public static final String LAST_SUCCESSFUL_APP_LAUNCH_EVENT_SYNC_TIME = "lastSuccessfulAppLaunchEventTime";
    public static final String LAST_SUCCESSFUL_CONFIG_FETCH_TIME = "lastSuccessfulConfigFetchTime";
    private static final Long MINIMUM_PERIODIC_FETCH_INTERVAL = 60L;
    private static final Long MINIMUM_PREISSUE_RESET_INTERVAL = 43200L;
    public static final String NOTIFICATION_ICON_ID = "notificationIconId";
    public static final String NOTIFICATION_LARGE_ICON_ID = "notificationLargeIconId";
    public static final String NOTIFICATION_MUTE_ENABLE = "notificationMute";
    public static final String NOTIFICATION_SOUND_ID = "notificationSoundId";
    public static final String PERIODIC_FETCH_INTERVAL = "periodicFetchInterval";
    public static final String PERIODIC_REVIEW_ENABLED = "periodicReviewEnabled";
    public static final String PERIODIC_REVIEW_INTERVAL = "periodicReviewInterval";
    public static final String PERIODIC_REVIEW_TYPE = "periodicReviewType";
    public static final String PERIODIC_SYNC_APP_LAUNCH_EVENT_INTERVAL = "periodicSyncAppLaunchEventInterval";
    public static final String PLATFORM_ID = "platformId";
    public static final String PLUGIN_VERSION = "pluginVersion";
    public static final String PREISSUE_RESET_INTERVAL = "preissueResetInterval";
    public static final String PROFILE_FORM_ENABLE = "profileFormEnable";
    public static final String REQUIRED_LOG_LEVEL_FOR_REPORTING = "logLevelForReporting";
    public static final String REQUIRE_EMAIL = "requireEmail";
    public static final String REQUIRE_NAME_AND_EMAIL = "requireNameAndEmail";
    public static final String REVIEW_URL = "reviewUrl";
    public static final String RUNTIME_VERSION = "runtimeVersion";
    public static final String SDK_LANGUAGE = "sdkLanguage";
    public static final String SDK_TYPE = "sdkType";
    public static final String SHOULD_SHOW_CONVERSATION_HISTORY_AGENT = "showConversationHistoryAgent";
    public static final String SHOW_CONVERSATION_INFO_SCREEN = "showConversationInfoScreen";
    public static final String SHOW_CONVERSATION_RESOLUTION_QUESTION_AGENT = "showConversationResolutionQuestionAgent";
    public static final String SHOW_CONVERSATION_RESOLUTION_QUESTION_API = "showConversationResolutionQuestion";
    public static final String SHOW_PERSONALIZED_AGENT_AVATAR = "personalizedAgent";
    public static final String SHOW_PERSONALIZED_BOT_AVATAR = "personalizedBot";
    public static final String SHOW_SEARCH_ON_NEW_CONVERSATION = "showSearchOnNewConversation";
    private static final long SMART_INTENT_CLIENT_CACHE_DEFAULT_INTERVAL = 259200000;
    public static final String SMART_INTENT_CLIENT_CACHE_INTERVAL = "smartIntentClientCache";
    private static final long SMART_INTENT_MODEL_REFRESH_DEFAULT_INTERVAL = 600000;
    public static final String SMART_INTENT_MODEL_REFRESH_INTERVAL = "smartIntentModelSLA";
    private static final long SMART_INTENT_TREE_REFRESH_DEFAULT_INTERVAL = 600000;
    public static final String SMART_INTENT_TREE_REFRESH_INTERVAL = "smartIntentTreeSLA";
    public static final String SUPPORT_NOTIFICATION_CHANNEL_ID = "supportNotificationChannelId";
    public static final String SYSTEM_MESSAGE_NICKNAME = "systemMessageNickname";
    private static final String TAG = "Helpshift_SDKConfigDM";
    public static final String WHITELISTED_ATTACHMENT = "whiteListedAttachment";
    private final Domain domain;
    private final KVStore kvStore;
    private final Platform platform;
    private final ResponseParser responseParser;

    public SDKConfigurationDM(Domain domain, Platform platform) {
        this.domain = domain;
        this.platform = platform;
        this.responseParser = platform.getResponseParser();
        this.kvStore = platform.getKVStore();
    }

    public void updateUserConfig(UserDM userDM, RootServerConfig rootServerConfig, UserManagerDM userManagerDM) {
        userManagerDM.updateIssueExists(userDM, rootServerConfig.issueExists);
    }

    public void updateServerConfig(RootServerConfig rootServerConfig) {
        boolean z;
        boolean z2;
        HashMap map = new HashMap();
        map.put(REQUIRE_NAME_AND_EMAIL, Boolean.valueOf(rootServerConfig.requireNameAndEmail));
        map.put(PROFILE_FORM_ENABLE, Boolean.valueOf(rootServerConfig.profileFormEnable));
        map.put(CUSTOMER_SATISFACTION_SURVEY, Boolean.valueOf(rootServerConfig.customerSatisfactionSurvey));
        map.put(DISABLE_IN_APP_CONVERSATION, Boolean.valueOf(rootServerConfig.disableInAppConversation));
        map.put(HELPSHIFT_BRANDING_DISABLE_AGENT, Boolean.valueOf(rootServerConfig.disableHelpshiftBranding));
        map.put(DEBUG_LOG_LIMIT, Integer.valueOf(rootServerConfig.debugLogLimit));
        map.put(BREADCRUMB_LIMIT, Integer.valueOf(rootServerConfig.breadcrumbLimit));
        map.put(REVIEW_URL, rootServerConfig.reviewUrl);
        PeriodicReview periodicReview = rootServerConfig.periodicReview;
        boolean z3 = false;
        if (periodicReview == null) {
            periodicReview = new PeriodicReview(false, 0, null);
        }
        map.put(PERIODIC_REVIEW_ENABLED, Boolean.valueOf(periodicReview.isEnabled));
        map.put(PERIODIC_REVIEW_INTERVAL, Integer.valueOf(periodicReview.interval));
        map.put(PERIODIC_REVIEW_TYPE, periodicReview.type);
        map.put(CONVERSATION_GREETING_MESSAGE, rootServerConfig.conversationGreetingMessage);
        map.put(CONVERSATIONAL_ISSUE_FILING, Boolean.valueOf(rootServerConfig.conversationalIssueFiling));
        map.put(ENABLE_TYPING_INDICATOR_AGENT, Boolean.valueOf(rootServerConfig.enableTypingIndicator));
        map.put(SHOW_CONVERSATION_RESOLUTION_QUESTION_AGENT, Boolean.valueOf(rootServerConfig.showConversationResolutionQuestion));
        map.put(SHOULD_SHOW_CONVERSATION_HISTORY_AGENT, Boolean.valueOf(rootServerConfig.shouldShowConversationHistory));
        map.put(ALLOW_USER_ATTACHMENTS, Boolean.valueOf(rootServerConfig.allowUserAttachments));
        map.put(PERIODIC_FETCH_INTERVAL, Long.valueOf(rootServerConfig.periodicFetchInterval));
        map.put(PREISSUE_RESET_INTERVAL, Long.valueOf(rootServerConfig.preissueResetInterval));
        map.put(AUTO_FILL_FIRST_PREISSUE_MESSAGE, Boolean.valueOf(rootServerConfig.autoFillFirstPreissueMessage));
        map.put(IS_SMART_INTENT_ENABLED, Boolean.valueOf(rootServerConfig.isSmartIntentEnabled));
        map.put(SMART_INTENT_MODEL_REFRESH_INTERVAL, rootServerConfig.smartIntentSearchModelRefreshInterval);
        map.put(SMART_INTENT_TREE_REFRESH_INTERVAL, rootServerConfig.smartIntentTreeRefreshInterval);
        map.put(SMART_INTENT_CLIENT_CACHE_INTERVAL, rootServerConfig.smartIntentClientCacheInterval);
        map.put(WHITELISTED_ATTACHMENT, rootServerConfig.whiteListedAttachments);
        map.put(REQUIRED_LOG_LEVEL_FOR_REPORTING, Integer.valueOf(rootServerConfig.logLevel));
        map.put(ACTIVELY_SYNC_APP_LAUNCH_EVENT, Boolean.valueOf(rootServerConfig.activelySyncAppLaunchEvent));
        map.put(PERIODIC_SYNC_APP_LAUNCH_EVENT_INTERVAL, Long.valueOf(rootServerConfig.periodicSyncAppLaunchEventInterval));
        AvatarConfig avatarConfig = rootServerConfig.avatarConfig;
        boolean z4 = avatarConfig != null;
        if (avatarConfig == null) {
            avatarConfig = new AvatarConfig(false, false, "", false, "", "", "", 0L);
        }
        if (avatarConfig.isShowAvatarInChatFeedEnabled) {
            z3 = !rootServerConfig.conversationHeaderImageUrl.equals(getConversationHeaderImageUrl());
            z = !avatarConfig.botFallbackImageUrl.equals(getBotFallbackImageUrl());
            z2 = !avatarConfig.agentFallbackImageUrl.equals(getAgentFallbackImageUrl());
        } else {
            z = false;
            z2 = false;
        }
        if (rootServerConfig.isShowConversationHeaderEnabled) {
            z3 = !rootServerConfig.conversationHeaderImageUrl.equals(getConversationHeaderImageUrl());
        }
        map.put(IS_PERSONALISED_CONVERSATION_ENABLED, Boolean.valueOf(z4));
        map.put(IS_CUSTOM_HEADER_ENABLED, Boolean.valueOf(rootServerConfig.isShowConversationHeaderEnabled));
        map.put(IS_AVATAR_ENABLED_IN_CHAT_FEED, Boolean.valueOf(avatarConfig.isShowAvatarInChatFeedEnabled));
        map.put(HEADER_TITLE_TEXT, rootServerConfig.conversationHeaderTitleText);
        map.put(HEADER_IMAGE_URL, rootServerConfig.conversationHeaderImageUrl);
        map.put(SHOW_PERSONALIZED_AGENT_AVATAR, Boolean.valueOf(avatarConfig.isPersonalisedAgentEnabled));
        map.put(AGENT_FALLBACK_IMAGE_URL, avatarConfig.agentFallbackImageUrl);
        map.put(SHOW_PERSONALIZED_BOT_AVATAR, Boolean.valueOf(avatarConfig.isPersonalisedBotEnabled));
        map.put(BOT_FALLBACK_IMAGE_URL, avatarConfig.botFallbackImageUrl);
        map.put(SYSTEM_MESSAGE_NICKNAME, avatarConfig.systemMessageNickname);
        map.put(AVATAR_IMAGE_TEMPLATE_URL, avatarConfig.templateUrl);
        map.put(AVATAR_CACHE_EXPIRY, Long.valueOf(avatarConfig.cacheExpiry));
        this.kvStore.setKeyValues(map);
        downloadFallbackAndHeaderImages(z2, z, z3);
    }

    private void downloadFallbackAndHeaderImages(boolean z, boolean z2, boolean z3) {
        if (isAvatarEnabledInChatFeed()) {
            if (z) {
                AvatarImageDownloader.downloadAgentFallbackImage(this.platform, this.domain);
            }
            if (z2) {
                AvatarImageDownloader.downloadBotFallbackImage(this.platform, this.domain);
            }
        }
        if (z3) {
            AvatarImageDownloader.downloadConversationHeaderImage(this.platform, this.domain);
        }
    }

    public void setAgentAvatarImagePath(String str) {
        this.kvStore.setString(AGENT_FALLBACK_IMAGE_LOCAL_PATH, str);
    }

    public void setBotAvatarImagePath(String str) {
        this.kvStore.setString(BOT_FALLBACK_IMAGE_LOCAL_PATH, str);
    }

    public void setHeaderAvatarImagePath(String str) {
        this.kvStore.setString(HEADER_IMAGE_LOCAL_PATH, str);
    }

    public void updateLastSuccessfulConfigFetchTime() {
        this.kvStore.setLong(LAST_SUCCESSFUL_CONFIG_FETCH_TIME, Long.valueOf(System.currentTimeMillis() / 1000));
    }

    public Long getLastSuccessfulConfigFetchTime() {
        return this.kvStore.getLong(LAST_SUCCESSFUL_CONFIG_FETCH_TIME, 0L);
    }

    public boolean getBoolean(String str) {
        boolean zBooleanValue;
        str.hashCode();
        zBooleanValue = true;
        switch (str) {
            case "conversationalIssueFiling":
                zBooleanValue = this.kvStore.getBoolean(ENABLE_DEFAULT_CONVERSATIONAL_FILING, false).booleanValue();
                break;
            case "profileFormEnable":
            case "enableTypingIndicatorAgent":
            case "enableInAppNotification":
            case "defaultFallbackLanguageEnable":
            case "allowUserAttachments":
                break;
            default:
                zBooleanValue = false;
                break;
        }
        return this.kvStore.getBoolean(str, Boolean.valueOf(zBooleanValue)).booleanValue();
    }

    public Integer getInt(String str) {
        str.hashCode();
        return this.kvStore.getInt(str, (str.equals(DEBUG_LOG_LIMIT) || str.equals(BREADCRUMB_LIMIT)) ? 100 : null);
    }

    public String getString(String str) {
        String str2;
        str.hashCode();
        switch (str) {
            case "sdkLanguage":
            case "fontPath":
            case "reviewUrl":
                str2 = "";
                break;
            case "sdkType":
                str2 = "android";
                break;
            default:
                str2 = null;
                break;
        }
        return this.kvStore.getString(str, str2);
    }

    public PeriodicReview getPeriodicReview() {
        return new PeriodicReview(this.kvStore.getBoolean(PERIODIC_REVIEW_ENABLED, false).booleanValue(), this.kvStore.getInt(PERIODIC_REVIEW_INTERVAL, 0).intValue(), this.kvStore.getString(PERIODIC_REVIEW_TYPE, ""));
    }

    public void updateInstallConfig(RootInstallConfig rootInstallConfig) {
        HashMap map = new HashMap();
        String str = rootInstallConfig.supportNotificationChannelId == null ? "" : rootInstallConfig.supportNotificationChannelId;
        String str2 = rootInstallConfig.fontPath != null ? rootInstallConfig.fontPath : "";
        map.put(SUPPORT_NOTIFICATION_CHANNEL_ID, str);
        map.put(FONT_PATH, str2);
        HashMap map2 = new HashMap();
        map2.put(ENABLE_IN_APP_NOTIFICATION, rootInstallConfig.enableInAppNotification);
        map2.put(DEFAULT_FALLBACK_LANGUAGE_ENABLE, rootInstallConfig.enableDefaultFallbackLanguage);
        map2.put(INBOX_POLLING_ENABLE, rootInstallConfig.enableInboxPolling);
        map2.put(NOTIFICATION_MUTE_ENABLE, rootInstallConfig.enableNotificationMute);
        map2.put(DISABLE_ANIMATION, rootInstallConfig.disableAnimations);
        map2.put("disableHelpshiftBranding", rootInstallConfig.disableHelpshiftBranding);
        map2.put(DISABLE_ERROR_LOGGING, rootInstallConfig.disableErrorLogging);
        map2.put(DISABLE_APP_LAUNCH_EVENT, rootInstallConfig.disableAppLaunchEvent);
        map2.put(NOTIFICATION_SOUND_ID, rootInstallConfig.notificationSound);
        map2.put(NOTIFICATION_ICON_ID, rootInstallConfig.notificationIcon);
        map2.put(NOTIFICATION_LARGE_ICON_ID, rootInstallConfig.largeNotificationIcon);
        map2.put(SDK_TYPE, rootInstallConfig.sdkType);
        map2.put(PLUGIN_VERSION, rootInstallConfig.pluginVersion);
        map2.put(RUNTIME_VERSION, rootInstallConfig.runtimeVersion);
        removeNullValues(map2);
        map2.putAll(map);
        this.kvStore.setKeyValues(map2);
    }

    public boolean isHelpshiftBrandingDisabled() {
        return this.kvStore.getBoolean("disableHelpshiftBranding", false).booleanValue() || this.kvStore.getBoolean(HELPSHIFT_BRANDING_DISABLE_AGENT, false).booleanValue();
    }

    public boolean shouldShowConversationResolutionQuestion() {
        return getBoolean(SHOW_CONVERSATION_RESOLUTION_QUESTION_AGENT) || getBoolean(SHOW_CONVERSATION_RESOLUTION_QUESTION_API);
    }

    public void updateApiConfig(RootApiConfig rootApiConfig) {
        HashMap map = new HashMap();
        map.put(CONVERSATION_PRE_FILL_TEXT, rootApiConfig.conversationPrefillText);
        map.put(INITIAL_USER_MESSAGE_TO_AUTOSEND_IN_PREISSUE, rootApiConfig.initialUserMessageToAutoSend);
        HashMap map2 = new HashMap();
        map2.put(ENABLE_FULL_PRIVACY, rootApiConfig.enableFullPrivacy);
        map2.put(HIDE_NAME_AND_EMAIL, rootApiConfig.hideNameAndEmail);
        map2.put(REQUIRE_EMAIL, rootApiConfig.requireEmail);
        map2.put(SHOW_SEARCH_ON_NEW_CONVERSATION, rootApiConfig.showSearchOnNewConversation);
        map2.put(GOTO_CONVERSATION_AFTER_CONTACT_US, rootApiConfig.gotoConversationAfterContactUs);
        map2.put(SHOW_CONVERSATION_RESOLUTION_QUESTION_API, rootApiConfig.showConversationResolutionQuestion);
        map2.put(SHOW_CONVERSATION_INFO_SCREEN, rootApiConfig.showConversationInfoScreen);
        map2.put(ENABLE_TYPING_INDICATOR, rootApiConfig.enableTypingIndicator);
        if (rootApiConfig.enableContactUs != null) {
            map2.put(ENABLE_CONTACT_US, Integer.valueOf(rootApiConfig.enableContactUs.getValue()));
        }
        map2.put(ENABLE_DEFAULT_CONVERSATIONAL_FILING, rootApiConfig.enableDefaultConversationalFiling);
        removeNullValues(map2);
        map2.putAll(map);
        this.kvStore.setKeyValues(map2);
    }

    public RootApiConfig.EnableContactUs getEnableContactUs() {
        return RootApiConfig.EnableContactUs.fromInt(this.kvStore.getInt(ENABLE_CONTACT_US, 0).intValue());
    }

    public void setAppReviewed(boolean z) {
        this.kvStore.setBoolean(APP_REVIEWED, Boolean.valueOf(z));
    }

    public void setSdkLanguage(String str) {
        String string = getString(SDK_LANGUAGE);
        if (StringUtils.isEmpty(string)) {
            string = "";
        }
        if (!(StringUtils.isEmpty(str) ? "" : str).equals(string)) {
            this.platform.getNetworkRequestDAO().storeETag(NetworkConstants.SUPPORT_CONFIG_ROUTE, "");
        }
        this.kvStore.setString(SDK_LANGUAGE, str);
    }

    public boolean shouldEnableTypingIndicator() {
        return getBoolean(ENABLE_TYPING_INDICATOR_AGENT) || getBoolean(ENABLE_TYPING_INDICATOR);
    }

    public boolean shouldCreateConversationAnonymously() {
        return getBoolean(ENABLE_FULL_PRIVACY) || !((getBoolean(REQUIRE_NAME_AND_EMAIL) && getBoolean(HIDE_NAME_AND_EMAIL)) || getBoolean(PROFILE_FORM_ENABLE));
    }

    public int getMinimumConversationDescriptionLength() {
        return this.platform.getMinimumConversationDescriptionLength();
    }

    private void removeNullValues(Map<String, Serializable> map) {
        Iterator<Map.Entry<String, Serializable>> it = map.entrySet().iterator();
        while (it.hasNext()) {
            if (it.next().getValue() == null) {
                it.remove();
            }
        }
    }

    public boolean shouldShowConversationHistory() {
        if (getBoolean(SHOULD_SHOW_CONVERSATION_HISTORY_AGENT) && getBoolean(CONVERSATIONAL_ISSUE_FILING)) {
            return !getBoolean(ENABLE_FULL_PRIVACY);
        }
        return false;
    }

    public long getPeriodicFetchInterval() {
        return Math.max(this.kvStore.getLong(PERIODIC_FETCH_INTERVAL, 0L).longValue(), MINIMUM_PERIODIC_FETCH_INTERVAL.longValue());
    }

    public long getPreissueResetInterval() {
        return Math.max(this.kvStore.getLong(PREISSUE_RESET_INTERVAL, 0L).longValue(), MINIMUM_PREISSUE_RESET_INTERVAL.longValue());
    }

    public boolean isSmartIntentsEnabled() {
        return this.kvStore.getBoolean(IS_SMART_INTENT_ENABLED, false).booleanValue();
    }

    public long getSmartIntentTreeRefreshInterval() {
        return this.kvStore.getLong(SMART_INTENT_TREE_REFRESH_INTERVAL, Long.valueOf(AuthenticationTokenClaims.MAX_TIME_SINCE_TOKEN_ISSUED)).longValue();
    }

    public long getSmartIntentModelRefreshInterval() {
        return this.kvStore.getLong(SMART_INTENT_MODEL_REFRESH_INTERVAL, Long.valueOf(AuthenticationTokenClaims.MAX_TIME_SINCE_TOKEN_ISSUED)).longValue();
    }

    public long getSmartIntentClientCacheExpiryInterval() {
        return this.kvStore.getLong(SMART_INTENT_CLIENT_CACHE_INTERVAL, Long.valueOf(SMART_INTENT_CLIENT_CACHE_DEFAULT_INTERVAL)).longValue();
    }

    public boolean shouldAutoFillPreissueFirstMessage() {
        return this.kvStore.getBoolean(AUTO_FILL_FIRST_PREISSUE_MESSAGE, false).booleanValue();
    }

    public List<String> getWhiteListAttachmentMimeTypes() {
        Object serializable = this.kvStore.getSerializable(WHITELISTED_ATTACHMENT);
        if (serializable != null) {
            return ListUtils.flatten((List) serializable);
        }
        return Arrays.asList(AttachmentConstants.ALLOW_ALL_MIME);
    }

    public boolean isImageWhiteListed() {
        for (String str : getWhiteListAttachmentMimeTypes()) {
            if (str.startsWith(AttachmentConstants.IMAGE_MIME_PREFIX) || str.equals(AttachmentConstants.ALLOW_ALL_MIME)) {
                return true;
            }
        }
        return false;
    }

    public int getRequiredLogCachingLevel() {
        return this.kvStore.getInt(REQUIRED_LOG_LEVEL_FOR_REPORTING, Integer.valueOf(LogLevel.FATAL.getValue())).intValue();
    }

    public boolean isPersonalisedConversationEnabled() {
        return this.kvStore.getBoolean(IS_PERSONALISED_CONVERSATION_ENABLED, true).booleanValue();
    }

    public boolean isAvatarEnabledInChatFeed() {
        return this.kvStore.getBoolean(IS_AVATAR_ENABLED_IN_CHAT_FEED, true).booleanValue() && isPersonalisedConversationEnabled();
    }

    public boolean isPersonalisedAgentEnabled() {
        return this.kvStore.getBoolean(SHOW_PERSONALIZED_AGENT_AVATAR, false).booleanValue() && isAvatarEnabledInChatFeed();
    }

    public boolean isPersonalisedBotEnabled() {
        return this.kvStore.getBoolean(SHOW_PERSONALIZED_BOT_AVATAR, false).booleanValue() && isAvatarEnabledInChatFeed();
    }

    public boolean isConversationHeaderEnabled() {
        return this.kvStore.getBoolean(IS_CUSTOM_HEADER_ENABLED, true).booleanValue();
    }

    public String getSystemMessageNickname() {
        return this.kvStore.getString(SYSTEM_MESSAGE_NICKNAME, "");
    }

    public String getCustomHeaderTitle() {
        return this.kvStore.getString(HEADER_TITLE_TEXT, "");
    }

    public String getConversationHeaderImageUrl() {
        return this.kvStore.getString(HEADER_IMAGE_URL, "");
    }

    public String getAgentFallbackImageUrl() {
        return this.kvStore.getString(AGENT_FALLBACK_IMAGE_URL, "");
    }

    public String getBotFallbackImageUrl() {
        return this.kvStore.getString(BOT_FALLBACK_IMAGE_URL, "");
    }

    public String getConversationHeaderImageLocalPath() {
        return this.kvStore.getString(HEADER_IMAGE_LOCAL_PATH, "");
    }

    public String getAgentFallbackImageLocalPath() {
        return this.kvStore.getString(AGENT_FALLBACK_IMAGE_LOCAL_PATH, "");
    }

    public String getBotFallbackImageLocalPath() {
        return this.kvStore.getString(BOT_FALLBACK_IMAGE_LOCAL_PATH, "");
    }

    public long getAvatarCacheExpiry() {
        return this.kvStore.getLong(AVATAR_CACHE_EXPIRY, Long.valueOf(AVATAR_IMAGE_CACHE_DEFAULT_INTERVAL)).longValue();
    }

    public String getAvatarImageTemplateUrl() {
        return this.kvStore.getString(AVATAR_IMAGE_TEMPLATE_URL);
    }

    public String getAvatarImageUrl(String str) {
        String avatarImageTemplateUrl = getAvatarImageTemplateUrl();
        return StringUtils.isNotEmpty(avatarImageTemplateUrl) ? avatarImageTemplateUrl.replace("{{avatar_id}}", str) : "";
    }

    public void storeDownloadedImage(String str, String str2) {
        str2.hashCode();
        switch (str2) {
            case "botFallbackImageUrl":
                setBotAvatarImagePath(str);
                break;
            case "headerImageUrl":
                setHeaderAvatarImagePath(str);
                break;
            case "agentFallbackImageUrl":
                setAgentAvatarImagePath(str);
                break;
        }
    }

    public long getAppLaunchEventSyncInterval() {
        return this.kvStore.getLong(PERIODIC_SYNC_APP_LAUNCH_EVENT_INTERVAL, 0L).longValue();
    }

    public boolean isActivelySyncAppLaunchEventEnabled() {
        return this.kvStore.getBoolean(ACTIVELY_SYNC_APP_LAUNCH_EVENT, true).booleanValue();
    }

    public void updateLastSuccessfulAppLaunchEventSyncTime() {
        this.kvStore.setLong(LAST_SUCCESSFUL_APP_LAUNCH_EVENT_SYNC_TIME, Long.valueOf(System.currentTimeMillis()));
    }

    public Long getLastSuccessfulAppLaunchEventSyncTime() {
        return this.kvStore.getLong(LAST_SUCCESSFUL_APP_LAUNCH_EVENT_SYNC_TIME, 0L);
    }
}
