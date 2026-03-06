package com.helpshift.conversation.activeconversation.message;

/* JADX INFO: loaded from: classes2.dex */
public class SystemDividerMessageDM extends SystemMessageDM {
    public final boolean showDividerText;

    public SystemDividerMessageDM(String str, long j, boolean z) {
        super("", str, j, MessageType.SYSTEM_DIVIDER);
        this.showDividerText = z;
    }

    private SystemDividerMessageDM(SystemDividerMessageDM systemDividerMessageDM) {
        super(systemDividerMessageDM);
        this.showDividerText = systemDividerMessageDM.showDividerText;
    }

    @Override // com.helpshift.conversation.activeconversation.message.SystemMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public SystemDividerMessageDM deepClone() {
        return new SystemDividerMessageDM(this);
    }
}
