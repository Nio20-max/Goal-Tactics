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
import com.helpshift.common.platform.network.RequestData;
import com.helpshift.conversation.activeconversation.ConversationServerInfo;
import com.helpshift.conversation.viewmodel.ConversationVMCallback;
import com.helpshift.delegate.DelegateConstants;
import com.helpshift.downloader.AdminFileInfo;
import com.helpshift.downloader.SupportDownloadStateChangeListener;
import com.helpshift.downloader.SupportDownloader;
import com.helpshift.util.Callback;
import com.helpshift.util.FileUtil;
import com.helpshift.util.StringUtils;
import java.util.HashMap;

/* JADX INFO: loaded from: classes2.dex */
public class UserAttachmentMessageDM extends AttachmentMessageDM {
    int progressPercentage;
    public UserGenericAttachmentState state;

    public enum UserGenericAttachmentState {
        DOWNLOAD_NOT_STARTED,
        DOWNLOADING,
        UNSENT_RETRYABLE,
        UNSENT_NOT_RETRYABLE,
        SENDING,
        SENT
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public boolean isUISupportedMessage() {
        return true;
    }

    public UserAttachmentMessageDM(String str, String str2, long j, Author author, int i, String str3, String str4, String str5, boolean z) {
        super(str, str2, j, author, i, str3, str4, str5, false, z, MessageType.USER_ATTACHMENT);
        this.progressPercentage = 0;
    }

    public UserAttachmentMessageDM(UserAttachmentMessageDM userAttachmentMessageDM) {
        super(userAttachmentMessageDM);
        this.progressPercentage = 0;
        this.state = userAttachmentMessageDM.state;
        this.progressPercentage = userAttachmentMessageDM.progressPercentage;
    }

    public void handleClick(ConversationVMCallback conversationVMCallback) {
        if (this.state == UserGenericAttachmentState.SENT && conversationVMCallback != null) {
            conversationVMCallback.launchAttachment(getFilePath(), this.contentType);
        } else if (this.state == UserGenericAttachmentState.DOWNLOAD_NOT_STARTED) {
            this.progressPercentage = 0;
            setState(UserGenericAttachmentState.DOWNLOADING);
            this.platform.getDownloader().startDownload(new AdminFileInfo(this.attachmentUrl, this.fileName, this.contentType, this.isSecureAttachment), SupportDownloader.StorageDirType.INTERNAL_ONLY, new AuthDataProvider(this.domain, this.platform, this.attachmentUrl), new SupportDownloadStateChangeListener() { // from class: com.helpshift.conversation.activeconversation.message.UserAttachmentMessageDM.1
                @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
                public void onFailure(String str, int i) {
                    UserAttachmentMessageDM.this.setState(UserGenericAttachmentState.DOWNLOAD_NOT_STARTED);
                }

                @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
                public void onSuccess(String str, String str2, String str3) {
                    UserAttachmentMessageDM.this.filePath = str2;
                    UserAttachmentMessageDM.this.platform.getConversationDAO().insertOrUpdateMessage(UserAttachmentMessageDM.this);
                    UserAttachmentMessageDM.this.setState(UserGenericAttachmentState.SENT);
                }

                @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
                public void onProgressChange(String str, int i) {
                    UserAttachmentMessageDM.this.progressPercentage = i;
                    UserAttachmentMessageDM.this.notifyUpdated();
                }
            });
        }
    }

    public void uploadAttachment(final UserDM userDM, final ConversationServerInfo conversationServerInfo, final Callback<Void, RootAPIException> callback) {
        if (StringUtils.isEmpty(conversationServerInfo.getIssueId())) {
            throw new UnsupportedOperationException("UserAttachmentMessageDM send called with conversation in pre issue mode.");
        }
        if (getFilePath() == null) {
            return;
        }
        setState(UserGenericAttachmentState.SENDING);
        this.domain.getAttachmentUploadThreader().thread(new F() { // from class: com.helpshift.conversation.activeconversation.message.UserAttachmentMessageDM.2
            @Override // com.helpshift.common.domain.F
            public void f() {
                UserAttachmentMessageDM.this.uploadAttachmentInternal(userDM, conversationServerInfo, callback);
            }
        }).f();
    }

