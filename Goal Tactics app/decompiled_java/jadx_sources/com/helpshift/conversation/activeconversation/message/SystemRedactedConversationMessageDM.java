package com.helpshift.conversation.activeconversation.message;

/* JADX INFO: loaded from: classes2.dex */
public class SystemRedactedConversationMessageDM extends SystemMessageDM {
    public int contiguousRedactedConversationsCount;

    public SystemRedactedConversationMessageDM(String str, long j, int i) {
        super("", str, j, MessageType.SYSTEM_CONVERSATION_REDACTED);
        this.contiguousRedactedConversationsCount = i;
    }

    private SystemRedactedConversationMessageDM(SystemRedactedConversationMessageDM systemRedactedConversationMessageDM) {
        super(systemRedactedConversationMessageDM);
        this.contiguousRedactedConversationsCount = systemRedactedConversationMessageDM.contiguousRedactedConversationsCount;
    }

    @Override // com.helpshift.conversation.activeconversation.message.SystemMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public SystemRedactedConversationMessageDM deepClone() {
        return new SystemRedactedConversationMessageDM(this);
    }
}
