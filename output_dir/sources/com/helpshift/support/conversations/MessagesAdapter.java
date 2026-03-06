package com.helpshift.support.conversations;

import android.content.Context;
import android.view.ContextMenu;
import android.view.ViewGroup;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.conversation.activeconversation.message.AdminActionCardMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminCSATMessageWithOptions;
import com.helpshift.conversation.activeconversation.message.AdminImageAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.ConversationFooterState;
import com.helpshift.conversation.activeconversation.message.FAQListMessageDM;
import com.helpshift.conversation.activeconversation.message.HistoryLoadingState;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.OptionInputMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestAppReviewMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.ScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.UserAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.input.OptionInput;
import com.helpshift.support.conversations.messages.AgentTypingMessageDataBinder;
import com.helpshift.support.conversations.messages.ConversationFooterViewBinder;
import com.helpshift.support.conversations.messages.HistoryLoadingViewBinder;
import com.helpshift.support.conversations.messages.MessageViewDataBinder;
import com.helpshift.support.conversations.messages.MessageViewType;
import com.helpshift.support.conversations.messages.MessageViewTypeConverter;
import com.helpshift.support.conversations.messages.MessagesAdapterClickListener;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class MessagesAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> implements MessageViewDataBinder.MessageItemClickListener, ConversationFooterViewBinder.ConversationFooterClickListener, HistoryLoadingViewBinder.HistoryLoadingClickListener {
    private boolean isAvatarEnabledInChatFeed;
    private MessageViewTypeConverter messageViewTypeConverter;
    private List<MessageDM> messages;
    private MessagesAdapterClickListener messagesAdapterClickListener;
    private ConversationFooterState conversationFooterState = ConversationFooterState.NONE;
    private boolean isAgentTypingIndicatorVisible = false;
    private HistoryLoadingState historyLoadingState = HistoryLoadingState.NONE;

    public MessagesAdapter(Context context, List<MessageDM> list, boolean z, MessagesAdapterClickListener messagesAdapterClickListener) {
        this.messageViewTypeConverter = new MessageViewTypeConverter(context);
        this.messages = list;
        this.isAvatarEnabledInChatFeed = z;
        this.messagesAdapterClickListener = messagesAdapterClickListener;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        if (i == MessageViewType.HISTORY_LOADING_VIEW.key) {
            HistoryLoadingViewBinder historyLoadingViewBinder = this.messageViewTypeConverter.getHistoryLoadingViewBinder();
            historyLoadingViewBinder.setHistoryLoadingClickListener(this);
            return historyLoadingViewBinder.createViewHolder(viewGroup);
        }
        if (i == MessageViewType.CONVERSATION_FOOTER.key) {
            ConversationFooterViewBinder conversationFooterViewBinder = this.messageViewTypeConverter.getConversationFooterViewBinder();
            conversationFooterViewBinder.setConversationFooterClickListener(this);
            return conversationFooterViewBinder.createViewHolder(viewGroup);
        }
        if (i == MessageViewType.AGENT_TYPING_FOOTER.key) {
            return this.messageViewTypeConverter.getAgentTypingMessageDataBinder().createViewHolder(viewGroup);
        }
        MessageViewDataBinder messageViewDataBinderViewTypeToDataBinder = this.messageViewTypeConverter.viewTypeToDataBinder(i);
        messageViewDataBinderViewTypeToDataBinder.setMessageItemClickListener(this);
        return messageViewDataBinderViewTypeToDataBinder.createViewHolder(viewGroup);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int i) {
        int itemViewType = viewHolder.getItemViewType();
        if (itemViewType == MessageViewType.HISTORY_LOADING_VIEW.key) {
            this.messageViewTypeConverter.getHistoryLoadingViewBinder().bind((HistoryLoadingViewBinder.ViewHolder) viewHolder, this.historyLoadingState);
            return;
        }
        if (itemViewType == MessageViewType.CONVERSATION_FOOTER.key) {
            this.messageViewTypeConverter.getConversationFooterViewBinder().bind((ConversationFooterViewBinder.ViewHolder) viewHolder, this.conversationFooterState);
        } else if (itemViewType == MessageViewType.AGENT_TYPING_FOOTER.key) {
            this.messageViewTypeConverter.getAgentTypingMessageDataBinder().bind((AgentTypingMessageDataBinder.ViewHolder) viewHolder, this.isAvatarEnabledInChatFeed);
        } else {
            this.messageViewTypeConverter.viewTypeToDataBinder(itemViewType).bind(viewHolder, getMessageFromUIMessageList(i));
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemViewType(int i) {
        if (i < getHeaderCount()) {
            return getHeaderViewType();
        }
        if (i < getHeaderCount() + getMessageCount()) {
            return this.messageViewTypeConverter.messageToViewType(getMessageFromUIMessageList(i));
        }
        return getFooterViewType(i);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return getHeaderCount() + getMessageCount() + getFooterCount();
    }

    public void onItemRangeInserted(int i, int i2) {
        notifyItemRangeInserted(i + getHeaderCount(), i2);
    }

    public void onItemRangeChanged(int i, int i2) {
        notifyItemRangeChanged(i + getHeaderCount(), i2);
    }

    public void onItemRangeRemoved(int i, int i2) {
        notifyItemRangeRemoved(i + getHeaderCount(), i2);
    }

    private int getHeaderCount() {
        return this.historyLoadingState != HistoryLoadingState.NONE ? 1 : 0;
    }

    private int getFooterCount() {
        int i = this.isAgentTypingIndicatorVisible ? 1 : 0;
        return this.conversationFooterState != ConversationFooterState.NONE ? i + 1 : i;
    }

    private MessageDM getMessageFromUIMessageList(int i) {
        return this.messages.get(i - getHeaderCount());
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void onAdminMessageLinkClicked(String str, MessageDM messageDM) {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.onAdminMessageLinkClicked(str, messageDM);
        }
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void onAdminMessageLinkClickFailed() {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.onAdminMessageLinkClickFailed();
        }
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void onCreateContextMenu(ContextMenu contextMenu, String str) {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.onCreateContextMenu(contextMenu, str);
        }
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void retryMessage(int i) {
        if (this.messagesAdapterClickListener != null) {
            this.messagesAdapterClickListener.retryMessage(getMessageFromUIMessageList(i));
        }
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void launchImagePicker(RequestScreenshotMessageDM requestScreenshotMessageDM) {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.launchImagePicker(requestScreenshotMessageDM);
        }
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void handleReplyReviewButtonClick(RequestAppReviewMessageDM requestAppReviewMessageDM) {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.handleReplyReviewButtonClick(requestAppReviewMessageDM);
        }
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void onScreenshotMessageClicked(ScreenshotMessageDM screenshotMessageDM) {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.onScreenshotMessageClicked(screenshotMessageDM);
        }
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void onUserAttachmentMessageClicked(UserAttachmentMessageDM userAttachmentMessageDM) {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.onUserAttachmentMessageClicked(userAttachmentMessageDM);
        }
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void handleGenericAttachmentMessageClick(AdminAttachmentMessageDM adminAttachmentMessageDM) {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.handleGenericAttachmentMessageClick(adminAttachmentMessageDM);
        }
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void handleAdminImageAttachmentMessageClick(AdminImageAttachmentMessageDM adminImageAttachmentMessageDM) {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.handleAdminImageAttachmentMessageClick(adminImageAttachmentMessageDM);
        }
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void handleOptionSelected(OptionInputMessageDM optionInputMessageDM, OptionInput.Option option, boolean z) {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.handleOptionSelected(optionInputMessageDM, option, z);
        }
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void onAdminSuggestedQuestionSelected(FAQListMessageDM fAQListMessageDM, String str, String str2) {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.onAdminSuggestedQuestionSelected(fAQListMessageDM, str, str2);
        }
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void onActionCardClicked(AdminActionCardMessageDM adminActionCardMessageDM) {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.onActionCardClicked(adminActionCardMessageDM);
        }
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void downloadAvatarImage(MessageDM messageDM) {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.downloadAvatarImage(messageDM);
        }
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void onStartNewConversationButtonClickFromCSATBot(AdminCSATMessageWithOptions adminCSATMessageWithOptions) {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.onStartNewConversationButtonClickFromCSATBot(adminCSATMessageWithOptions);
        }
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void onSendFeedbackClick(int i, AdminCSATMessageWithOptions adminCSATMessageWithOptions) {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.onSendFeedbackClick(i, adminCSATMessageWithOptions);
        }
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void onCSATSurveyStartedFromBot(String str) {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.onCSATSurveyStartedFromBot(str);
        }
    }

    public void setAgentTypingIndicatorVisibility(boolean z) {
        if (this.isAgentTypingIndicatorVisible != z) {
            this.isAgentTypingIndicatorVisible = z;
            if (z) {
                notifyItemRangeInserted(this.messages.size(), 1);
            } else {
                notifyItemRangeRemoved(this.messages.size(), 1);
            }
        }
    }

    public void setHistoryLoadingState(HistoryLoadingState historyLoadingState) {
        HistoryLoadingState historyLoadingState2;
        if (historyLoadingState == null || (historyLoadingState2 = this.historyLoadingState) == historyLoadingState) {
            return;
        }
        if (historyLoadingState2 == HistoryLoadingState.NONE) {
            this.historyLoadingState = historyLoadingState;
            notifyItemInserted(0);
        } else if (historyLoadingState == HistoryLoadingState.NONE) {
            this.historyLoadingState = historyLoadingState;
            notifyItemRemoved(0);
        } else {
            this.historyLoadingState = historyLoadingState;
            notifyItemChanged(0);
        }
    }

    private int getHeaderViewType() {
        return MessageViewType.HISTORY_LOADING_VIEW.key;
    }

    private int getFooterViewType(int i) {
        int headerCount = i - (getHeaderCount() + getMessageCount());
        boolean z = this.conversationFooterState != ConversationFooterState.NONE;
        if (headerCount != 0) {
            if (headerCount == 1 && z) {
                return MessageViewType.CONVERSATION_FOOTER.key;
            }
        } else {
            if (this.isAgentTypingIndicatorVisible) {
                return MessageViewType.AGENT_TYPING_FOOTER.key;
            }
            if (z) {
                return MessageViewType.CONVERSATION_FOOTER.key;
            }
        }
        return -1;
    }

    public void setConversationFooterState(ConversationFooterState conversationFooterState) {
        if (conversationFooterState == null) {
            conversationFooterState = ConversationFooterState.NONE;
        }
        this.conversationFooterState = conversationFooterState;
        notifyDataSetChanged();
    }

    @Override // com.helpshift.support.conversations.messages.ConversationFooterViewBinder.ConversationFooterClickListener
    public void onStartNewConversationButtonClick() {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.onStartNewConversationButtonClick();
        }
    }

    @Override // com.helpshift.support.conversations.messages.ConversationFooterViewBinder.ConversationFooterClickListener
    public void onCSATSurveyStarted() {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.onCSATSurveyStarted();
        }
    }

    @Override // com.helpshift.support.conversations.messages.ConversationFooterViewBinder.ConversationFooterClickListener
    public void onCSATSurveySubmitted(int i, String str) {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.onCSATSurveySubmitted(i, str);
        }
    }

    @Override // com.helpshift.support.conversations.messages.ConversationFooterViewBinder.ConversationFooterClickListener
    public void onCSATSurveyCancelled() {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.onCSATSurveyCancelled();
        }
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder.MessageItemClickListener
    public void onCSATSurveyRequestedFromBot(String str) {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.onCSATSurveyRequestedFromBot(str);
        }
    }

    public void unregisterAdapterClickListener() {
        this.messagesAdapterClickListener = null;
    }

    public int getMessageCount() {
        return this.messages.size();
    }

    @Override // com.helpshift.support.conversations.messages.HistoryLoadingViewBinder.HistoryLoadingClickListener
    public void onHistoryLoadingRetryClicked() {
        MessagesAdapterClickListener messagesAdapterClickListener = this.messagesAdapterClickListener;
        if (messagesAdapterClickListener != null) {
            messagesAdapterClickListener.onHistoryLoadingRetryClicked();
        }
    }
}
