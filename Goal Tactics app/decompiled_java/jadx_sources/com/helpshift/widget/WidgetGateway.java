package com.helpshift.widget;

import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.conversation.activeconversation.message.ConversationFooterState;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.domainmodel.ConversationController;
import com.helpshift.conversation.dto.ConversationDetailDTO;
import com.helpshift.conversation.dto.IssueState;
import com.helpshift.util.StringUtils;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes2.dex */
public class WidgetGateway {
    private final SDKConfigurationDM config;
    private final ConversationController conversationController;

    public WidgetGateway(SDKConfigurationDM sDKConfigurationDM, ConversationController conversationController) {
        this.config = sDKConfigurationDM;
        this.conversationController = conversationController;
    }

    public MutableBaseViewState makeStartConversationButtonViewState() {
        MutableBaseViewState mutableBaseViewState = new MutableBaseViewState();
        mutableBaseViewState.setVisible(!this.conversationController.isCreateConversationInProgress());
        return mutableBaseViewState;
    }

    public MutableReplyFieldViewState makeReplyFieldViewState() {
        return new MutableReplyFieldViewState();
    }

    public MutableReplyBoxViewState makeReplyBoxViewState(Conversation conversation, boolean z) {
        MutableReplyBoxViewState mutableReplyBoxViewState = new MutableReplyBoxViewState();
        updateReplyBoxWidget(mutableReplyBoxViewState, conversation, z);
        return mutableReplyBoxViewState;
    }

    public void updateReplyBoxWidget(MutableReplyBoxViewState mutableReplyBoxViewState, Conversation conversation, boolean z) {
        boolean z2 = true;
        if (conversation.isRedacted || (!conversation.isIssueInProgress() && (conversation.state != IssueState.RESOLUTION_REJECTED || !z))) {
            z2 = false;
        }
        mutableReplyBoxViewState.setVisible(z2);
    }

    public MutableScrollJumperViewState makeScrollJumperViewState() {
        return new MutableScrollJumperViewState(false, false);
    }

    public boolean getDefaultVisibilityForConversationInfoButtonWidget(Conversation conversation) {
        return !conversation.isInPreIssueMode() && this.config.getBoolean(SDKConfigurationDM.SHOW_CONVERSATION_INFO_SCREEN);
    }

    public MutableConversationFooterViewState makeConversationFooterViewState(Conversation conversation, boolean z) {
        MutableConversationFooterViewState mutableConversationFooterViewState = new MutableConversationFooterViewState();
        updateConversationFooterViewState(mutableConversationFooterViewState, conversation, z);
        return mutableConversationFooterViewState;
    }

    public void updateConversationFooterViewState(MutableConversationFooterViewState mutableConversationFooterViewState, Conversation conversation, boolean z) {
        ConversationFooterState conversationFooterState = ConversationFooterState.NONE;
        if (conversation.isRedacted) {
            conversationFooterState = ConversationFooterState.REDACTED_STATE;
        } else if (conversation.state == IssueState.RESOLUTION_ACCEPTED || conversation.state == IssueState.RESOLUTION_EXPIRED) {
            if (this.conversationController.conversationManager.shouldShowCSATInFooter(conversation)) {
                conversationFooterState = ConversationFooterState.CSAT_RATING;
            } else {
                conversationFooterState = ConversationFooterState.START_NEW_CONVERSATION;
            }
        } else if (conversation.state == IssueState.REJECTED) {
            conversationFooterState = ConversationFooterState.REJECTED_MESSAGE;
        } else if (conversation.state == IssueState.ARCHIVED) {
            conversationFooterState = ConversationFooterState.ARCHIVAL_MESSAGE;
        } else if (conversation.state == IssueState.RESOLUTION_REQUESTED && this.config.shouldShowConversationResolutionQuestion() && !conversation.isFeedbackBotEnabled) {
            conversationFooterState = ConversationFooterState.CONVERSATION_ENDED_MESSAGE;
        } else if (conversation.state == IssueState.RESOLUTION_REJECTED) {
            if (z) {
                conversationFooterState = ConversationFooterState.NONE;
            } else if (this.conversationController.conversationManager.shouldShowCSATInFooter(conversation)) {
                conversationFooterState = ConversationFooterState.CSAT_RATING;
            } else {
                conversationFooterState = ConversationFooterState.START_NEW_CONVERSATION;
            }
        } else if (conversation.state == IssueState.CLOSED) {
            conversationFooterState = ConversationFooterState.START_NEW_CONVERSATION;
        } else if (conversation.state == IssueState.AUTHOR_MISMATCH) {
            conversationFooterState = ConversationFooterState.AUTHOR_MISMATCH;
        }
        mutableConversationFooterViewState.setState(conversationFooterState);
    }

