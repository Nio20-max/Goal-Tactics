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
public class AdminImageAttachmentMessageDM extends ImageAttachmentMessageDM {
    private int downloadProgress;
    public AdminImageAttachmentState state;

    public enum AdminImageAttachmentState {
        DOWNLOAD_NOT_STARTED,
        THUMBNAIL_DOWNLOADING,
        THUMBNAIL_DOWNLOADED,
        IMAGE_DOWNLOADING,
        IMAGE_DOWNLOADED
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public boolean isUISupportedMessage() {
        return true;
    }

    public AdminImageAttachmentMessageDM(String str, String str2, String str3, long j, Author author, String str4, String str5, String str6, String str7, boolean z, int i) {
        super(str2, str3, j, author, str4, str5, str6, str7, i, true, z, MessageType.ADMIN_IMAGE_ATTACHMENT);
        this.serverId = str;
        updateState();
    }

    private AdminImageAttachmentMessageDM(AdminImageAttachmentMessageDM adminImageAttachmentMessageDM) {
        super(adminImageAttachmentMessageDM);
        this.state = adminImageAttachmentMessageDM.state;
        this.downloadProgress = adminImageAttachmentMessageDM.downloadProgress;
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
            this.state = AdminImageAttachmentState.IMAGE_DOWNLOADED;
        } else if (checkAndGetThumbnailFilePath() != null) {
            this.state = AdminImageAttachmentState.THUMBNAIL_DOWNLOADED;
        } else {
            this.state = AdminImageAttachmentState.DOWNLOAD_NOT_STARTED;
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
        if (this.state == AdminImageAttachmentState.IMAGE_DOWNLOADING && this.downloadProgress > 0) {
            double d = ((double) (this.size * this.downloadProgress)) / 100.0d;
            if (d < this.size) {
                return getFormattedFileSize(d);
            }
        }
        return null;
    }

    public String checkAndGetThumbnailFilePath() {
        if (!FileUtil.doesFilePathExistAndCanRead(this.thumbnailFilePath)) {
            this.state = AdminImageAttachmentState.DOWNLOAD_NOT_STARTED;
            this.thumbnailFilePath = null;
        }
        return this.thumbnailFilePath;
    }

    public String checkAndGetFilePath() {
        if (isValidUriPath(this.filePath)) {
            if (this.platform != null && !this.platform.canReadFileAtUri(this.filePath)) {
                this.filePath = null;
            }
        } else if (!FileUtil.doesFilePathExistAndCanRead(this.filePath)) {
            this.filePath = null;
        }
        if (this.filePath == null && checkAndGetThumbnailFilePath() != null) {
            this.state = AdminImageAttachmentState.THUMBNAIL_DOWNLOADED;
        }
        return this.filePath;
    }

    public void setState(AdminImageAttachmentState adminImageAttachmentState) {
        this.state = adminImageAttachmentState;
        notifyUpdated();
    }

    public void downloadThumbnailImage(final Platform platform) {
        if (this.state == AdminImageAttachmentState.DOWNLOAD_NOT_STARTED) {
            setState(AdminImageAttachmentState.THUMBNAIL_DOWNLOADING);
            platform.getDownloader().startDownload(new AdminFileInfo(this.thumbnailUrl, null, null, this.isSecureAttachment), SupportDownloader.StorageDirType.EXTERNAL_OR_INTERNAL, new AuthDataProvider(this.domain, platform, this.attachmentUrl), new SupportDownloadStateChangeListener() { // from class: com.helpshift.conversation.activeconversation.message.AdminImageAttachmentMessageDM.1
                @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
                public void onProgressChange(String str, int i) {
                }

                @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
                public void onFailure(String str, int i) {
                    AdminImageAttachmentMessageDM.this.setState(AdminImageAttachmentState.DOWNLOAD_NOT_STARTED);
                }

                @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
                public void onSuccess(String str, String str2, String str3) {
                    AdminImageAttachmentMessageDM.this.thumbnailFilePath = str2;
                    platform.getConversationDAO().insertOrUpdateMessage(AdminImageAttachmentMessageDM.this);
                    AdminImageAttachmentMessageDM.this.setState(AdminImageAttachmentState.THUMBNAIL_DOWNLOADED);
                }
            });
        }
    }

    public void handleClick(ConversationVMCallback conversationVMCallback) {
        if (this.state == AdminImageAttachmentState.IMAGE_DOWNLOADED) {
            if (conversationVMCallback != null) {
                conversationVMCallback.launchAttachment(checkAndGetFilePath(), this.contentType);
            }
        } else if (this.state == AdminImageAttachmentState.DOWNLOAD_NOT_STARTED || this.state == AdminImageAttachmentState.THUMBNAIL_DOWNLOADING || this.state == AdminImageAttachmentState.THUMBNAIL_DOWNLOADED) {
            setState(AdminImageAttachmentState.IMAGE_DOWNLOADING);
            this.platform.getDownloader().startDownload(new AdminFileInfo(this.attachmentUrl, this.fileName, this.contentType, this.isSecureAttachment), SupportDownloader.StorageDirType.EXTERNAL_ONLY, new AuthDataProvider(this.domain, this.platform, this.attachmentUrl), new SupportDownloadStateChangeListener() { // from class: com.helpshift.conversation.activeconversation.message.AdminImageAttachmentMessageDM.2
                @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
                public void onFailure(String str, int i) {
                    AdminImageAttachmentMessageDM.this.setState(AdminImageAttachmentState.THUMBNAIL_DOWNLOADED);
                }

                @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
                public void onSuccess(String str, String str2, String str3) {
                    AdminImageAttachmentMessageDM.this.filePath = str2;
                    AdminImageAttachmentMessageDM.this.platform.getConversationDAO().insertOrUpdateMessage(AdminImageAttachmentMessageDM.this);
                    AdminImageAttachmentMessageDM.this.setState(AdminImageAttachmentState.IMAGE_DOWNLOADED);
                }

                @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
                public void onProgressChange(String str, int i) {
                    AdminImageAttachmentMessageDM.this.downloadProgress = i;
                    AdminImageAttachmentMessageDM.this.notifyUpdated();
                }
            });
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public AdminImageAttachmentMessageDM deepClone() {
        return new AdminImageAttachmentMessageDM(this);
    }
}
