package com.helpshift.common.platform;

import android.content.Context;
import com.helpshift.common.conversation.ConversationDB;
import com.helpshift.common.dao.DAOResult;
import com.helpshift.conversation.activeconversation.ConversationUpdate;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.MessageType;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.dao.ConversationDAO;
import com.helpshift.conversation.dao.FAQSuggestionsDAO;
import com.helpshift.conversation.pollersync.model.MessagesDiff;
import com.helpshift.support.Faq;
import com.helpshift.util.HSLogger;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/* JADX INFO: loaded from: classes2.dex */
class AndroidConversationDAO implements ConversationDAO, FAQSuggestionsDAO {
    private final String TAG = "Helpshift_CnDAO";
    private final ConversationDB conversationDB;

    AndroidConversationDAO(Context context) {
        this.conversationDB = ConversationDB.getInstance(context);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public void dropAndCreateDatabase() {
        this.conversationDB.dropAndCreateDatabase();
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public synchronized Conversation readConversationWithoutMessages(String str) {
        return this.conversationDB.readConversationWithServerId(str);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public synchronized Conversation readPreConversationWithoutMessages(String str) {
        return this.conversationDB.readPreConversationWithServerId(str);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public Conversation readConversationWithoutMessages(Long l) {
        return this.conversationDB.readConversationWithLocalId(l);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public synchronized Conversation readConversation(long j) {
        Conversation conversationWithLocalId = this.conversationDB.readConversationWithLocalId(Long.valueOf(j));
        if (conversationWithLocalId == null) {
            return null;
        }
        conversationWithLocalId.setMessageDMs(this.conversationDB.readMessages(j).getData());
        return conversationWithLocalId;
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public synchronized void deleteConversation(long j) {
        if (j != 0) {
            this.conversationDB.deleteConversationWithLocalId(j);
        }
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public synchronized DAOResult<List<Conversation>> readConversationsWithoutMessages(long j) {
        return this.conversationDB.readConversationsWithLocalId(j);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public synchronized void insertPreIssueConversation(Conversation conversation) {
        if (conversation.localUUID == null) {
            conversation.localUUID = UUID.randomUUID().toString();
        }
        long jInsertConversation = this.conversationDB.insertConversation(conversation);
        if (jInsertConversation != -1) {
            conversation.setLocalId(jInsertConversation);
        }
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public synchronized Map<Long, Integer> getMessagesCountForConversations(List<Long> list) {
        return this.conversationDB.getMessagesCountForConversations(list, null);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public synchronized Map<Long, Integer> getMessagesCountForConversations(List<Long> list, String[] strArr) {
        return this.conversationDB.getMessagesCountForConversations(list, strArr);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public synchronized DAOResult<List<MessageDM>> readMessages(long j) {
        return this.conversationDB.readMessages(j);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public List<MessageDM> readMessages(long j, MessageType messageType) {
        return this.conversationDB.readMessages(j, messageType);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public List<MessageDM> readMessagesForConversations(List<Long> list) {
        return this.conversationDB.readMessagesForConversations(list);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public MessageDM readMessage(String str) {
        return this.conversationDB.readMessageWithServerId(str).getData();
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public synchronized void insertOrUpdateMessage(MessageDM messageDM) {
        Long l = messageDM.localId;
        String str = messageDM.serverId;
        if (l == null && str == null) {
            long jInsertMessage = this.conversationDB.insertMessage(messageDM);
            if (jInsertMessage != -1) {
                messageDM.localId = Long.valueOf(jInsertMessage);
            }
        } else if (l == null && str != null) {
            MessageDM data = this.conversationDB.readMessageWithServerId(str).getData();
            if (data == null) {
                long jInsertMessage2 = this.conversationDB.insertMessage(messageDM);
                if (jInsertMessage2 != -1) {
                    messageDM.localId = Long.valueOf(jInsertMessage2);
                }
            } else {
                messageDM.localId = data.localId;
                this.conversationDB.updateMessage(messageDM);
            }
        } else if (this.conversationDB.readMessageWithLocalId(l).getData() == null) {
            long jInsertMessage3 = this.conversationDB.insertMessage(messageDM);
            if (jInsertMessage3 != -1) {
                messageDM.localId = Long.valueOf(jInsertMessage3);
            }
        } else {
            this.conversationDB.updateMessage(messageDM);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x0075, code lost:
    
        r9 = r8.conversationDB.insertMessages(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x007f, code lost:
    
        if (r9.isSuccess() != false) goto L37;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0082, code lost:
    
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0083, code lost:
    
        r9 = r9.getData();
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x008d, code lost:
    
        if (r3 >= r0.size()) goto L72;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x008f, code lost:
    
        r4 = r9.get(r3).longValue();
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x009d, code lost:
    
        if (r4 != (-1)) goto L43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00a0, code lost:
    
        ((com.helpshift.conversation.activeconversation.message.MessageDM) r0.get(r3)).localId = java.lang.Long.valueOf(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00ac, code lost:
    
        r3 = r3 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00b6, code lost:
    
        return r8.conversationDB.updateMessages(r1);
     */
    @Override // com.helpshift.conversation.dao.ConversationDAO
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized boolean insertOrUpdateMessages(java.util.List<com.helpshift.conversation.activeconversation.message.MessageDM> r9) {
        /*
            r8 = this;
            monitor-enter(r8)
            int r0 = r9.size()     // Catch: java.lang.Throwable -> Lb7
            if (r0 != 0) goto La
            monitor-exit(r8)
            r9 = 1
            return r9
        La:
            java.util.ArrayList r0 = new java.util.ArrayList     // Catch: java.lang.Throwable -> Lb7
            r0.<init>()     // Catch: java.lang.Throwable -> Lb7
            java.util.ArrayList r1 = new java.util.ArrayList     // Catch: java.lang.Throwable -> Lb7
            r1.<init>()     // Catch: java.lang.Throwable -> Lb7
            java.util.Iterator r9 = r9.iterator()     // Catch: java.lang.Throwable -> Lb7
        L18:
            boolean r2 = r9.hasNext()     // Catch: java.lang.Throwable -> Lb7
            r3 = 0
            if (r2 == 0) goto L75
            java.lang.Object r2 = r9.next()     // Catch: java.lang.Throwable -> Lb7
            com.helpshift.conversation.activeconversation.message.MessageDM r2 = (com.helpshift.conversation.activeconversation.message.MessageDM) r2     // Catch: java.lang.Throwable -> Lb7
            java.lang.Long r4 = r2.localId     // Catch: java.lang.Throwable -> Lb7
            java.lang.String r5 = r2.serverId     // Catch: java.lang.Throwable -> Lb7
            if (r4 != 0) goto L31
            if (r5 != 0) goto L31
            r0.add(r2)     // Catch: java.lang.Throwable -> Lb7
            goto L18
        L31:
            if (r4 != 0) goto L57
            if (r5 == 0) goto L57
            com.helpshift.common.conversation.ConversationDB r4 = r8.conversationDB     // Catch: java.lang.Throwable -> Lb7
            com.helpshift.common.dao.DAOResult r4 = r4.readMessageWithServerId(r5)     // Catch: java.lang.Throwable -> Lb7
            boolean r5 = r4.isSuccess()     // Catch: java.lang.Throwable -> Lb7
            if (r5 != 0) goto L43
            monitor-exit(r8)
            return r3
        L43:
            java.lang.Object r3 = r4.getData()     // Catch: java.lang.Throwable -> Lb7
            com.helpshift.conversation.activeconversation.message.MessageDM r3 = (com.helpshift.conversation.activeconversation.message.MessageDM) r3     // Catch: java.lang.Throwable -> Lb7
            if (r3 != 0) goto L4f
            r0.add(r2)     // Catch: java.lang.Throwable -> Lb7
            goto L18
        L4f:
            java.lang.Long r3 = r3.localId     // Catch: java.lang.Throwable -> Lb7
            r2.localId = r3     // Catch: java.lang.Throwable -> Lb7
            r1.add(r2)     // Catch: java.lang.Throwable -> Lb7
            goto L18
        L57:
            com.helpshift.common.conversation.ConversationDB r5 = r8.conversationDB     // Catch: java.lang.Throwable -> Lb7
            com.helpshift.common.dao.DAOResult r4 = r5.readMessageWithLocalId(r4)     // Catch: java.lang.Throwable -> Lb7
            boolean r5 = r4.isSuccess()     // Catch: java.lang.Throwable -> Lb7
            if (r5 != 0) goto L65
            monitor-exit(r8)
            return r3
        L65:
            java.lang.Object r3 = r4.getData()     // Catch: java.lang.Throwable -> Lb7
            com.helpshift.conversation.activeconversation.message.MessageDM r3 = (com.helpshift.conversation.activeconversation.message.MessageDM) r3     // Catch: java.lang.Throwable -> Lb7
            if (r3 != 0) goto L71
            r0.add(r2)     // Catch: java.lang.Throwable -> Lb7
            goto L18
        L71:
            r1.add(r2)     // Catch: java.lang.Throwable -> Lb7
            goto L18
        L75:
            com.helpshift.common.conversation.ConversationDB r9 = r8.conversationDB     // Catch: java.lang.Throwable -> Lb7
            com.helpshift.common.dao.DAOResult r9 = r9.insertMessages(r0)     // Catch: java.lang.Throwable -> Lb7
            boolean r2 = r9.isSuccess()     // Catch: java.lang.Throwable -> Lb7
            if (r2 != 0) goto L83
            monitor-exit(r8)
            return r3
        L83:
            java.lang.Object r9 = r9.getData()     // Catch: java.lang.Throwable -> Lb7
            java.util.List r9 = (java.util.List) r9     // Catch: java.lang.Throwable -> Lb7
        L89:
            int r2 = r0.size()     // Catch: java.lang.Throwable -> Lb7
            if (r3 >= r2) goto Laf
            java.lang.Object r2 = r9.get(r3)     // Catch: java.lang.Throwable -> Lb7
            java.lang.Long r2 = (java.lang.Long) r2     // Catch: java.lang.Throwable -> Lb7
            long r4 = r2.longValue()     // Catch: java.lang.Throwable -> Lb7
            r6 = -1
            int r2 = (r4 > r6 ? 1 : (r4 == r6 ? 0 : -1))
            if (r2 != 0) goto La0
            goto Lac
        La0:
            java.lang.Object r2 = r0.get(r3)     // Catch: java.lang.Throwable -> Lb7
            com.helpshift.conversation.activeconversation.message.MessageDM r2 = (com.helpshift.conversation.activeconversation.message.MessageDM) r2     // Catch: java.lang.Throwable -> Lb7
            java.lang.Long r4 = java.lang.Long.valueOf(r4)     // Catch: java.lang.Throwable -> Lb7
            r2.localId = r4     // Catch: java.lang.Throwable -> Lb7
        Lac:
            int r3 = r3 + 1
            goto L89
        Laf:
            com.helpshift.common.conversation.ConversationDB r9 = r8.conversationDB     // Catch: java.lang.Throwable -> Lb7
            boolean r9 = r9.updateMessages(r1)     // Catch: java.lang.Throwable -> Lb7
            monitor-exit(r8)
            return r9
        Lb7:
            r9 = move-exception
            monitor-exit(r8)
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.common.platform.AndroidConversationDAO.insertOrUpdateMessages(java.util.List):boolean");
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public void insertConversation(Conversation conversation) {
        String str = conversation.serverId;
        String str2 = conversation.preConversationServerId;
        if (str == null && str2 == null) {
            return;
        }
        if (conversation.localUUID == null) {
            conversation.localUUID = UUID.randomUUID().toString();
        }
        long jInsertConversation = this.conversationDB.insertConversation(conversation);
        if (jInsertConversation != -1) {
            conversation.setLocalId(jInsertConversation);
        }
        insertOrUpdateMessages(conversation.messageDMs);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public void updateConversation(Conversation conversation) {
        String str = conversation.serverId;
        String str2 = conversation.preConversationServerId;
        if (str == null && str2 == null) {
            return;
        }
        this.conversationDB.updateConversation(conversation);
        insertOrUpdateMessages(conversation.messageDMs);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public void updateLastUserActivityTimeInConversation(Long l, long j) {
        if (l == null) {
            HSLogger.e("Helpshift_CnDAO", "Trying to update last user activity time but localId is null");
        } else {
            this.conversationDB.updateLastUserActivityTimeInConversation(l, j);
        }
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public void updateConversationWithoutMessages(Conversation conversation) {
        this.conversationDB.updateConversation(conversation);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public boolean insertConversations(List<Conversation> list) {
        if (list.size() == 0) {
            return true;
        }
        for (Conversation conversation : list) {
            if (conversation.localUUID == null) {
                conversation.localUUID = UUID.randomUUID().toString();
            }
        }
        DAOResult<List<Long>> dAOResultInsertConversations = this.conversationDB.insertConversations(list);
        if (!dAOResultInsertConversations.isSuccess()) {
            return false;
        }
        List<Long> data = dAOResultInsertConversations.getData();
        HashSet hashSet = new HashSet();
        for (int i = 0; i < list.size(); i++) {
            long jLongValue = data.get(i).longValue();
            Conversation conversation2 = list.get(i);
            if (jLongValue == -1) {
                hashSet.add(conversation2);
            } else {
                conversation2.setLocalId(jLongValue);
            }
        }
        ArrayList arrayList = new ArrayList();
        for (Conversation conversation3 : list) {
            if (!hashSet.contains(conversation3)) {
                arrayList.addAll(conversation3.messageDMs);
            }
        }
        return insertOrUpdateMessages(arrayList);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public void updateConversations(List<Conversation> list, Map<Long, ConversationUpdate> map) {
        if (list.size() == 0) {
            return;
        }
        this.conversationDB.updateConversations(list);
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (Conversation conversation : list) {
            if (map.containsKey(conversation.localId)) {
                ConversationUpdate conversationUpdate = map.get(conversation.localId);
                arrayList.addAll(conversationUpdate.newMessageDMs);
                arrayList2.addAll(conversationUpdate.updatedMessageDMs);
            }
        }
        DAOResult<List<Long>> dAOResultInsertMessages = this.conversationDB.insertMessages(arrayList);
        for (int i = 0; i < arrayList.size(); i++) {
            long jLongValue = dAOResultInsertMessages.getData().get(i).longValue();
            if (jLongValue != -1) {
                ((MessageDM) arrayList.get(i)).localId = Long.valueOf(jLongValue);
            }
        }
        this.conversationDB.updateMessages(arrayList2);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public boolean updateConversations(Map<Conversation, MessagesDiff> map, List<Conversation> list) {
        MessagesDiff messagesDiff;
        if (list.size() == 0) {
            return true;
        }
        if (!this.conversationDB.updateConversations(list)) {
            return false;
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (Conversation conversation : list) {
            if (map.containsKey(conversation) && (messagesDiff = map.get(conversation)) != null) {
                arrayList.addAll(messagesDiff.newMessages);
                arrayList2.addAll(messagesDiff.updatedMessages);
            }
        }
        DAOResult<List<Long>> dAOResultInsertMessages = this.conversationDB.insertMessages(arrayList);
        if (!dAOResultInsertMessages.isSuccess()) {
            return false;
        }
        for (int i = 0; i < arrayList.size(); i++) {
            long jLongValue = dAOResultInsertMessages.getData().get(i).longValue();
            if (jLongValue != -1) {
                ((MessageDM) arrayList.get(i)).localId = Long.valueOf(jLongValue);
            }
        }
        return this.conversationDB.updateMessages(arrayList2);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public void deleteConversations(long j) {
        if (j > 0) {
            this.conversationDB.deleteConversations(j);
        }
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public String getOldestMessageCursor(long j) {
        return this.conversationDB.getOldestMessageCursor(j);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public Long getOldestConversationCreatedAtTime(long j) {
        return this.conversationDB.getOldestConversationEpochCreatedAtTime(j);
    }

    @Override // com.helpshift.conversation.dao.ConversationDAO
    public boolean deleteMessagesForConversation(long j) {
        return this.conversationDB.deleteMessagesForConversation(j);
    }

    @Override // com.helpshift.conversation.dao.FAQSuggestionsDAO
    public Object getFAQ(String str, String str2) {
        return this.conversationDB.getAdminFAQSuggestion(str, str2);
    }

    @Override // com.helpshift.conversation.dao.FAQSuggestionsDAO
    public void insertOrUpdateFAQ(Object obj) {
        this.conversationDB.insertOrUpdateAdminFAQSuggestion((Faq) obj);
    }

    @Override // com.helpshift.conversation.dao.FAQSuggestionsDAO
    public void removeFAQ(String str, String str2) {
        this.conversationDB.removeAdminFAQSuggestion(str, str2);
    }
}
