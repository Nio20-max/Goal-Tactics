package com.helpshift.conversation.activeconversation.message;

import com.helpshift.util.AttachmentFileSize;
import com.helpshift.util.StringUtils;

/* JADX INFO: loaded from: classes2.dex */
public abstract class AttachmentMessageDM extends MessageDM {
    public String attachmentUrl;
    public String contentType;
    public String fileName;
    public String filePath;
    public boolean isRejected;
    public boolean isSecureAttachment;
    public boolean isZipped;
    public int size;

    AttachmentMessageDM(String str, String str2, long j, Author author, int i, String str3, String str4, String str5, boolean z, boolean z2, MessageType messageType) {
        super(str, str2, j, author, z, messageType);
        this.size = i;
        this.contentType = str3;
        this.attachmentUrl = str4;
        this.fileName = str5;
        this.isSecureAttachment = z2;
    }

    protected AttachmentMessageDM(AttachmentMessageDM attachmentMessageDM) {
        super(attachmentMessageDM);
        this.contentType = attachmentMessageDM.contentType;
        this.fileName = attachmentMessageDM.fileName;
        this.attachmentUrl = attachmentMessageDM.attachmentUrl;
        this.size = attachmentMessageDM.size;
        this.filePath = attachmentMessageDM.filePath;
        this.isSecureAttachment = attachmentMessageDM.isSecureAttachment;
        this.isZipped = attachmentMessageDM.isZipped;
        this.isRejected = attachmentMessageDM.isRejected;
    }

    public String getFormattedFileSize() {
        return AttachmentFileSize.getFormattedFileSize(this.size);
    }

    String getFormattedFileSize(double d) {
        return AttachmentFileSize.getFormattedFileSize(d);
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public void merge(MessageDM messageDM) {
        super.merge(messageDM);
        if (messageDM instanceof AttachmentMessageDM) {
            AttachmentMessageDM attachmentMessageDM = (AttachmentMessageDM) messageDM;
            if (!attachmentMessageDM.isZipped) {
                this.contentType = attachmentMessageDM.contentType;
                this.size = attachmentMessageDM.size;
                this.fileName = attachmentMessageDM.fileName;
            }
            this.attachmentUrl = attachmentMessageDM.attachmentUrl;
            this.isSecureAttachment = attachmentMessageDM.isSecureAttachment;
        }
    }

    boolean isValidUriPath(String str) {
        return !StringUtils.isEmpty(str) && str.startsWith("content://");
    }
}
