package com.helpshift.conversation.viewmodel;

import com.helpshift.account.AuthenticationFailureDM;
import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.analytics.AnalyticsEventKey;
import com.helpshift.analytics.AnalyticsEventType;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.PlatformException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.conversation.ConversationUtil;
import com.helpshift.conversation.IssueType;
import com.helpshift.conversation.activeconversation.ConversationManager;
import com.helpshift.conversation.activeconversation.ConversationalRenderer;
import com.helpshift.conversation.activeconversation.UIConversation;
import com.helpshift.conversation.activeconversation.ViewableConversation;
import com.helpshift.conversation.activeconversation.message.AdminActionCardMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminCSATMessageWithOptions;
import com.helpshift.conversation.activeconversation.message.AdminMessageWithOptionInputDM;
import com.helpshift.conversation.activeconversation.message.AdminMessageWithTextInputDM;
import com.helpshift.conversation.activeconversation.message.AdminResolutionMessageWithOptions;
import com.helpshift.conversation.activeconversation.message.AttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.Author;
import com.helpshift.conversation.activeconversation.message.AvatarImageDownloader;
import com.helpshift.conversation.activeconversation.message.ConversationFooterState;
import com.helpshift.conversation.activeconversation.message.FAQListMessageDM;
import com.helpshift.conversation.activeconversation.message.FAQListMessageWithOptionInputDM;
import com.helpshift.conversation.activeconversation.message.HistoryLoadingState;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.MessageType;
import com.helpshift.conversation.activeconversation.message.OptionInputMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestAppReviewMessageDM;
import com.helpshift.conversation.activeconversation.message.ScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.SystemRedactedConversationMessageDM;
import com.helpshift.conversation.activeconversation.message.UserAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.UserMessageDM;
import com.helpshift.conversation.activeconversation.message.UserMessageState;
import com.helpshift.conversation.activeconversation.message.UserResponseMessageForOptionInput;
import com.helpshift.conversation.activeconversation.message.UserResponseMessageForTextInputDM;
import com.helpshift.conversation.activeconversation.message.UserSmartIntentMessageDM;
import com.helpshift.conversation.activeconversation.message.input.OptionInput;
import com.helpshift.conversation.activeconversation.message.input.TextInput;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.domainmodel.ConversationController;
import com.helpshift.conversation.dto.AttachmentPickerFile;
import com.helpshift.conversation.dto.IssueState;
import com.helpshift.conversation.smartintent.BaseSmartIntentViewState;
import com.helpshift.conversation.smartintent.LeafIntentUIModel;
import com.helpshift.conversation.smartintent.RootIntentUIModel;
import com.helpshift.conversation.smartintent.SearchIntentUIModel;
import com.helpshift.conversation.smartintent.SmartIntentCollapsedRootViewState;
import com.helpshift.conversation.smartintent.SmartIntentDM;
import com.helpshift.conversation.smartintent.SmartIntentSavedState;
import com.helpshift.util.AttachmentConstants;
import com.helpshift.util.HSLogger;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import com.helpshift.widget.BaseViewState;
import com.helpshift.widget.ConversationFooterViewState;
import com.helpshift.widget.HistoryLoadingViewState;
import com.helpshift.widget.MutableBaseViewState;
import com.helpshift.widget.MutableConversationFooterViewState;
import com.helpshift.widget.MutableHistoryLoadingViewState;
import com.helpshift.widget.MutableReplyBoxViewState;
import com.helpshift.widget.MutableReplyFieldViewState;
import com.helpshift.widget.MutableScrollJumperViewState;
import com.helpshift.widget.ReplyBoxViewState;
import com.helpshift.widget.ReplyFieldViewState;
import com.helpshift.widget.ScrollJumperViewState;
import com.helpshift.widget.WidgetGateway;
import java.net.URI;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationalVM implements ConversationController.StartNewConversationListener, ListPickerVMCallback, ConversationVMCallback, MessageListVMCallback, AuthenticationFailureDM.AuthenticationFailureObserver, SmartIntentVMCallback {
    public static final String CREATE_NEW_PRE_ISSUE = "create_new_pre_issue";
    public static final int NO_NETWORK_ERROR = 1;
    public static final int POLL_FAILURE_ERROR = 2;
    private static final String TAG = "Helpshift_ConvsatnlVM";
    MutableBaseViewState attachImageButtonViewState;
    boolean awaitingUserInputForBotStep;
    private MessageDM botMessageDM;
    MutableBaseViewState confirmationBoxViewState;
    final ConversationController conversationController;
    MutableConversationFooterViewState conversationFooterViewState;
    ConversationManager conversationManager;
    Domain domain;
    MutableHistoryLoadingViewState historyLoadingViewState;
    protected boolean isConversationRejected;
    boolean isInBetweenBotExecution;
    private boolean isScreenCurrentlyVisible;
    boolean isShowingPollFailureError;
    boolean isUserReplyDraftClearedForBotChange;
    private ListPickerVM listPickerVM;
    MessageListVM messageListVM;
    Platform platform;
    ConversationalRenderer renderer;
    MutableReplyBoxViewState replyBoxViewState;
    MutableBaseViewState replyButtonViewState;
    MutableReplyFieldViewState replyFieldViewState;
    private boolean retainMessageBoxOnUI;
    MutableScrollJumperViewState scrollJumperViewState;
    final SDKConfigurationDM sdkConfigurationDM;
    private boolean showConversationHistory;
    private SmartIntentDM smartIntentDM;
    private SmartIntentVM smartIntentVM;
    public final ViewableConversation viewableConversation;
    WidgetGateway widgetGateway;
    boolean isNetworkAvailable = true;
    Map<MessageDM, Boolean> messageToAvatarTriggeredMap = new HashMap();
    private String lastCSATStartRatingEventId = "";
    private String lastCSATRequestedEventId = "";

    public ConversationalVM(Platform platform, Domain domain, ConversationController conversationController, ViewableConversation viewableConversation, ConversationalRenderer conversationalRenderer, boolean z, boolean z2) {
        this.domain = domain;
        this.platform = platform;
        this.conversationController = conversationController;
        this.viewableConversation = viewableConversation;
        SDKConfigurationDM sDKConfigurationDM = domain.getSDKConfigurationDM();
        this.sdkConfigurationDM = sDKConfigurationDM;
        this.retainMessageBoxOnUI = z2;
        this.conversationManager = conversationController.conversationManager;
        domain.getAuthenticationFailureDM().registerListener(this);
        this.widgetGateway = new WidgetGateway(sDKConfigurationDM, conversationController);
        Conversation activeConversation = viewableConversation.getActiveConversation();
        this.conversationManager.updateConversationExpiryProperties(activeConversation);
        UserDM activeUser = domain.getUserManagerDM().getActiveUser();
        SmartIntentDM smartIntentDM = domain.getSmartIntentDM();
        this.smartIntentDM = smartIntentDM;
        this.smartIntentVM = new SmartIntentVM(platform, domain, smartIntentDM, activeUser, activeConversation, this);
        this.replyFieldViewState = this.widgetGateway.makeReplyFieldViewState();
        this.historyLoadingViewState = new MutableHistoryLoadingViewState();
        this.scrollJumperViewState = this.widgetGateway.makeScrollJumperViewState();
        boolean zShouldShowReplyBoxOnConversationRejected = shouldShowReplyBoxOnConversationRejected();
        this.conversationManager.setEnableMessageClickOnResolutionRejected(activeConversation, zShouldShowReplyBoxOnConversationRejected);
        this.conversationFooterViewState = this.widgetGateway.makeConversationFooterViewState(activeConversation, zShouldShowReplyBoxOnConversationRejected);
        this.attachImageButtonViewState = this.widgetGateway.makeAttachImageButtonViewState(viewableConversation.getActiveConversation());
        this.replyButtonViewState = new MutableBaseViewState();
        this.replyBoxViewState = this.widgetGateway.makeReplyBoxViewState(activeConversation, zShouldShowReplyBoxOnConversationRejected);
        this.confirmationBoxViewState = this.widgetGateway.makeConfirmationBoxViewState(activeConversation);
        conversationController.setConversationViewState(this.replyBoxViewState.isVisible() ? 2 : -1);
        if (!zShouldShowReplyBoxOnConversationRejected && activeConversation.state == IssueState.RESOLUTION_REJECTED) {
            this.conversationManager.handleConversationEnded(activeConversation);
        }
        retryFallbackAvatarImageDownload();
        viewableConversation.setConversationVMCallback(this);
        this.renderer = conversationalRenderer;
        this.conversationManager.removeFeedbackMessagesFromConversations(viewableConversation);
        initMessagesList();
        this.showConversationHistory = z;
    }

    public void onResume() {
        refreshVM();
        renderMenuItems();
        setScreenVisibility(true);
        setUserCanReadMessages(true);
        markMessagesAsSeenOnEntry();
        clearNotifications();
    }

    public void onPause() {
        setScreenVisibility(false);
        setUserCanReadMessages(false);
        markMessagesAsSeenOnExit();
        clearNotifications();
        resetIncrementMessageCountFlag();
        saveReplyText(this.renderer.getReply());
    }

    public void handleRootIntentSelected(RootIntentUIModel rootIntentUIModel) {
        this.smartIntentVM.handleRootIntentSelected(rootIntentUIModel);
    }

    public void handleLeafIntentSelected(LeafIntentUIModel leafIntentUIModel) {
        this.smartIntentVM.handleLeafIntentSelected(leafIntentUIModel);
    }

    public void handleSearchIntentSelected(SearchIntentUIModel searchIntentUIModel) {
        this.smartIntentVM.handleSearchIntentSelected(searchIntentUIModel);
    }

    public void renderMenuItems() {
        this.replyButtonViewState.setEnabled(!StringUtils.isEmpty(this.replyFieldViewState.getReplyText()));
        updateAttachmentButtonViewState();
    }

    private void setScreenVisibility(boolean z) {
        this.isScreenCurrentlyVisible = z;
    }

    private void setUserCanReadMessages(boolean z) {
        this.conversationController.setUserCanReadMessages(z);
        onAgentTypingUpdate(this.viewableConversation.isAgentTyping());
    }

    private void markMessagesAsSeenOnExit() {
        final ArrayList arrayList = new ArrayList(this.viewableConversation.getAllConversations());
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        if (!this.conversationManager.isSynced(activeConversation)) {
            arrayList.remove(activeConversation);
        }
        this.domain.runParallel(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    ConversationalVM.this.conversationManager.markMessagesAsSeen((Conversation) it.next());
                }
            }
        });
    }

    private void markMessagesAsSeenOnEntry() {
        final Conversation activeConversation = this.viewableConversation.getActiveConversation();
        if (this.conversationManager.isSynced(activeConversation)) {
            this.domain.runParallel(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.2
                @Override // com.helpshift.common.domain.F
                public void f() {
                    if (activeConversation != null) {
                        ConversationalVM.this.conversationManager.markMessagesAsSeen(activeConversation);
                    }
                }
            });
        }
    }

    public void unregisterRenderer() {
        this.viewableConversation.unregisterConversationVMCallback();
        MessageListVM messageListVM = this.messageListVM;
        if (messageListVM != null) {
            messageListVM.unregisterMessageListVMCallback();
            this.messageListVM = null;
        }
        this.smartIntentVM.onDestroy();
        this.renderer = null;
        this.domain.getAuthenticationFailureDM().unregisterListener(this);
    }

    protected void resetDefaultMenuItemsVisibility() {
        this.attachImageButtonViewState.setVisible(this.widgetGateway.getDefaultVisibilityForAttachImageButton(this.viewableConversation.getActiveConversation()));
    }

    public void saveReplyText(String str) {
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        if ((str.equals(this.sdkConfigurationDM.getString(SDKConfigurationDM.CONVERSATION_PRE_FILL_TEXT)) || str.equals(this.conversationController.getConversationArchivalPrefillText())) && !this.conversationManager.containsAtleastOneUserMessage(activeConversation)) {
            this.conversationController.saveUserReplyText("");
        } else {
            this.replyFieldViewState.setReplyText(str);
            this.conversationController.saveUserReplyText(str);
        }
    }

    public boolean shouldShowUnreadMessagesIndicator() {
        return this.scrollJumperViewState.shouldShowUnreadMessagesIndicator();
    }

    public void clearUserReplyDraft() {
        this.conversationController.saveUserReplyText("");
        this.replyFieldViewState.clearReplyText();
    }

    protected void initMessagesList() {
        MessageListVM messageListVM = this.messageListVM;
        if (messageListVM != null) {
            messageListVM.unregisterMessageListVMCallback();
        }
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        this.viewableConversation.initializeConversationsForUI();
        this.conversationManager.initializeIssueStatusForUI(activeConversation);
        boolean zHasMoreMessages = this.viewableConversation.hasMoreMessages();
        this.messageListVM = new MessageListVM(this.platform, this.domain);
        List<UIConversation> uIConversations = this.viewableConversation.getUIConversations();
        ArrayList arrayList = new ArrayList();
        Iterator<Conversation> it = this.viewableConversation.getAllConversations().iterator();
        while (it.hasNext()) {
            arrayList.addAll(getUIMessages(it.next()));
        }
        this.messageListVM.initializeMessageList(uIConversations, arrayList, zHasMoreMessages, this);
        this.renderer.initializeMessages(this.messageListVM.getUiMessageDMs());
        this.viewableConversation.registerMessagesObserver(this);
        this.isConversationRejected = activeConversation.state == IssueState.REJECTED;
        prefillReplyBox();
    }

    protected void prefillReplyBox() {
        String userReplyText = this.conversationController.getUserReplyText();
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        if (StringUtils.isEmpty(userReplyText) && !this.conversationManager.containsAtleastOneUserMessage(activeConversation)) {
            userReplyText = this.conversationController.getConversationArchivalPrefillText();
            if (StringUtils.isEmpty(userReplyText)) {
                userReplyText = this.sdkConfigurationDM.getString(SDKConfigurationDM.CONVERSATION_PRE_FILL_TEXT);
            }
        }
        if (userReplyText != null) {
            this.replyFieldViewState.setReplyText(userReplyText);
        }
    }

    private SystemRedactedConversationMessageDM generateSystemRedactedConversationMessageDM(Conversation conversation) {
        SystemRedactedConversationMessageDM systemRedactedConversationMessageDM = new SystemRedactedConversationMessageDM(conversation.getCreatedAt(), conversation.getEpochCreatedAtTime(), 1);
        systemRedactedConversationMessageDM.setDependencies(this.domain, this.platform);
        systemRedactedConversationMessageDM.conversationLocalId = conversation.localId;
        return systemRedactedConversationMessageDM;
    }

    private List<MessageDM> getUIMessages(Conversation conversation) {
        ArrayList arrayList = new ArrayList();
        if (conversation.isRedacted) {
            arrayList.add(generateSystemRedactedConversationMessageDM(conversation));
        } else {
            arrayList.addAll(buildUIMessages(conversation));
        }
        return arrayList;
    }

    protected List<MessageDM> buildUIMessages(Conversation conversation) {
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        if (activeConversation.localId.equals(conversation.localId) && this.conversationManager.shouldOpen(activeConversation)) {
            return processMessagesForBots(conversation.messageDMs, false);
        }
        return new ArrayList(conversation.messageDMs);
    }

    private List<MessageDM> processMessagesForBots(Collection<? extends MessageDM> collection, boolean z) {
        OptionInputMessageDM optionInputMessageDMCreateOptionsBotMessage;
        ArrayList arrayList = new ArrayList(collection);
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        boolean zEvaluateBotExecutionState = this.conversationManager.evaluateBotExecutionState(arrayList, z);
        this.isInBetweenBotExecution = zEvaluateBotExecutionState;
        if (zEvaluateBotExecutionState) {
            MessageDM latestUnansweredBotMessage = this.conversationManager.getLatestUnansweredBotMessage(activeConversation);
            MessageDM messageDM = this.botMessageDM;
            if (messageDM != null && latestUnansweredBotMessage != null && messageDM.serverId.equals(latestUnansweredBotMessage.serverId)) {
                this.awaitingUserInputForBotStep = true;
                return arrayList;
            }
            if (latestUnansweredBotMessage != null && (latestUnansweredBotMessage.messageType == MessageType.ADMIN_TEXT_WITH_OPTION_INPUT || latestUnansweredBotMessage.messageType == MessageType.FAQ_LIST_WITH_OPTION_INPUT || latestUnansweredBotMessage.messageType == MessageType.ADMIN_RESOLUTION_QUESTION_MESSAGE)) {
                int iIndexOf = arrayList.indexOf(latestUnansweredBotMessage);
                if (iIndexOf != -1) {
                    if (latestUnansweredBotMessage.messageType == MessageType.ADMIN_TEXT_WITH_OPTION_INPUT) {
                        optionInputMessageDMCreateOptionsBotMessage = createOptionsBotMessage((AdminMessageWithOptionInputDM) latestUnansweredBotMessage);
                        incrementCreatedAt(optionInputMessageDMCreateOptionsBotMessage, latestUnansweredBotMessage, r3.attachmentCount + 1);
                    } else if (latestUnansweredBotMessage.messageType == MessageType.ADMIN_RESOLUTION_QUESTION_MESSAGE) {
                        optionInputMessageDMCreateOptionsBotMessage = createOptionsBotMessage((AdminResolutionMessageWithOptions) latestUnansweredBotMessage);
                        incrementCreatedAt(optionInputMessageDMCreateOptionsBotMessage, latestUnansweredBotMessage, r3.attachmentCount + 1);
                    } else {
                        optionInputMessageDMCreateOptionsBotMessage = createOptionsBotMessage((FAQListMessageWithOptionInputDM) latestUnansweredBotMessage);
                        incrementCreatedAt(optionInputMessageDMCreateOptionsBotMessage, latestUnansweredBotMessage, 1L);
                    }
                    if (optionInputMessageDMCreateOptionsBotMessage.input.type == OptionInput.Type.PILL) {
                        arrayList.add(iIndexOf + 1, optionInputMessageDMCreateOptionsBotMessage);
                    }
                    this.botMessageDM = optionInputMessageDMCreateOptionsBotMessage;
                }
            } else {
                this.botMessageDM = latestUnansweredBotMessage;
            }
            if (latestUnansweredBotMessage != null) {
                removeOptionsMessageFromUI();
                this.awaitingUserInputForBotStep = true;
            } else {
                this.awaitingUserInputForBotStep = false;
            }
        } else {
            this.awaitingUserInputForBotStep = false;
        }
        return arrayList;
    }

    private void removeOptionsMessageFromUI() {
        MessageListVM messageListVM = this.messageListVM;
        if (messageListVM == null) {
            return;
        }
        List<MessageDM> listCopyOfUIMessageDMs = messageListVM.copyOfUIMessageDMs();
        ArrayList arrayList = new ArrayList();
        if (!ListUtils.isEmpty(listCopyOfUIMessageDMs)) {
            for (MessageDM messageDM : listCopyOfUIMessageDMs) {
                if (messageDM.messageType == MessageType.OPTION_INPUT) {
                    arrayList.add(messageDM);
                }
            }
            this.messageListVM.remove(arrayList);
        }
        hideListPicker(false);
    }

    private void removeCSATBotFromUI(Conversation conversation) {
        if (this.messageListVM == null || !conversation.isFeedbackBotEnabled) {
            return;
        }
        List<MessageDM> listCopyOfUIMessageDMs = this.messageListVM.copyOfUIMessageDMs();
        ArrayList arrayList = new ArrayList();
        if (ListUtils.isEmpty(listCopyOfUIMessageDMs)) {
            return;
        }
        for (MessageDM messageDM : listCopyOfUIMessageDMs) {
            if (messageDM.messageType == MessageType.ADMIN_CSAT_MESSAGE) {
                arrayList.add(messageDM);
            }
        }
        this.messageListVM.remove(arrayList);
    }

    public void refreshVM() {
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        this.conversationManager.updateConversationExpiryProperties(activeConversation);
        boolean zShouldShowReplyBoxOnConversationRejected = shouldShowReplyBoxOnConversationRejected();
        this.widgetGateway.updateReplyBoxWidget(this.replyBoxViewState, activeConversation, zShouldShowReplyBoxOnConversationRejected);
        this.widgetGateway.updateConfirmationBoxViewState(this.confirmationBoxViewState, activeConversation);
        this.widgetGateway.updateConversationFooterViewState(this.conversationFooterViewState, activeConversation, zShouldShowReplyBoxOnConversationRejected);
        this.conversationController.setConversationViewState(this.replyBoxViewState.isVisible() ? 2 : -1);
        this.viewableConversation.registerMessagesObserver(this);
        this.viewableConversation.setConversationVMCallback(this);
        if (activeConversation.serverId != null || activeConversation.preConversationServerId != null || this.viewableConversation.getAllConversations().size() > 1) {
            this.conversationController.getConversationInboxPoller().startChatPoller();
        }
        if (!this.conversationManager.isSynced(activeConversation) && this.conversationManager.containsAtleastOneUserMessage(activeConversation)) {
            MessageDM messageDM = activeConversation.messageDMs.get(activeConversation.messageDMs.size() - 1);
            if (messageDM instanceof UserMessageDM) {
                UserMessageDM userMessageDM = (UserMessageDM) messageDM;
                if (userMessageDM.getState() != UserMessageState.SENT) {
                    this.replyBoxViewState.setVisible(false);
                }
                if (this.conversationController.isPreissueCreationInProgress(activeConversation.localId.longValue())) {
                    userMessageDM.setState(UserMessageState.SENDING);
                    return;
                }
                return;
            }
            return;
        }
        if (!this.conversationManager.isSynced(activeConversation) && this.sdkConfigurationDM.shouldAutoFillPreissueFirstMessage()) {
            String string = this.sdkConfigurationDM.getString(SDKConfigurationDM.INITIAL_USER_MESSAGE_TO_AUTOSEND_IN_PREISSUE);
            if (!StringUtils.isEmpty(string)) {
                HSLogger.d(TAG, "Auto-filing preissue with client set user message.");
                this.conversationManager.updateIsAutoFilledPreissueFlag(activeConversation, true);
                createPreIssueViaConversationalFlow(string);
                return;
            }
        }
        if (this.smartIntentDM.shouldShowSmartIntent(activeConversation)) {
            this.smartIntentVM.showSmartIntentUI();
            return;
        }
        if (this.conversationManager.isSynced(activeConversation)) {
            evaluateBotMessages(activeConversation.messageDMs);
        }
        updateReplyBoxVisibility();
    }

    private void addPreIssueFirstUserMessage(Conversation conversation, String str, List<String> list) {
        clearUserReplyDraft();
        disableUserInputOptions();
        if (ListUtils.isNotEmpty(list)) {
            this.conversationManager.addPreissueFirstUserMessageViaSmartIntent(conversation, list);
        } else {
            this.conversationManager.addPreissueFirstUserMessage(conversation, str);
        }
    }

    private void createPreIssueViaSmartIntent(String str, List<String> list, List<String> list2, String str2) {
        HSLogger.d(TAG, "Trigger preissue creation via Smart intent");
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        this.conversationManager.updateSmartIntentData(activeConversation, str, list, str2);
        addPreIssueFirstUserMessage(activeConversation, str2, list2);
        createPreIssue(activeConversation, str2, list2);
    }

    void createPreIssueViaUserRetry(String str, List<String> list) {
        HSLogger.d(TAG, "Trigger preissue creation via User retry");
        createPreIssue(this.viewableConversation.getActiveConversation(), str, list);
    }

    void createPreIssueViaConversationalFlow(String str) {
        HSLogger.d(TAG, "Trigger preissue creation via Conversational flow");
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        addPreIssueFirstUserMessage(activeConversation, str, null);
        createPreIssue(activeConversation, str, null);
    }

    private void createPreIssue(Conversation conversation, String str, List<String> list) {
        updateLastUserActivityTime();
        String string = this.sdkConfigurationDM.getString(SDKConfigurationDM.CONVERSATION_GREETING_MESSAGE);
        if (!this.isNetworkAvailable) {
            onCreateConversationFailure(new Exception("No internet connection."));
        } else if (ListUtils.isEmpty(list)) {
            this.conversationController.createPreIssueViaConversationalFlow(conversation, string, str, this);
        } else {
            this.conversationController.createPreIssueViaSmartIntent(conversation, string, str, list, this);
        }
    }

    @Override // com.helpshift.conversation.viewmodel.ConversationVMCallback
    public void onConversationInboxPollFailure() {
        HSLogger.e(TAG, "On conversation inbox poll failure");
        showFakeTypingIndicator(false);
        if (!this.platform.isOnline() || this.awaitingUserInputForBotStep || this.smartIntentVM.isSmartIntentUIVisible() || !this.viewableConversation.getActiveConversation().isIssueInProgress()) {
            return;
        }
        if (this.isInBetweenBotExecution || this.viewableConversation.getActiveConversation().isInPreIssueMode()) {
            this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.3
                @Override // com.helpshift.common.domain.F
                public void f() {
                    if (ConversationalVM.this.renderer != null) {
                        ConversationalVM.this.renderer.showNetworkErrorFooter(2);
                    }
                }
            });
            this.isShowingPollFailureError = true;
        }
    }

    @Override // com.helpshift.conversation.viewmodel.ConversationVMCallback
    public void onConversationInboxPollSuccess() {
        if (this.isShowingPollFailureError) {
            this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.4
                @Override // com.helpshift.common.domain.F
                public void f() {
                    if (ConversationalVM.this.renderer != null) {
                        ConversationalVM.this.renderer.hideNetworkErrorFooter();
                    }
                }
            });
            this.isShowingPollFailureError = false;
        }
    }

    void showFakeTypingIndicator(final boolean z) {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.5
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (ConversationalVM.this.renderer == null) {
                    return;
                }
                boolean z2 = false;
                if ((ConversationalVM.this.viewableConversation.getActiveConversation().isIssueInProgress() || ConversationalVM.this.viewableConversation.getActiveConversation().isInPreIssueMode() || ConversationalVM.this.isInBetweenBotExecution) && (ConversationalVM.this.viewableConversation.isAgentTyping() || z)) {
                    z2 = true;
                }
                ConversationalVM.this.updateTypingIndicatorStatus(z2);
            }
        });
    }

    public void sendTextMessage() {
        String reply = this.renderer.getReply();
        if (StringUtils.isEmpty(reply)) {
            return;
        }
        this.conversationController.setPersistMessageBox(true);
        sendTextMessage(reply.trim());
    }

    void clearReply() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.6
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (ConversationalVM.this.renderer != null) {
                    ConversationalVM.this.renderer.setReply("");
                }
            }
        });
    }

    private void sendNormalTextMessage(final String str) {
        clearReply();
        this.domain.runParallel(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.7
            @Override // com.helpshift.common.domain.F
            public void f() {
                ConversationalVM.this.conversationManager.sendTextMessage(ConversationalVM.this.viewableConversation.getActiveConversation(), str);
            }
        });
    }

    protected void sendTextMessage(final String str) {
        updateLastUserActivityTime();
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        if (!this.conversationManager.containsAtleastOneUserMessage(activeConversation)) {
            if (StringUtils.userVisibleCharacterCount(str) < this.sdkConfigurationDM.getMinimumConversationDescriptionLength()) {
                this.renderer.showReplyValidationFailedError(1);
                return;
            } else if (StringUtils.isEmpty(activeConversation.preConversationServerId)) {
                clearReply();
                createPreIssueViaConversationalFlow(str);
                return;
            }
        }
        if (!this.isInBetweenBotExecution) {
            sendNormalTextMessage(str);
            return;
        }
        MessageDM messageDM = this.botMessageDM;
        if (!(messageDM instanceof AdminMessageWithTextInputDM)) {
            sendNormalTextMessage(str);
            return;
        }
        final AdminMessageWithTextInputDM adminMessageWithTextInputDM = (AdminMessageWithTextInputDM) messageDM;
        TextInput textInput = adminMessageWithTextInputDM.input;
        if (!adminMessageWithTextInputDM.input.validate(str)) {
            this.renderer.showReplyValidationFailedError(textInput.keyboard);
            return;
        }
        this.renderer.hideReplyValidationFailedError();
        disableUserInputOptions();
        clearReply();
        this.domain.runParallel(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.8
            @Override // com.helpshift.common.domain.F
            public void f() {
                try {
                    ConversationalVM.this.conversationManager.sendTextMessage(ConversationalVM.this.viewableConversation.getActiveConversation(), str, adminMessageWithTextInputDM, false);
                    ConversationalVM.this.showFakeTypingIndicator(!r0.awaitingUserInputForBotStep);
                } catch (RootAPIException e) {
                    ConversationalVM.this.showErrorForNoNetwork(e);
                    throw e;
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showErrorForNoNetwork(RootAPIException rootAPIException) {
        if (!(rootAPIException.exceptionType instanceof NetworkException) || this.platform.isOnline()) {
            return;
        }
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.9
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (ConversationalVM.this.renderer != null) {
                    ConversationalVM.this.renderer.showNetworkErrorFooter(1);
                }
            }
        });
    }

    public void retryMessage(final MessageDM messageDM) {
        this.domain.runParallel(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.10
            @Override // com.helpshift.common.domain.F
            public void f() {
                Conversation activeConversation = ConversationalVM.this.viewableConversation.getActiveConversation();
                if (!ConversationalVM.this.conversationManager.isSynced(activeConversation)) {
                    MessageDM messageDM2 = messageDM;
                    if (messageDM2 instanceof UserSmartIntentMessageDM) {
                        HSLogger.d(ConversationalVM.TAG, "User retrying smart intent message to file preissue.");
                        UserSmartIntentMessageDM userSmartIntentMessageDM = (UserSmartIntentMessageDM) messageDM;
                        userSmartIntentMessageDM.setState(UserMessageState.SENDING);
                        ConversationalVM.this.createPreIssueViaUserRetry(messageDM.body, userSmartIntentMessageDM.intentLabels);
                        return;
                    }
                    if (messageDM2 instanceof UserMessageDM) {
                        HSLogger.d(ConversationalVM.TAG, "User retrying message to file preissue.");
                        ((UserMessageDM) messageDM).setState(UserMessageState.SENDING);
                        ConversationalVM.this.createPreIssueViaUserRetry(messageDM.body, null);
                        return;
                    }
                    return;
                }
                if (ConversationalVM.this.isNetworkAvailable) {
                    ConversationalVM.this.conversationManager.retryMessage(activeConversation, messageDM);
                    ConversationalVM conversationalVM = ConversationalVM.this;
                    conversationalVM.showFakeTypingIndicator(conversationalVM.isInBetweenBotExecution);
                }
            }
        });
    }

    public void handleScreenshotMessageClick(ScreenshotMessageDM screenshotMessageDM) {
        this.viewableConversation.onScreenshotMessageClicked(screenshotMessageDM);
    }

    public void handleUserAttachmentMessageClick(UserAttachmentMessageDM userAttachmentMessageDM) {
        this.viewableConversation.onUserAttachmentMessageClicked(userAttachmentMessageDM);
    }

    public void handleAppReviewRequestClick(RequestAppReviewMessageDM requestAppReviewMessageDM) {
        String strTrim = this.sdkConfigurationDM.getString(SDKConfigurationDM.REVIEW_URL).trim();
        if (!StringUtils.isEmpty(strTrim)) {
            this.sdkConfigurationDM.setAppReviewed(true);
            ConversationalRenderer conversationalRenderer = this.renderer;
            if (conversationalRenderer != null) {
                conversationalRenderer.openAppReviewStore(strTrim);
            }
        }
        this.conversationManager.handleAppReviewRequestClick(this.viewableConversation.getActiveConversation(), requestAppReviewMessageDM);
    }

    @Override // com.helpshift.conversation.viewmodel.ConversationVMCallback
    public void launchScreenshotAttachment(String str, String str2) {
        this.renderer.launchScreenshotAttachment(str, str2);
    }

    @Override // com.helpshift.conversation.viewmodel.ConversationVMCallback
    public boolean isMessageBoxVisible() {
        return this.replyBoxViewState.isVisible();
    }

    @Override // com.helpshift.conversation.viewmodel.ConversationVMCallback
    public boolean isVisibleOnUI() {
        return this.isScreenCurrentlyVisible;
    }

    @Override // com.helpshift.conversation.viewmodel.ConversationVMCallback
    public void onAgentTypingUpdate(final boolean z) {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.11
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (ConversationalVM.this.renderer != null) {
                    ConversationalVM.this.updateTypingIndicatorStatus(ConversationalVM.this.viewableConversation.getActiveConversation().isIssueInProgress() ? z : false);
                }
            }
        });
    }

    public void onSkipClick() {
        updateLastUserActivityTime();
        final MessageDM messageDM = this.botMessageDM;
        if (messageDM instanceof AdminMessageWithTextInputDM) {
            clearUserReplyDraft();
            disableUserInputOptions();
            this.domain.runParallel(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.12
                @Override // com.helpshift.common.domain.F
                public void f() {
                    AdminMessageWithTextInputDM adminMessageWithTextInputDM = (AdminMessageWithTextInputDM) messageDM;
                    try {
                        ConversationalVM.this.conversationManager.sendTextMessage(ConversationalVM.this.viewableConversation.getActiveConversation(), adminMessageWithTextInputDM.input.skipLabel, adminMessageWithTextInputDM, true);
                        ConversationalVM.this.showFakeTypingIndicator(!r0.awaitingUserInputForBotStep);
                    } catch (RootAPIException e) {
                        ConversationalVM.this.showErrorForNoNetwork(e);
                        throw e;
                    }
                }
            });
        }
        this.renderer.hideSkipButton();
    }

    @Override // com.helpshift.util.HSListObserver
    public void addAll(Collection<? extends MessageDM> collection) {
        HSLogger.d(TAG, "addAll called : " + collection.size());
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        if (this.conversationManager.hasBotSwitchedToAnotherBotInPollerResponse(collection)) {
            this.conversationManager.updateMessagesClickOnBotSwitch(activeConversation, false);
        }
        List<MessageDM> listEvaluateBotMessages = evaluateBotMessages(collection);
        if (this.isInBetweenBotExecution) {
            if (!this.isUserReplyDraftClearedForBotChange && this.conversationManager.containsAtleastOneUserMessage(activeConversation)) {
                clearUserReplyDraft();
                this.isUserReplyDraftClearedForBotChange = true;
            }
        } else {
            this.isUserReplyDraftClearedForBotChange = false;
        }
        MessageListVM messageListVM = this.messageListVM;
        if (messageListVM != null) {
            messageListVM.addMessages(listEvaluateBotMessages);
        }
    }

    @Override // com.helpshift.util.HSListObserver
    public void update(MessageDM messageDM) {
        HSLogger.d(TAG, "update called : " + messageDM);
        updateUserInputState();
        MessageListVM messageListVM = this.messageListVM;
        if (messageListVM == null) {
            return;
        }
        messageListVM.insertOrUpdateMessage(messageDM);
    }

    public void handleOptionSelected(final OptionInputMessageDM optionInputMessageDM, final OptionInput.Option option, final boolean z) {
        if (this.messageListVM == null) {
            return;
        }
        if (optionInputMessageDM.input.type == OptionInput.Type.PILL) {
            int iIndexOf = this.messageListVM.getUiMessageDMs().indexOf(optionInputMessageDM);
            this.messageListVM.remove(Collections.singletonList(optionInputMessageDM));
            this.renderer.updateMessages(iIndexOf - 1, 1);
        }
        updateLastUserActivityTime();
        if (optionInputMessageDM.input.type == OptionInput.Type.PILL) {
            disableUserInputOptions();
        } else if (optionInputMessageDM.input.type == OptionInput.Type.PICKER) {
            hideListPicker(true);
        }
        this.domain.runParallel(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.13
            @Override // com.helpshift.common.domain.F
            public void f() {
                try {
                    ConversationalVM.this.conversationManager.sendOptionInputMessage(ConversationalVM.this.viewableConversation.getActiveConversation(), optionInputMessageDM, option, z);
                    if (ConversationalVM.this.viewableConversation.getActiveConversation().isIssueInProgress()) {
                        ConversationalVM.this.showFakeTypingIndicator(!r0.awaitingUserInputForBotStep);
                    }
                } catch (RootAPIException e) {
                    ConversationalVM.this.showErrorForNoNetwork(e);
                    throw e;
                }
            }
        });
    }

    private void hideListPicker(final boolean z) {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.14
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (ConversationalVM.this.renderer != null) {
                    ConversationalVM.this.renderer.hideListPicker(z);
                }
            }
        });
    }

    private void disableUserInputOptions() {
        ConversationalRenderer conversationalRenderer = this.renderer;
        if (conversationalRenderer != null) {
            conversationalRenderer.hideKeyboard();
        }
        this.attachImageButtonViewState.setVisible(false);
        disableUserTextInput();
    }

    private List<MessageDM> evaluateBotMessages(Collection<? extends MessageDM> collection) {
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        boolean z = this.isInBetweenBotExecution;
        List<MessageDM> listProcessMessagesForBots = processMessagesForBots(collection, z);
        if (!activeConversation.isInPreIssueMode()) {
            if (z && !this.isInBetweenBotExecution) {
                ConversationManager conversationManager = this.conversationManager;
                conversationManager.updateMessagesClickOnBotSwitch(activeConversation, conversationManager.shouldEnableMessagesClick(activeConversation));
                removeOptionsMessageFromUI();
                removeCSATBotFromUI(activeConversation);
                if (activeConversation.isIssueInProgress()) {
                    this.replyBoxViewState.setStandardTextInput();
                    this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.15
                        @Override // com.helpshift.common.domain.F
                        public void f() {
                            ConversationalVM.this.resetDefaultMenuItemsVisibility();
                            if (ConversationalVM.this.renderer != null) {
                                ConversationalVM.this.renderer.hideReplyValidationFailedError();
                            }
                        }
                    });
                }
            } else if (this.isInBetweenBotExecution && !z) {
                this.conversationManager.updateMessagesClickOnBotSwitch(activeConversation, false);
            }
        }
        updateUserInputState();
        return listProcessMessagesForBots;
    }

    private void disableUserTextInput() {
        this.replyBoxViewState.setVisible(false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateUserInputState() {
        int size;
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        IssueState issueState = activeConversation.state;
        boolean zShouldShowSmartIntentFakeTypingIndicator = true;
        if (issueState == IssueState.REJECTED) {
            disableUserInputOptions();
        } else {
            if ((issueState != IssueState.RESOLUTION_REQUESTED || activeConversation.isFeedbackBotEnabled) && issueState != IssueState.RESOLUTION_ACCEPTED && issueState != IssueState.COMPLETED_ISSUE_CREATED) {
                if (this.isInBetweenBotExecution || (activeConversation.isFeedbackBotEnabled && issueState == IssueState.RESOLUTION_REQUESTED)) {
                    this.attachImageButtonViewState.setVisible(false);
                    if (!this.awaitingUserInputForBotStep) {
                        disableUserInputOptions();
                        if (this.messageListVM != null && (size = activeConversation.messageDMs.size()) > 0) {
                            MessageDM messageDM = activeConversation.messageDMs.get(size - 1);
                            if (((messageDM instanceof UserResponseMessageForTextInputDM) || (messageDM instanceof UserResponseMessageForOptionInput)) && ((UserMessageDM) messageDM).getState() != UserMessageState.SENT) {
                            }
                        }
                    }
                } else if (activeConversation.isInPreIssueMode() && !StringUtils.isEmpty(activeConversation.preConversationServerId)) {
                    disableUserInputOptions();
                } else {
                    zShouldShowSmartIntentFakeTypingIndicator = this.smartIntentVM.shouldShowSmartIntentFakeTypingIndicator();
                }
            }
            showFakeTypingIndicator(zShouldShowSmartIntentFakeTypingIndicator);
        }
        zShouldShowSmartIntentFakeTypingIndicator = false;
        showFakeTypingIndicator(zShouldShowSmartIntentFakeTypingIndicator);
    }

    public void onNetworkAvailable() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.16
            @Override // com.helpshift.common.domain.F
            public void f() {
                ConversationalVM.this.isNetworkAvailable = true;
                if (ConversationalVM.this.renderer == null) {
                    return;
                }
                ConversationalVM.this.updateUserInputState();
                ConversationalVM.this.renderer.hideNetworkErrorFooter();
            }
        });
    }

    public void onNetworkUnAvailable() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.17
            @Override // com.helpshift.common.domain.F
            public void f() {
                boolean z = false;
                ConversationalVM.this.isNetworkAvailable = false;
                if (ConversationalVM.this.renderer == null) {
                    return;
                }
                Conversation activeConversation = ConversationalVM.this.viewableConversation.getActiveConversation();
                ConversationalVM.this.showFakeTypingIndicator(false);
                boolean z2 = (!activeConversation.isInPreIssueMode() || StringUtils.isEmpty(activeConversation.preConversationServerId) || ConversationalVM.this.awaitingUserInputForBotStep) ? false : true;
                if (ConversationalVM.this.isInBetweenBotExecution && !ConversationalVM.this.awaitingUserInputForBotStep) {
                    z = true;
                }
                if (z2 || z) {
                    ConversationalVM.this.renderer.showNetworkErrorFooter(1);
                }
            }
        });
    }

    @Override // com.helpshift.conversation.viewmodel.ConversationVMCallback
    public void onIssueStatusChange(IssueState issueState) {
        if (!this.viewableConversation.getActiveConversation().isInPreIssueMode()) {
            handleStateChangeForIssueMode(issueState);
            if (this.isInBetweenBotExecution) {
                this.attachImageButtonViewState.setVisible(false);
                return;
            }
            return;
        }
        int i = AnonymousClass33.$SwitchMap$com$helpshift$conversation$dto$IssueState[issueState.ordinal()];
        if (i == 1) {
            this.awaitingUserInputForBotStep = false;
            showStartNewConversation(ConversationFooterState.START_NEW_CONVERSATION);
            updateUIOnNewMessageReceived();
        } else if (i == 2) {
            this.awaitingUserInputForBotStep = false;
            removeOptionsMessageFromUI();
            handleConversationRejectedState();
            updateUIOnNewMessageReceived();
        }
        updateUserInputState();
    }

    /* JADX INFO: renamed from: com.helpshift.conversation.viewmodel.ConversationalVM$33, reason: invalid class name */
    static /* synthetic */ class AnonymousClass33 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$conversation$dto$IssueState;

        static {
            int[] iArr = new int[IssueState.values().length];
            $SwitchMap$com$helpshift$conversation$dto$IssueState = iArr;
            try {
                iArr[IssueState.RESOLUTION_ACCEPTED.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$dto$IssueState[IssueState.REJECTED.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
        }
    }

    @Override // com.helpshift.conversation.domainmodel.ConversationController.StartNewConversationListener
    public void onCreateConversationSuccess(long j) {
        handlePreIssueCreationSuccess();
    }

    @Override // com.helpshift.conversation.viewmodel.ConversationVMCallback
    public void handlePreIssueCreationSuccess() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.18
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (ConversationalVM.this.renderer == null) {
                    return;
                }
                HSLogger.d(ConversationalVM.TAG, "Preissue creation success. Handling on UI.");
                ConversationalVM.this.conversationController.getConversationInboxPoller().startChatPoller();
                ConversationalVM.this.initMessagesList();
                ConversationalVM.this.renderer.notifyRefreshList();
                if (!ConversationalVM.this.isInBetweenBotExecution && ConversationalVM.this.viewableConversation.getActiveConversation().isInPreIssueMode()) {
                    ConversationalVM.this.showFakeTypingIndicator(true);
                }
                ConversationalVM.this.renderer.hideNetworkErrorFooter();
                if (IssueType.ISSUE.equals(ConversationalVM.this.viewableConversation.getActiveConversation().issueType)) {
                    ConversationalVM.this.replyBoxViewState.setVisible(true);
                    ConversationalVM.this.renderMenuItems();
                }
            }
        });
    }

    @Override // com.helpshift.conversation.viewmodel.ConversationVMCallback
    public void handleIdempotentPreIssueCreationSuccess() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.19
            @Override // com.helpshift.common.domain.F
            public void f() {
                ConversationalVM.this.handlePreIssueCreationSuccess();
                if (ConversationalVM.this.renderer != null) {
                    ConversationalVM.this.refreshVM();
                }
            }
        });
    }

    @Override // com.helpshift.conversation.domainmodel.ConversationController.StartNewConversationListener
    public void onCreateConversationFailure(Exception exc) {
        HSLogger.e(TAG, "Error filing a pre-issue", exc);
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.20
            @Override // com.helpshift.common.domain.F
            public void f() {
                ConversationalVM.this.showFakeTypingIndicator(false);
                if (ConversationalVM.this.renderer != null) {
                    MessageDM lastUIMessage = ConversationalVM.this.messageListVM.getLastUIMessage();
                    if (lastUIMessage instanceof UserMessageDM) {
                        ((UserMessageDM) lastUIMessage).setState(UserMessageState.UNSENT_RETRYABLE);
                    }
                    if (ConversationalVM.this.isNetworkAvailable) {
                        return;
                    }
                    ConversationalVM.this.renderer.showNetworkErrorFooter(1);
                }
            }
        });
    }

    public void handleAdminSuggestedQuestionRead(final FAQListMessageDM fAQListMessageDM, final String str, final String str2) {
        if (StringUtils.isEmpty(str2)) {
            return;
        }
        final Long l = fAQListMessageDM.conversationLocalId;
        this.domain.runParallel(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.21
            @Override // com.helpshift.common.domain.F
            public void f() {
                Conversation next;
                Iterator<Conversation> it = ConversationalVM.this.viewableConversation.getAllConversations().iterator();
                while (true) {
                    if (!it.hasNext()) {
                        next = null;
                        break;
                    } else {
                        next = it.next();
                        if (next.localId.equals(l)) {
                            break;
                        }
                    }
                }
                if (next != null) {
                    ConversationalVM.this.conversationManager.handleAdminSuggestedQuestionRead(next, fAQListMessageDM, str, str2);
                }
            }
        });
    }

    public void onNewConversationButtonClicked() {
        this.isInBetweenBotExecution = false;
        stopLiveUpdates();
        this.conversationManager.setStartNewConversationButtonClicked(this.viewableConversation.getActiveConversation(), true, true);
        if (this.showConversationHistory) {
            hideAllFooterWidgets();
            Conversation openConversationWithMessages = this.conversationController.getOpenConversationWithMessages();
            if (openConversationWithMessages == null) {
                openConversationWithMessages = this.conversationController.createLocalPreIssueConversation();
            }
            this.viewableConversation.onNewConversationStarted(openConversationWithMessages);
            this.smartIntentVM.onNewConversationStarted(openConversationWithMessages);
            pushChatScreenOpenAnalyticsEvent();
            refreshVM();
            renderMenuItems();
            initMessagesList();
            this.renderer.notifyRefreshList();
            return;
        }
        HashMap map = new HashMap();
        map.put(CREATE_NEW_PRE_ISSUE, Boolean.valueOf(this.showConversationHistory != this.sdkConfigurationDM.shouldShowConversationHistory()));
        this.renderer.openFreshConversationScreen(map);
    }

    private OptionInputMessageDM createOptionsBotMessage(FAQListMessageWithOptionInputDM fAQListMessageWithOptionInputDM) {
        if (fAQListMessageWithOptionInputDM == null) {
            return null;
        }
        OptionInputMessageDM optionInputMessageDM = new OptionInputMessageDM(fAQListMessageWithOptionInputDM);
        optionInputMessageDM.setDependencies(this.domain, this.platform);
        return optionInputMessageDM;
    }

    private OptionInputMessageDM createOptionsBotMessage(AdminMessageWithOptionInputDM adminMessageWithOptionInputDM) {
        if (adminMessageWithOptionInputDM == null) {
            return null;
        }
        OptionInputMessageDM optionInputMessageDM = new OptionInputMessageDM(adminMessageWithOptionInputDM);
        optionInputMessageDM.setDependencies(this.domain, this.platform);
        return optionInputMessageDM;
    }

    private OptionInputMessageDM createOptionsBotMessage(AdminResolutionMessageWithOptions adminResolutionMessageWithOptions) {
        if (adminResolutionMessageWithOptions == null) {
            return null;
        }
        OptionInputMessageDM optionInputMessageDM = new OptionInputMessageDM(adminResolutionMessageWithOptions);
        optionInputMessageDM.setDependencies(this.domain, this.platform);
        return optionInputMessageDM;
    }

    private void incrementCreatedAt(MessageDM messageDM, MessageDM messageDM2, long j) {
        String str = HSDateFormatSpec.STORAGE_TIME_FORMAT.format(new Date(messageDM2.getEpochCreatedAtTime() + j));
        long jConvertToEpochTime = HSDateFormatSpec.convertToEpochTime(str);
        messageDM.setCreatedAt(str);
        messageDM.setEpochCreatedAtTime(jConvertToEpochTime);
    }

    @Override // com.helpshift.conversation.viewmodel.MessageListVMCallback
    public void onUIMessageListUpdated() {
        updateReplyBoxVisibility();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateReplyBoxVisibility() {
        if (this.isInBetweenBotExecution) {
            if (this.botMessageDM == null) {
                this.replyBoxViewState.setVisible(false);
                return;
            }
            Conversation activeConversation = this.viewableConversation.getActiveConversation();
            if (ConversationUtil.isInProgressState(activeConversation.state) || (activeConversation.state == IssueState.RESOLUTION_REQUESTED && activeConversation.isFeedbackBotEnabled)) {
                if (this.botMessageDM.messageType == MessageType.ADMIN_TEXT_WITH_TEXT_INPUT) {
                    this.replyBoxViewState.setInput(((AdminMessageWithTextInputDM) this.botMessageDM).input);
                    return;
                } else if (this.botMessageDM.messageType == MessageType.OPTION_INPUT) {
                    this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.22
                        @Override // com.helpshift.common.domain.F
                        public void f() {
                            if (ConversationalVM.this.renderer == null) {
                                return;
                            }
                            ConversationalVM.this.replyBoxViewState.setVisible(false);
                            ConversationalVM conversationalVM = ConversationalVM.this;
                            conversationalVM.showOptions((OptionInputMessageDM) conversationalVM.botMessageDM);
                        }
                    });
                    return;
                } else {
                    if (this.botMessageDM.messageType == MessageType.ADMIN_CSAT_MESSAGE) {
                        this.replyBoxViewState.setVisible(false);
                        return;
                    }
                    return;
                }
            }
            return;
        }
        if (this.replyBoxViewState.isVisible()) {
            this.replyBoxViewState.setStandardTextInput();
        }
        hideListPicker(false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showOptions(OptionInputMessageDM optionInputMessageDM) {
        if (optionInputMessageDM.input.type == OptionInput.Type.PILL) {
            this.renderer.showOptionInput(optionInputMessageDM.input);
        } else {
            showListPicker(optionInputMessageDM);
        }
    }

    @Override // com.helpshift.conversation.viewmodel.ListPickerVMCallback
    public void updateListPickerOptions(List<OptionUIModel> list) {
        this.renderer.updateListPickerOptions(list);
    }

    @Override // com.helpshift.conversation.viewmodel.ListPickerVMCallback
    public void handleOptionSelectedForPicker(OptionInputMessageDM optionInputMessageDM, OptionInput.Option option, boolean z) {
        this.listPickerVM = null;
        handleOptionSelected(optionInputMessageDM, option, z);
    }

    @Override // com.helpshift.conversation.viewmodel.ListPickerVMCallback
    public void showEmptyListPickerView() {
        this.renderer.showEmptyListPickerView();
    }

    private void showListPicker(final OptionInputMessageDM optionInputMessageDM) {
        this.listPickerVM = new ListPickerVM(this.domain, optionInputMessageDM, this);
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.23
            @Override // com.helpshift.common.domain.F
            public void f() {
                ConversationalVM.this.renderer.showListPicker(ConversationalVM.this.listPickerVM.getAllOptions(), optionInputMessageDM.input.inputLabel, optionInputMessageDM.input.required, optionInputMessageDM.input.skipLabel);
            }
        });
    }

    public void onListPickerSearchQueryChange(String str) {
        ListPickerVM listPickerVM = this.listPickerVM;
        if (listPickerVM != null) {
            listPickerVM.onListPickerSearchQueryChange(str);
        }
    }

    public void handleOptionSelectedForPicker(OptionUIModel optionUIModel, boolean z) {
        ListPickerVM listPickerVM = this.listPickerVM;
        if (listPickerVM != null) {
            listPickerVM.handleOptionSelectedForPicker(optionUIModel, z);
        }
    }

    @Override // com.helpshift.conversation.viewmodel.ListPickerVMCallback
    public void showPickerClearButton() {
        this.renderer.showPickerClearButton();
    }

    @Override // com.helpshift.conversation.viewmodel.ListPickerVMCallback
    public void hidePickerClearButton() {
        this.renderer.hidePickerClearButton();
    }

    private List<MessageDM> getUIMessagesForHistory(Conversation conversation) {
        ArrayList arrayList = new ArrayList();
        if (conversation.isRedacted) {
            arrayList.add(generateSystemRedactedConversationMessageDM(conversation));
        } else {
            arrayList.addAll(conversation.messageDMs);
        }
        return arrayList;
    }

    @Override // com.helpshift.conversation.viewmodel.ConversationVMCallback
    public void prependConversations(List<Conversation> list, boolean z) {
        if (ListUtils.isEmpty(list)) {
            if (z) {
                return;
            }
            this.messageListVM.prependMessages(new ArrayList(), false);
            return;
        }
        List<UIConversation> uIConversations = this.viewableConversation.getUIConversations();
        ArrayList arrayList = new ArrayList();
        Iterator<Conversation> it = list.iterator();
        while (it.hasNext()) {
            arrayList.addAll(getUIMessagesForHistory(it.next()));
        }
        MessageListVM messageListVM = this.messageListVM;
        if (messageListVM != null) {
            messageListVM.updateUIConversationOrder(uIConversations);
            this.messageListVM.prependMessages(arrayList, z);
        }
    }

    @Override // com.helpshift.conversation.viewmodel.ConversationVMCallback
    public void onHistoryLoadingSuccess() {
        this.historyLoadingViewState.setState(HistoryLoadingState.NONE);
    }

    @Override // com.helpshift.conversation.viewmodel.ConversationVMCallback
    public void onHistoryLoadingError() {
        this.historyLoadingViewState.setState(HistoryLoadingState.ERROR);
    }

    @Override // com.helpshift.conversation.viewmodel.ConversationVMCallback
    public void onHistoryLoadingStarted() {
        this.historyLoadingViewState.setState(HistoryLoadingState.LOADING);
    }

    public void sendAttachment(final AttachmentPickerFile attachmentPickerFile, final String str) {
        this.domain.runParallel(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.24
            @Override // com.helpshift.common.domain.F
            public void f() {
                ConversationalVM.this.conversationManager.sendAttachment(ConversationalVM.this.viewableConversation.getActiveConversation(), attachmentPickerFile, str);
            }
        });
    }

    public void handleAdminAttachmentMessageClick(AttachmentMessageDM attachmentMessageDM) {
        this.viewableConversation.onAdminAttachmentMessageClicked(attachmentMessageDM);
    }

    public void onAdminMessageLinkClickFailed() {
        this.renderer.showErrorView(PlatformException.NO_APPS_FOR_OPENING_ATTACHMENT);
    }

    public void onActionCardMessageClicked(AdminActionCardMessageDM adminActionCardMessageDM) {
        this.viewableConversation.onActionCardMessageClicked(adminActionCardMessageDM);
        this.renderer.openActionLink(adminActionCardMessageDM.getUriAsStringForAction());
    }

    @Override // com.helpshift.conversation.viewmodel.ConversationVMCallback
    public void launchAttachment(String str, String str2) {
        this.renderer.launchAttachment(str, str2);
    }

    public void markConversationResolutionStatus(boolean z) {
        HSLogger.d(TAG, "Sending resolution event : Accepted? " + z);
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        if (activeConversation.state == IssueState.RESOLUTION_REQUESTED) {
            this.conversationManager.markConversationResolutionStatus(activeConversation, z);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00c5  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void handleStateChangeForIssueMode(com.helpshift.conversation.dto.IssueState r7) {
        /*
            Method dump skipped, instruction units count: 208
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.conversation.viewmodel.ConversationalVM.handleStateChangeForIssueMode(com.helpshift.conversation.dto.IssueState):void");
    }

    void handleConversationRejectedState() {
        ConversationFooterState conversationFooterState;
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        this.conversationController.saveUserReplyText("");
        if (activeConversation.isRedacted) {
            conversationFooterState = ConversationFooterState.REDACTED_STATE;
        } else {
            conversationFooterState = ConversationFooterState.REJECTED_MESSAGE;
        }
        showStartNewConversation(conversationFooterState);
        this.isConversationRejected = true;
    }

    public void onAttachmentButtonClick() {
        this.conversationController.setPersistMessageBox(true);
    }

    public List<Integer> getWhiteListedAttachmentTypes() {
        HashSet hashSet = new HashSet();
        List<String> whiteListAttachmentMimeTypes = this.sdkConfigurationDM.getWhiteListAttachmentMimeTypes();
        if (whiteListAttachmentMimeTypes == null || whiteListAttachmentMimeTypes.contains(AttachmentConstants.ALLOW_ALL_MIME)) {
            hashSet.add(1);
            hashSet.add(2);
            hashSet.add(3);
        } else {
            for (String str : whiteListAttachmentMimeTypes) {
                if (str.startsWith(AttachmentConstants.IMAGE_MIME_PREFIX)) {
                    hashSet.add(1);
                } else if (str.startsWith(AttachmentConstants.VIDEO_MIME_PREFIX)) {
                    hashSet.add(2);
                } else {
                    hashSet.add(3);
                }
                if (hashSet.size() == 3) {
                    break;
                }
            }
        }
        return new ArrayList(hashSet);
    }

    private boolean shouldShowReplyBoxOnConversationRejected() {
        return !StringUtils.isEmpty(this.conversationController.getUserReplyText()) || this.conversationController.shouldPersistMessageBox() || this.retainMessageBoxOnUI;
    }

    private void sendCSATEvent(AnalyticsEventType analyticsEventType) {
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        HashMap map = new HashMap();
        if (activeConversation != null && StringUtils.isNotEmpty(activeConversation.acid)) {
            map.put("acid", activeConversation.acid);
        }
        this.domain.getAnalyticsEventDM().pushEvent(analyticsEventType, map);
    }

    public void onCSATSurveyStarted() {
        sendCSATEvent(AnalyticsEventType.START_CSAT_RATING);
    }

    public void onCSATSurveyRequested() {
        sendCSATEvent(AnalyticsEventType.CSAT_REQUESTED);
    }

    public void onCSATSurveyRequestedFromBot(String str) {
        if (this.lastCSATRequestedEventId.equals(str)) {
            return;
        }
        sendCSATEvent(AnalyticsEventType.CSAT_REQUESTED);
        this.lastCSATRequestedEventId = str;
    }

    public void onCSATSurveySubmitted(int i, String str) {
        ConversationalRenderer conversationalRenderer = this.renderer;
        if (conversationalRenderer != null) {
            conversationalRenderer.showCSATSubmittedView();
        }
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        if (!activeConversation.isIssueInProgress()) {
            showStartNewConversation(ConversationFooterState.START_NEW_CONVERSATION);
        }
        HSLogger.d(TAG, "Sending CSAT rating : " + i + ", feedback: " + str);
        this.conversationManager.sendCSATSurvey(activeConversation, i, str);
        sendCSATEvent(AnalyticsEventType.CSAT_SUBMITTED);
    }

    public void onCSATSurveyCancelled() {
        sendCSATEvent(AnalyticsEventType.CANCEL_CSAT_RATING);
    }

    public void onCSATSurveyStartedFromBot(String str) {
        if (this.lastCSATStartRatingEventId.equals(str)) {
            return;
        }
        sendCSATEvent(AnalyticsEventType.START_CSAT_RATING);
        this.lastCSATStartRatingEventId = str;
    }

    public void setConversationViewState(int i) {
        this.conversationController.setConversationViewState(i);
    }

    public void forceClickOnNewConversationButton() {
        if (this.viewableConversation.getActiveConversation().isStartNewConversationClicked) {
            onNewConversationButtonClicked();
        }
    }

    private void clearNotifications() {
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        this.conversationController.clearNotification(activeConversation);
        this.conversationController.resetPushNotificationCount(activeConversation);
    }

    private void resetIncrementMessageCountFlag() {
        this.conversationManager.setShouldIncrementMessageCount(this.viewableConversation.getActiveConversation(), false, true);
    }

    private void pushAnalyticsEvent(AnalyticsEventType analyticsEventType, Map<String, Object> map) {
        this.domain.getAnalyticsEventDM().pushEvent(analyticsEventType, map);
    }

    public void onAdminMessageLinkClicked(String str, MessageDM messageDM) {
        URI uriCreate;
        Conversation conversation = null;
        try {
            uriCreate = URI.create(str);
        } catch (Exception unused) {
        }
        String scheme = uriCreate != null ? uriCreate.getScheme() : null;
        Long l = messageDM.conversationLocalId;
        Iterator<Conversation> it = this.viewableConversation.getAllConversations().iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Conversation next = it.next();
            if (next.localId.equals(l)) {
                conversation = next;
                break;
            }
        }
        if (StringUtils.isEmpty(scheme)) {
            return;
        }
        Map<String, Object> map = new HashMap<>();
        if (conversation != null) {
            if (!StringUtils.isEmpty(conversation.preConversationServerId)) {
                map.put(AnalyticsEventKey.PREISSUE_ID, conversation.preConversationServerId);
            }
            if (!StringUtils.isEmpty(conversation.serverId)) {
                map.put(AnalyticsEventKey.ISSUE_ID, conversation.serverId);
            }
            if (StringUtils.isNotEmpty(conversation.acid)) {
                map.put("acid", conversation.acid);
            }
        }
        map.put(AnalyticsEventKey.PROTOCOL, scheme);
        map.put("u", str);
        pushAnalyticsEvent(AnalyticsEventType.ADMIN_MESSAGE_DEEPLINK_CLICKED, map);
    }

    public void startLiveUpdates() {
        this.viewableConversation.startLiveUpdates();
    }

    public void stopLiveUpdates() {
        this.viewableConversation.stopLiveUpdates();
    }

    @Override // com.helpshift.util.HSListObserver
    public void add(MessageDM messageDM) {
        addAll(Collections.singletonList(messageDM));
    }

    public void updateLastUserActivityTime() {
        this.conversationManager.updateLastUserActivityTime(this.viewableConversation.getActiveConversation(), System.currentTimeMillis());
    }

    @Override // com.helpshift.conversation.viewmodel.MessageListVMCallback
    public void appendMessages(int i, int i2) {
        ConversationalRenderer conversationalRenderer = this.renderer;
        if (conversationalRenderer != null) {
            conversationalRenderer.appendMessages(i, i2);
        }
    }

    @Override // com.helpshift.conversation.viewmodel.MessageListVMCallback
    public void newAdminMessagesAdded() {
        updateUIOnNewMessageReceived();
    }

    @Override // com.helpshift.conversation.viewmodel.MessageListVMCallback
    public void newUserMessagesAdded() {
        notifyRendererForScrollToBottom();
    }

    private void showUnreadMessagesIndicator() {
        this.scrollJumperViewState.setShouldShowUnreadMessagesIndicator(true);
    }

    protected void updateUIOnNewMessageReceived() {
        if (this.scrollJumperViewState.isVisible()) {
            showUnreadMessagesIndicator();
        } else {
            notifyRendererForScrollToBottom();
        }
    }

    @Override // com.helpshift.conversation.viewmodel.MessageListVMCallback
    public void updateMessages(int i, int i2) {
        ConversationalRenderer conversationalRenderer = this.renderer;
        if (conversationalRenderer != null) {
            conversationalRenderer.updateMessages(i, i2);
        }
    }

    @Override // com.helpshift.conversation.viewmodel.MessageListVMCallback
    public void refreshAll() {
        ConversationalRenderer conversationalRenderer = this.renderer;
        if (conversationalRenderer != null) {
            conversationalRenderer.notifyRefreshList();
        }
    }

    @Override // com.helpshift.account.AuthenticationFailureDM.AuthenticationFailureObserver
    public void onAuthenticationFailure() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.25
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (ConversationalVM.this.renderer != null) {
                    ConversationalVM.this.renderer.onAuthenticationFailure();
                }
            }
        });
    }

    public void onScrollJumperViewClicked() {
        notifyRendererForScrollToBottom();
    }

    public void onScrolledToBottom() {
        this.scrollJumperViewState.setVisible(false);
        this.scrollJumperViewState.setShouldShowUnreadMessagesIndicator(false);
    }

    public void onScrolling() {
        this.scrollJumperViewState.setVisible(true);
    }

    public void onScrolledToTop() {
        if (this.historyLoadingViewState.getState() == HistoryLoadingState.NONE) {
            loadHistoryMessagesInternal();
        }
    }

    public void retryHistoryLoadingMessages() {
        if (this.historyLoadingViewState.getState() == HistoryLoadingState.ERROR) {
            loadHistoryMessagesInternal();
        }
    }

    private void loadHistoryMessagesInternal() {
        if (this.historyLoadingViewState.getState() == HistoryLoadingState.LOADING) {
            return;
        }
        this.domain.runParallel(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.26
            @Override // com.helpshift.common.domain.F
            public void f() {
                ConversationalVM.this.viewableConversation.loadMoreMessages();
            }
        });
    }

    protected void updateTypingIndicatorStatus(boolean z) {
        boolean z2;
        if (z) {
            this.renderer.showAgentTypingIndicator();
            z2 = !this.scrollJumperViewState.isVisible();
        } else {
            this.renderer.hideAgentTypingIndicator();
            z2 = false;
        }
        if (z2) {
            notifyRendererForScrollToBottom();
        }
    }

    private void notifyRendererForScrollToBottom() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.27
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (ConversationalVM.this.renderer != null) {
                    ConversationalVM.this.renderer.scrollToBottom();
                }
            }
        });
    }

    public void updateUnreadMessageCountIndicator(boolean z) {
        this.scrollJumperViewState.setShouldShowUnreadMessagesIndicator(z);
    }

    private void showMessageBox() {
        this.replyBoxViewState.setVisible(true);
        updateAttachmentButtonViewState();
        this.confirmationBoxViewState.setVisible(false);
        this.conversationFooterViewState.setState(ConversationFooterState.NONE);
    }

    private void showConfirmationBox() {
        this.replyBoxViewState.setVisible(false);
        updateAttachmentButtonViewState();
        this.confirmationBoxViewState.setVisible(true);
        this.conversationFooterViewState.setState(ConversationFooterState.NONE);
    }

    private void updateAttachmentButtonViewState() {
        resetDefaultMenuItemsVisibility();
        if (this.attachImageButtonViewState.isVisible()) {
            this.attachImageButtonViewState.setVisible(!this.isConversationRejected && this.replyBoxViewState.isVisible());
        }
    }

    protected void hideAllFooterWidgets() {
        this.replyBoxViewState.setVisible(false);
        updateAttachmentButtonViewState();
        this.confirmationBoxViewState.setVisible(false);
        this.conversationFooterViewState.setState(ConversationFooterState.NONE);
    }

    protected void showStartNewConversation(ConversationFooterState conversationFooterState) {
        this.replyBoxViewState.setVisible(false);
        updateAttachmentButtonViewState();
        this.confirmationBoxViewState.setVisible(false);
        this.conversationFooterViewState.setState(conversationFooterState);
    }

    public void toggleReplySendButton(boolean z) {
        this.replyButtonViewState.setEnabled(z);
    }

    public ReplyFieldViewState getReplyFieldViewState() {
        return this.replyFieldViewState;
    }

    public HistoryLoadingViewState getHistoryLoadingViewState() {
        return this.historyLoadingViewState;
    }

    public ScrollJumperViewState getScrollJumperViewState() {
        return this.scrollJumperViewState;
    }

    public ConversationFooterViewState getConversationFooterViewState() {
        return this.conversationFooterViewState;
    }

    public BaseViewState getAttachImageButtonViewState() {
        return this.attachImageButtonViewState;
    }

    public ReplyBoxViewState getReplyBoxViewState() {
        return this.replyBoxViewState;
    }

    public BaseViewState getConfirmationBoxViewState() {
        return this.confirmationBoxViewState;
    }

    public BaseViewState getReplyButtonViewState() {
        return this.replyButtonViewState;
    }

    public void onDestroy() {
        this.conversationController.resetLastNotificationCountFetchTime();
    }

    @Override // com.helpshift.conversation.viewmodel.SmartIntentVMCallback
    public void showFakeTypingIndicatorFromSmartIntent() {
        showFakeTypingIndicator(true);
    }

    @Override // com.helpshift.conversation.viewmodel.SmartIntentVMCallback
    public void hideFakeTypingIndicatorFromSmartIntent() {
        showFakeTypingIndicator(false);
    }

    @Override // com.helpshift.conversation.viewmodel.SmartIntentVMCallback
    public void showReplyFooterFromSmartIntent() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.28
            @Override // com.helpshift.common.domain.F
            public void f() {
                ConversationalVM.this.replyBoxViewState.setVisible(true);
                ConversationalVM.this.updateReplyBoxVisibility();
            }
        });
    }

    @Override // com.helpshift.conversation.viewmodel.SmartIntentVMCallback
    public void hideReplyFooterFromSmartIntent() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.29
            @Override // com.helpshift.common.domain.F
            public void f() {
                ConversationalVM.this.replyBoxViewState.setVisible(false);
                ConversationalVM.this.updateReplyBoxVisibility();
            }
        });
    }

    @Override // com.helpshift.conversation.viewmodel.SmartIntentVMCallback
    public void createPreIssueFromSmartIntentSelection(String str, List<String> list, List<String> list2, String str2) {
        createPreIssueViaSmartIntent(str, list, list2, str2);
    }

    @Override // com.helpshift.conversation.viewmodel.SmartIntentVMCallback
    public void createPreIssueFromSmartIntentSendButton(String str, String str2) {
        createPreIssueViaSmartIntent(str, null, null, str2);
    }

    @Override // com.helpshift.conversation.viewmodel.SmartIntentVMCallback
    public void showSmartIntentReplyValidationFailedError() {
        ConversationalRenderer conversationalRenderer = this.renderer;
        if (conversationalRenderer != null) {
            conversationalRenderer.showSmartIntentReplyValidationFailedError();
        }
    }

    @Override // com.helpshift.conversation.viewmodel.SmartIntentVMCallback
    public void showSmartIntentUI(SmartIntentCollapsedRootViewState smartIntentCollapsedRootViewState) {
        HSLogger.d(TAG, "showSmartIntentUI : " + smartIntentCollapsedRootViewState);
        ConversationalRenderer conversationalRenderer = this.renderer;
        if (conversationalRenderer != null) {
            conversationalRenderer.showSmartIntentView(smartIntentCollapsedRootViewState);
        }
    }

    @Override // com.helpshift.conversation.viewmodel.SmartIntentVMCallback
    public void updateSmartIntentView(BaseSmartIntentViewState baseSmartIntentViewState) {
        HSLogger.d(TAG, "updateSmartIntentView : " + baseSmartIntentViewState);
        ConversationalRenderer conversationalRenderer = this.renderer;
        if (conversationalRenderer != null) {
            conversationalRenderer.updateSmartIntentView(baseSmartIntentViewState);
        }
    }

    @Override // com.helpshift.conversation.viewmodel.SmartIntentVMCallback
    public void hideSmartIntentView() {
        HSLogger.d(TAG, "hideSmartIntentView called");
        ConversationalRenderer conversationalRenderer = this.renderer;
        if (conversationalRenderer != null) {
            conversationalRenderer.hideSendReplyUI();
            this.renderer.hideSmartIntentView();
        }
    }

    public boolean handleBackPressedForSmartIntent() {
        return this.smartIntentVM.handleBackPressedForSmartIntent();
    }

    public void onSmartIntentBottomSheetCollapsed() {
        this.smartIntentVM.onSmartIntentBottomSheetCollapsed();
    }

    public void onSmartIntentBottomSheetExpanded() {
        this.smartIntentVM.onSmartIntentBottomSheetExpanded();
    }

    public BaseViewState getSmartIntentReplyButtonViewState() {
        return this.smartIntentVM.getReplyButtonViewState();
    }

    public BaseViewState getSmartIntentClearSearchButtonViewState() {
        return this.smartIntentVM.getClearSearchButtonViewState();
    }

    public ReplyFieldViewState getSmartIntentReplyFieldViewState() {
        return this.smartIntentVM.getReplyFieldViewState();
    }

    public void onSmartIntentTextChanged(CharSequence charSequence) {
        this.smartIntentVM.onSmartIntentTextChanged(charSequence);
    }

    public void onSmartIntentSendButtonClick() {
        ConversationalRenderer conversationalRenderer = this.renderer;
        if (conversationalRenderer != null) {
            this.smartIntentVM.onSmartIntentSendButtonClick(conversationalRenderer.getSmartIntentUserQuery());
        }
    }

    public SmartIntentSavedState getSmartIntentInstanceSaveState() {
        return this.smartIntentVM.buildInstanceSaveState();
    }

    public void onRestoreSmartIntentInstanceState(SmartIntentSavedState smartIntentSavedState) {
        this.smartIntentVM.onRestoreInstanceState(smartIntentSavedState);
    }

    public void pushChatScreenOpenAnalyticsEvent() {
        Conversation activeConversation = this.viewableConversation.getActiveConversation();
        String str = activeConversation.serverId;
        String str2 = activeConversation.preConversationServerId;
        HashMap map = new HashMap();
        if (StringUtils.isNotEmpty(activeConversation.acid)) {
            map.put("acid", activeConversation.acid);
        }
        if (StringUtils.isNotEmpty(str)) {
            map.put("id", str);
            pushAnalyticsEvent(AnalyticsEventType.OPEN_ISSUE, map);
        } else {
            if (StringUtils.isNotEmpty(str2)) {
                map.put(AnalyticsEventKey.PREISSUE_ID, str2);
            }
            pushAnalyticsEvent(AnalyticsEventType.REPORTED_ISSUE, map);
        }
    }

    private void retryFallbackAvatarImageDownload() {
        this.domain.runParallel(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.30
            @Override // com.helpshift.common.domain.F
            public void f() {
                AvatarImageDownloader.retryFallbackImagesDownload(ConversationalVM.this.platform, ConversationalVM.this.domain);
            }
        });
    }

    public void downloadAvatarImage(MessageDM messageDM) {
        if ((this.sdkConfigurationDM.isPersonalisedBotEnabled() && messageDM.author.role == Author.AuthorRole.BOT) || (this.sdkConfigurationDM.isPersonalisedAgentEnabled() && messageDM.author.role == Author.AuthorRole.AGENT)) {
            Boolean bool = this.messageToAvatarTriggeredMap.get(messageDM);
            if (bool == null || !bool.booleanValue()) {
                this.messageToAvatarTriggeredMap.put(messageDM, true);
                this.conversationManager.downloadAvatarImage(messageDM);
            }
        }
    }

    public void onSendFeedBackClick(final int i, final AdminCSATMessageWithOptions adminCSATMessageWithOptions) {
        int iIndexOf = this.messageListVM.getUiMessageDMs().indexOf(adminCSATMessageWithOptions);
        this.messageListVM.remove(Collections.singletonList(adminCSATMessageWithOptions));
        this.renderer.updateMessages(iIndexOf - 1, 1);
        this.domain.runParallel(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.31
            @Override // com.helpshift.common.domain.F
            public void f() {
                try {
                    ConversationalVM.this.conversationManager.sendCSATBotResponse(ConversationalVM.this.viewableConversation.getActiveConversation(), i, false, adminCSATMessageWithOptions);
                } catch (Exception e) {
                    HSLogger.e(ConversationalVM.TAG, "Error sending csat response", e);
                }
            }
        });
        sendCSATEvent(AnalyticsEventType.CSAT_SUBMITTED);
    }

    public void onStartNewConversationButtonClickFromCSATBot(final AdminCSATMessageWithOptions adminCSATMessageWithOptions) {
        int iIndexOf = this.messageListVM.getUiMessageDMs().indexOf(adminCSATMessageWithOptions);
        this.messageListVM.remove(Collections.singletonList(adminCSATMessageWithOptions));
        this.renderer.updateMessages(iIndexOf - 1, 1);
        this.domain.runParallel(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationalVM.32
            @Override // com.helpshift.common.domain.F
            public void f() {
                try {
                    ConversationalVM.this.conversationManager.sendCSATBotResponse(ConversationalVM.this.viewableConversation.getActiveConversation(), 0, true, adminCSATMessageWithOptions);
                } catch (Exception unused) {
                    HSLogger.e(ConversationalVM.TAG, "Error sending csat response");
                }
            }
        });
        onNewConversationButtonClicked();
    }
}
