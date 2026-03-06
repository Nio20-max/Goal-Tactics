package com.helpshift.conversation.loaders;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.conversation.ConversationUtil;
import com.helpshift.conversation.IssueType;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.dao.ConversationDAO;
import com.helpshift.conversation.dto.IssueState;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationHistoryDBLoader extends ConversationDBLoader {
    private UserDM userDM;

    public ConversationHistoryDBLoader(UserDM userDM, ConversationDAO conversationDAO) {
        super(conversationDAO);
        this.userDM = userDM;
    }

    @Override // com.helpshift.conversation.loaders.ConversationDBLoader
    public List<Conversation> fetchMessages(String str, String str2, long j) {
        List<Conversation> listFilterOutMultipleOpenConversations;
        List<Conversation> data = this.conversationDAO.readConversationsWithoutMessages(this.userDM.getLocalId().longValue()).getData();
        if (data.isEmpty()) {
            return new ArrayList();
        }
        ConversationUtil.sortConversationsBasedOnCreatedAt(data);
        boolean zIsEmpty = StringUtils.isEmpty(str);
        ArrayList arrayList = new ArrayList();
        if (!zIsEmpty) {
            data = filterOutConversationCreatedAfterCursor(str, data);
            if (!ListUtils.isEmpty(data)) {
                Conversation conversation = data.get(data.size() - 1);
                if (conversation.getCreatedAt().equals(str)) {
                    List<MessageDM> listFilterMessages = filterMessages(str2, j, this.conversationDAO.readMessages(conversation.localId.longValue()).getData());
                    if (!ListUtils.isEmpty(listFilterMessages)) {
                        conversation.setMessageDMs(listFilterMessages);
                        arrayList.add(conversation);
                        j -= (long) listFilterMessages.size();
                    }
                    data.remove(conversation);
                }
            }
        }
        if (j < 1) {
            return arrayList;
        }
        if (zIsEmpty) {
            int size = data.size();
            if (size > 1) {
                int i = size - 1;
                Conversation conversation2 = data.get(i);
                data = filterOutFullPrivacyEnabledConversations(data.subList(0, i));
                data.add(conversation2);
            }
        } else {
            data = filterOutFullPrivacyEnabledConversations(data);
        }
        List<Conversation> listFilterOutRejectedEmptyPreIssues = filterOutRejectedEmptyPreIssues(data);
        if (zIsEmpty) {
            Conversation lastOpenConversation = getLastOpenConversation(listFilterOutRejectedEmptyPreIssues);
            listFilterOutMultipleOpenConversations = filterOutMultipleOpenConversations(listFilterOutRejectedEmptyPreIssues);
            if (lastOpenConversation != null) {
                listFilterOutMultipleOpenConversations.add(lastOpenConversation);
            }
        } else {
            listFilterOutMultipleOpenConversations = filterOutMultipleOpenConversations(listFilterOutRejectedEmptyPreIssues);
        }
        List<Conversation> listFilterOutConversationsForWhichMessagesLimitExceed = filterOutConversationsForWhichMessagesLimitExceed(j, listFilterOutMultipleOpenConversations);
        ArrayList arrayList2 = new ArrayList();
        HashMap map = new HashMap();
        for (Conversation conversation3 : listFilterOutConversationsForWhichMessagesLimitExceed) {
            arrayList2.add(conversation3.localId);
            map.put(conversation3.localId, conversation3);
        }
        for (MessageDM messageDM : this.conversationDAO.readMessagesForConversations(arrayList2)) {
            if (map.containsKey(messageDM.conversationLocalId)) {
                ((Conversation) map.get(messageDM.conversationLocalId)).messageDMs.add(messageDM);
            }
        }
        int size2 = 0;
        for (int size3 = listFilterOutConversationsForWhichMessagesLimitExceed.size() - 1; size3 >= 0; size3--) {
            Conversation conversation4 = listFilterOutConversationsForWhichMessagesLimitExceed.get(size3);
            if (conversation4.messageDMs.size() + size2 > j) {
                ConversationUtil.sortMessagesBasedOnCreatedAt(conversation4.messageDMs);
                ArrayList arrayList3 = new ArrayList(conversation4.messageDMs);
                conversation4.messageDMs.clear();
                conversation4.messageDMs.addAll(arrayList3.subList(arrayList3.size() - ((int) (j - ((long) size2))), arrayList3.size()));
            } else {
                size2 += conversation4.messageDMs.size();
            }
        }
        arrayList.addAll(0, listFilterOutConversationsForWhichMessagesLimitExceed);
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            ConversationUtil.sortMessagesBasedOnCreatedAt(((Conversation) it.next()).messageDMs);
        }
        return arrayList;
    }

    private List<Conversation> filterOutConversationsForWhichMessagesLimitExceed(long j, List<Conversation> list) {
        ArrayList arrayList = new ArrayList();
        Iterator<Conversation> it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(it.next().localId);
        }
        Map<Long, Integer> messagesCountForConversations = this.conversationDAO.getMessagesCountForConversations(arrayList);
        int i = 0;
        ArrayList arrayList2 = new ArrayList();
        for (int size = list.size() - 1; size >= 0; size--) {
            Conversation conversation = list.get(size);
            int iIntValue = messagesCountForConversations.get(conversation.localId).intValue();
            arrayList2.add(conversation);
            i += iIntValue;
            if (i >= j) {
                break;
            }
        }
        Collections.reverse(arrayList2);
        return arrayList2;
    }

    private List<Conversation> filterOutConversationCreatedAfterCursor(String str, List<Conversation> list) {
        if (ListUtils.isEmpty(list) || StringUtils.isEmpty(str)) {
            return list;
        }
        long jConvertToEpochTime = HSDateFormatSpec.convertToEpochTime(str);
        ArrayList arrayList = new ArrayList();
        for (Conversation conversation : list) {
            if (compareEpochTime(conversation.getEpochCreatedAtTime(), jConvertToEpochTime) > 0) {
                break;
            }
            arrayList.add(conversation);
        }
        return arrayList;
    }

    private List<Conversation> filterOutFullPrivacyEnabledConversations(List<Conversation> list) {
        ArrayList arrayList = new ArrayList();
        if (list.isEmpty()) {
            return arrayList;
        }
        int size = list.size();
        for (int i = 0; i < size; i++) {
            Conversation conversation = list.get(i);
            if (!conversation.wasFullPrivacyEnabledAtCreation) {
                arrayList.add(conversation);
            }
        }
        return arrayList;
    }

    private List<Conversation> filterOutRejectedEmptyPreIssues(List<Conversation> list) {
        ArrayList arrayList = new ArrayList();
        if (list.isEmpty()) {
            return arrayList;
        }
        ArrayList arrayList2 = new ArrayList();
        for (Conversation conversation : list) {
            if (conversation.state == IssueState.REJECTED && IssueType.PRE_ISSUE.equals(conversation.issueType)) {
                arrayList2.add(conversation.localId);
            }
        }
        if (arrayList2.isEmpty()) {
            arrayList.addAll(list);
            return arrayList;
        }
        Map<Long, Integer> userMessageCountForConversationLocalIds = ConversationUtil.getUserMessageCountForConversationLocalIds(this.conversationDAO, arrayList2);
        for (Conversation conversation2 : list) {
            Integer num = userMessageCountForConversationLocalIds.get(conversation2.localId);
            if (num == null || num.intValue() != 0) {
                arrayList.add(conversation2);
            }
        }
        return arrayList;
    }

    private List<Conversation> filterOutMultipleOpenConversations(List<Conversation> list) {
        ArrayList arrayList = new ArrayList();
        if (list.isEmpty()) {
            return arrayList;
        }
        for (Conversation conversation : list) {
            if (!conversation.isIssueInProgress()) {
                arrayList.add(conversation);
            }
        }
        return arrayList;
    }

    private Conversation getLastOpenConversation(List<Conversation> list) {
        Conversation conversation = null;
        if (ListUtils.isEmpty(list)) {
            return null;
        }
        for (Conversation conversation2 : list) {
            if (conversation2.isIssueInProgress()) {
                conversation = conversation2;
            }
        }
        return conversation;
    }
}
