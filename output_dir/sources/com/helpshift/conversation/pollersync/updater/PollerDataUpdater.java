package com.helpshift.conversation.pollersync.updater;

import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.pollersync.exception.PollerSyncException;
import com.helpshift.conversation.pollersync.model.ConversationsDiff;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public interface PollerDataUpdater {
    ConversationsDiff updateData(List<Conversation> list) throws PollerSyncException;
}