    public MutableBaseViewState makeConfirmationBoxViewState(Conversation conversation) {
        MutableBaseViewState mutableBaseViewState = new MutableBaseViewState();
        updateConfirmationBoxViewState(mutableBaseViewState, conversation);
        return mutableBaseViewState;
    }

    public void updateConfirmationBoxViewState(MutableBaseViewState mutableBaseViewState, Conversation conversation) {
        mutableBaseViewState.setVisible(!conversation.isRedacted && !conversation.isFeedbackBotEnabled && conversation.state == IssueState.RESOLUTION_REQUESTED && this.config.shouldShowConversationResolutionQuestion());
    }

    public MutableBaseViewState makeAttachImageButtonViewState(Conversation conversation) {
        MutableBaseViewState mutableBaseViewState = new MutableBaseViewState();
        mutableBaseViewState.setVisible(getDefaultVisibilityForAttachImageButton(conversation));
        return mutableBaseViewState;
    }

    public MutableBaseViewState makeNewConversationAttachImageButtonViewState(MutableImageAttachmentViewState mutableImageAttachmentViewState) {
        MutableBaseViewState mutableBaseViewState = new MutableBaseViewState();
        mutableBaseViewState.setVisible(getVisibilityForNewConversationAttachImageButton(mutableImageAttachmentViewState));
        return mutableBaseViewState;
    }

    private boolean getVisibilityForNewConversationAttachImageButton(MutableImageAttachmentViewState mutableImageAttachmentViewState) {
        return getDefaultVisibilityForAttachImageButtonNewConversation() && StringUtils.isEmpty(mutableImageAttachmentViewState.getImagePath()) && !this.conversationController.isCreateConversationInProgress();
    }

    public boolean getDefaultVisibilityForAttachImageButton(Conversation conversation) {
        return !conversation.isInPreIssueMode() && getDefaultVisibilityForAttachImageButtonNewConversation();
    }

    public boolean getDefaultVisibilityForAttachImageButtonNewConversation() {
        return !this.config.getBoolean(SDKConfigurationDM.ENABLE_FULL_PRIVACY) && this.config.getBoolean(SDKConfigurationDM.ALLOW_USER_ATTACHMENTS);
    }

    public MutableTextViewState makeDescriptionViewState() {
        String str;
        MutableTextViewState mutableTextViewState = new MutableTextViewState(true);
        String conversationArchivalPrefillText = this.conversationController.getConversationArchivalPrefillText();
        String string = this.config.getString(SDKConfigurationDM.CONVERSATION_PRE_FILL_TEXT);
        ConversationDetailDTO conversationDetail = this.conversationController.getConversationDetail();
        if (conversationDetail == null || conversationDetail.type != 1) {
            str = "";
        } else {
            str = conversationDetail.title;
            long jNanoTime = System.nanoTime() - conversationDetail.timestamp;
            if (jNanoTime < 0 || TimeUnit.NANOSECONDS.toSeconds(jNanoTime) > 7200) {
                this.conversationController.saveDescriptionDetail("", 0);
                str = "";
            }
        }
        if (!StringUtils.isEmpty(str)) {
            conversationArchivalPrefillText = str;
        } else if (!StringUtils.isEmpty(conversationArchivalPrefillText)) {
            this.conversationController.saveDescriptionDetail(conversationArchivalPrefillText, 3);
        } else if (StringUtils.isEmpty(string)) {
            conversationArchivalPrefillText = "";
        } else {
            this.conversationController.saveDescriptionDetail(string, 2);
            conversationArchivalPrefillText = string;
        }
        mutableTextViewState.setText(conversationArchivalPrefillText);
        return mutableTextViewState;
    }

