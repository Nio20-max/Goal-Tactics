package com.helpshift.conversation.activeconversation.message;

import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.idempotent.IdempotentPolicy;
import com.helpshift.common.domain.idempotent.SuccessOrNonRetriableStatusCodeIdempotentPolicy;
import com.helpshift.common.domain.network.AuthenticationFailureNetwork;
import com.helpshift.common.domain.network.GuardAgainstConversationArchivalNetwork;
import com.helpshift.common.domain.network.GuardAgainstConversationReOpenExpiryNetwork;
import com.helpshift.common.domain.network.GuardOKNetwork;
import com.helpshift.common.domain.network.IdempotentNetwork;
import com.helpshift.common.domain.network.Network;
import com.helpshift.common.domain.network.POSTNetwork;
import com.helpshift.common.domain.network.TSCorrectedNetwork;
import com.helpshift.common.domain.network.UserPreConditionsFailedNetwork;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.conversation.activeconversation.ConversationServerInfo;
import com.helpshift.conversation.activeconversation.message.Author;
import com.helpshift.conversation.domainmodel.ConversationController;
import com.helpshift.util.FileUtil;
import com.helpshift.util.HSCloneable;
import com.helpshift.util.HSLogger;
import com.helpshift.util.StringUtils;
import java.text.ParseException;
import java.util.Date;
import java.util.Locale;
import java.util.Observable;

/* JADX INFO: loaded from: classes2.dex */
public abstract class MessageDM extends Observable implements HSCloneable {
    public static final int DELIVERY_STATE_READ = 1;
    public static final int DELIVERY_STATE_SENT = 2;
    public static final int DELIVERY_STATE_UNREAD = 0;
    private static final String TAG = "Helpshift_MessageDM";
    public Author author;
    private AvatarImageDownloadState avatarImageState;
    public String body;
    public Long conversationLocalId;
    private String createdAt;
    public String createdRequestId;
    public int deliveryState;
    protected Domain domain;
    private long epochCreatedAtTime;
    public final boolean isAdminMessage;
    public boolean isFeedbackMessage;
    public boolean isMessageSeenSynced;
    public boolean isRedacted;
    public Long localId;
    public final MessageType messageType;
    protected Platform platform;
    public String readAt;
    public String seenAtMessageCursor;
    public String serverId;
    private final UIViewState uiViewState;

    public enum AvatarImageDownloadState {
        AVATAR_IMAGE_DOWNLOAD_FAILED,
        AVATAR_IMAGE_NOT_PRESENT,
        AVATAR_IMAGE_DOWNLOADING,
        AVATAR_IMAGE_DOWNLOADED
    }

    public abstract MessageDM deepClone();

    public abstract boolean isUISupportedMessage();

    MessageDM(String str, String str2, long j, Author author, boolean z, MessageType messageType) {
        this.body = str;
        this.createdAt = str2;
        this.epochCreatedAtTime = j;
        this.author = author;
        this.isAdminMessage = z;
        this.messageType = messageType;
        this.uiViewState = new UIViewState();
        updateAvatarImageState();
    }

    protected MessageDM(MessageDM messageDM) {
        this.isAdminMessage = messageDM.isAdminMessage;
        this.messageType = messageDM.messageType;
        this.uiViewState = messageDM.uiViewState.deepClone();
        this.serverId = messageDM.serverId;
        this.body = messageDM.body;
        this.author = messageDM.author;
        this.conversationLocalId = messageDM.conversationLocalId;
        this.localId = messageDM.localId;
        this.readAt = messageDM.readAt;
        this.seenAtMessageCursor = messageDM.seenAtMessageCursor;
        this.deliveryState = messageDM.deliveryState;
        this.isMessageSeenSynced = messageDM.isMessageSeenSynced;
        this.createdRequestId = messageDM.createdRequestId;
        this.isRedacted = messageDM.isRedacted;
        this.domain = messageDM.domain;
        this.platform = messageDM.platform;
        this.createdAt = messageDM.createdAt;
        this.epochCreatedAtTime = messageDM.epochCreatedAtTime;
        this.avatarImageState = messageDM.avatarImageState;
        this.author = messageDM.author.deepClone();
        this.isFeedbackMessage = messageDM.isFeedbackMessage;
    }

