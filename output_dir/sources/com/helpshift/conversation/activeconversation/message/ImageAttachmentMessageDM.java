package com.helpshift.conversation.activeconversation.message;

/* JADX INFO: loaded from: classes2.dex */
public abstract class ImageAttachmentMessageDM extends AttachmentMessageDM {
    public String thumbnailFilePath;
    public String thumbnailUrl;

    ImageAttachmentMessageDM(String str, String str2, long j, Author author, String str3, String str4, String str5, String str6, int i, boolean z, boolean z2, MessageType messageType) {
        super(str, str2, j, author, i, str6, str3, str4, z, z2, messageType);
        this.thumbnailUrl = str5;
    }

    protected ImageAttachmentMessageDM(ImageAttachmentMessageDM imageAttachmentMessageDM) {
        super(imageAttachmentMessageDM);
        this.thumbnailUrl = imageAttachmentMessageDM.thumbnailUrl;
        this.thumbnailFilePath = imageAttachmentMessageDM.thumbnailFilePath;
    }

    @Override // com.helpshift.conversation.activeconversation.message.AttachmentMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM
    public void merge(MessageDM messageDM) {
        super.merge(messageDM);
        if (messageDM instanceof ImageAttachmentMessageDM) {
            this.thumbnailUrl = ((ImageAttachmentMessageDM) messageDM).thumbnailUrl;
        }
    }
}
