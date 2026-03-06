package com.helpshift.conversation.activeconversation.message;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.analytics.AnalyticsEventType;
import com.helpshift.common.domain.F;
import com.helpshift.common.domain.network.AuthDataProvider;
import com.helpshift.common.domain.network.AuthenticationFailureNetwork;
import com.helpshift.common.domain.network.GuardAgainstConversationArchivalNetwork;
import com.helpshift.common.domain.network.GuardAgainstConversationReOpenExpiryNetwork;
import com.helpshift.common.domain.network.GuardOKNetwork;
import com.helpshift.common.domain.network.IdempotentNetwork;
import com.helpshift.common.domain.network.NetworkDataRequestUtil;
import com.helpshift.common.domain.network.NetworkErrorCodes;
import com.helpshift.common.domain.network.UploadNetwork;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.platform.network.RequestData;
import com.helpshift.conversation.activeconversation.ConversationServerInfo;
import com.helpshift.conversation.viewmodel.ConversationVMCallback;
import com.helpshift.downloader.AdminFileInfo;
import com.helpshift.downloader.SupportDownloadStateChangeListener;
import com.helpshift.downloader.SupportDownloader;
import com.helpshift.util.Callback;
import com.helpshift.util.FileUtil;
import com.helpshift.util.StringUtils;
import java.util.HashMap;

/* JADX INFO: loaded from: classes2.dex */
public class ScreenshotMessageDM extends ImageAttachmentMessageDM {
    public String refersMessageId;
    public UserMessageState state;

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public boolean isUISupportedMessage() {
        return true;
    }

    public ScreenshotMessageDM(String str, String str2, long j, Author author, String str3, String str4, String str5, String str6, int i, boolean z) {
        super(str, str2, j, author, str6, str5, str4, str3, i, false, z, MessageType.SCREENSHOT);
    }

    private ScreenshotMessageDM(ScreenshotMessageDM screenshotMessageDM) {
        super(screenshotMessageDM);
        this.refersMessageId = screenshotMessageDM.refersMessageId;
        this.state = screenshotMessageDM.state;
    }

    public void setRefersMessageId(String str) {
        this.refersMessageId = str;
    }

    public void handleClick(ConversationVMCallback conversationVMCallback) {
        if (this.state != UserMessageState.SENT || conversationVMCallback == null) {
            return;
        }
        conversationVMCallback.launchScreenshotAttachment(getFilePath(), this.contentType);
    }