    public void setDependencies(Domain domain, Platform platform) {
        this.domain = domain;
        this.platform = platform;
    }

    public String getSubText() {
        Date date;
        Locale currentLocale = this.domain.getLocaleProviderDM().getCurrentLocale();
        try {
            date = HSDateFormatSpec.getDateFormatter(HSDateFormatSpec.STORAGE_TIME_PATTERN, currentLocale, "GMT").parse(getCreatedAt());
        } catch (ParseException e) {
            Date date2 = new Date();
            HSLogger.d(TAG, "getSubText : ParseException", e);
            date = date2;
        }
        String str = HSDateFormatSpec.getDateFormatter(this.platform.getDevice().is24HourFormat() ? HSDateFormatSpec.DISPLAY_TIME_PATTERN_24HR : HSDateFormatSpec.DISPLAY_TIME_PATTERN_12HR, currentLocale).format(date);
        String displayedAuthorName = getDisplayedAuthorName();
        if (StringUtils.isEmpty(displayedAuthorName)) {
            return str;
        }
        return displayedAuthorName + ", " + str;
    }

    public String getAccessbilityMessageTime() {
        Locale currentLocale = this.domain.getLocaleProviderDM().getCurrentLocale();
        Date date = new Date(getEpochCreatedAtTime());
        return HSDateFormatSpec.getDateFormatter(this.platform.getDevice().is24HourFormat() ? HSDateFormatSpec.DISPLAY_TIME_PATTERN_24HR : HSDateFormatSpec.DISPLAY_TIME_PATTERN_12HR, currentLocale).format(date) + " " + HSDateFormatSpec.getDateFormatter(HSDateFormatSpec.DISPLAY_DATE_PATTERN, currentLocale).format(date);
    }

    public String getDisplayedAuthorName() {
        if (!this.isAdminMessage || !this.domain.getSDKConfigurationDM().isPersonalisedConversationEnabled()) {
            return null;
        }
        String systemMessageNickname = getSystemMessageNickname();
        if (!StringUtils.isEmpty(this.author.authorName)) {
            systemMessageNickname = this.author.authorName.trim();
        } else if (StringUtils.isEmpty(systemMessageNickname)) {
            return null;
        }
        return systemMessageNickname;
    }

    public String getSystemMessageNickname() {
        return this.domain.getSDKConfigurationDM().getSystemMessageNickname();
    }

    public void notifyUpdated() {
        setChanged();
        notifyObservers();
    }

    public void mergeAndNotify(MessageDM messageDM) {
        merge(messageDM);
        notifyUpdated();
    }

    public void merge(MessageDM messageDM) {
        this.body = messageDM.body;
        this.createdAt = messageDM.getCreatedAt();
        this.epochCreatedAtTime = messageDM.getEpochCreatedAtTime();
        if (this.isAdminMessage) {
            String str = this.author.localAvatarImagePath;
            Author author = messageDM.author;
            this.author = author;
            author.localAvatarImagePath = str;
        } else {
            this.author = messageDM.author;
        }
        if (StringUtils.isEmpty(this.serverId)) {
            this.serverId = messageDM.serverId;
        }
        if (!StringUtils.isEmpty(messageDM.createdRequestId)) {
            this.createdRequestId = messageDM.createdRequestId;
        }
        this.isRedacted = messageDM.isRedacted;
        this.isFeedbackMessage = messageDM.isFeedbackMessage;
    }

    Network getSendMessageNetwork(String str) {
        return new GuardOKNetwork(new GuardAgainstConversationArchivalNetwork(new GuardAgainstConversationReOpenExpiryNetwork(new AuthenticationFailureNetwork(new UserPreConditionsFailedNetwork(new TSCorrectedNetwork(new IdempotentNetwork(new POSTNetwork(str, this.domain, this.platform), this.platform, getIdempotentPolicy(), str, String.valueOf(this.localId)), this.platform))), this.platform)));
    }

