package com.helpshift.conversation.activeconversation;

import com.helpshift.conversation.activeconversation.message.MessageDM;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationUpdate {
    public final List<MessageDM> updatedMessageDMs = new ArrayList();
    public final List<MessageDM> newMessageDMs = new ArrayList();
    public final List<String> localIdsForResolvedRequestIds = new ArrayList();
}