    public void uploadImage(final UserDM userDM, final ConversationServerInfo conversationServerInfo, boolean z, final Callback<Void, RootAPIException> callback) {
        if (StringUtils.isEmpty(conversationServerInfo.getIssueId())) {
            throw new UnsupportedOperationException("ScreenshotMessageDM send called with conversation in pre issue mode.");
        }
        if (getFilePath() == null) {
            return;
        }
        if (z) {
            this.filePath = this.platform.compressAndStoreScreenshot(getFilePath());
            this.platform.getConversationDAO().insertOrUpdateMessage(this);
        }
        setState(UserMessageState.SENDING);
        this.domain.getAttachmentUploadThreader().thread(new F() { // from class: com.helpshift.conversation.activeconversation.message.ScreenshotMessageDM.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                ScreenshotMessageDM.this.uploadImageInternal(userDM, conversationServerInfo, callback);
            }
        }).f();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void uploadImageInternal(UserDM userDM, ConversationServerInfo conversationServerInfo, Callback<Void, RootAPIException> callback) {
        HashMap<String, String> userRequestData = NetworkDataRequestUtil.getUserRequestData(userDM);
        userRequestData.put("body", "Screenshot sent");
        userRequestData.put("type", "sc");
        userRequestData.put("filePath", getFilePath());
        userRequestData.put("originalFileName", this.fileName);
        if (!StringUtils.isEmpty(this.refersMessageId)) {
            userRequestData.put("refers", this.refersMessageId);
        }
        try {
            String issueSendMessageRoute = getIssueSendMessageRoute(conversationServerInfo);
            GuardAgainstConversationArchivalNetwork guardAgainstConversationArchivalNetwork = new GuardAgainstConversationArchivalNetwork(new GuardAgainstConversationReOpenExpiryNetwork(new AuthenticationFailureNetwork(new IdempotentNetwork(new UploadNetwork(issueSendMessageRoute, this.domain, this.platform), this.platform, getIdempotentPolicy(), issueSendMessageRoute, String.valueOf(this.localId))), this.platform));
            ScreenshotMessageDM screenshotMessageDM = this.platform.getResponseParser().parseScreenshotMessageDM(new GuardOKNetwork(guardAgainstConversationArchivalNetwork).makeRequest(new RequestData(userRequestData)).responseString);
            this.serverId = screenshotMessageDM.serverId;
            this.author = screenshotMessageDM.author;
            merge(screenshotMessageDM);
            setState(UserMessageState.SENT);
            this.platform.getConversationDAO().insertOrUpdateMessage(this);
            notifyUpdated();
            HashMap map = new HashMap();
            map.put("id", conversationServerInfo.getIssueId());
            if (StringUtils.isNotEmpty(conversationServerInfo.getAnalyticConversationId())) {
                map.put("acid", conversationServerInfo.getAnalyticConversationId());
            }
            map.put("type", "url");
            this.domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.MESSAGE_ADDED, map);
            this.domain.getDelegate().userRepliedToConversation("User sent a screenshot");
            if (callback != null) {
                callback.onSuccess(null);
            }
        } catch (RootAPIException e) {
            if (e.exceptionType == NetworkException.UNHANDLED_STATUS_CODE && e.getServerStatusCode() == NetworkErrorCodes.UNSUPPORTED_MEDIA_TYPE.intValue()) {
                this.isRejected = true;
                setState(UserMessageState.UNSENT_NOT_RETRYABLE);
                this.platform.getConversationDAO().insertOrUpdateMessage(this);
                notifyUpdated();
                return;
            }
            if (e.exceptionType == NetworkException.INVALID_AUTH_TOKEN || e.exceptionType == NetworkException.AUTH_TOKEN_NOT_PROVIDED) {
                this.domain.getAuthenticationFailureDM().notifyAuthenticationFailure(userDM, e.exceptionType);
            }
            if (e.exceptionType == NetworkException.CONVERSATION_REOPEN_EXPIRED) {
                setState(UserMessageState.UNSENT_NOT_RETRYABLE);
            } else if (StringUtils.isEmpty(this.serverId)) {
                setState(UserMessageState.UNSENT_RETRYABLE);
            }
            if (callback != null) {
                callback.onFailure(e);
            }
            throw RootAPIException.wrap(e);
        }
    }

    public void setState(UserMessageState userMessageState) {
        this.state = userMessageState;
        notifyUpdated();
    }

    public void updateState(boolean z) {
        if (this.serverId == null) {
            if (this.state == UserMessageState.SENDING) {
                return;
            }
            if (z && !this.isRejected) {
                setState(UserMessageState.UNSENT_RETRYABLE);
                return;
            } else {
                setState(UserMessageState.UNSENT_NOT_RETRYABLE);
                return;
            }
        }
        setState(UserMessageState.SENT);
    }

    public String getFilePath() {
        if (!FileUtil.doesFilePathExistAndCanRead(this.filePath)) {
            this.filePath = null;
        }
        return this.filePath;
    }

    public void checkAndReDownloadImageIfNotExist(final Platform platform) {
        if (this.state != UserMessageState.SENT || FileUtil.doesFilePathExistAndCanRead(getFilePath())) {
            return;
        }
        platform.getDownloader().startDownload(new AdminFileInfo(this.attachmentUrl, this.fileName, this.contentType, this.isSecureAttachment), SupportDownloader.StorageDirType.INTERNAL_ONLY, new AuthDataProvider(this.domain, platform, this.attachmentUrl), new SupportDownloadStateChangeListener() { // from class: com.helpshift.conversation.activeconversation.message.ScreenshotMessageDM.2
            @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
            public void onFailure(String str, int i) {
            }

            @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
            public void onProgressChange(String str, int i) {
            }

            @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
            public void onSuccess(String str, String str2, String str3) {
                ScreenshotMessageDM.this.filePath = str2;
                platform.getConversationDAO().insertOrUpdateMessage(ScreenshotMessageDM.this);
                ScreenshotMessageDM.this.notifyUpdated();
            }
        });
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public ScreenshotMessageDM deepClone() {
        return new ScreenshotMessageDM(this);
    }
}
