package com.helpshift.conversation.activeconversation.message;

import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.network.AuthDataProvider;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.viewmodel.ConversationVMCallback;
import com.helpshift.downloader.AdminFileInfo;
import com.helpshift.downloader.SupportDownloadStateChangeListener;
import com.helpshift.downloader.SupportDownloader;
import com.helpshift.util.FileUtil;
import com.helpshift.util.StringUtils;

/* JADX INFO: loaded from: classes2.dex */
public class AdminAttachmentMessageDM extends AttachmentMessageDM {
    int downloadProgress;
    public AdminGenericAttachmentState state;

    public enum AdminGenericAttachmentState {
        DOWNLOAD_NOT_STARTED,
        DOWNLOADING,
        DOWNLOADED
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public boolean isUISupportedMessage() {
        return true;
    }

    public AdminAttachmentMessageDM(String str, String str2, String str3, long j, Author author, int i, String str4, String str5, String str6, boolean z) {
        super(str2, str3, j, author, i, str4, str5, str6, true, z, MessageType.ADMIN_ATTACHMENT);
        this.downloadProgress = 0;
        this.serverId = str;
        updateState();
    }

    private AdminAttachmentMessageDM(AdminAttachmentMessageDM adminAttachmentMessageDM) {
        super(adminAttachmentMessageDM);
        this.downloadProgress = 0;
        this.state = adminAttachmentMessageDM.state;
        this.downloadProgress = adminAttachmentMessageDM.downloadProgress;
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public void setDependencies(Domain domain, Platform platform) {
        super.setDependencies(domain, platform);
        if (isValidUriPath(this.filePath)) {
            updateState();
        }
    }

    public void updateState() {
        if (checkAndGetFilePath() != null) {
            this.state = AdminGenericAttachmentState.DOWNLOADED;
        } else {
            this.state = AdminGenericAttachmentState.DOWNLOAD_NOT_STARTED;
        }
    }

    public String getDownloadProgressAndFileSize() {
        String downloadedProgressSize = getDownloadedProgressSize();
        if (!StringUtils.isEmpty(downloadedProgressSize)) {
            return downloadedProgressSize + "/" + getFormattedFileSize();
        }
        return getFormattedFileSize();
    }

    public String getDownloadedProgressSize() {
        if (this.state == AdminGenericAttachmentState.DOWNLOADING && this.downloadProgress > 0) {
            double d = ((double) (this.size * this.downloadProgress)) / 100.0d;
            if (d < this.size) {
                return getFormattedFileSize(d);
            }
        }
        return null;
    }

    public boolean isWriteStoragePermissionRequired() {
        return this.state == AdminGenericAttachmentState.DOWNLOAD_NOT_STARTED;
    }

    void setState(AdminGenericAttachmentState adminGenericAttachmentState) {
        this.state = adminGenericAttachmentState;
        notifyUpdated();
    }

    public void handleClick(ConversationVMCallback conversationVMCallback) {
        if (this.state == AdminGenericAttachmentState.DOWNLOADED) {
            if (conversationVMCallback != null) {
                conversationVMCallback.launchAttachment(checkAndGetFilePath(), this.contentType);
            }
        } else if (this.state == AdminGenericAttachmentState.DOWNLOAD_NOT_STARTED) {
            setState(AdminGenericAttachmentState.DOWNLOADING);
            this.platform.getDownloader().startDownload(new AdminFileInfo(this.attachmentUrl, this.fileName, this.contentType, this.isSecureAttachment), SupportDownloader.StorageDirType.EXTERNAL_ONLY, new AuthDataProvider(this.domain, this.platform, this.attachmentUrl), new SupportDownloadStateChangeListener() { // from class: com.helpshift.conversation.activeconversation.message.AdminAttachmentMessageDM.1
                @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
                public void onFailure(String str, int i) {
                    AdminAttachmentMessageDM.this.setState(AdminGenericAttachmentState.DOWNLOAD_NOT_STARTED);
                }

                @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
                public void onSuccess(String str, String str2, String str3) {
                    AdminAttachmentMessageDM.this.filePath = str2;
                    AdminAttachmentMessageDM.this.platform.getConversationDAO().insertOrUpdateMessage(AdminAttachmentMessageDM.this);
                    AdminAttachmentMessageDM.this.setState(AdminGenericAttachmentState.DOWNLOADED);
                }

                @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
                public void onProgressChange(String str, int i) {
                    AdminAttachmentMessageDM.this.downloadProgress = i;
                    AdminAttachmentMessageDM.this.notifyUpdated();
                }
            });
        }
    }

    public String checkAndGetFilePath() {
        if (isValidUriPath(this.filePath)) {
            if (this.platform != null && !this.platform.canReadFileAtUri(this.filePath)) {
                this.filePath = null;
                this.state = AdminGenericAttachmentState.DOWNLOAD_NOT_STARTED;
            }
        } else if (!FileUtil.doesFilePathExistAndCanRead(this.filePath)) {
            this.filePath = null;
            this.state = AdminGenericAttachmentState.DOWNLOAD_NOT_STARTED;
        }
        return this.filePath;
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public AdminAttachmentMessageDM deepClone() {
        return new AdminAttachmentMessageDM(this);
    }
}