    String getPreIssueSendMessageRoute(ConversationServerInfo conversationServerInfo) {
        return ConversationController.CREATE_PRE_ISSUE_ROUTE + conversationServerInfo.getPreIssueId() + "/messages/";
    }

    String getIssueSendMessageRoute(ConversationServerInfo conversationServerInfo) {
        return ConversationController.CREATE_ISSUE_ROUTE + conversationServerInfo.getIssueId() + "/messages/";
    }

    public UIViewState getUiViewState() {
        return this.uiViewState;
    }

    public String getCreatedAt() {
        return this.createdAt;
    }

    public void setCreatedAt(String str) {
        if (StringUtils.isEmpty(str)) {
            return;
        }
        this.createdAt = str;
    }

    public long getEpochCreatedAtTime() {
        return this.epochCreatedAtTime;
    }

    public void setEpochCreatedAtTime(long j) {
        this.epochCreatedAtTime = j;
    }

    protected IdempotentPolicy getIdempotentPolicy() {
        return new SuccessOrNonRetriableStatusCodeIdempotentPolicy();
    }

    public boolean shouldShowAvatar() {
        return this.domain.getSDKConfigurationDM().isAvatarEnabledInChatFeed();
    }

    public boolean shouldShowPersonalisedAgentAvatar() {
        return this.domain.getSDKConfigurationDM().isPersonalisedAgentEnabled();
    }

    public boolean shouldShowPersonalisedBotAvatar() {
        return this.domain.getSDKConfigurationDM().isPersonalisedBotEnabled();
    }

    private void updateAvatarImageState() {
        if (StringUtils.isEmpty(this.author.localAvatarImagePath)) {
            this.avatarImageState = AvatarImageDownloadState.AVATAR_IMAGE_NOT_PRESENT;
        } else if (FileUtil.doesFilePathExistAndCanRead(this.author.localAvatarImagePath)) {
            this.avatarImageState = AvatarImageDownloadState.AVATAR_IMAGE_DOWNLOADED;
        } else {
            this.avatarImageState = AvatarImageDownloadState.AVATAR_IMAGE_DOWNLOAD_FAILED;
        }
    }

    public void setAvatarImageState(AvatarImageDownloadState avatarImageDownloadState) {
        this.avatarImageState = avatarImageDownloadState;
        notifyUpdated();
    }

    public AvatarImageDownloadState getAvatarImageState() {
        return this.avatarImageState;
    }

    /* JADX INFO: renamed from: com.helpshift.conversation.activeconversation.message.MessageDM$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$conversation$activeconversation$message$Author$AuthorRole;

        static {
            int[] iArr = new int[Author.AuthorRole.values().length];
            $SwitchMap$com$helpshift$conversation$activeconversation$message$Author$AuthorRole = iArr;
            try {
                iArr[Author.AuthorRole.AGENT.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$Author$AuthorRole[Author.AuthorRole.BOT.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$Author$AuthorRole[Author.AuthorRole.SYSTEM.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$Author$AuthorRole[Author.AuthorRole.LOCAL_USER.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
        }
    }

    public String getAuthorAvatarFallbackImage() {
        int i = AnonymousClass1.$SwitchMap$com$helpshift$conversation$activeconversation$message$Author$AuthorRole[this.author.role.ordinal()];
        if (i == 1) {
            return this.domain.getSDKConfigurationDM().getAgentFallbackImageLocalPath();
        }
        if (i == 2) {
            return this.domain.getSDKConfigurationDM().getBotFallbackImageLocalPath();
        }
        if (i != 3) {
            return i != 4 ? this.domain.getSDKConfigurationDM().getConversationHeaderImageLocalPath() : "";
        }
        return this.domain.getSDKConfigurationDM().getConversationHeaderImageLocalPath();
    }
}
