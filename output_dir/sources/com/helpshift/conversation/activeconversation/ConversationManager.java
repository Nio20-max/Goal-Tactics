package com.helpshift.conversation.activeconversation;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.analytics.AnalyticsEventType;
import com.helpshift.bots.BotControlActions;
import com.helpshift.campaigns.util.constants.ModelKeys;
import com.helpshift.common.AutoRetryFailedEventDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.domain.idempotent.SuccessOrNonRetriableStatusCodeIdempotentPolicy;
import com.helpshift.common.domain.network.AuthenticationFailureNetwork;
import com.helpshift.common.domain.network.FailedAPICallNetworkDecorator;
import com.helpshift.common.domain.network.GuardAgainstCSATExpiryNetwork;
import com.helpshift.common.domain.network.GuardOKNetwork;
import com.helpshift.common.domain.network.IdempotentNetwork;
import com.helpshift.common.domain.network.NetworkDataRequestUtil;
import com.helpshift.common.domain.network.POSTNetwork;
import com.helpshift.common.domain.network.PUTNetwork;
import com.helpshift.common.domain.network.TSCorrectedNetwork;
import com.helpshift.common.exception.ExceptionType;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.platform.network.RequestData;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.conversation.ConversationUtil;
import com.helpshift.conversation.activeconversation.message.AcceptedAppReviewMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminActionCardMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminBotControlMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminCSATMessageWithOptions;
import com.helpshift.conversation.activeconversation.message.AdminImageAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminMessageWithOptionInputDM;
import com.helpshift.conversation.activeconversation.message.AdminMessageWithTextInputDM;
import com.helpshift.conversation.activeconversation.message.AttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.Author;
import com.helpshift.conversation.activeconversation.message.AutoRetriableMessageDM;
import com.helpshift.conversation.activeconversation.message.AvatarImageDownloader;
import com.helpshift.conversation.activeconversation.message.ConfirmationAcceptedMessageDM;
import com.helpshift.conversation.activeconversation.message.ConfirmationRejectedMessageDM;
import com.helpshift.conversation.activeconversation.message.FAQListMessageDM;
import com.helpshift.conversation.activeconversation.message.FollowupAcceptedMessageDM;
import com.helpshift.conversation.activeconversation.message.FollowupRejectedMessageDM;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.MessageType;
import com.helpshift.conversation.activeconversation.message.OptionInputMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestAppReviewMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestForReopenMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.ScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.UnsupportedAdminMessageWithInputDM;
import com.helpshift.conversation.activeconversation.message.UserAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.UserBotControlMessageDM;
import com.helpshift.conversation.activeconversation.message.UserMessageDM;
import com.helpshift.conversation.activeconversation.message.UserMessageState;
import com.helpshift.conversation.activeconversation.message.UserResponseMessageForCSATInput;
import com.helpshift.conversation.activeconversation.message.UserResponseMessageForOptionInput;
import com.helpshift.conversation.activeconversation.message.UserResponseMessageForTextInputDM;
import com.helpshift.conversation.activeconversation.message.UserSmartIntentMessageDM;
import com.helpshift.conversation.activeconversation.message.input.CSATRatingsInput;
import com.helpshift.conversation.activeconversation.message.input.OptionInput;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.dao.ConversationDAO;
import com.helpshift.conversation.domainmodel.ConversationController;
import com.helpshift.conversation.dto.AttachmentPickerFile;
import com.helpshift.conversation.dto.IssueState;
import com.helpshift.conversation.states.ConversationCSATState;
import com.helpshift.conversation.util.predicate.MessagePredicates;
import com.helpshift.db.conversation.tables.MessagesTable;
import com.helpshift.util.Callback;
import com.helpshift.util.FileUtil;
import com.helpshift.util.Filters;
import com.helpshift.util.HSLogger;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import com.helpshift.util.ValuePair;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationManager {
    private static final String TAG = "Helpshift_ConvManager";
    private ConversationDAO conversationDAO;
    Domain domain;
    Platform platform;
    private SDKConfigurationDM sdkConfigurationDM;
    UserDM userDM;

    public ConversationManager(Platform platform, Domain domain, UserDM userDM) {
        this.platform = platform;
        this.domain = domain;
        this.userDM = userDM;
        this.conversationDAO = platform.getConversationDAO();
        this.sdkConfigurationDM = domain.getSDKConfigurationDM();
    }

    public void checkAndReopen(final Conversation conversation, RequestForReopenMessageDM requestForReopenMessageDM, int i, String str, boolean z) {
        if (i == 1) {
            sendReOpenRejectedMessage(conversation, 1, null, requestForReopenMessageDM.serverId);
            return;
        }
        if (z) {
            sendReOpenRejectedMessage(conversation, 4, null, requestForReopenMessageDM.serverId);
            return;
        }
        if (ConversationUtil.isInProgressState(conversation.state) || (conversation.state == IssueState.RESOLUTION_REJECTED && i == 2)) {
            sendReOpenRejectedMessage(conversation, 3, null, requestForReopenMessageDM.serverId);
            return;
        }
        if (str != null && !str.equals(conversation.serverId)) {
            sendReOpenRejectedMessage(conversation, 2, str, requestForReopenMessageDM.serverId);
            return;
        }
        conversation.state = IssueState.WAITING_FOR_AGENT;
        conversation.isConversationEndedDelegateSent = false;
        this.conversationDAO.updateConversationWithoutMessages(conversation);
        ValuePair<String, Long> currentAdjustedTimeForStorage = HSDateFormatSpec.getCurrentAdjustedTimeForStorage(this.platform);
        final FollowupAcceptedMessageDM followupAcceptedMessageDM = new FollowupAcceptedMessageDM(null, currentAdjustedTimeForStorage.first, currentAdjustedTimeForStorage.second.longValue(), new Author("mobile", "", Author.AuthorRole.LOCAL_USER), requestForReopenMessageDM.serverId, 1);
        followupAcceptedMessageDM.conversationLocalId = conversation.localId;
        followupAcceptedMessageDM.setDependencies(this.domain, this.platform);
        addMessageToDBAndGlobalList(conversation, followupAcceptedMessageDM);
        requestForReopenMessageDM.setAnsweredAndNotify(true);
        this.conversationDAO.insertOrUpdateMessage(requestForReopenMessageDM);
        sendMessageWithAutoRetry(new F() { // from class: com.helpshift.conversation.activeconversation.ConversationManager.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                followupAcceptedMessageDM.send(ConversationManager.this.userDM, conversation);
            }
        });
    }

    private void sendReOpenRejectedMessage(final Conversation conversation, int i, String str, String str2) {
        ValuePair<String, Long> currentAdjustedTimeForStorage = HSDateFormatSpec.getCurrentAdjustedTimeForStorage(this.platform);
        final FollowupRejectedMessageDM followupRejectedMessageDM = new FollowupRejectedMessageDM(null, currentAdjustedTimeForStorage.first, currentAdjustedTimeForStorage.second.longValue(), new Author("mobile", "", Author.AuthorRole.LOCAL_USER), str2, 1);
        followupRejectedMessageDM.reason = i;
        followupRejectedMessageDM.openConversationId = str;
        followupRejectedMessageDM.conversationLocalId = conversation.localId;
        followupRejectedMessageDM.setDependencies(this.domain, this.platform);
        addMessageToDBAndGlobalList(conversation, followupRejectedMessageDM);
        sendMessageWithAutoRetry(new F() { // from class: com.helpshift.conversation.activeconversation.ConversationManager.2
            @Override // com.helpshift.common.domain.F
            public void f() {
                followupRejectedMessageDM.send(ConversationManager.this.userDM, conversation);
            }
        });
    }

    private void deleteOptionsForAdminMessageWithOptionsInput(OptionInputMessageDM optionInputMessageDM) {
        if (optionInputMessageDM.referredMessageType == MessageType.ADMIN_TEXT_WITH_OPTION_INPUT) {
            AdminMessageWithOptionInputDM adminMessageWithOptionInputDM = (AdminMessageWithOptionInputDM) this.conversationDAO.readMessage(optionInputMessageDM.serverId);
            adminMessageWithOptionInputDM.input.options.clear();
            this.conversationDAO.insertOrUpdateMessage(adminMessageWithOptionInputDM);
        }
    }

    private void addMessageToDBAndGlobalList(Conversation conversation, MessageDM messageDM) {
        this.conversationDAO.insertOrUpdateMessage(messageDM);
        messageDM.setDependencies(this.domain, this.platform);
        messageDM.addObserver(conversation);
        conversation.messageDMs.add(messageDM);
    }

    private void sendMessageWithAutoRetry(final F f) {
        this.domain.runParallel(new F() { // from class: com.helpshift.conversation.activeconversation.ConversationManager.3
            @Override // com.helpshift.common.domain.F
            public void f() {
                try {
                    f.f();
                } catch (RootAPIException e) {
                    ExceptionType exceptionType = e.exceptionType;
                    if (exceptionType == NetworkException.NON_RETRIABLE || exceptionType == NetworkException.USER_PRE_CONDITION_FAILED) {
                        return;
                    }
                    ConversationManager.this.domain.getAutoRetryFailedEventDM().scheduleRetryTaskForEventType(AutoRetryFailedEventDM.EventType.CONVERSATION, e.getServerStatusCode());
                    throw e;
                }
            }
        });
    }

    public void refreshConversationOnIssueStateUpdate(Conversation conversation) {
        int i = AnonymousClass16.$SwitchMap$com$helpshift$conversation$dto$IssueState[conversation.state.ordinal()];
        if (i == 1) {
            ArrayList arrayList = new ArrayList();
            for (MessageDM messageDM : this.conversationDAO.readMessages(conversation.localId.longValue()).getData()) {
                if ((messageDM instanceof UserMessageDM) && messageDM.serverId == null) {
                    arrayList.add((UserMessageDM) messageDM);
                }
            }
            StringBuilder sb = new StringBuilder();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                sb.append(((UserMessageDM) it.next()).body);
                sb.append("\n");
            }
            this.platform.getConversationInboxDAO().saveConversationArchivalPrefillText(this.userDM.getLocalId().longValue(), sb.toString());
            handleConversationEnded(conversation);
        } else if (i == 2 || i == 3) {
            handleConversationEnded(conversation);
        }
        updateMessagesOnIssueStatusUpdate(conversation);
    }

    public void updateMessagesOnIssueStatusUpdate(Conversation conversation) {
        boolean zShouldEnableMessagesClick = shouldEnableMessagesClick(conversation);
        Iterator<MessageDM> it = conversation.messageDMs.iterator();
        while (it.hasNext()) {
            updateMessageOnConversationUpdate(it.next(), zShouldEnableMessagesClick);
        }
    }

    void updateMessageOnConversationUpdate(MessageDM messageDM, boolean z) {
        updateMessageClickableState(messageDM, z);
        if (messageDM instanceof ScreenshotMessageDM) {
            ((ScreenshotMessageDM) messageDM).checkAndReDownloadImageIfNotExist(this.platform);
        }
    }

    private void updateMessageClickableState(MessageDM messageDM, boolean z) {
        if (messageDM instanceof UserMessageDM) {
            ((UserMessageDM) messageDM).updateState(z);
            return;
        }
        if (messageDM instanceof RequestScreenshotMessageDM) {
            ((RequestScreenshotMessageDM) messageDM).setAttachmentButtonClickable(z);
        } else if (messageDM instanceof ScreenshotMessageDM) {
            ((ScreenshotMessageDM) messageDM).updateState(z);
        } else if (messageDM instanceof UserAttachmentMessageDM) {
            ((UserAttachmentMessageDM) messageDM).updateState(z);
        }
    }

    public void markConversationCSATStateToExpired(Conversation conversation) {
        if (conversation.csatState == ConversationCSATState.EXPIRED) {
            return;
        }
        setCSATState(conversation, ConversationCSATState.EXPIRED);
        sendCSATExpiryEvent(conversation);
    }

    public void sendCSATExpiryEvent(Conversation conversation) {
        HashMap map = new HashMap();
        map.put("type", "csat");
        map.put("id", conversation.getIssueId());
        this.domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.TIMER_EXPIRED, map);
    }

    public void markConversationStateToResolutionExpired(Conversation conversation) {
        if (conversation.state == IssueState.RESOLUTION_EXPIRED) {
            return;
        }
        updateIssueStatus(conversation, IssueState.RESOLUTION_EXPIRED);
        sendResolutionQuestionExpiryEvent(conversation);
        handleConversationEnded(conversation);
    }

    public void sendResolutionQuestionExpiryEvent(Conversation conversation) {
        HashMap map = new HashMap();
        map.put("type", "reopen");
        map.put("id", conversation.getIssueId());
        this.domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.TIMER_EXPIRED, map);
    }

    public void markConversationResolutionStatus(final Conversation conversation, boolean z) {
        ValuePair<String, Long> currentAdjustedTimeForStorage = HSDateFormatSpec.getCurrentAdjustedTimeForStorage(this.platform);
        String str = currentAdjustedTimeForStorage.first;
        long jLongValue = currentAdjustedTimeForStorage.second.longValue();
        if (z) {
            sendConfirmationAcceptedMessageAndDelegates(conversation);
            updateIssueStatus(conversation, IssueState.RESOLUTION_ACCEPTED);
            return;
        }
        final ConfirmationRejectedMessageDM confirmationRejectedMessageDM = new ConfirmationRejectedMessageDM("Did not accept the solution", str, jLongValue, new Author("mobile", "", Author.AuthorRole.SYSTEM), 1);
        confirmationRejectedMessageDM.conversationLocalId = conversation.localId;
        addMessageToDbAndUI(conversation, confirmationRejectedMessageDM);
        sendMessageWithAutoRetry(new F() { // from class: com.helpshift.conversation.activeconversation.ConversationManager.4
            @Override // com.helpshift.common.domain.F
            public void f() {
                try {
                    confirmationRejectedMessageDM.send(ConversationManager.this.userDM, conversation);
                } catch (RootAPIException e) {
                    if (e.exceptionType == NetworkException.CONVERSATION_ARCHIVED) {
                        ConversationManager.this.updateIssueStatus(conversation, IssueState.ARCHIVED);
                    } else {
                        if (e.exceptionType == NetworkException.CONVERSATION_REOPEN_EXPIRED) {
                            ConversationManager.this.markConversationStateToResolutionExpired(conversation);
                            return;
                        }
                        throw e;
                    }
                }
            }
        });
        updateIssueStatus(conversation, IssueState.RESOLUTION_REJECTED);
        HashMap map = new HashMap();
        map.put("id", conversation.serverId);
        if (StringUtils.isNotEmpty(conversation.acid)) {
            map.put("acid", conversation.acid);
        }
        this.domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.RESOLUTION_REJECTED, map);
        this.domain.getDelegate().userRepliedToConversation("User rejected the solution");
    }

    public void sendConfirmationAcceptedMessageAndDelegates(final Conversation conversation) {
        ValuePair<String, Long> currentAdjustedTimeForStorage = HSDateFormatSpec.getCurrentAdjustedTimeForStorage(this.platform);
        final ConfirmationAcceptedMessageDM confirmationAcceptedMessageDM = new ConfirmationAcceptedMessageDM("Accepted the solution", currentAdjustedTimeForStorage.first, currentAdjustedTimeForStorage.second.longValue(), new Author("mobile", "", Author.AuthorRole.LOCAL_USER), 1);
        confirmationAcceptedMessageDM.setDependencies(this.domain, this.platform);
        confirmationAcceptedMessageDM.conversationLocalId = conversation.localId;
        this.conversationDAO.insertOrUpdateMessage(confirmationAcceptedMessageDM);
        sendMessageWithAutoRetry(new F() { // from class: com.helpshift.conversation.activeconversation.ConversationManager.5
            @Override // com.helpshift.common.domain.F
            public void f() {
                try {
                    confirmationAcceptedMessageDM.send(ConversationManager.this.userDM, conversation);
                } catch (RootAPIException e) {
                    if (e.exceptionType == NetworkException.CONVERSATION_ARCHIVED) {
                        ConversationManager.this.updateIssueStatus(conversation, IssueState.ARCHIVED);
                    } else {
                        if (e.exceptionType == NetworkException.CONVERSATION_REOPEN_EXPIRED) {
                            ConversationManager.this.markConversationStateToResolutionExpired(conversation);
                            return;
                        }
                        throw e;
                    }
                }
            }
        });
        HashMap map = new HashMap();
        map.put("id", conversation.serverId);
        if (StringUtils.isNotEmpty(conversation.acid)) {
            map.put("acid", conversation.acid);
        }
        this.domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.RESOLUTION_ACCEPTED, map);
        this.domain.getDelegate().userRepliedToConversation("User accepted the solution");
    }

    public void updateIssueStatus(Conversation conversation, IssueState issueState) {
        if (conversation.state == issueState) {
            return;
        }
        HSLogger.d(TAG, "Changing conversation status from: " + conversation.state + ", new status: " + issueState + ", for: " + conversation.serverId);
        conversation.state = issueState;
        refreshConversationOnIssueStateUpdate(conversation);
        this.conversationDAO.updateConversationWithoutMessages(conversation);
        if (conversation.conversationDMListener != null) {
            conversation.conversationDMListener.onIssueStatusChange(conversation.state);
        }
    }

    public boolean filterMessagesOlderThanLastMessageInDb(Conversation conversation) {
        String oldestMessageCursor = this.conversationDAO.getOldestMessageCursor(this.userDM.getLocalId().longValue());
        boolean z = false;
        if (!StringUtils.isEmpty(oldestMessageCursor)) {
            List<MessageDM> listFilter = Filters.filter(conversation.messageDMs, MessagePredicates.olderThanLastDbMessagePredicate(HSDateFormatSpec.convertToEpochTime(oldestMessageCursor)));
            int size = conversation.messageDMs.size();
            int size2 = listFilter.size();
            if (size != 0 && size2 == 0) {
                z = true;
            }
            if (size != size2) {
                conversation.setMessageDMs(listFilter);
            }
        }
        return z;
    }

    public void mergeIssue(Conversation conversation, Conversation conversation2, boolean z, ConversationUpdate conversationUpdate) {
        IssueState issueState = conversation2.state;
        IssueState issueState2 = conversation.state;
        if (conversation2.shouldAllowNewConversationCreation) {
            issueState = IssueState.CLOSED;
        } else if (!conversation2.isFeedbackBotEnabled && issueState == IssueState.RESOLUTION_REQUESTED && (conversation.state == IssueState.RESOLUTION_ACCEPTED || conversation.state == IssueState.RESOLUTION_REJECTED || conversation.state == IssueState.RESOLUTION_EXPIRED)) {
            issueState = issueState2;
        }
        String str = conversation2.messageCursor;
        if (str != null) {
            conversation.messageCursor = str;
        }
        conversation.serverId = conversation2.serverId;
        conversation.preConversationServerId = conversation2.preConversationServerId;
        conversation.issueType = conversation2.issueType;
        conversation.title = conversation2.title;
        conversation.publishId = conversation2.publishId;
        conversation.createdAt = conversation2.createdAt;
        conversation.epochCreatedAtTime = conversation2.getEpochCreatedAtTime();
        conversation.isRedacted = conversation2.isRedacted;
        conversation.resolutionExpiryAt = conversation2.resolutionExpiryAt;
        conversation.csatExpiryAt = conversation2.csatExpiryAt;
        conversation.updatedAt = conversation2.updatedAt;
        conversation.state = issueState;
        conversation.isFeedbackBotEnabled = conversation2.isFeedbackBotEnabled;
        conversation.shouldAllowNewConversationCreation = conversation2.shouldAllowNewConversationCreation;
        if (conversation2.csatState == ConversationCSATState.SUBMITTED_SYNCED) {
            conversation.csatState = conversation2.csatState;
        } else if (ConversationUtil.isCSATTimerExpired(this.platform, conversation)) {
            conversation.csatState = ConversationCSATState.EXPIRED;
        }
        updateMessageDMs(conversation, z, conversation2.messageDMs, conversationUpdate);
    }

    private void addMessageToDbAndUI(Conversation conversation, MessageDM messageDM) {
        this.conversationDAO.insertOrUpdateMessage(messageDM);
        addMessageToUI(conversation, messageDM);
    }

    void addMessageToUI(Conversation conversation, MessageDM messageDM) {
        messageDM.setDependencies(this.domain, this.platform);
        if (messageDM.isUISupportedMessage()) {
            messageDM.addObserver(conversation);
            conversation.messageDMs.add(messageDM);
            ConversationUtil.sortMessagesBasedOnCreatedAt(conversation.messageDMs);
        }
    }

    public void updateMessageDMs(Conversation conversation, boolean z, List<MessageDM> list, ConversationUpdate conversationUpdate) {
        if (conversationUpdate == null) {
            conversationUpdate = new ConversationUpdate();
        }
        Map<String, MessageDM> map = new HashMap<>();
        Map<String, MessageDM> map2 = new HashMap<>();
        populateMessageDMLookup(conversation, map, map2);
        List<MessageDM> arrayList = new ArrayList<>();
        List<MessageDM> arrayList2 = new ArrayList<>();
        for (MessageDM messageDM : list) {
            MessageDM messageDMForUpdate = getMessageDMForUpdate(messageDM, map, map2, conversationUpdate);
            if (messageDMForUpdate != null) {
                if (messageDMForUpdate instanceof UserMessageDM) {
                    messageDMForUpdate.merge(messageDM);
                    ((UserMessageDM) messageDMForUpdate).setState(UserMessageState.SENT);
                } else if (messageDMForUpdate instanceof ScreenshotMessageDM) {
                    messageDMForUpdate.merge(messageDM);
                    ((ScreenshotMessageDM) messageDMForUpdate).setState(UserMessageState.SENT);
                    if (messageDMForUpdate.isRedacted) {
                        arrayList2.add(messageDMForUpdate);
                    }
                } else if (messageDMForUpdate instanceof UserAttachmentMessageDM) {
                    messageDMForUpdate.merge(messageDM);
                    ((UserAttachmentMessageDM) messageDMForUpdate).setState(UserAttachmentMessageDM.UserGenericAttachmentState.SENT);
                    if (messageDMForUpdate.isRedacted) {
                        arrayList2.add(messageDMForUpdate);
                    }
                } else if ((messageDMForUpdate instanceof AttachmentMessageDM) || (messageDMForUpdate instanceof AdminActionCardMessageDM)) {
                    messageDMForUpdate.mergeAndNotify(messageDM);
                    if (messageDMForUpdate.isRedacted) {
                        arrayList2.add(messageDMForUpdate);
                    }
                } else {
                    messageDMForUpdate.mergeAndNotify(messageDM);
                }
                conversationUpdate.updatedMessageDMs.add(messageDMForUpdate);
            } else {
                arrayList.add(messageDM);
            }
        }
        clearRedactedAttachmentsResources(arrayList2);
        if (ListUtils.isEmpty(arrayList)) {
            return;
        }
        for (MessageDM messageDM2 : arrayList) {
            messageDM2.setDependencies(this.domain, this.platform);
            messageDM2.conversationLocalId = conversation.localId;
            if (messageDM2 instanceof UserMessageDM) {
                ((UserMessageDM) messageDM2).setState(UserMessageState.SENT);
            } else if (messageDM2 instanceof ScreenshotMessageDM) {
                ((ScreenshotMessageDM) messageDM2).setState(UserMessageState.SENT);
            } else if (messageDM2 instanceof UserAttachmentMessageDM) {
                ((UserAttachmentMessageDM) messageDM2).setState(UserAttachmentMessageDM.UserGenericAttachmentState.SENT);
            }
            messageDM2.addObserver(conversation);
        }
        if (z) {
            ConversationUtil.sortMessagesBasedOnCreatedAt(arrayList);
            conversation.isInBetweenBotExecution = evaluateBotExecutionState(arrayList, conversation.isInBetweenBotExecution);
            conversation.messageDMs.addAll(arrayList);
            for (MessageDM messageDM3 : arrayList) {
                if (messageDM3 instanceof AdminImageAttachmentMessageDM) {
                    ((AdminImageAttachmentMessageDM) messageDM3).downloadThumbnailImage(this.platform);
                }
                if (messageDM3 instanceof AdminActionCardMessageDM) {
                    ((AdminActionCardMessageDM) messageDM3).downloadImage(this.platform);
                }
                updateAcceptedRequestForReopenMessageDMs(conversation, messageDM3);
            }
        } else {
            conversation.messageDMs.addAll(arrayList);
        }
        conversationUpdate.newMessageDMs.addAll(arrayList);
        evaluateBotControlMessages(conversation, arrayList);
    }

    public void clearRedactedAttachmentsResources(final List<MessageDM> list) {
        if (list.size() == 0) {
            return;
        }
        this.domain.runParallel(new F() { // from class: com.helpshift.conversation.activeconversation.ConversationManager.6
            @Override // com.helpshift.common.domain.F
            public void f() {
                for (MessageDM messageDM : list) {
                    try {
                        if (messageDM instanceof AttachmentMessageDM) {
                            AttachmentMessageDM attachmentMessageDM = (AttachmentMessageDM) messageDM;
                            if (FileUtil.deleteFile(attachmentMessageDM.filePath)) {
                                attachmentMessageDM.filePath = null;
                            }
                        } else if (messageDM instanceof AdminActionCardMessageDM) {
                            AdminActionCardMessageDM adminActionCardMessageDM = (AdminActionCardMessageDM) messageDM;
                            if (FileUtil.deleteFile(adminActionCardMessageDM.actionCard.filePath)) {
                                adminActionCardMessageDM.actionCard.filePath = null;
                            }
                        }
                    } catch (Exception e) {
                        HSLogger.e(ConversationManager.TAG, "Exception while deleting redacted AttachmentMessageDM file", e);
                    }
                }
            }
        });
    }

    public void evaluateBotControlMessages(final Conversation conversation, Collection<? extends MessageDM> collection) {
        for (MessageDM messageDM : collection) {
            if (AnonymousClass16.$SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[messageDM.messageType.ordinal()] == 1) {
                ValuePair<String, Long> currentAdjustedTimeForStorage = HSDateFormatSpec.getCurrentAdjustedTimeForStorage(this.platform);
                UnsupportedAdminMessageWithInputDM unsupportedAdminMessageWithInputDM = (UnsupportedAdminMessageWithInputDM) messageDM;
                final UserBotControlMessageDM userBotControlMessageDM = new UserBotControlMessageDM("Unsupported bot input", currentAdjustedTimeForStorage.first, currentAdjustedTimeForStorage.second.longValue(), new Author("mobile", "", Author.AuthorRole.LOCAL_USER), BotControlActions.BOT_CANCELLED, BotControlActions.UNSUPPORTED_BOT_INPUT, unsupportedAdminMessageWithInputDM.botInfo, unsupportedAdminMessageWithInputDM.serverId, 1);
                userBotControlMessageDM.conversationLocalId = conversation.localId;
                addMessageToDbAndUI(conversation, userBotControlMessageDM);
                sendMessageWithAutoRetry(new F() { // from class: com.helpshift.conversation.activeconversation.ConversationManager.7
                    @Override // com.helpshift.common.domain.F
                    public void f() {
                        userBotControlMessageDM.send(ConversationManager.this.userDM, conversation);
                    }
                });
            }
        }
    }

    /* JADX INFO: renamed from: com.helpshift.conversation.activeconversation.ConversationManager$16, reason: invalid class name */
    static /* synthetic */ class AnonymousClass16 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$conversation$dto$IssueState;

        static {
            int[] iArr = new int[MessageType.values().length];
            $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType = iArr;
            try {
                iArr[MessageType.UNSUPPORTED_ADMIN_MESSAGE_WITH_INPUT.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[MessageType.ADMIN_TEXT.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[MessageType.ADMIN_TEXT_WITH_TEXT_INPUT.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[MessageType.ADMIN_TEXT_WITH_OPTION_INPUT.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[MessageType.FAQ_LIST.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[MessageType.FAQ_LIST_WITH_OPTION_INPUT.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[MessageType.ADMIN_ATTACHMENT.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[MessageType.ADMIN_IMAGE_ATTACHMENT.ordinal()] = 8;
            } catch (NoSuchFieldError unused8) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[MessageType.REQUEST_FOR_REOPEN.ordinal()] = 9;
            } catch (NoSuchFieldError unused9) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[MessageType.REQUESTED_SCREENSHOT.ordinal()] = 10;
            } catch (NoSuchFieldError unused10) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[MessageType.REQUESTED_APP_REVIEW.ordinal()] = 11;
            } catch (NoSuchFieldError unused11) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[MessageType.ADMIN_ACTION_CARD.ordinal()] = 12;
            } catch (NoSuchFieldError unused12) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[MessageType.ADMIN_CSAT_MESSAGE.ordinal()] = 13;
            } catch (NoSuchFieldError unused13) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[MessageType.ADMIN_RESOLUTION_QUESTION_MESSAGE.ordinal()] = 14;
            } catch (NoSuchFieldError unused14) {
            }
            int[] iArr2 = new int[IssueState.values().length];
            $SwitchMap$com$helpshift$conversation$dto$IssueState = iArr2;
            try {
                iArr2[IssueState.ARCHIVED.ordinal()] = 1;
            } catch (NoSuchFieldError unused15) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$dto$IssueState[IssueState.RESOLUTION_ACCEPTED.ordinal()] = 2;
            } catch (NoSuchFieldError unused16) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$dto$IssueState[IssueState.REJECTED.ordinal()] = 3;
            } catch (NoSuchFieldError unused17) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$dto$IssueState[IssueState.COMPLETED_ISSUE_CREATED.ordinal()] = 4;
            } catch (NoSuchFieldError unused18) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$dto$IssueState[IssueState.RESOLUTION_REQUESTED.ordinal()] = 5;
            } catch (NoSuchFieldError unused19) {
            }
        }
    }

    public void updateAcceptedRequestForReopenMessageDMs(Conversation conversation, MessageDM messageDM) {
        if (messageDM instanceof RequestForReopenMessageDM) {
            RequestForReopenMessageDM requestForReopenMessageDM = (RequestForReopenMessageDM) messageDM;
            if (requestForReopenMessageDM.isAnswered()) {
                return;
            }
            conversation.unansweredRequestForReopenMessageDMs.put(messageDM.serverId, requestForReopenMessageDM);
            return;
        }
        if (messageDM instanceof FollowupAcceptedMessageDM) {
            String str = ((FollowupAcceptedMessageDM) messageDM).referredMessageId;
            if (conversation.unansweredRequestForReopenMessageDMs.containsKey(str)) {
                RequestForReopenMessageDM requestForReopenMessageDMRemove = conversation.unansweredRequestForReopenMessageDMs.remove(str);
                requestForReopenMessageDMRemove.setDependencies(this.domain, this.platform);
                requestForReopenMessageDMRemove.setAnsweredAndNotify(true);
                this.conversationDAO.insertOrUpdateMessage(requestForReopenMessageDMRemove);
            }
        }
    }

    private void populateMessageDMLookup(Conversation conversation, Map<String, MessageDM> map, Map<String, MessageDM> map2) {
        ArrayList<MessageDM> arrayList = new ArrayList();
        List<MessageDM> data = this.conversationDAO.readMessages(conversation.localId.longValue()).getData();
        HashMap map3 = new HashMap();
        for (MessageDM messageDM : conversation.messageDMs) {
            if (messageDM.localId != null) {
                map3.put(messageDM.localId, messageDM);
            }
        }
        for (MessageDM messageDM2 : data) {
            MessageDM messageDM3 = (MessageDM) map3.get(messageDM2.localId);
            if (messageDM3 == null) {
                arrayList.add(messageDM2);
            } else {
                arrayList.add(messageDM3);
            }
        }
        Map<String, String> messagesLocalIdToPendingRequestIdMap = getMessagesLocalIdToPendingRequestIdMap(conversation);
        for (MessageDM messageDM4 : arrayList) {
            if (!StringUtils.isEmpty(messageDM4.serverId)) {
                map.put(messageDM4.serverId, messageDM4);
            }
            if (messageDM4.localId != null) {
                String strValueOf = String.valueOf(messageDM4.localId);
                if (messagesLocalIdToPendingRequestIdMap != null && messagesLocalIdToPendingRequestIdMap.containsKey(strValueOf)) {
                    map2.put(messagesLocalIdToPendingRequestIdMap.get(strValueOf), messageDM4);
                }
            }
        }
    }

    public Map<String, String> getMessagesLocalIdToPendingRequestIdMap(Conversation conversation) {
        return this.platform.getNetworkRequestDAO().getPendingRequestIdMapForRoute(getRouteForSendingMessage(conversation));
    }

    private String getRouteForSendingMessage(Conversation conversation) {
        if (conversation.isInPreIssueMode()) {
            return ConversationController.CREATE_PRE_ISSUE_ROUTE + conversation.getPreIssueId() + "/messages/";
        }
        return ConversationController.CREATE_ISSUE_ROUTE + conversation.getIssueId() + "/messages/";
    }

    private MessageDM getMessageDMForUpdate(MessageDM messageDM, Map<String, MessageDM> map, Map<String, MessageDM> map2, ConversationUpdate conversationUpdate) {
        if (map.containsKey(messageDM.serverId)) {
            return map.get(messageDM.serverId);
        }
        if (!map2.containsKey(messageDM.createdRequestId)) {
            return null;
        }
        MessageDM messageDM2 = map2.get(messageDM.createdRequestId);
        conversationUpdate.localIdsForResolvedRequestIds.add(String.valueOf(messageDM2.localId));
        return messageDM2;
    }

    public boolean evaluateBotExecutionState(List<MessageDM> list, boolean z) {
        if (list != null && list.size() != 0) {
            for (int size = list.size() - 1; size >= 0; size--) {
                MessageDM messageDM = list.get(size);
                if (MessageType.ADMIN_BOT_CONTROL == messageDM.messageType) {
                    AdminBotControlMessageDM adminBotControlMessageDM = (AdminBotControlMessageDM) messageDM;
                    String str = adminBotControlMessageDM.actionType;
                    if (BotControlActions.BOT_STARTED.equals(str)) {
                        return true;
                    }
                    if (BotControlActions.BOT_ENDED.equals(str)) {
                        return adminBotControlMessageDM.hasNextBot;
                    }
                }
            }
        }
        return z;
    }

    public void mergePreIssue(Conversation conversation, Conversation conversation2, boolean z, ConversationUpdate conversationUpdate) {
        IssueState issueState = conversation2.state;
        int i = AnonymousClass16.$SwitchMap$com$helpshift$conversation$dto$IssueState[issueState.ordinal()];
        if (i == 4) {
            issueState = IssueState.COMPLETED_ISSUE_CREATED;
            conversation.serverId = conversation2.serverId;
        } else if (i == 5) {
            issueState = IssueState.RESOLUTION_ACCEPTED;
        }
        String str = conversation2.messageCursor;
        if (str != null) {
            conversation.messageCursor = str;
        }
        conversation.preConversationServerId = conversation2.preConversationServerId;
        conversation.serverId = conversation2.serverId;
        conversation.issueType = conversation2.issueType;
        conversation.title = conversation2.title;
        conversation.publishId = conversation2.publishId;
        conversation.createdAt = conversation2.createdAt;
        conversation.epochCreatedAtTime = conversation2.getEpochCreatedAtTime();
        conversation.updatedAt = conversation2.updatedAt;
        conversation.state = issueState;
        updateMessageDMs(conversation, z, conversation2.messageDMs, conversationUpdate);
    }

    public void setEnableMessageClickOnResolutionRejected(Conversation conversation, boolean z) {
        conversation.enableMessageClickOnResolutionRejected = z;
        if (conversation.state == IssueState.RESOLUTION_REJECTED) {
            updateMessagesOnIssueStatusUpdate(conversation);
        }
    }

    public boolean shouldShowCSATInFooter(Conversation conversation) {
        return !conversation.isInPreIssueMode() && conversation.csatState == ConversationCSATState.NONE && this.sdkConfigurationDM.getBoolean(SDKConfigurationDM.CUSTOMER_SATISFACTION_SURVEY);
    }

    public void handleConversationEnded(final Conversation conversation) {
        this.domain.runParallel(new F() { // from class: com.helpshift.conversation.activeconversation.ConversationManager.8
            @Override // com.helpshift.common.domain.F
            public void f() {
                ConversationManager.this.deleteOptionsForAdminMessageWithOptionsInput(conversation);
                ConversationManager.this.sendConversationEndedDelegate(conversation);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void deleteOptionsForAdminMessageWithOptionsInput(Conversation conversation) {
        List<MessageDM> messages = this.conversationDAO.readMessages(conversation.localId.longValue(), MessageType.ADMIN_TEXT_WITH_OPTION_INPUT);
        Iterator<MessageDM> it = messages.iterator();
        while (it.hasNext()) {
            ((AdminMessageWithOptionInputDM) it.next()).input.options.clear();
        }
        this.conversationDAO.insertOrUpdateMessages(messages);
    }

    public void sendConversationEndedDelegate(Conversation conversation) {
        if (conversation.isConversationEndedDelegateSent) {
            return;
        }
        this.domain.getDelegate().conversationEnded();
        conversation.isConversationEndedDelegateSent = true;
        this.conversationDAO.updateConversationWithoutMessages(conversation);
    }

    public void initializeIssueStatusForUI(Conversation conversation) {
        if (conversation.state != IssueState.RESOLUTION_REQUESTED || conversation.isFeedbackBotEnabled || this.sdkConfigurationDM.shouldShowConversationResolutionQuestion()) {
            return;
        }
        markConversationResolutionStatus(conversation, true);
    }

    public void addPreissueFirstUserMessage(Conversation conversation, String str) {
        HSLogger.d(TAG, "Adding first user message to DB and UI.");
        ValuePair<String, Long> currentAdjustedTimeForStorage = HSDateFormatSpec.getCurrentAdjustedTimeForStorage(this.platform);
        UserMessageDM userMessageDM = new UserMessageDM(str, currentAdjustedTimeForStorage.first, currentAdjustedTimeForStorage.second.longValue(), new Author("mobile", "", Author.AuthorRole.LOCAL_USER));
        userMessageDM.setDependencies(this.domain, this.platform);
        userMessageDM.conversationLocalId = conversation.localId;
        userMessageDM.setState(UserMessageState.SENDING);
        addMessageToDbAndUI(conversation, userMessageDM);
    }

    public void addPreissueFirstUserMessageViaSmartIntent(Conversation conversation, List<String> list) {
        HSLogger.d(TAG, "Adding first user message via smart intent to DB and UI.");
        ValuePair<String, Long> currentAdjustedTimeForStorage = HSDateFormatSpec.getCurrentAdjustedTimeForStorage(this.platform);
        UserSmartIntentMessageDM userSmartIntentMessageDM = new UserSmartIntentMessageDM(list, currentAdjustedTimeForStorage.first, currentAdjustedTimeForStorage.second.longValue(), new Author("mobile", "", Author.AuthorRole.LOCAL_USER));
        userSmartIntentMessageDM.setDependencies(this.domain, this.platform);
        userSmartIntentMessageDM.conversationLocalId = conversation.localId;
        userSmartIntentMessageDM.setState(UserMessageState.SENDING);
        addMessageToDbAndUI(conversation, userSmartIntentMessageDM);
    }

    public void sendTextMessage(Conversation conversation, String str) {
        ValuePair<String, Long> currentAdjustedTimeForStorage = HSDateFormatSpec.getCurrentAdjustedTimeForStorage(this.platform);
        UserMessageDM userMessageDM = new UserMessageDM(str, currentAdjustedTimeForStorage.first, currentAdjustedTimeForStorage.second.longValue(), new Author("mobile", "", Author.AuthorRole.LOCAL_USER));
        userMessageDM.conversationLocalId = conversation.localId;
        userMessageDM.updateState(shouldEnableMessagesClick(conversation));
        addMessageToDbAndUI(conversation, userMessageDM);
        sendTextMessage(conversation, userMessageDM);
    }

    private void sendTextMessage(Conversation conversation, UserMessageDM userMessageDM) {
        try {
            userMessageDM.send(this.userDM, conversation);
            if (conversation.state == IssueState.RESOLUTION_REJECTED) {
                updateIssueStatus(conversation, IssueState.WAITING_FOR_AGENT);
            }
        } catch (RootAPIException e) {
            if (e.exceptionType == NetworkException.CONVERSATION_ARCHIVED) {
                updateIssueStatus(conversation, IssueState.ARCHIVED);
            } else if (e.exceptionType == NetworkException.USER_PRE_CONDITION_FAILED) {
                updateIssueStatus(conversation, IssueState.AUTHOR_MISMATCH);
            } else {
                if (e.exceptionType == NetworkException.CONVERSATION_REOPEN_EXPIRED) {
                    markConversationStateToResolutionExpired(conversation);
                    return;
                }
                throw e;
            }
        }
    }

    public void sendTextMessage(Conversation conversation, String str, AdminMessageWithTextInputDM adminMessageWithTextInputDM, boolean z) {
        ValuePair<String, Long> currentAdjustedTimeForStorage = HSDateFormatSpec.getCurrentAdjustedTimeForStorage(this.platform);
        UserResponseMessageForTextInputDM userResponseMessageForTextInputDM = new UserResponseMessageForTextInputDM(str, currentAdjustedTimeForStorage.first, currentAdjustedTimeForStorage.second.longValue(), new Author("mobile", "", Author.AuthorRole.LOCAL_USER), adminMessageWithTextInputDM, z);
        userResponseMessageForTextInputDM.conversationLocalId = conversation.localId;
        userResponseMessageForTextInputDM.updateState(true);
        addMessageToDbAndUI(conversation, userResponseMessageForTextInputDM);
        sendTextMessage(conversation, userResponseMessageForTextInputDM);
    }

    public void retryMessage(Conversation conversation, MessageDM messageDM) {
        if (messageDM instanceof UserMessageDM) {
            sendTextMessage(conversation, (UserMessageDM) messageDM);
        } else if (messageDM instanceof ScreenshotMessageDM) {
            sendScreenshotMessageInternal(conversation, (ScreenshotMessageDM) messageDM, false);
        } else if (messageDM instanceof UserAttachmentMessageDM) {
            sendAttachmentMessageInternal(conversation, (UserAttachmentMessageDM) messageDM);
        }
    }

    private void sendScreenshotMessageInternal(final Conversation conversation, ScreenshotMessageDM screenshotMessageDM, boolean z) {
        screenshotMessageDM.uploadImage(this.userDM, conversation, z, new Callback<Void, RootAPIException>() { // from class: com.helpshift.conversation.activeconversation.ConversationManager.9
            @Override // com.helpshift.util.Callback
            public void onSuccess(Void r3) {
                if (conversation.state == IssueState.RESOLUTION_REJECTED) {
                    ConversationManager.this.updateIssueStatus(conversation, IssueState.WAITING_FOR_AGENT);
                }
            }

            @Override // com.helpshift.util.Callback
            public void onFailure(RootAPIException rootAPIException) {
                if (rootAPIException.exceptionType == NetworkException.CONVERSATION_REOPEN_EXPIRED) {
                    ConversationManager.this.markConversationStateToResolutionExpired(conversation);
                } else if (rootAPIException.exceptionType == NetworkException.CONVERSATION_ARCHIVED) {
                    ConversationManager.this.updateIssueStatus(conversation, IssueState.ARCHIVED);
                }
            }
        });
    }

    private void sendAttachmentMessageInternal(final Conversation conversation, UserAttachmentMessageDM userAttachmentMessageDM) {
        userAttachmentMessageDM.uploadAttachment(this.userDM, conversation, new Callback<Void, RootAPIException>() { // from class: com.helpshift.conversation.activeconversation.ConversationManager.10
            @Override // com.helpshift.util.Callback
            public void onSuccess(Void r3) {
                if (conversation.state == IssueState.RESOLUTION_REJECTED) {
                    ConversationManager.this.updateIssueStatus(conversation, IssueState.WAITING_FOR_AGENT);
                }
            }

            @Override // com.helpshift.util.Callback
            public void onFailure(RootAPIException rootAPIException) {
                if (rootAPIException.exceptionType == NetworkException.CONVERSATION_REOPEN_EXPIRED) {
                    ConversationManager.this.markConversationStateToResolutionExpired(conversation);
                } else if (rootAPIException.exceptionType == NetworkException.CONVERSATION_ARCHIVED) {
                    ConversationManager.this.updateIssueStatus(conversation, IssueState.ARCHIVED);
                }
            }
        });
    }

    public boolean canAutoRetryMessages(Conversation conversation) {
        return (conversation.state == IssueState.ARCHIVED || conversation.state == IssueState.AUTHOR_MISMATCH) ? false : true;
    }

    private boolean canAutoRetryMessage(Conversation conversation, AutoRetriableMessageDM autoRetriableMessageDM) {
        if (canAutoRetryMessages(conversation) && autoRetriableMessageDM.isRetriable()) {
            return (((autoRetriableMessageDM instanceof ConfirmationAcceptedMessageDM) || (autoRetriableMessageDM instanceof ConfirmationRejectedMessageDM)) && ConversationUtil.isResolutionQuestionExpired(this.platform, conversation)) ? false : true;
        }
        return false;
    }

    public void retryMessages(Conversation conversation, boolean z) {
        List<MessageDM> data = this.conversationDAO.readMessages(conversation.localId.longValue()).getData();
        ArrayList<AutoRetriableMessageDM> arrayList = new ArrayList();
        ArrayList<MessageDM> arrayList2 = new ArrayList();
        HashMap map = new HashMap();
        ArrayList arrayList3 = new ArrayList();
        ArrayList<UserResponseMessageForCSATInput> arrayList4 = new ArrayList();
        for (MessageDM messageDM : data) {
            messageDM.setDependencies(this.domain, this.platform);
            if (messageDM instanceof AutoRetriableMessageDM) {
                AutoRetriableMessageDM autoRetriableMessageDM = (AutoRetriableMessageDM) messageDM;
                if (canAutoRetryMessage(conversation, autoRetriableMessageDM)) {
                    arrayList.add(autoRetriableMessageDM);
                }
            }
            if (!StringUtils.isEmpty(messageDM.readAt) && !messageDM.isMessageSeenSynced) {
                arrayList2.add(messageDM);
            }
            if (messageDM instanceof RequestAppReviewMessageDM) {
                map.put(messageDM.serverId, (RequestAppReviewMessageDM) messageDM);
            }
            if (messageDM instanceof FAQListMessageDM) {
                FAQListMessageDM fAQListMessageDM = (FAQListMessageDM) messageDM;
                if (fAQListMessageDM.isSuggestionsReadEventPending()) {
                    arrayList3.add(fAQListMessageDM);
                }
            }
            if (messageDM instanceof UserResponseMessageForCSATInput) {
                UserResponseMessageForCSATInput userResponseMessageForCSATInput = (UserResponseMessageForCSATInput) messageDM;
                if (userResponseMessageForCSATInput.isNewConversationStarted && StringUtils.isEmpty(userResponseMessageForCSATInput.serverId) && userResponseMessageForCSATInput.messageSyncState == 1) {
                    arrayList4.add(userResponseMessageForCSATInput);
                }
            }
        }
        for (AutoRetriableMessageDM autoRetriableMessageDM2 : arrayList) {
            if (!canAutoRetryMessages(conversation)) {
                return;
            }
            if (canAutoRetryMessage(conversation, autoRetriableMessageDM2)) {
                try {
                    autoRetriableMessageDM2.send(this.userDM, conversation);
                    if (autoRetriableMessageDM2 instanceof AcceptedAppReviewMessageDM) {
                        List<MessageDM> arrayList5 = new ArrayList<>();
                        AcceptedAppReviewMessageDM acceptedAppReviewMessageDM = (AcceptedAppReviewMessageDM) autoRetriableMessageDM2;
                        String str = acceptedAppReviewMessageDM.referredMessageId;
                        if (map.containsKey(str)) {
                            RequestAppReviewMessageDM requestAppReviewMessageDM = (RequestAppReviewMessageDM) map.get(str);
                            requestAppReviewMessageDM.handleAcceptedReviewSuccess(this.platform);
                            arrayList5.add(requestAppReviewMessageDM);
                        }
                        if (z) {
                            arrayList5.add(autoRetriableMessageDM2);
                            addMessageToUI(conversation, acceptedAppReviewMessageDM);
                            updateMessageDMs(conversation, true, arrayList5, null);
                        }
                    }
                } catch (RootAPIException e) {
                    if (handleConversationErrorUpdate(conversation, e)) {
                        continue;
                    } else if (e.exceptionType != NetworkException.NON_RETRIABLE) {
                        throw e;
                    }
                }
            }
        }
        HashMap map2 = new HashMap();
        for (MessageDM messageDM2 : arrayList2) {
            String str2 = messageDM2.readAt;
            List arrayList6 = (List) map2.get(str2);
            if (arrayList6 == null) {
                arrayList6 = new ArrayList();
            }
            arrayList6.add(messageDM2);
            map2.put(str2, arrayList6);
        }
        Iterator it = map2.keySet().iterator();
        while (it.hasNext()) {
            try {
                markMessagesAsSeen(conversation, (List) map2.get((String) it.next()));
            } catch (RootAPIException e2) {
                if (e2.exceptionType != NetworkException.NON_RETRIABLE) {
                    throw e2;
                }
            }
        }
        Iterator it2 = arrayList3.iterator();
        while (it2.hasNext()) {
            ((FAQListMessageDM) it2.next()).sendSuggestionReadEvent(conversation, this.userDM);
        }
        for (UserResponseMessageForCSATInput userResponseMessageForCSATInput2 : arrayList4) {
            try {
                userResponseMessageForCSATInput2.send(this.userDM, conversation);
            } catch (RootAPIException e3) {
                if (handleConversationErrorUpdate(conversation, e3) || e3.exceptionType == NetworkException.NON_RETRIABLE) {
                    userResponseMessageForCSATInput2.messageSyncState = 3;
                    this.conversationDAO.insertOrUpdateMessage(userResponseMessageForCSATInput2);
                } else {
                    throw e3;
                }
            }
        }
    }

    private boolean handleConversationErrorUpdate(Conversation conversation, RootAPIException rootAPIException) {
        if (rootAPIException.exceptionType == NetworkException.CONVERSATION_ARCHIVED) {
            updateIssueStatus(conversation, IssueState.ARCHIVED);
        } else if (rootAPIException.exceptionType == NetworkException.USER_PRE_CONDITION_FAILED) {
            updateIssueStatus(conversation, IssueState.AUTHOR_MISMATCH);
        } else {
            if (rootAPIException.exceptionType != NetworkException.CONVERSATION_REOPEN_EXPIRED) {
                return false;
            }
            markConversationStateToResolutionExpired(conversation);
        }
        return true;
    }

    public void markMessagesAsSeen(Conversation conversation) {
        List<MessageDM> data = this.conversationDAO.readMessages(conversation.localId.longValue()).getData();
        HashSet hashSet = new HashSet();
        for (MessageDM messageDM : data) {
            if (messageDM.deliveryState != 1) {
                switch (messageDM.messageType) {
                    case ADMIN_TEXT:
                    case ADMIN_TEXT_WITH_TEXT_INPUT:
                    case ADMIN_TEXT_WITH_OPTION_INPUT:
                    case FAQ_LIST:
                    case FAQ_LIST_WITH_OPTION_INPUT:
                    case ADMIN_ATTACHMENT:
                    case ADMIN_IMAGE_ATTACHMENT:
                    case REQUEST_FOR_REOPEN:
                    case REQUESTED_SCREENSHOT:
                    case REQUESTED_APP_REVIEW:
                    case ADMIN_ACTION_CARD:
                    case ADMIN_CSAT_MESSAGE:
                    case ADMIN_RESOLUTION_QUESTION_MESSAGE:
                        hashSet.add(messageDM.localId);
                        break;
                }
            }
        }
        if (hashSet.size() == 0) {
            return;
        }
        markSeenMessagesAsRead(conversation, hashSet);
    }

    private void markSeenMessagesAsRead(Conversation conversation, Set<Long> set) {
        String str = HSDateFormatSpec.getCurrentAdjustedTimeForStorage(this.platform).first;
        HashMap map = new HashMap();
        ArrayList arrayList = new ArrayList();
        for (MessageDM messageDM : conversation.messageDMs) {
            if (messageDM.localId != null) {
                map.put(messageDM.localId, messageDM);
            }
        }
        Iterator<Long> it = set.iterator();
        while (it.hasNext()) {
            MessageDM messageDM2 = (MessageDM) map.get(it.next());
            if (messageDM2 != null) {
                messageDM2.readAt = str;
                messageDM2.deliveryState = 1;
                messageDM2.seenAtMessageCursor = conversation.messageCursor;
                arrayList.add(messageDM2);
            }
        }
        if (ListUtils.isEmpty(arrayList)) {
            return;
        }
        this.conversationDAO.insertOrUpdateMessages(arrayList);
        markMessagesAsSeen(conversation, arrayList);
    }

    private void markMessagesAsSeen(Conversation conversation, List<MessageDM> list) {
        if (ListUtils.isEmpty(list)) {
            return;
        }
        String str = list.get(0).readAt;
        String str2 = list.get(0).seenAtMessageCursor;
        HashMap<String, String> userRequestData = NetworkDataRequestUtil.getUserRequestData(this.userDM);
        userRequestData.put("read_at", str);
        userRequestData.put(ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_BODY_COLOR, str2);
        userRequestData.put(MessagesTable.Columns.DELIVERY_STATE, "read");
        try {
            new GuardOKNetwork(new FailedAPICallNetworkDecorator(new TSCorrectedNetwork(new AuthenticationFailureNetwork(new PUTNetwork(getRouteForSendingMessage(conversation), this.domain, this.platform)), this.platform))).makeRequest(new RequestData(userRequestData));
        } catch (RootAPIException e) {
            if (e.exceptionType == NetworkException.INVALID_AUTH_TOKEN || e.exceptionType == NetworkException.AUTH_TOKEN_NOT_PROVIDED) {
                this.domain.getAuthenticationFailureDM().notifyAuthenticationFailure(this.userDM, e.exceptionType);
            } else if (e.exceptionType != NetworkException.NON_RETRIABLE) {
                throw e;
            }
        }
        Iterator<MessageDM> it = list.iterator();
        while (it.hasNext()) {
            it.next().isMessageSeenSynced = true;
        }
        this.conversationDAO.insertOrUpdateMessages(list);
    }

    public void handleAppReviewRequestClick(final Conversation conversation, final RequestAppReviewMessageDM requestAppReviewMessageDM) {
        final AcceptedAppReviewMessageDM acceptedAppReviewMessageDMHandleRequestReviewClick = requestAppReviewMessageDM.handleRequestReviewClick(this.domain, this.platform);
        if (acceptedAppReviewMessageDMHandleRequestReviewClick != null) {
            sendMessageWithAutoRetry(new F() { // from class: com.helpshift.conversation.activeconversation.ConversationManager.11
                @Override // com.helpshift.common.domain.F
                public void f() {
                    try {
                        acceptedAppReviewMessageDMHandleRequestReviewClick.send(ConversationManager.this.userDM, conversation);
                        requestAppReviewMessageDM.handleAcceptedReviewSuccess(ConversationManager.this.platform);
                    } catch (RootAPIException e) {
                        if (e.exceptionType == NetworkException.CONVERSATION_ARCHIVED) {
                            ConversationManager.this.updateIssueStatus(conversation, IssueState.ARCHIVED);
                        } else {
                            requestAppReviewMessageDM.setIsReviewButtonClickable(true);
                            throw e;
                        }
                    }
                }
            });
        }
    }

    public void sendAttachment(Conversation conversation, AttachmentPickerFile attachmentPickerFile, String str) {
        if (1 == attachmentPickerFile.attachmentType) {
            sendScreenshot(conversation, attachmentPickerFile, str);
        } else {
            sendGenericAttachment(conversation, attachmentPickerFile);
        }
    }

    public void sendScreenshot(Conversation conversation, AttachmentPickerFile attachmentPickerFile, String str) {
        ValuePair<String, Long> currentAdjustedTimeForStorage = HSDateFormatSpec.getCurrentAdjustedTimeForStorage(this.platform);
        ScreenshotMessageDM screenshotMessageDM = new ScreenshotMessageDM(null, currentAdjustedTimeForStorage.first, currentAdjustedTimeForStorage.second.longValue(), new Author("mobile", "", Author.AuthorRole.LOCAL_USER), null, null, null, null, 0, false);
        screenshotMessageDM.fileName = attachmentPickerFile.originalFileName;
        screenshotMessageDM.filePath = attachmentPickerFile.filePath;
        screenshotMessageDM.setRefersMessageId(str);
        screenshotMessageDM.updateState(shouldEnableMessagesClick(conversation));
        screenshotMessageDM.conversationLocalId = conversation.localId;
        addMessageToDbAndUI(conversation, screenshotMessageDM);
        if (str != null) {
            Iterator<MessageDM> it = conversation.messageDMs.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                MessageDM next = it.next();
                if (next.serverId != null && next.serverId.equals(str) && next.messageType == MessageType.REQUESTED_SCREENSHOT) {
                    ((RequestScreenshotMessageDM) next).setIsAnswered(this.platform, true);
                    break;
                }
            }
        }
        sendScreenshotMessageInternal(conversation, screenshotMessageDM, !attachmentPickerFile.isFileCompressionAndCopyingDone);
    }

    private void sendGenericAttachment(Conversation conversation, AttachmentPickerFile attachmentPickerFile) {
        ValuePair<String, Long> currentAdjustedTimeForStorage = HSDateFormatSpec.getCurrentAdjustedTimeForStorage(this.platform);
        UserAttachmentMessageDM userAttachmentMessageDM = new UserAttachmentMessageDM(null, currentAdjustedTimeForStorage.first, currentAdjustedTimeForStorage.second.longValue(), new Author("mobile", "", Author.AuthorRole.LOCAL_USER), attachmentPickerFile.originalFileSize == null ? 0 : attachmentPickerFile.originalFileSize.intValue(), null, null, attachmentPickerFile.originalFileName, false);
        userAttachmentMessageDM.filePath = attachmentPickerFile.filePath;
        userAttachmentMessageDM.updateState(shouldEnableMessagesClick(conversation));
        userAttachmentMessageDM.conversationLocalId = conversation.localId;
        addMessageToDbAndUI(conversation, userAttachmentMessageDM);
        sendAttachmentMessageInternal(conversation, userAttachmentMessageDM);
    }

    public void sendCSATSurvey(final Conversation conversation, int i, String str) {
        if (i > 5) {
            i = 5;
        } else if (i < 0) {
            i = 0;
        }
        conversation.csatRating = i;
        if (str != null) {
            str = str.trim();
        }
        conversation.csatFeedback = str;
        setCSATState(conversation, ConversationCSATState.SUBMITTED_NOT_SYNCED);
        sendMessageWithAutoRetry(new F() { // from class: com.helpshift.conversation.activeconversation.ConversationManager.12
            @Override // com.helpshift.common.domain.F
            public void f() {
                ConversationManager.this.sendCSATSurveyInternal(conversation);
            }
        });
        this.domain.getDelegate().userCompletedCustomerSatisfactionSurvey(conversation.csatRating, conversation.csatFeedback);
    }

    public void sendCSATSurveyInternal(Conversation conversation) {
        if (ConversationUtil.isCSATTimerExpired(this.platform, conversation)) {
            markConversationCSATStateToExpired(conversation);
            return;
        }
        String str = ConversationController.CREATE_ISSUE_ROUTE + conversation.serverId + "/customer-survey/";
        HashMap<String, String> userRequestData = NetworkDataRequestUtil.getUserRequestData(this.userDM);
        userRequestData.put("rating", String.valueOf(conversation.csatRating));
        userRequestData.put("feedback", conversation.csatFeedback);
        try {
            try {
                new GuardOKNetwork(new FailedAPICallNetworkDecorator(new GuardAgainstCSATExpiryNetwork(new TSCorrectedNetwork(new IdempotentNetwork(new POSTNetwork(str, this.domain, this.platform), this.platform, new SuccessOrNonRetriableStatusCodeIdempotentPolicy(), str, conversation.serverId), this.platform), this.platform))).makeRequest(new RequestData(userRequestData));
                ConversationCSATState conversationCSATState = ConversationCSATState.SUBMITTED_SYNCED;
                if (conversationCSATState != null) {
                    setCSATState(conversation, conversationCSATState);
                }
            } catch (RootAPIException e) {
                if (e.exceptionType == NetworkException.CSAT_EXPIRED) {
                    ConversationCSATState conversationCSATState2 = ConversationCSATState.EXPIRED;
                    sendCSATExpiryEvent(conversation);
                    if (conversationCSATState2 != null) {
                        setCSATState(conversation, conversationCSATState2);
                        return;
                    }
                    return;
                }
                if (e.exceptionType == NetworkException.INVALID_AUTH_TOKEN || e.exceptionType == NetworkException.AUTH_TOKEN_NOT_PROVIDED) {
                    this.domain.getAuthenticationFailureDM().notifyAuthenticationFailure(this.userDM, e.exceptionType);
                } else if (e.exceptionType == NetworkException.NON_RETRIABLE) {
                    ConversationCSATState conversationCSATState3 = ConversationCSATState.SUBMITTED_SYNCED;
                }
                throw e;
            }
        } catch (Throwable th) {
            if (0 != 0) {
                setCSATState(conversation, null);
            }
            throw th;
        }
    }

    private void setCSATState(Conversation conversation, ConversationCSATState conversationCSATState) {
        if (conversation.csatState != conversationCSATState) {
            HSLogger.d(TAG, "Update CSAT state : Conversation : " + conversation.serverId + ", state : " + conversationCSATState.toString());
        }
        conversation.csatState = conversationCSATState;
        this.conversationDAO.updateConversationWithoutMessages(conversation);
    }

    public void setStartNewConversationButtonClicked(Conversation conversation, boolean z, boolean z2) {
        conversation.isStartNewConversationClicked = z;
        if (z2) {
            this.conversationDAO.updateConversationWithoutMessages(conversation);
        }
    }

    public void setShouldIncrementMessageCount(Conversation conversation, boolean z, boolean z2) {
        if (conversation.shouldIncrementMessageCount != z) {
            conversation.shouldIncrementMessageCount = z;
            if (z2) {
                this.conversationDAO.updateConversationWithoutMessages(conversation);
            }
        }
    }

    public void updateLastUserActivityTime(Conversation conversation, long j) {
        conversation.lastUserActivityTime = j;
        this.conversationDAO.updateLastUserActivityTimeInConversation(conversation.localId, j);
    }

    public void initializeMessagesForUI(Conversation conversation, boolean z) {
        ConversationUtil.sortMessagesBasedOnCreatedAt(conversation.messageDMs);
        if (z) {
            conversation.isInBetweenBotExecution = evaluateBotExecutionState(conversation.messageDMs, false);
            for (MessageDM messageDM : conversation.messageDMs) {
                messageDM.setDependencies(this.domain, this.platform);
                if (messageDM instanceof AdminImageAttachmentMessageDM) {
                    ((AdminImageAttachmentMessageDM) messageDM).downloadThumbnailImage(this.platform);
                }
                if (messageDM instanceof AdminActionCardMessageDM) {
                    ((AdminActionCardMessageDM) messageDM).downloadImage(this.platform);
                }
                updateMessageOnConversationUpdate(messageDM, shouldEnableMessagesClick(conversation));
                updateAcceptedRequestForReopenMessageDMs(conversation, messageDM);
            }
            if (conversation.messageDMs.size() > 0 && (conversation.isIssueInProgress() || (conversation.isFeedbackBotEnabled && conversation.state == IssueState.RESOLUTION_REQUESTED))) {
                MessageDM messageDM2 = conversation.messageDMs.get(conversation.messageDMs.size() - 1);
                if (messageDM2.messageType == MessageType.USER_RESP_FOR_OPTION_INPUT || messageDM2.messageType == MessageType.USER_RESP_FOR_TEXT_INPUT || messageDM2.messageType == MessageType.USER_RESP_FOR_CSAT) {
                    MessageDM latestUnansweredBotMessage = getLatestUnansweredBotMessage(conversation);
                    if (conversation.isInBetweenBotExecution && latestUnansweredBotMessage == null) {
                        ((UserMessageDM) messageDM2).updateState(true);
                    }
                }
            }
        } else {
            for (MessageDM messageDM3 : conversation.messageDMs) {
                messageDM3.setDependencies(this.domain, this.platform);
                if (messageDM3 instanceof AdminImageAttachmentMessageDM) {
                    ((AdminImageAttachmentMessageDM) messageDM3).downloadThumbnailImage(this.platform);
                }
                if (messageDM3 instanceof AdminActionCardMessageDM) {
                    ((AdminActionCardMessageDM) messageDM3).downloadImage(this.platform);
                }
                updateMessageOnConversationUpdate(messageDM3, false);
            }
        }
        ListIterator<MessageDM> listIterator = conversation.messageDMs.listIterator();
        while (listIterator.hasNext()) {
            MessageDM next = listIterator.next();
            if ((next instanceof AdminCSATMessageWithOptions) && (!z || conversation.messageDMs.indexOf(next) != conversation.messageDMs.size() - 1)) {
                listIterator.remove();
            }
        }
    }

    public void initializeHistoryMessageListForUI(Conversation conversation, boolean z) {
        removeFeedbackMessagesFromConversations(conversation);
        for (MessageDM messageDM : conversation.messageDMs) {
            messageDM.setDependencies(this.domain, this.platform);
            updateMessageOnConversationUpdate(messageDM, z);
            updateAcceptedRequestForReopenMessageDMs(conversation, messageDM);
        }
    }

    public void removeFeedbackMessagesFromConversations(Conversation conversation) {
        if (conversation.state != IssueState.CLOSED) {
            return;
        }
        ListIterator<MessageDM> listIterator = conversation.messageDMs.listIterator();
        while (listIterator.hasNext()) {
            if (listIterator.next().isFeedbackMessage) {
                listIterator.remove();
            }
        }
    }

    public void removeFeedbackMessagesFromConversations(ViewableConversation viewableConversation) {
        Iterator<Conversation> it = viewableConversation.getAllConversations().iterator();
        while (it.hasNext()) {
            removeFeedbackMessagesFromConversations(it.next());
        }
    }

    public boolean isSynced(Conversation conversation) {
        return (StringUtils.isEmpty(conversation.serverId) && StringUtils.isEmpty(conversation.preConversationServerId)) ? false : true;
    }

    public boolean shouldOpen(Conversation conversation) {
        boolean z;
        if (!this.sdkConfigurationDM.getBoolean(SDKConfigurationDM.CONVERSATIONAL_ISSUE_FILING) && conversation.isInPreIssueMode() && StringUtils.isEmpty(conversation.preConversationServerId)) {
            return false;
        }
        if (conversation.isInPreIssueMode() && conversation.isIssueInProgress()) {
            return true;
        }
        IssueState issueState = conversation.state;
        if (conversation.isRedacted) {
            return false;
        }
        if (issueState == IssueState.CLOSED || issueState == IssueState.RESOLUTION_REQUESTED) {
            z = conversation.isStartNewConversationClicked;
        } else {
            if (!conversation.isIssueInProgress()) {
                if (issueState == IssueState.RESOLUTION_ACCEPTED || issueState == IssueState.RESOLUTION_REJECTED || issueState == IssueState.RESOLUTION_EXPIRED || issueState == IssueState.ARCHIVED) {
                    z = conversation.isStartNewConversationClicked;
                } else {
                    if (issueState != IssueState.REJECTED || conversation.isStartNewConversationClicked) {
                        return false;
                    }
                    if (conversation.isInPreIssueMode() && ConversationUtil.getUserMessageCountForConversationLocalId(this.conversationDAO, conversation.localId) <= 0) {
                        return false;
                    }
                }
            }
            return true;
        }
        return !z;
    }

    public MessageDM getLatestUnansweredBotMessage(Conversation conversation) {
        boolean z = true;
        for (int size = conversation.messageDMs.size() - 1; size >= 0; size--) {
            MessageDM messageDM = conversation.messageDMs.get(size);
            if (messageDM.messageType == MessageType.ADMIN_BOT_CONTROL) {
                return null;
            }
            if (messageDM.messageType == MessageType.ADMIN_TEXT_WITH_TEXT_INPUT || messageDM.messageType == MessageType.ADMIN_TEXT_WITH_OPTION_INPUT || messageDM.messageType == MessageType.FAQ_LIST_WITH_OPTION_INPUT || messageDM.messageType == MessageType.ADMIN_RESOLUTION_QUESTION_MESSAGE || messageDM.messageType == MessageType.OPTION_INPUT || messageDM.messageType == MessageType.ADMIN_CSAT_MESSAGE) {
                int i = size + 1;
                while (true) {
                    if (i >= conversation.messageDMs.size()) {
                        z = false;
                        break;
                    }
                    MessageDM messageDM2 = conversation.messageDMs.get(i);
                    if ((messageDM2.messageType == MessageType.USER_RESP_FOR_OPTION_INPUT || messageDM2.messageType == MessageType.USER_RESP_FOR_TEXT_INPUT) && messageDM.serverId.equals(((UserMessageDM) messageDM2).getReferredMessageId())) {
                        break;
                    }
                    i++;
                }
                if (z) {
                    return null;
                }
                return messageDM;
            }
        }
        return null;
    }

    public boolean hasBotSwitchedToAnotherBotInPollerResponse(Collection<? extends MessageDM> collection) {
        if (collection != null && collection.size() != 0) {
            ArrayList arrayList = new ArrayList(collection);
            boolean z = false;
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                MessageDM messageDM = (MessageDM) arrayList.get(size);
                if (MessageType.ADMIN_BOT_CONTROL == messageDM.messageType) {
                    String str = ((AdminBotControlMessageDM) messageDM).actionType;
                    if (BotControlActions.BOT_ENDED.equals(str)) {
                        return z;
                    }
                    if (BotControlActions.BOT_STARTED.equals(str)) {
                        z = true;
                    }
                }
            }
        }
        return false;
    }

    public void sendOptionInputMessage(Conversation conversation, OptionInputMessageDM optionInputMessageDM, OptionInput.Option option, boolean z) {
        String str;
        ValuePair<String, Long> currentAdjustedTimeForStorage = HSDateFormatSpec.getCurrentAdjustedTimeForStorage(this.platform);
        String str2 = currentAdjustedTimeForStorage.first;
        long jLongValue = currentAdjustedTimeForStorage.second.longValue();
        if (z) {
            str = optionInputMessageDM.input.skipLabel;
        } else {
            str = option.title;
        }
        UserResponseMessageForOptionInput userResponseMessageForOptionInput = new UserResponseMessageForOptionInput(str, str2, jLongValue, new Author("mobile", "", Author.AuthorRole.LOCAL_USER), optionInputMessageDM, z);
        userResponseMessageForOptionInput.conversationLocalId = conversation.localId;
        userResponseMessageForOptionInput.updateState(true);
        addMessageToDbAndUI(conversation, userResponseMessageForOptionInput);
        deleteOptionsForAdminMessageWithOptionsInput(optionInputMessageDM);
        sendTextMessage(conversation, userResponseMessageForOptionInput);
    }

    public void updateMessagesClickOnBotSwitch(Conversation conversation, boolean z) {
        Iterator<MessageDM> it = conversation.messageDMs.iterator();
        while (it.hasNext()) {
            updateMessageClickableState(it.next(), z);
        }
    }

    public void handleAdminSuggestedQuestionRead(final Conversation conversation, final FAQListMessageDM fAQListMessageDM, final String str, final String str2) {
        sendMessageWithAutoRetry(new F() { // from class: com.helpshift.conversation.activeconversation.ConversationManager.13
            @Override // com.helpshift.common.domain.F
            public void f() {
                fAQListMessageDM.handleSuggestionClick(conversation, ConversationManager.this.userDM, str, str2);
            }
        });
    }

    public void dropCustomMetaData() {
        this.domain.getMetaDataDM().setCustomMetaDataCallable(null);
        this.domain.getMetaDataDM().clearCustomMetaData();
    }

    public boolean containsAtleastOneUserMessage(Conversation conversation) {
        if (!conversation.isInPreIssueMode()) {
            return true;
        }
        ArrayList arrayList = new ArrayList();
        for (MessageDM messageDM : conversation.messageDMs) {
            if (messageDM.isUISupportedMessage()) {
                if (messageDM instanceof UserMessageDM) {
                    return true;
                }
                arrayList.add(messageDM);
                if (arrayList.size() > 3) {
                    return true;
                }
            }
        }
        return false;
    }

    public void sendConversationPostedEvent(Conversation conversation) {
        HashMap map = new HashMap();
        map.put("id", conversation.serverId);
        if (StringUtils.isNotEmpty(conversation.acid)) {
            map.put("acid", conversation.acid);
        }
        this.domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.CONVERSATION_POSTED, map);
    }

    public void deleteCachedAttachmentFiles(Conversation conversation) {
        List<MessageDM> data = this.conversationDAO.readMessages(conversation.localId.longValue()).getData();
        ArrayList arrayList = new ArrayList();
        for (MessageDM messageDM : data) {
            if (messageDM instanceof ScreenshotMessageDM) {
                ScreenshotMessageDM screenshotMessageDM = (ScreenshotMessageDM) messageDM;
                try {
                    if (FileUtil.deleteFile(screenshotMessageDM.getFilePath())) {
                        screenshotMessageDM.filePath = null;
                        arrayList.add(screenshotMessageDM);
                    }
                } catch (Exception e) {
                    HSLogger.e(TAG, "Exception while deleting ScreenshotMessageDM file", e);
                }
            } else if (messageDM instanceof UserAttachmentMessageDM) {
                UserAttachmentMessageDM userAttachmentMessageDM = (UserAttachmentMessageDM) messageDM;
                try {
                    if (FileUtil.deleteFile(userAttachmentMessageDM.getFilePath())) {
                        userAttachmentMessageDM.filePath = null;
                        arrayList.add(userAttachmentMessageDM);
                    }
                } catch (Exception e2) {
                    HSLogger.e(TAG, "Exception while deleting UserAttachmentMessageDM file", e2);
                }
            }
            if (messageDM instanceof AdminActionCardMessageDM) {
                AdminActionCardMessageDM adminActionCardMessageDM = (AdminActionCardMessageDM) messageDM;
                try {
                    if (FileUtil.deleteFile(adminActionCardMessageDM.actionCard.filePath)) {
                        adminActionCardMessageDM.actionCard.filePath = null;
                        arrayList.add(adminActionCardMessageDM);
                    }
                } catch (Exception e3) {
                    HSLogger.e(TAG, "Exception while deleting AdminActionCardMessageDM file", e3);
                }
            }
        }
        this.conversationDAO.insertOrUpdateMessages(arrayList);
    }

    public int getUnSeenMessageCount(Conversation conversation) {
        int i = 0;
        if (!shouldOpen(conversation)) {
            return 0;
        }
        List<MessageDM> data = this.conversationDAO.readMessages(conversation.localId.longValue()).getData();
        if (data != null) {
            for (MessageDM messageDM : data) {
                if (messageDM.isUISupportedMessage() && messageDM.deliveryState != 1) {
                    switch (messageDM.messageType) {
                        case ADMIN_TEXT:
                        case ADMIN_TEXT_WITH_OPTION_INPUT:
                        case FAQ_LIST:
                        case FAQ_LIST_WITH_OPTION_INPUT:
                        case ADMIN_ATTACHMENT:
                        case ADMIN_IMAGE_ATTACHMENT:
                        case REQUEST_FOR_REOPEN:
                        case REQUESTED_SCREENSHOT:
                        case REQUESTED_APP_REVIEW:
                        case ADMIN_CSAT_MESSAGE:
                        case ADMIN_RESOLUTION_QUESTION_MESSAGE:
                            i++;
                            break;
                        case ADMIN_TEXT_WITH_TEXT_INPUT:
                            if ((messageDM instanceof AdminMessageWithTextInputDM) && !((AdminMessageWithTextInputDM) messageDM).isMessageEmpty) {
                                i++;
                            }
                            break;
                    }
                }
            }
        }
        return conversation.shouldIncrementMessageCount ? i + 1 : i;
    }

    public void handlePreIssueCreationSuccess(Conversation conversation) {
        conversation.lastUserActivityTime = System.currentTimeMillis();
        sendMessageAddedEventOnPreissueCreation(conversation);
    }

    public void sendMessageAddedEventOnPreissueCreation(Conversation conversation) {
        String str;
        HashMap map = new HashMap();
        if (StringUtils.isNotEmpty(conversation.acid)) {
            map.put("acid", conversation.acid);
        }
        Iterator<MessageDM> it = conversation.messageDMs.iterator();
        while (true) {
            if (!it.hasNext()) {
                str = "txt";
                break;
            } else if (it.next() instanceof UserSmartIntentMessageDM) {
                str = "si";
                break;
            }
        }
        map.put("type", str);
        this.domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.MESSAGE_ADDED, map);
    }

    public boolean shouldEnableMessagesClick(Conversation conversation) {
        if (conversation.isInBetweenBotExecution) {
            return false;
        }
        if (conversation.isIssueInProgress()) {
            return true;
        }
        if (conversation.state == IssueState.RESOLUTION_REQUESTED || conversation.state == IssueState.RESOLUTION_ACCEPTED || conversation.state == IssueState.RESOLUTION_EXPIRED || conversation.state == IssueState.ARCHIVED || conversation.state == IssueState.REJECTED || conversation.state == IssueState.CLOSED || conversation.state != IssueState.RESOLUTION_REJECTED) {
            return false;
        }
        return conversation.enableMessageClickOnResolutionRejected;
    }

    public void updateStateBasedOnMessages(Conversation conversation) {
        if (conversation.state != IssueState.RESOLUTION_REQUESTED || conversation.isFeedbackBotEnabled || conversation.messageDMs == null || conversation.messageDMs.size() <= 0) {
            return;
        }
        MessageDM messageDM = null;
        for (int size = conversation.messageDMs.size() - 1; size >= 0; size--) {
            messageDM = conversation.messageDMs.get(size);
            if (!(messageDM instanceof FollowupRejectedMessageDM) && !(messageDM instanceof RequestForReopenMessageDM)) {
                break;
            }
        }
        if (messageDM instanceof ConfirmationAcceptedMessageDM) {
            conversation.state = IssueState.RESOLUTION_ACCEPTED;
        } else if (messageDM instanceof ConfirmationRejectedMessageDM) {
            conversation.state = IssueState.RESOLUTION_REJECTED;
        }
    }

    public void updateIsAutoFilledPreissueFlag(Conversation conversation, boolean z) {
        conversation.isAutoFilledPreIssue = z;
        this.conversationDAO.updateConversationWithoutMessages(conversation);
    }

    public void updateSmartIntentData(Conversation conversation, String str, List<String> list, String str2) {
        conversation.smartIntentTreeId = str;
        conversation.smartIntentIds = list;
        conversation.smartIntentUserQuery = str2;
        this.conversationDAO.updateConversationWithoutMessages(conversation);
    }

    public void clearRequestIdForPendingCreateConversationCalls(List<Conversation> list) {
        if (ListUtils.isEmpty(list)) {
            return;
        }
        String pendingRequestId = this.platform.getNetworkRequestDAO().getPendingRequestId(ConversationController.CREATE_ISSUE_ROUTE, ConversationController.CREATE_ISSUE_UNIQUE_MAPPING_KEY);
        String pendingRequestId2 = this.platform.getNetworkRequestDAO().getPendingRequestId(ConversationController.CREATE_PRE_ISSUE_ROUTE, ConversationController.CREATE_PRE_ISSUE_UNIQUE_MAPPING_KEY);
        if (pendingRequestId == null && pendingRequestId2 == null) {
            return;
        }
        for (Conversation conversation : list) {
            if (conversation.createdRequestId != null) {
                if (conversation.createdRequestId.equals(pendingRequestId)) {
                    this.platform.getNetworkRequestDAO().deletePendingRequestId(ConversationController.CREATE_ISSUE_ROUTE, ConversationController.CREATE_ISSUE_UNIQUE_MAPPING_KEY);
                } else if (conversation.createdRequestId.equals(pendingRequestId2)) {
                    this.platform.getNetworkRequestDAO().deletePendingRequestId(ConversationController.CREATE_PRE_ISSUE_ROUTE, ConversationController.CREATE_PRE_ISSUE_UNIQUE_MAPPING_KEY);
                }
            }
        }
    }

    public void clearRequestIdForPendingSendMessageCalls(Conversation conversation, List<MessageDM> list) {
        if (ListUtils.isEmpty(list)) {
            return;
        }
        String routeForSendingMessage = getRouteForSendingMessage(conversation);
        if (getMessagesLocalIdToPendingRequestIdMap(conversation) == null) {
            return;
        }
        Iterator<MessageDM> it = list.iterator();
        while (it.hasNext()) {
            this.platform.getNetworkRequestDAO().deletePendingRequestId(routeForSendingMessage, String.valueOf(it.next().localId));
        }
    }

    public void updateConversationExpiryProperties(Conversation conversation) {
        if (conversation == null) {
            return;
        }
        if (ConversationUtil.isResolutionQuestionExpired(this.platform, conversation)) {
            markConversationStateToResolutionExpired(conversation);
        }
        if (ConversationUtil.isCSATTimerExpired(this.platform, conversation)) {
            markConversationCSATStateToExpired(conversation);
        }
    }

    public boolean isConversationActionable(Conversation conversation, boolean z) {
        if (conversation == null || !isSynced(conversation)) {
            return false;
        }
        if ((conversation.isInPreIssueMode() && StringUtils.isNotEmpty(conversation.preConversationServerId) && conversation.isIssueInProgress()) || conversation.isIssueInProgress() || conversation.state == IssueState.RESOLUTION_REQUESTED) {
            return true;
        }
        return conversation.state == IssueState.RESOLUTION_REJECTED && z;
    }

    public void downloadAvatarImage(final MessageDM messageDM) {
        this.domain.runParallel(new F() { // from class: com.helpshift.conversation.activeconversation.ConversationManager.14
            @Override // com.helpshift.common.domain.F
            public void f() {
                AvatarImageDownloader.downloadAvatarImage(ConversationManager.this.platform, ConversationManager.this.domain, messageDM);
            }
        });
    }

    public void sendCSATBotResponse(final Conversation conversation, int i, boolean z, AdminCSATMessageWithOptions adminCSATMessageWithOptions) {
        String str;
        String str2;
        ValuePair<String, Long> currentAdjustedTimeForStorage = HSDateFormatSpec.getCurrentAdjustedTimeForStorage(this.platform);
        String str3 = currentAdjustedTimeForStorage.first;
        long jLongValue = currentAdjustedTimeForStorage.second.longValue();
        if (z) {
            str2 = adminCSATMessageWithOptions.csatRatingsInput.startNewConversationLabel;
            str = "{}";
        } else {
            CSATRatingsInput.Rating rating = adminCSATMessageWithOptions.csatRatingsInput.ratings.get(0);
            Iterator<CSATRatingsInput.Rating> it = adminCSATMessageWithOptions.csatRatingsInput.ratings.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                CSATRatingsInput.Rating next = it.next();
                if (next.value == i) {
                    rating = next;
                    break;
                }
            }
            String str4 = rating.title;
            str = rating.jsonData;
            str2 = str4;
        }
        final UserResponseMessageForCSATInput userResponseMessageForCSATInput = new UserResponseMessageForCSATInput(str2, str3, jLongValue, new Author("mobile", "", Author.AuthorRole.LOCAL_USER), i, z, adminCSATMessageWithOptions.csatRatingsInput.botInfo, str, adminCSATMessageWithOptions.serverId, 1);
        userResponseMessageForCSATInput.conversationLocalId = conversation.localId;
        userResponseMessageForCSATInput.updateState(true);
        addMessageToDbAndUI(conversation, userResponseMessageForCSATInput);
        if (!z) {
            sendTextMessage(conversation, userResponseMessageForCSATInput);
        } else {
            sendMessageWithAutoRetry(new F() { // from class: com.helpshift.conversation.activeconversation.ConversationManager.15
                @Override // com.helpshift.common.domain.F
                public void f() {
                    userResponseMessageForCSATInput.send(ConversationManager.this.userDM, conversation);
                }
            });
        }
    }
}
