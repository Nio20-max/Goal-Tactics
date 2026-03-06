package com.helpshift.conversation.viewmodel;

import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.conversation.activeconversation.UIConversation;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.MessageType;
import com.helpshift.conversation.activeconversation.message.ScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.SystemDateMessageDM;
import com.helpshift.conversation.activeconversation.message.SystemDividerMessageDM;
import com.helpshift.conversation.activeconversation.message.SystemMessageDM;
import com.helpshift.conversation.activeconversation.message.SystemPublishIdMessageDM;
import com.helpshift.conversation.activeconversation.message.SystemRedactedConversationMessageDM;
import com.helpshift.conversation.activeconversation.message.UIViewState;
import com.helpshift.conversation.activeconversation.message.UserMessageDM;
import com.helpshift.conversation.activeconversation.message.UserMessageState;
import com.helpshift.conversation.dto.IssueState;
import com.helpshift.util.ErrorReportProvider;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import com.helpshift.util.ValuePair;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* JADX INFO: loaded from: classes2.dex */
public class MessageListVM {
    protected final Domain domain;
    MessageListVMCallback messageListVMCallback;
    protected final Platform platform;
    private long timeZoneOffSet;
    private Map<Long, UIConversation> uiConversationLocalIdMap = new ConcurrentHashMap();
    List<MessageDM> uiMessageDMs;

    public MessageListVM(Platform platform, Domain domain) {
        this.platform = platform;
        this.domain = domain;
        this.timeZoneOffSet = platform.getDevice().getTimeZoneOffSet();
    }

    public void initializeMessageList(List<UIConversation> list, List<MessageDM> list2, boolean z, MessageListVMCallback messageListVMCallback) {
        updateUIConversationOrder(list);
        this.uiMessageDMs = insertSystemMessageDMs(groupConversationRedactedMessages(processAddedMessages(list2)), null, z);
        insertSystemMessageDMsForLatestEmptyConversation(list);
        checkAndUpdateGroupByTime(this.uiMessageDMs, 0, r2.size() - 1);
        this.messageListVMCallback = messageListVMCallback;
    }

    private void insertSystemMessageDMsForLatestEmptyConversation(List<UIConversation> list) {
        if (ListUtils.isEmpty(this.uiMessageDMs)) {
            return;
        }
        List<MessageDM> list2 = this.uiMessageDMs;
        MessageDM messageDM = list2.get(list2.size() - 1);
        Long l = messageDM.conversationLocalId;
        UIConversation uIConversation = list.get(list.size() - 1);
        if (Long.valueOf(uIConversation.localID).equals(l)) {
            return;
        }
        UIConversation uIConversation2 = getUIConversation(messageDM.conversationLocalId.longValue());
        boolean z = !(uIConversation2 != null && uIConversation2.isRedacted) && getIssueStateForMessage(messageDM) == IssueState.REJECTED;
        Date date = new Date(uIConversation.epochCreateTime);
        SystemDividerMessageDM systemDividerMessageDMGenerateConversationDividerMessage = generateConversationDividerMessage(date, z);
        SystemDateMessageDM systemDateMessageDMGenerateSystemDateMessageDM = generateSystemDateMessageDM(date, false, Long.valueOf(uIConversation.localID));
        this.uiMessageDMs.add(systemDividerMessageDMGenerateConversationDividerMessage);
        this.uiMessageDMs.add(systemDateMessageDMGenerateSystemDateMessageDM);
    }

    private synchronized List<MessageDM> groupConversationRedactedMessages(List<MessageDM> list) {
        ArrayList arrayList = new ArrayList();
        if (ListUtils.isEmpty(list)) {
            return arrayList;
        }
        SystemRedactedConversationMessageDM systemRedactedConversationMessageDM = null;
        int i = 0;
        for (MessageDM messageDM : list) {
            if (messageDM instanceof SystemRedactedConversationMessageDM) {
                i++;
                systemRedactedConversationMessageDM = (SystemRedactedConversationMessageDM) messageDM;
            } else {
                if (systemRedactedConversationMessageDM != null) {
                    systemRedactedConversationMessageDM.contiguousRedactedConversationsCount = i;
                    arrayList.add(systemRedactedConversationMessageDM);
                    systemRedactedConversationMessageDM = null;
                    i = 0;
                }
                arrayList.add(messageDM);
            }
        }
        if (systemRedactedConversationMessageDM != null) {
            systemRedactedConversationMessageDM.contiguousRedactedConversationsCount = i;
            arrayList.add(systemRedactedConversationMessageDM);
        }
        return arrayList;
    }

