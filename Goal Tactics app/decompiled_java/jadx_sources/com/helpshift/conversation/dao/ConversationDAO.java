package com.helpshift.conversation.dao;

import com.helpshift.common.dao.DAOResult;
import com.helpshift.conversation.activeconversation.ConversationUpdate;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.MessageType;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.pollersync.model.MessagesDiff;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public interface ConversationDAO {
    void deleteConversation(long j);

    void deleteConversations(long j);

    boolean deleteMessagesForConversation(long j);

    void dropAndCreateDatabase();

    Map<Long, Integer> getMessagesCountForConversations(List<Long> list);

    Map<Long, Integer> getMessagesCountForConversations(List<Long> list, String[] strArr);

    Long getOldestConversationCreatedAtTime(long j);

    String getOldestMessageCursor(long j);

    void insertConversation(Conversation conversation);

    boolean insertConversations(List<Conversation> list);

    void insertOrUpdateMessage(MessageDM messageDM);

    boolean insertOrUpdateMessages(List<MessageDM> list);

    void insertPreIssueConversation(Conversation conversation);

    Conversation readConversation(long j);

    Conversation readConversationWithoutMessages(Long l);

    Conversation readConversationWithoutMessages(String str);

    DAOResult<List<Conversation>> readConversationsWithoutMessages(long j);

    MessageDM readMessage(String str);

    DAOResult<List<MessageDM>> readMessages(long j);

    List<MessageDM> readMessages(long j, MessageType messageType);

    List<MessageDM> readMessagesForConversations(List<Long> list);

    Conversation readPreConversationWithoutMessages(String str);

    void updateConversation(Conversation conversation);

    void updateConversationWithoutMessages(Conversation conversation);

    void updateConversations(List<Conversation> list, Map<Long, ConversationUpdate> map);

    boolean updateConversations(Map<Conversation, MessagesDiff> map, List<Conversation> list);

    void updateLastUserActivityTimeInConversation(Long l, long j);
}
