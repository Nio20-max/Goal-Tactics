package com.helpshift.conversation.domainmodel;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.ConversationUtil;
import com.helpshift.conversation.activeconversation.ConversationManager;
import com.helpshift.conversation.activeconversation.ConversationUpdate;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.dto.IssueState;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationHistoryRemoteDataMerger {
    private ConversationManager conversationManager;
    private Domain domain;
    private Platform platform;
    private UserDM userDM;

    public ConversationHistoryRemoteDataMerger(Platform platform, Domain domain, UserDM userDM, ConversationManager conversationManager) {
        this.platform = platform;
        this.domain = domain;
        this.userDM = userDM;
        this.conversationManager = conversationManager;
    }

    public void merge(List<Conversation> list) {
        ConversationUpdate conversationUpdate;
        if (ListUtils.isEmpty(list)) {
            return;
        }
        Set<Conversation> hashSet = new HashSet<>();
        Map<Long, ConversationUpdate> map = new HashMap<>();
        Set<Conversation> hashSet2 = new HashSet<>();
        if (list.size() > 1) {
            ConversationUtil.sortConversationsBasedOnCreatedAt(list);
        }
        List<Conversation> data = this.platform.getConversationDAO().readConversationsWithoutMessages(this.userDM.getLocalId().longValue()).getData();
        ArrayList arrayList = new ArrayList();
        HashMap map2 = new HashMap();
        HashMap map3 = new HashMap();
        for (Conversation conversation : data) {
            if (!StringUtils.isEmpty(conversation.serverId)) {
                map2.put(conversation.serverId, conversation);
            } else if (!StringUtils.isEmpty(conversation.preConversationServerId)) {
                map3.put(conversation.preConversationServerId, conversation);
            }
        }
        for (Conversation conversation2 : list) {
            String str = conversation2.serverId;
            String str2 = conversation2.preConversationServerId;
            Conversation conversation3 = null;
            conversation2.userLocalId = this.userDM.getLocalId().longValue();
            if (map2.containsKey(str)) {
                conversation3 = (Conversation) map2.get(str);
            } else if (map3.containsKey(str2)) {
                conversation3 = (Conversation) map3.get(str2);
            }
            if (conversation3 != null) {
                conversation3.userLocalId = this.userDM.getLocalId().longValue();
                if (map.containsKey(conversation3.localId)) {
                    conversationUpdate = map.get(conversation3.localId);
                } else {
                    conversationUpdate = new ConversationUpdate();
                }
                if (conversation2.isInPreIssueMode()) {
                    if (conversation3.isInPreIssueMode()) {
                        this.conversationManager.mergePreIssue(conversation3, conversation2, false, conversationUpdate);
                    } else if (!ListUtils.isEmpty(conversation2.messageDMs)) {
                        this.conversationManager.updateMessageDMs(conversation3, false, conversation2.messageDMs, conversationUpdate);
                    }
                } else {
                    this.conversationManager.mergeIssue(conversation3, conversation2, false, conversationUpdate);
                }
                hashSet.add(conversation3);
                map.put(conversation3.localId, conversationUpdate);
            } else {
                if (conversation2.isInPreIssueMode()) {
                    conversation2.lastUserActivityTime = System.currentTimeMillis();
                    if (conversation2.state == IssueState.RESOLUTION_REQUESTED) {
                        conversation2.state = IssueState.RESOLUTION_ACCEPTED;
                    }
                }
                IssueState issueState = conversation2.state;
                if (issueState == IssueState.RESOLUTION_ACCEPTED || issueState == IssueState.RESOLUTION_REJECTED || issueState == IssueState.REJECTED || issueState == IssueState.ARCHIVED) {
                    conversation2.isStartNewConversationClicked = true;
                }
                if (issueState != null && conversation2.isRedacted && conversation2.state == IssueState.RESOLUTION_REQUESTED) {
                    conversation2.isStartNewConversationClicked = true;
                    conversation2.state = IssueState.RESOLUTION_ACCEPTED;
                }
                if (conversation2.shouldAllowNewConversationCreation) {
                    conversation2.isStartNewConversationClicked = true;
                    conversation2.state = IssueState.CLOSED;
                }
                arrayList.add(conversation2);
            }
        }
        if (arrayList.size() <= 1) {
            hashSet2.addAll(arrayList);
            putConversations(hashSet, hashSet2, map);
            return;
        }
        ArrayList arrayList2 = new ArrayList(arrayList);
        for (int size = arrayList2.size() - 1; size >= 0; size--) {
            Conversation conversation4 = (Conversation) arrayList2.get(size);
            if (!conversation4.isInPreIssueMode()) {
                int i = size - 1;
                while (true) {
                    if (i >= 0) {
                        Conversation conversation5 = (Conversation) arrayList2.get(i);
                        if (!StringUtils.isEmpty(conversation4.preConversationServerId) && conversation4.preConversationServerId.equals(conversation5.preConversationServerId) && conversation4.serverId.equals(conversation5.serverId)) {
                            conversation4.messageDMs.addAll(conversation5.messageDMs);
                            arrayList.remove(i);
                            break;
                        }
                        i--;
                    }
                }
            }
        }
        hashSet2.addAll(arrayList);
        putConversations(hashSet, hashSet2, map);
    }

    void putConversations(Set<Conversation> set, Set<Conversation> set2, Map<Long, ConversationUpdate> map) {
        Iterator<Conversation> it = set.iterator();
        while (it.hasNext()) {
            it.next().userLocalId = this.userDM.getLocalId().longValue();
        }
        Iterator<Conversation> it2 = set2.iterator();
        while (it2.hasNext()) {
            it2.next().userLocalId = this.userDM.getLocalId().longValue();
        }
        this.platform.getConversationDAO().updateConversations(new ArrayList(set), map);
        this.platform.getConversationDAO().insertConversations(new ArrayList(set2));
    }
}
