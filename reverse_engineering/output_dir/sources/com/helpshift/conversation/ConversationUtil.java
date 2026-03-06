package com.helpshift.conversation;

import com.helpshift.common.platform.Platform;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.MessageType;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.dao.ConversationDAO;
import com.helpshift.conversation.dto.IssueState;
import com.helpshift.conversation.states.ConversationCSATState;
import com.helpshift.util.ListUtils;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationUtil {
    private static Comparator<Conversation> conversationComparator;
    private static Comparator<MessageDM> messageDMComparator;
    private static Set<IssueState> validConversationStatesForResolutionExpiry = new HashSet(Arrays.asList(IssueState.RESOLUTION_REQUESTED, IssueState.RESOLUTION_REJECTED));
    private static Set<IssueState> validConversationStatesForCSATExpiry = new HashSet(Arrays.asList(IssueState.RESOLUTION_ACCEPTED, IssueState.RESOLUTION_REJECTED, IssueState.RESOLUTION_EXPIRED));

    /* JADX INFO: Access modifiers changed from: private */
    public static int compareEpochTime(long j, long j2) {
        if (j > j2) {
            return 1;
        }
        return j < j2 ? -1 : 0;
    }

    private static void checkAndUpdateCachedConversationComparator() {
        if (conversationComparator == null) {
            conversationComparator = new Comparator<Conversation>() { // from class: com.helpshift.conversation.ConversationUtil.1
                @Override // java.util.Comparator
                public int compare(Conversation conversation, Conversation conversation2) {
                    return ConversationUtil.compareEpochTime(conversation.getEpochCreatedAtTime(), conversation2.getEpochCreatedAtTime());
                }
            };
        }
    }

    public static void sortConversationsBasedOnCreatedAt(List<Conversation> list) {
        if (list == null || list.size() <= 1) {
            return;
        }
        checkAndUpdateCachedConversationComparator();
        Collections.sort(list, conversationComparator);
    }

    public static Conversation getLastConversationBasedOnCreatedAt(Collection<Conversation> collection) {
        checkAndUpdateCachedConversationComparator();
        return (Conversation) Collections.max(collection, conversationComparator);
    }

    public static void sortMessagesBasedOnCreatedAt(List<MessageDM> list) {
        if (messageDMComparator == null) {
            messageDMComparator = new Comparator<MessageDM>() { // from class: com.helpshift.conversation.ConversationUtil.2
                @Override // java.util.Comparator
                public int compare(MessageDM messageDM, MessageDM messageDM2) {
                    return ConversationUtil.compareEpochTime(messageDM.getEpochCreatedAtTime(), messageDM2.getEpochCreatedAtTime());
                }
            };
        }
        Collections.sort(list, messageDMComparator);
    }

    public static int getUserMessageCountForConversationLocalId(ConversationDAO conversationDAO, Long l) {
        Integer num;
        if (l == null || (num = getUserMessageCountForConversationLocalIds(conversationDAO, Collections.singletonList(l)).get(l)) == null) {
            return 0;
        }
        return num.intValue();
    }

    public static Map<Long, Integer> getUserMessageCountForConversationLocalIds(ConversationDAO conversationDAO, List<Long> list) {
        return conversationDAO.getMessagesCountForConversations(list, new String[]{MessageType.USER_TEXT.getValue(), MessageType.ACCEPTED_APP_REVIEW.getValue(), MessageType.SCREENSHOT.getValue(), MessageType.USER_RESP_FOR_TEXT_INPUT.getValue(), MessageType.USER_RESP_FOR_OPTION_INPUT.getValue()});
    }

    public static boolean isInProgressState(IssueState issueState) {
        return issueState == IssueState.NEW || issueState == IssueState.NEW_FOR_AGENT || issueState == IssueState.AGENT_REPLIED || issueState == IssueState.WAITING_FOR_AGENT || issueState == IssueState.PENDING_REASSIGNMENT || issueState == IssueState.COMPLETED_ISSUE_CREATED;
    }

    public static boolean shouldPollActivelyForConversations(List<Conversation> list) {
        if (ListUtils.isEmpty(list)) {
            return false;
        }
        for (Conversation conversation : list) {
            if (conversation.isIssueInProgress()) {
                return true;
            }
            if (conversation.state == IssueState.RESOLUTION_REQUESTED && conversation.isFeedbackBotEnabled) {
                return true;
            }
        }
        return false;
    }

    public static boolean isResolutionQuestionExpired(Platform platform, Conversation conversation) {
        if (conversation.isFeedbackBotEnabled) {
            return false;
        }
        if (conversation.state == IssueState.RESOLUTION_EXPIRED) {
            return true;
        }
        return validConversationStatesForResolutionExpiry.contains(conversation.state) && conversation.resolutionExpiryAt != null && HSDateFormatSpec.getCurrentAdjustedTimeInMillis(platform) > conversation.resolutionExpiryAt.longValue();
    }

    public static boolean isCSATTimerExpired(Platform platform, Conversation conversation) {
        return (conversation.isFeedbackBotEnabled || conversation.csatState == ConversationCSATState.SUBMITTED_SYNCED || !validConversationStatesForCSATExpiry.contains(conversation.state) || conversation.csatExpiryAt == null || HSDateFormatSpec.getCurrentAdjustedTimeInMillis(platform) <= conversation.csatExpiryAt.longValue()) ? false : true;
    }
}
