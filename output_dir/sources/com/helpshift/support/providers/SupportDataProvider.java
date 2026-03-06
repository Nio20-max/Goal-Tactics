package com.helpshift.support.providers;

import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.providers.ISupportDataProvider;
import com.helpshift.util.HelpshiftContext;

/* JADX INFO: loaded from: classes2.dex */
public class SupportDataProvider implements ISupportDataProvider {
    @Override // com.helpshift.providers.ISupportDataProvider
    public String getActiveConversationId() {
        Conversation activeConversation = HelpshiftContext.getCoreApi().getActiveConversation();
        if (activeConversation != null) {
            return activeConversation.serverId;
        }
        return null;
    }

    @Override // com.helpshift.providers.ISupportDataProvider
    public String getActionEvents() {
        return HelpshiftContext.getPlatform().getJsonifier().jsonifyAnalyticsDTOList(HelpshiftContext.getCoreApi().getAnalyticsEventDM().getCurrentSessionEventsCopy());
    }
}
