package com.helpshift.redaction;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.domainmodel.ConversationController;

/* JADX INFO: loaded from: classes2.dex */
public class RedactionAgent {
    private Domain domain;
    private Platform platform;

    public RedactionAgent(Platform platform, Domain domain) {
        this.platform = platform;
        this.domain = domain;
    }

    public void checkAndUpdateRedactionState(UserDM userDM, Long l, Long l2) {
        ConversationController conversationInboxDM = this.domain.getConversationInboxManagerDM().getConversationInboxDM(userDM);
        if (isUserRedacted(l, conversationInboxDM.getOldestConversationCreatedAtTime())) {
            updateRedaction(userDM, RedactionType.USER);
        } else if (isConversationRedacted(l2, conversationInboxDM.getLastConversationsRedactionTime())) {
            updateRedaction(userDM, RedactionType.CONVERSATION);
        }
        if (l2 != null) {
            conversationInboxDM.saveLastConversationsRedactionTime(l2.longValue());
        }
    }

    private void updateRedaction(UserDM userDM, RedactionType redactionType) {
        RedactionDetail redactionDetail = new RedactionDetail(userDM.getLocalId().longValue(), RedactionState.PENDING, redactionType);
        RedactionDAO redactionDAO = this.platform.getRedactionDAO();
        if (redactionDAO.getRedactionDetail(userDM.getLocalId().longValue()) == null) {
            redactionDAO.insertRedactionDetail(redactionDetail);
        } else {
            redactionDAO.updateRedactionRedail(redactionDetail);
        }
    }

    private boolean isUserRedacted(Long l, Long l2) {
        return l2 != null && (l == null || l.longValue() > l2.longValue());
    }

    private boolean isConversationRedacted(Long l, Long l2) {
        return l != null && (l2 == null || l2.longValue() < l.longValue());
    }
}