    private synchronized List<MessageDM> filterUIMessages(Collection<? extends MessageDM> collection) {
        ArrayList arrayList = new ArrayList();
        if (collection == null) {
            return arrayList;
        }
        for (MessageDM messageDM : collection) {
            if (messageDM.isUISupportedMessage()) {
                arrayList.add(messageDM);
            }
        }
        return arrayList;
    }

    private boolean isDifferentConversationMessages(MessageDM messageDM, MessageDM messageDM2) {
        if (messageDM == null || messageDM2 == null) {
            return false;
        }
        return !messageDM.conversationLocalId.equals(messageDM2.conversationLocalId);
    }

    private IssueState getIssueStateForMessage(MessageDM messageDM) {
        if (messageDM == null) {
            return IssueState.UNKNOWN;
        }
        UIConversation uIConversation = getUIConversation(messageDM.conversationLocalId.longValue());
        if (uIConversation == null) {
            return IssueState.UNKNOWN;
        }
        return uIConversation.issueState;
    }

    private synchronized List<MessageDM> insertSystemMessageDMs(List<MessageDM> list, MessageDM messageDM, boolean z) {
        ArrayList arrayList;
        arrayList = new ArrayList();
        boolean z2 = this.domain.getSDKConfigurationDM().getBoolean(SDKConfigurationDM.SHOW_CONVERSATION_INFO_SCREEN);
        boolean z3 = !z && messageDM == null;
        for (MessageDM messageDM2 : list) {
            arrayList.addAll(buildSystemMessages(messageDM, messageDM2, z3, z2));
            arrayList.add(messageDM2);
            messageDM = messageDM2;
            z3 = false;
        }
        return arrayList;
    }

