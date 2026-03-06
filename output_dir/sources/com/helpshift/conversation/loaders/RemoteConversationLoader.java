package com.helpshift.conversation.loaders;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.activeconversation.ConversationManager;
import com.helpshift.conversation.dao.ConversationDAO;
import com.helpshift.conversation.dao.ConversationInboxDAO;
import com.helpshift.conversation.domainmodel.ConversationHistoryRemoteDataFetcher;
import com.helpshift.conversation.domainmodel.ConversationHistoryRemoteDataMerger;
import com.helpshift.conversation.dto.ConversationHistory;
import com.helpshift.util.StringUtils;

/* JADX INFO: loaded from: classes2.dex */
public class RemoteConversationLoader {
    private ConversationDAO conversationDAO;
    private ConversationInboxDAO conversationInboxDAO;
    private Domain domain;
    private Platform platform;
    private ConversationHistoryRemoteDataFetcher remoteDataFetcher;
    private ConversationHistoryRemoteDataMerger remoteDataMerger;
    private UserDM userDM;

    public RemoteConversationLoader(Platform platform, Domain domain, UserDM userDM, ConversationManager conversationManager) {
        this.platform = platform;
        this.domain = domain;
        this.userDM = userDM;
        this.conversationDAO = platform.getConversationDAO();
        this.conversationInboxDAO = platform.getConversationInboxDAO();
        this.remoteDataFetcher = new ConversationHistoryRemoteDataFetcher(platform, domain, userDM);
        this.remoteDataMerger = new ConversationHistoryRemoteDataMerger(platform, domain, userDM, conversationManager);
    }

    public boolean hasMoreMessage() {
        return this.conversationInboxDAO.getHasOlderMessages(this.userDM.getLocalId().longValue());
    }

    public synchronized boolean loadMoreMessages() throws RootAPIException {
        if (!hasMoreMessage()) {
            return false;
        }
        String oldestMessageCursor = this.conversationDAO.getOldestMessageCursor(this.userDM.getLocalId().longValue());
        if (StringUtils.isEmpty(oldestMessageCursor)) {
            return false;
        }
        try {
            ConversationHistory conversationHistoryFetchConversations = this.remoteDataFetcher.fetchConversations(oldestMessageCursor);
            this.conversationInboxDAO.saveHasOlderMessages(this.userDM.getLocalId().longValue(), conversationHistoryFetchConversations.hasOlderMessages);
            this.remoteDataMerger.merge(conversationHistoryFetchConversations.conversations);
            return true;
        } catch (RootAPIException e) {
            if (e.exceptionType == NetworkException.INVALID_AUTH_TOKEN || e.exceptionType == NetworkException.AUTH_TOKEN_NOT_PROVIDED) {
                this.domain.getAuthenticationFailureDM().notifyAuthenticationFailure(this.userDM, e.exceptionType);
            }
            throw e;
        }
    }
}
