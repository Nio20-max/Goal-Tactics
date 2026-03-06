package com.helpshift.common.domain.idempotent;

import com.helpshift.conversation.activeconversation.ViewableConversation;
import com.helpshift.conversation.activeconversation.model.Conversation;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public interface PollerSyncDataProvider {
    Conversation getActiveConversationFromStorage();

    ViewableConversation getAliveViewableConversation();

    int getCurrentConversationViewState();

    Map<String, String> getMessagesLocalIdToPendingRequestIdMap(Conversation conversation);

    String getPendingRequestIdForPreissue();
}