    private SystemDividerMessageDM buildSystemDividerMessages(MessageDM messageDM, MessageDM messageDM2) {
        if (messageDM == null || messageDM2 == null || !isDifferentConversationMessages(messageDM, messageDM2)) {
            return null;
        }
        UIConversation uIConversation = getUIConversation(messageDM.conversationLocalId.longValue());
        SystemDividerMessageDM systemDividerMessageDMGenerateConversationDividerMessage = generateConversationDividerMessage(getDateFromMessageDM(messageDM2), !(uIConversation != null && uIConversation.isRedacted) && getIssueStateForMessage(messageDM) == IssueState.REJECTED);
        systemDividerMessageDMGenerateConversationDividerMessage.conversationLocalId = messageDM2.conversationLocalId;
        return systemDividerMessageDMGenerateConversationDividerMessage;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public List<SystemMessageDM> buildSystemMessages(MessageDM messageDM, MessageDM messageDM2, boolean z, boolean z2) {
        if (messageDM2 == null) {
            return new ArrayList();
        }
        ArrayList arrayList = new ArrayList();
        SystemDividerMessageDM systemDividerMessageDMBuildSystemDividerMessages = buildSystemDividerMessages(messageDM, messageDM2);
        if (systemDividerMessageDMBuildSystemDividerMessages != null) {
            arrayList.add(systemDividerMessageDMBuildSystemDividerMessages);
        }
        boolean zIsDifferentConversationMessages = isDifferentConversationMessages(messageDM, messageDM2);
        Date dateFromMessageDM = getDateFromMessageDM(messageDM2);
        UIConversation uIConversation = getUIConversation(messageDM2.conversationLocalId.longValue());
        if (!(uIConversation != null && uIConversation.isRedacted)) {
            if (zIsDifferentConversationMessages || z) {
                if (uIConversation != null) {
                    if ((!z2 || uIConversation.isInPreIssueMode || StringUtils.isEmpty(uIConversation.publishId)) ? false : true) {
                        SystemPublishIdMessageDM systemPublishIdMessageDMGenerateSystemPublishIdMessageDM = generateSystemPublishIdMessageDM(uIConversation.publishId, dateFromMessageDM, z, messageDM2.conversationLocalId);
                        systemPublishIdMessageDMGenerateSystemPublishIdMessageDM.conversationLocalId = messageDM2.conversationLocalId;
                        arrayList.add(systemPublishIdMessageDMGenerateSystemPublishIdMessageDM);
                        z = false;
                    }
                }
                SystemDateMessageDM systemDateMessageDMGenerateSystemDateMessageDM = generateSystemDateMessageDM(dateFromMessageDM, z, messageDM2.conversationLocalId);
                systemDateMessageDMGenerateSystemDateMessageDM.conversationLocalId = messageDM2.conversationLocalId;
                arrayList.add(systemDateMessageDMGenerateSystemDateMessageDM);
            } else if (isMessagesDayDifferent(messageDM, messageDM2) && !isSystemDateMessage(messageDM2)) {
                SystemDateMessageDM systemDateMessageDMGenerateSystemDateMessageDM2 = generateSystemDateMessageDM(dateFromMessageDM, z, messageDM2.conversationLocalId);
                systemDateMessageDMGenerateSystemDateMessageDM2.conversationLocalId = messageDM2.conversationLocalId;
                arrayList.add(systemDateMessageDMGenerateSystemDateMessageDM2);
            }
        }
        return arrayList;
    }

    private SystemDateMessageDM generateSystemDateMessageDM(Date date, boolean z, Long l) {
        String str = HSDateFormatSpec.STORAGE_TIME_FORMAT.format(new Date(date.getTime()));
        SystemDateMessageDM systemDateMessageDM = new SystemDateMessageDM(str, getEpochTimeForSystemMessage(str), z);
        systemDateMessageDM.setDependencies(this.domain, this.platform);
        systemDateMessageDM.conversationLocalId = l;
        return systemDateMessageDM;
    }

    private SystemDividerMessageDM generateConversationDividerMessage(Date date, boolean z) {
        String str = HSDateFormatSpec.STORAGE_TIME_FORMAT.format(new Date(date.getTime()));
        SystemDividerMessageDM systemDividerMessageDM = new SystemDividerMessageDM(str, getEpochTimeForSystemMessage(str), z);
        systemDividerMessageDM.setDependencies(this.domain, this.platform);
        return systemDividerMessageDM;
    }

    private SystemPublishIdMessageDM generateSystemPublishIdMessageDM(String str, Date date, boolean z, Long l) {
        String str2 = HSDateFormatSpec.STORAGE_TIME_FORMAT.format(new Date(date.getTime()));
        SystemPublishIdMessageDM systemPublishIdMessageDM = new SystemPublishIdMessageDM(str, str2, getEpochTimeForSystemMessage(str2), z);
        systemPublishIdMessageDM.setDependencies(this.domain, this.platform);
        systemPublishIdMessageDM.conversationLocalId = l;
        return systemPublishIdMessageDM;
    }

    private long getEpochTimeForSystemMessage(String str) {
        return HSDateFormatSpec.convertToEpochTime(str) - 1;
    }

    private Date getDateFromMessageDM(MessageDM messageDM) {
        return new Date(messageDM.getEpochCreatedAtTime());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isSystemMessage(MessageDM messageDM) {
        return messageDM instanceof SystemMessageDM;
    }

    private boolean isSystemDateMessage(MessageDM messageDM) {
        return messageDM instanceof SystemDateMessageDM;
    }

    private boolean isMessagesDayDifferent(MessageDM messageDM, MessageDM messageDM2) {
        if (messageDM == null || messageDM2 == null) {
            return false;
        }
        return isDayDifferent(messageDM.getEpochCreatedAtTime(), messageDM2.getEpochCreatedAtTime());
    }

    private boolean isDayDifferent(long j, long j2) {
        long j3 = this.timeZoneOffSet;
        return (j + j3) / ErrorReportProvider.BATCH_TIME != (j2 + j3) / ErrorReportProvider.BATCH_TIME;
    }

    private boolean isMinuteDifferent(long j, long j2) {
        long j3 = this.timeZoneOffSet;
        return (j + j3) / 60000 != (j2 + j3) / 60000;
    }

    private Comparator<MessageDM> getSortMessagesComparator() {
        return new Comparator<MessageDM>() { // from class: com.helpshift.conversation.viewmodel.MessageListVM.1
            @Override // java.util.Comparator
            public int compare(MessageDM messageDM, MessageDM messageDM2) {
                UIConversation uIConversation = MessageListVM.this.getUIConversation(messageDM.conversationLocalId.longValue());
                UIConversation uIConversation2 = MessageListVM.this.getUIConversation(messageDM2.conversationLocalId.longValue());
                if (uIConversation != null && uIConversation2 != null) {
                    Integer numValueOf = Integer.valueOf(uIConversation.index);
                    Integer numValueOf2 = Integer.valueOf(uIConversation2.index);
                    if (numValueOf.intValue() < numValueOf2.intValue()) {
                        return -1;
                    }
                    if (numValueOf.intValue() > numValueOf2.intValue()) {
                        return 1;
                    }
                    long epochCreatedAtTime = messageDM.getEpochCreatedAtTime();
                    long epochCreatedAtTime2 = messageDM2.getEpochCreatedAtTime();
                    if (epochCreatedAtTime > epochCreatedAtTime2) {
                        return 1;
                    }
                    if (epochCreatedAtTime < epochCreatedAtTime2) {
                        return -1;
                    }
                }
                return 0;
            }
        };
    }

    protected List<MessageDM> processAddedMessages(Collection<? extends MessageDM> collection) {
        List<MessageDM> listFilterUIMessages = filterUIMessages(collection);
        Collections.sort(listFilterUIMessages, getSortMessagesComparator());
        return listFilterUIMessages;
    }

    public void addMessages(Collection<? extends MessageDM> collection) {
        final List<MessageDM> listProcessAddedMessages = processAddedMessages(collection);
        if (listProcessAddedMessages.size() > 0) {
            this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.MessageListVM.2
                @Override // com.helpshift.common.domain.F
                public void f() {
                    MessageDM itemAtPosition = MessageListVM.this.getItemAtPosition(r0.uiMessageDMs.size() - 1);
                    if (itemAtPosition == null || itemAtPosition.getEpochCreatedAtTime() <= ((MessageDM) listProcessAddedMessages.get(0)).getEpochCreatedAtTime()) {
                        MessageListVM.this.appendUIMessages(listProcessAddedMessages);
                    } else {
                        MessageListVM.this.insertUIMessages(listProcessAddedMessages);
                    }
                    MessageListVM.this.notifyNewUIMessagesAdded(listProcessAddedMessages);
                    MessageListVM.this.notifyUIMessageListUpdated();
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyNewUIMessagesAdded(List<MessageDM> list) {
        boolean zContainsAdminMessages = containsAdminMessages(list);
        MessageListVMCallback messageListVMCallback = this.messageListVMCallback;
        if (messageListVMCallback != null) {
            if (zContainsAdminMessages) {
                messageListVMCallback.newAdminMessagesAdded();
            } else {
                messageListVMCallback.newUserMessagesAdded();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void appendUIMessages(List<MessageDM> list) {
        int iIntValue;
        int size = this.uiMessageDMs.size();
        int i = size - 1;
        List<MessageDM> listInsertSystemMessageDMs = insertSystemMessageDMs(list, getItemAtPosition(i), true);
        this.uiMessageDMs.addAll(listInsertSystemMessageDMs);
        List<MessageDM> list2 = this.uiMessageDMs;
        ValuePair<Integer, Integer> valuePairCheckAndUpdateGroupByTime = checkAndUpdateGroupByTime(list2, i, list2.size() - 1);
        MessageListVMCallback messageListVMCallback = this.messageListVMCallback;
        if (messageListVMCallback != null) {
            messageListVMCallback.appendMessages(size, listInsertSystemMessageDMs.size());
            if (valuePairCheckAndUpdateGroupByTime == null || (iIntValue = valuePairCheckAndUpdateGroupByTime.first.intValue()) >= size) {
                return;
            }
            this.messageListVMCallback.updateMessages(iIntValue, size - iIntValue);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void insertUIMessages(List<MessageDM> list) {
        Iterator<MessageDM> it = list.iterator();
        while (it.hasNext()) {
            insertUIMessage(it.next());
        }
        notifyMessageListVMRefreshAll();
    }

    void insertUIMessage(MessageDM messageDM) {
        int iFindBinaryIndexIntoUIList = findBinaryIndexIntoUIList(messageDM);
        this.uiMessageDMs.add(iFindBinaryIndexIntoUIList, messageDM);
        checkAndUpdateGroupByDate(iFindBinaryIndexIntoUIList);
        checkAndUpdateGroupByTime(this.uiMessageDMs, iFindBinaryIndexIntoUIList - 1, iFindBinaryIndexIntoUIList + 1);
    }

    private boolean containsAdminMessages(List<MessageDM> list) {
        Iterator<MessageDM> it = list.iterator();
        while (it.hasNext()) {
            if (isAdminMessage(it.next())) {
                return true;
            }
        }
        return false;
    }

    public void insertOrUpdateMessage(final MessageDM messageDM) {
        if (messageDM == null || !messageDM.isUISupportedMessage()) {
            return;
        }
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.MessageListVM.3
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (MessageListVM.this.uiMessageDMs.contains(messageDM)) {
                    MessageListVM.this.updateUIMessage(messageDM);
                } else {
                    MessageListVM.this.insertUIMessage(messageDM);
                    MessageListVM.this.notifyNewUIMessagesAdded(new ArrayList(Collections.singletonList(messageDM)));
                    MessageListVM.this.notifyMessageListVMRefreshAll();
                }
                MessageListVM.this.notifyUIMessageListUpdated();
            }
        });
    }

    void updateUIMessage(MessageDM messageDM) {
        int i;
        int iIndexOf = this.uiMessageDMs.indexOf(messageDM);
        if (iIndexOf == -1) {
            return;
        }
        if (isMessageAtCorrectPosition(iIndexOf)) {
            boolean zCheckAndUpdateGroupByDate = checkAndUpdateGroupByDate(iIndexOf);
            ValuePair<Integer, Integer> valuePairCheckAndUpdateGroupByTime = checkAndUpdateGroupByTime(this.uiMessageDMs, iIndexOf - 1, iIndexOf + 1);
            if (zCheckAndUpdateGroupByDate) {
                notifyMessageListVMRefreshAll();
                return;
            }
            if (valuePairCheckAndUpdateGroupByTime != null) {
                int iMin = Math.min(iIndexOf, valuePairCheckAndUpdateGroupByTime.first.intValue());
                int iMax = Math.max(iIndexOf, valuePairCheckAndUpdateGroupByTime.second.intValue());
                iIndexOf = iMin;
                i = iMax;
            } else {
                i = iIndexOf;
            }
            if (this.messageListVMCallback == null || iIndexOf > i || i >= this.uiMessageDMs.size()) {
                return;
            }
            this.messageListVMCallback.updateMessages(iIndexOf, (i - iIndexOf) + 1);
            return;
        }
        this.uiMessageDMs.remove(iIndexOf);
        int i2 = iIndexOf - 1;
        checkAndUpdateGroupByDate(i2);
        checkAndUpdateGroupByTime(this.uiMessageDMs, i2, iIndexOf + 1);
        insertUIMessage(messageDM);
        notifyMessageListVMRefreshAll();
    }

    void notifyMessageListVMRefreshAll() {
        MessageListVMCallback messageListVMCallback = this.messageListVMCallback;
        if (messageListVMCallback != null) {
            messageListVMCallback.refreshAll();
        }
    }

    void notifyMessageListUpdate(ValuePair<Integer, Integer> valuePair) {
        if (valuePair == null) {
            return;
        }
        int iIntValue = valuePair.first.intValue();
        int iIntValue2 = (valuePair.second.intValue() - iIntValue) + 1;
        if (this.messageListVMCallback == null || iIntValue <= 0 || iIntValue2 <= 0 || valuePair.second.intValue() >= this.uiMessageDMs.size()) {
            return;
        }
        this.messageListVMCallback.updateMessages(iIntValue, iIntValue2);
    }

    boolean isMessageAtCorrectPosition(int i) {
        MessageDM itemAtPosition = getItemAtPosition(i);
        if (itemAtPosition == null) {
            return true;
        }
        MessageDM itemAtPosition2 = getItemAtPosition(i - 1);
        if (itemAtPosition2 != null && itemAtPosition.getEpochCreatedAtTime() < itemAtPosition2.getEpochCreatedAtTime()) {
            return false;
        }
        MessageDM itemAtPosition3 = getItemAtPosition(i + 1);
        return itemAtPosition3 == null || itemAtPosition.getEpochCreatedAtTime() <= itemAtPosition3.getEpochCreatedAtTime();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public MessageDM getItemAtPosition(int i) {
        if (i < 0 || i >= this.uiMessageDMs.size()) {
            return null;
        }
        return this.uiMessageDMs.get(i);
    }

    private int findBinaryIndexIntoUIList(MessageDM messageDM) {
        int iFindBinaryIndex;
        int size = this.uiMessageDMs.size();
        if (size != 0 && (iFindBinaryIndex = findBinaryIndex(messageDM.getEpochCreatedAtTime(), 0, size - 1)) >= 0) {
            return iFindBinaryIndex > size ? size : iFindBinaryIndex;
        }
        return 0;
    }

    private int findBinaryIndex(long j, int i, int i2) {
        int i3 = ((i2 - i) / 2) + i;
        if (i == i3) {
            return j < this.uiMessageDMs.get(i).getEpochCreatedAtTime() ? i : j >= this.uiMessageDMs.get(i2).getEpochCreatedAtTime() ? i2 + 1 : i2;
        }
        if (this.uiMessageDMs.get(i3).getEpochCreatedAtTime() <= j) {
            return findBinaryIndex(j, i3, i2);
        }
        return findBinaryIndex(j, i, i3);
    }

    private boolean isUserMessage(MessageDM messageDM) {
        return (isAdminMessage(messageDM) || isSystemMessage(messageDM)) ? false : true;
    }

    private boolean isAdminMessage(MessageDM messageDM) {
        return messageDM.isAdminMessage;
    }

    private boolean isUserMessageSent(MessageDM messageDM) {
        if (messageDM == null) {
            return false;
        }
        return (messageDM.messageType == MessageType.USER_TEXT || messageDM.messageType == MessageType.USER_RESP_FOR_TEXT_INPUT || messageDM.messageType == MessageType.USER_RESP_FOR_OPTION_INPUT) ? ((UserMessageDM) messageDM).getState() == UserMessageState.SENT : messageDM.messageType == MessageType.SCREENSHOT && ((ScreenshotMessageDM) messageDM).state == UserMessageState.SENT;
    }

    private boolean canGroupMessagesByTime(MessageDM messageDM, MessageDM messageDM2) {
        if (messageDM == null || messageDM2 == null || StringUtils.isEmpty(messageDM2.body)) {
            return false;
        }
        if (!((isUserMessage(messageDM) && isUserMessage(messageDM2)) || (isAdminMessage(messageDM) && isAdminMessage(messageDM2))) || isMinuteDifferent(messageDM.getEpochCreatedAtTime(), messageDM2.getEpochCreatedAtTime())) {
            return false;
        }
        if (isUserMessage(messageDM)) {
            return isUserMessageSent(messageDM) && isUserMessageSent(messageDM2);
        }
        String displayedAuthorName = messageDM.getDisplayedAuthorName();
        String displayedAuthorName2 = messageDM2.getDisplayedAuthorName();
        String str = messageDM.author.authorId;
        String str2 = messageDM2.author.authorId;
        if (!StringUtils.isEmpty(str) && !StringUtils.isEmpty(str2)) {
            return str.equals(str2);
        }
        if (displayedAuthorName == null) {
            return displayedAuthorName2 == null;
        }
        return displayedAuthorName.equals(displayedAuthorName2);
    }

    private boolean updateMessageGroupViewState(MessageDM messageDM, boolean z, boolean z2) {
        UIViewState uIViewState;
        UIViewState uIViewState2;
        UIViewState uiViewState = messageDM.getUiViewState();
        if (z) {
            if (z2) {
                uIViewState = new UIViewState(true, false);
            } else {
                uIViewState2 = new UIViewState(true, isUserMessage(messageDM));
                uIViewState = uIViewState2;
            }
        } else if (z2) {
            uIViewState2 = new UIViewState(false, isAdminMessage(messageDM));
            uIViewState = uIViewState2;
        } else {
            uIViewState = new UIViewState(false, true);
        }
        if (uiViewState.equals(uIViewState)) {
            return false;
        }
        uiViewState.updateViewState(uIViewState);
        return true;
    }

    boolean isGroupFirstMessageAtIndex(int i) {
        if (i < 0) {
            return false;
        }
        if (i == 0) {
            return true;
        }
        return !canGroupMessagesByTime(this.uiMessageDMs.get(i - 1), this.uiMessageDMs.get(i));
    }

    synchronized ValuePair<Integer, Integer> checkAndUpdateGroupByTime(List<MessageDM> list, int i, int i2) {
        int i3;
        int i4;
        boolean z;
        boolean zUpdateMessageGroupViewState;
        int size = list.size();
        int iMax = Math.max(i, 0);
        int i5 = size - 1;
        int iMin = Math.min(i2, i5);
        if (iMin < iMax) {
            return null;
        }
        if (iMax > 0) {
            i3 = iMax - 1;
            MessageDM messageDM = list.get(i3);
            boolean zIsGroupFirstMessageAtIndex = isGroupFirstMessageAtIndex(i3);
            boolean zCanGroupMessagesByTime = canGroupMessagesByTime(messageDM, list.get(iMax));
            if (updateMessageGroupViewState(messageDM, zIsGroupFirstMessageAtIndex, !zCanGroupMessagesByTime)) {
                i4 = i3;
            } else {
                i3 = -1;
                i4 = -1;
            }
            z = !zCanGroupMessagesByTime;
        } else {
            i3 = -1;
            i4 = -1;
            z = true;
        }
        while (iMax <= iMin) {
            MessageDM messageDM2 = list.get(iMax);
            if (iMax == i5) {
                zUpdateMessageGroupViewState = updateMessageGroupViewState(messageDM2, z, true);
            } else if (canGroupMessagesByTime(messageDM2, list.get(iMax + 1))) {
                zUpdateMessageGroupViewState = updateMessageGroupViewState(messageDM2, z, false);
                z = false;
            } else {
                zUpdateMessageGroupViewState = updateMessageGroupViewState(messageDM2, z, true);
                z = true;
            }
            if (zUpdateMessageGroupViewState) {
                if (i3 == -1) {
                    i3 = iMax;
                }
                i4 = iMax;
            }
            iMax++;
        }
        return i3 != -1 ? new ValuePair<>(Integer.valueOf(i3), Integer.valueOf(i4)) : null;
    }

    boolean checkAndUpdateGroupByDate(int i) {
        boolean z;
        MessageDM itemAtPosition = getItemAtPosition(i);
        MessageDM itemAtPosition2 = getItemAtPosition(i + 1);
        if (isSystemDateMessage(itemAtPosition) && (itemAtPosition2 == null || isSystemDateMessage(itemAtPosition2))) {
            this.uiMessageDMs.remove(i);
            i--;
            z = true;
        } else {
            z = false;
        }
        MessageDM itemAtPosition3 = getItemAtPosition(i);
        MessageDM itemAtPosition4 = getItemAtPosition(i - 1);
        if (itemAtPosition4 != null && itemAtPosition3 != null && !isSystemDateMessage(itemAtPosition3) && isMessagesDayDifferent(itemAtPosition4, itemAtPosition3)) {
            this.uiMessageDMs.add(i, generateSystemDateMessageDM(new Date(itemAtPosition3.getEpochCreatedAtTime()), itemAtPosition3.getEpochCreatedAtTime() == -1, itemAtPosition3.conversationLocalId));
            return true;
        }
        return z;
    }

    public void unregisterMessageListVMCallback() {
        this.messageListVMCallback = null;
    }

    public List<MessageDM> getUiMessageDMs() {
        return this.uiMessageDMs;
    }

    public void prependMessages(List<MessageDM> list, boolean z) {
        if (ListUtils.isEmpty(list)) {
            if (z) {
                return;
            }
            checkAndPrependSystemMessagesBeforeFirstMessage();
        } else {
            List<MessageDM> listFilterUIMessages = filterUIMessages(list);
            Collections.sort(listFilterUIMessages, getSortMessagesComparator());
            List<MessageDM> listInsertSystemMessageDMs = insertSystemMessageDMs(groupConversationRedactedMessages(listFilterUIMessages), null, z);
            checkAndUpdateGroupByTime(listInsertSystemMessageDMs, 0, listInsertSystemMessageDMs.size() - 1);
            prependMessagesInternal(listInsertSystemMessageDMs);
        }
    }

    void checkAndPrependSystemMessagesBeforeFirstMessage() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.MessageListVM.4
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (MessageListVM.this.uiMessageDMs.size() == 0) {
                    return;
                }
                MessageDM messageDM = MessageListVM.this.uiMessageDMs.get(0);
                if (MessageListVM.this.isSystemMessage(messageDM)) {
                    return;
                }
                List listBuildSystemMessages = MessageListVM.this.buildSystemMessages(null, messageDM, true, MessageListVM.this.domain.getSDKConfigurationDM().getBoolean(SDKConfigurationDM.SHOW_CONVERSATION_INFO_SCREEN));
                if (ListUtils.isEmpty(listBuildSystemMessages)) {
                    return;
                }
                MessageListVM.this.uiMessageDMs.addAll(0, listBuildSystemMessages);
                if (MessageListVM.this.messageListVMCallback != null) {
                    MessageListVM.this.messageListVMCallback.appendMessages(0, listBuildSystemMessages.size());
                }
            }
        });
    }

    void prependMessagesInternal(final List<MessageDM> list) {
        if (ListUtils.isEmpty(list)) {
            return;
        }
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.MessageListVM.5
            @Override // com.helpshift.common.domain.F
            public void f() {
                list.addAll(MessageListVM.this.buildSystemMessages((MessageDM) list.get(r0.size() - 1), !ListUtils.isEmpty(MessageListVM.this.uiMessageDMs) ? MessageListVM.this.uiMessageDMs.get(0) : null, false, MessageListVM.this.domain.getSDKConfigurationDM().getBoolean(SDKConfigurationDM.SHOW_CONVERSATION_INFO_SCREEN)));
                int size = list.size();
                MessageListVM.this.uiMessageDMs.addAll(0, list);
                if (MessageListVM.this.messageListVMCallback != null) {
                    MessageListVM.this.messageListVMCallback.appendMessages(0, size);
                }
                int i = size - 1;
                boolean zCheckAndUpdateGroupByDate = MessageListVM.this.checkAndUpdateGroupByDate(i);
                MessageListVM messageListVM = MessageListVM.this;
                ValuePair<Integer, Integer> valuePairCheckAndUpdateGroupByTime = messageListVM.checkAndUpdateGroupByTime(messageListVM.uiMessageDMs, i, size + 1);
                if (zCheckAndUpdateGroupByDate) {
                    MessageListVM.this.notifyMessageListVMRefreshAll();
                } else if (valuePairCheckAndUpdateGroupByTime != null) {
                    MessageListVM.this.notifyMessageListUpdate(valuePairCheckAndUpdateGroupByTime);
                }
            }
        });
    }

    public synchronized UIConversation getUIConversation(long j) {
        return this.uiConversationLocalIdMap.get(Long.valueOf(j));
    }

    public synchronized void updateUIConversationOrder(List<UIConversation> list) {
        if (ListUtils.isEmpty(list)) {
            return;
        }
        this.uiConversationLocalIdMap.clear();
        for (UIConversation uIConversation : list) {
            this.uiConversationLocalIdMap.put(Long.valueOf(uIConversation.localID), uIConversation);
        }
    }

    public List<MessageDM> copyOfUIMessageDMs() {
        if (this.uiMessageDMs != null) {
            return new ArrayList(this.uiMessageDMs);
        }
        return new ArrayList();
    }

    public MessageDM getLastUIMessage() {
        int size = this.uiMessageDMs.size();
        if (size > 0) {
            return this.uiMessageDMs.get(size - 1);
        }
        return null;
    }

    public void remove(List<MessageDM> list) {
        final List<MessageDM> listFilterUIMessages = filterUIMessages(list);
        if (ListUtils.isEmpty(listFilterUIMessages)) {
            return;
        }
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.MessageListVM.6
            @Override // com.helpshift.common.domain.F
            public void f() {
                Iterator it = listFilterUIMessages.iterator();
                boolean z = false;
                while (it.hasNext()) {
                    int iIndexOf = MessageListVM.this.uiMessageDMs.indexOf((MessageDM) it.next());
                    if (iIndexOf != -1) {
                        MessageListVM.this.uiMessageDMs.remove(iIndexOf);
                        int i = iIndexOf - 1;
                        MessageListVM.this.checkAndUpdateGroupByDate(i);
                        MessageListVM messageListVM = MessageListVM.this;
                        messageListVM.checkAndUpdateGroupByTime(messageListVM.uiMessageDMs, i, iIndexOf + 1);
                        z = true;
                    }
                }
                if (z) {
                    MessageListVM.this.notifyMessageListVMRefreshAll();
                    MessageListVM.this.notifyUIMessageListUpdated();
                }
            }
        });
    }

    void notifyUIMessageListUpdated() {
        MessageListVMCallback messageListVMCallback = this.messageListVMCallback;
        if (messageListVMCallback != null) {
            messageListVMCallback.onUIMessageListUpdated();
        }
    }
}
