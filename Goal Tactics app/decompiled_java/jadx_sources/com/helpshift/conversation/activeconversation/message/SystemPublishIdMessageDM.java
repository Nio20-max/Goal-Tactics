package com.helpshift.conversation.activeconversation.message;

/* JADX INFO: loaded from: classes2.dex */
public class SystemPublishIdMessageDM extends SystemMessageDM {
    public boolean isFirstMessageInList;

    public SystemPublishIdMessageDM(String str, String str2, long j, boolean z) {
        super(str, str2, j, MessageType.SYSTEM_PUBLISH_ID);
        this.isFirstMessageInList = z;
    }

    private SystemPublishIdMessageDM(SystemPublishIdMessageDM systemPublishIdMessageDM) {
        super(systemPublishIdMessageDM);
        this.isFirstMessageInList = systemPublishIdMessageDM.isFirstMessageInList;
    }

    @Override // com.helpshift.conversation.activeconversation.message.SystemMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public SystemPublishIdMessageDM deepClone() {
        return new SystemPublishIdMessageDM(this);
    }
}