    void uploadAttachmentInternal(UserDM userDM, ConversationServerInfo conversationServerInfo, Callback<Void, RootAPIException> callback) {
        HashMap<String, String> userRequestData = NetworkDataRequestUtil.getUserRequestData(userDM);
        userRequestData.put("body", "Attachment sent");
        userRequestData.put("type", "at");
        userRequestData.put("filePath", getFilePath());
        userRequestData.put("originalFileName", this.fileName);
        try {
            String issueSendMessageRoute = getIssueSendMessageRoute(conversationServerInfo);
            GuardAgainstConversationArchivalNetwork guardAgainstConversationArchivalNetwork = new GuardAgainstConversationArchivalNetwork(new GuardAgainstConversationReOpenExpiryNetwork(new AuthenticationFailureNetwork(new IdempotentNetwork(new UploadNetwork(issueSendMessageRoute, this.domain, this.platform), this.platform, getIdempotentPolicy(), issueSendMessageRoute, String.valueOf(this.localId))), this.platform));
            UserAttachmentMessageDM userAttachmentMessageDM = this.platform.getResponseParser().parseUserAttachmentMessageDM(new GuardOKNetwork(guardAgainstConversationArchivalNetwork).makeRequest(new RequestData(userRequestData)).responseString);
            this.serverId = userAttachmentMessageDM.serverId;
            this.author = userAttachmentMessageDM.author;
            merge(userAttachmentMessageDM);
            setState(UserGenericAttachmentState.SENT);
            this.platform.getConversationDAO().insertOrUpdateMessage(this);
            notifyUpdated();
            HashMap map = new HashMap();
            map.put("id", conversationServerInfo.getIssueId());
            if (StringUtils.isNotEmpty(conversationServerInfo.getAnalyticConversationId())) {
                map.put("acid", conversationServerInfo.getAnalyticConversationId());
            }
            map.put("type", "url");
            this.domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.MESSAGE_ADDED, map);
            this.domain.getDelegate().userRepliedToConversation(DelegateConstants.USER_SENT_A_ATTACHMENT);
            if (callback != null) {
                callback.onSuccess(null);
            }
        } catch (RootAPIException e) {
            if (e.exceptionType == NetworkException.UNHANDLED_STATUS_CODE && e.getServerStatusCode() == NetworkErrorCodes.UNSUPPORTED_MEDIA_TYPE.intValue()) {
                this.isRejected = true;
                setState(UserGenericAttachmentState.UNSENT_NOT_RETRYABLE);
                this.platform.getConversationDAO().insertOrUpdateMessage(this);
                notifyUpdated();
                return;
            }
            if (e.exceptionType == NetworkException.INVALID_AUTH_TOKEN || e.exceptionType == NetworkException.AUTH_TOKEN_NOT_PROVIDED) {
                this.domain.getAuthenticationFailureDM().notifyAuthenticationFailure(userDM, e.exceptionType);
            }
            if (e.exceptionType == NetworkException.CONVERSATION_REOPEN_EXPIRED) {
                setState(UserGenericAttachmentState.UNSENT_NOT_RETRYABLE);
            } else if (StringUtils.isEmpty(this.serverId)) {
                setState(UserGenericAttachmentState.UNSENT_RETRYABLE);
            }
            if (callback != null) {
                callback.onFailure(e);
            }
            throw RootAPIException.wrap(e);
        }
    }

    public void setState(UserGenericAttachmentState userGenericAttachmentState) {
        this.state = userGenericAttachmentState;
        notifyUpdated();
    }

    public void updateState(boolean z) {
        if (this.serverId == null) {
            if (this.state == UserGenericAttachmentState.SENDING) {
                return;
            }
            if (z && !this.isRejected) {
                setState(UserGenericAttachmentState.UNSENT_RETRYABLE);
                return;
            } else {
                setState(UserGenericAttachmentState.UNSENT_NOT_RETRYABLE);
                return;
            }
        }
        if (getFilePath() != null) {
            setState(UserGenericAttachmentState.SENT);
        } else {
            setState(UserGenericAttachmentState.DOWNLOAD_NOT_STARTED);
        }
    }

    public String getFilePath() {
        if (!FileUtil.doesFilePathExistAndCanRead(this.filePath)) {
            this.filePath = null;
        }
        return this.filePath;
    }

    public String getProgressAndFileSize() {
        String progressSize = getProgressSize();
        if (!StringUtils.isEmpty(progressSize)) {
            return progressSize + "/" + getFormattedFileSize();
        }
        return getFormattedFileSize();
    }

    private String getProgressSize() {
        if (this.progressPercentage > 0) {
            double d = ((double) (this.size * this.progressPercentage)) / 100.0d;
            if (d < this.size) {
                return getFormattedFileSize(d);
            }
        }
        return null;
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public MessageDM deepClone() {
        return new UserAttachmentMessageDM(this);
    }
}