    public void save(MutableTextViewState mutableTextViewState) {
        this.conversationController.saveDescriptionDetail(mutableTextViewState.getText(), 1);
    }

    public MutableTextViewState makeNameViewState() {
        MutableTextViewState mutableTextViewState = new MutableTextViewState(true);
        mutableTextViewState.setText(!this.config.shouldCreateConversationAnonymously() ? this.conversationController.getName() : "Anonymous");
        return mutableTextViewState;
    }

    public MutableTextViewState makeEmailViewState() {
        MutableTextViewState mutableTextViewState = new MutableTextViewState(isEmailRequired());
        if (!this.config.shouldCreateConversationAnonymously()) {
            mutableTextViewState.setText(this.conversationController.getEmail());
        }
        return mutableTextViewState;
    }

    private boolean isEmailRequired() {
        if (this.config.getBoolean(SDKConfigurationDM.ENABLE_FULL_PRIVACY)) {
            return false;
        }
        if (this.config.getBoolean(SDKConfigurationDM.REQUIRE_NAME_AND_EMAIL)) {
            return true;
        }
        return this.config.getBoolean(SDKConfigurationDM.PROFILE_FORM_ENABLE) && this.config.getBoolean(SDKConfigurationDM.REQUIRE_EMAIL);
    }

    public MutableImageAttachmentViewState makeImageAttachmentWidget() {
        MutableImageAttachmentViewState mutableImageAttachmentViewState = new MutableImageAttachmentViewState();
        if (this.config.getBoolean(SDKConfigurationDM.ENABLE_FULL_PRIVACY)) {
            mutableImageAttachmentViewState.setAttachmentPickerFile(null);
            save(mutableImageAttachmentViewState);
        } else {
            mutableImageAttachmentViewState.setAttachmentPickerFile(this.conversationController.getImageAttachmentDraft());
            mutableImageAttachmentViewState.setClickable(!this.conversationController.isCreateConversationInProgress());
        }
        return mutableImageAttachmentViewState;
    }

    public void save(MutableImageAttachmentViewState mutableImageAttachmentViewState) {
        this.conversationController.saveImageAttachmentDraft(mutableImageAttachmentViewState.getAttachmentPickerFile());
    }

    public MutableBaseViewState makeProfileFormViewState(TextViewState textViewState, TextViewState textViewState2) {
        MutableBaseViewState mutableBaseViewState = new MutableBaseViewState();
        mutableBaseViewState.setVisible(isProfileFormVisible(textViewState, textViewState2));
        return mutableBaseViewState;
    }

    private boolean isProfileFormVisible(TextViewState textViewState, TextViewState textViewState2) {
        if (this.config.getBoolean(SDKConfigurationDM.ENABLE_FULL_PRIVACY)) {
            return false;
        }
        boolean z = this.config.getBoolean(SDKConfigurationDM.PROFILE_FORM_ENABLE);
        boolean z2 = this.config.getBoolean(SDKConfigurationDM.HIDE_NAME_AND_EMAIL);
        boolean z3 = textViewState.getText().length() > 0;
        boolean z4 = textViewState2.getText().length() > 0;
        if (this.config.getBoolean(SDKConfigurationDM.REQUIRE_NAME_AND_EMAIL) && z2) {
            return (z3 && z4) ? false : true;
        }
        if (z) {
            return !z2 || (this.config.getBoolean(SDKConfigurationDM.REQUIRE_EMAIL) && !z4) || !z3;
        }
        return false;
    }

    public MutableBaseViewState makeProgressBarViewState() {
        MutableBaseViewState mutableBaseViewState = new MutableBaseViewState();
        mutableBaseViewState.setVisible(this.conversationController.isCreateConversationInProgress());
        return mutableBaseViewState;
    }
}
