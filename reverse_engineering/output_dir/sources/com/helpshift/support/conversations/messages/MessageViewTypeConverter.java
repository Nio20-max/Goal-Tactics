package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.util.SparseArray;
import com.helpshift.conversation.activeconversation.message.AdminActionCardMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminCSATMessageWithOptions;
import com.helpshift.conversation.activeconversation.message.AdminImageAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminMessageDM;
import com.helpshift.conversation.activeconversation.message.ConfirmationRejectedMessageDM;
import com.helpshift.conversation.activeconversation.message.FAQListMessageDM;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.OptionInputMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestAppReviewMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestForReopenMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.ScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.SystemDateMessageDM;
import com.helpshift.conversation.activeconversation.message.SystemDividerMessageDM;
import com.helpshift.conversation.activeconversation.message.SystemPublishIdMessageDM;
import com.helpshift.conversation.activeconversation.message.SystemRedactedConversationMessageDM;
import com.helpshift.conversation.activeconversation.message.UserAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.UserMessageDM;
import com.helpshift.conversation.activeconversation.message.UserResponseMessageForCSATInput;
import com.helpshift.conversation.activeconversation.message.UserSmartIntentMessageDM;

/* JADX INFO: loaded from: classes2.dex */
public class MessageViewTypeConverter {
    private AgentTypingMessageDataBinder agentTypingMessageDataBinder;
    private final Context context;
    private ConversationFooterViewBinder conversationFooterViewBinder;
    private HistoryLoadingViewBinder historyLoadingViewBinder;
    private SparseArray<MessageViewDataBinder> viewTypeToDataBinderMap = new SparseArray<>();

    public MessageViewTypeConverter(Context context) {
        this.context = context;
        this.conversationFooterViewBinder = new ConversationFooterViewBinder(context);
        this.agentTypingMessageDataBinder = new AgentTypingMessageDataBinder(context);
        this.historyLoadingViewBinder = new HistoryLoadingViewBinder(context);
    }

    public int messageToViewType(MessageDM messageDM) {
        if (messageDM.isRedacted) {
            if (messageDM.isAdminMessage) {
                return MessageViewType.ADMIN_REDACTED_MESSAGE.key;
            }
            return MessageViewType.USER_REDACTED_MESSAGE.key;
        }
        if (messageDM instanceof UserResponseMessageForCSATInput) {
            return MessageViewType.USER_RSP_CSAT_BOT.key;
        }
        if (messageDM instanceof AdminCSATMessageWithOptions) {
            return MessageViewType.ADMIN_CSAT_MESSAGE.key;
        }
        if (messageDM instanceof FAQListMessageDM) {
            return MessageViewType.ADMIN_SUGGESTIONS_LIST.key;
        }
        if (messageDM instanceof OptionInputMessageDM) {
            return MessageViewType.USER_SELECTABLE_OPTION.key;
        }
        if (messageDM instanceof AdminActionCardMessageDM) {
            return MessageViewType.ACTION_CARD_MESSAGE.key;
        }
        if (messageDM instanceof UserSmartIntentMessageDM) {
            return MessageViewType.USER_SMART_INTENT_MESSAGE.key;
        }
        if (messageDM instanceof AdminMessageDM) {
            return MessageViewType.ADMIN_TEXT_MESSAGE.key;
        }
        if (messageDM instanceof UserMessageDM) {
            return MessageViewType.USER_TEXT_MESSAGE.key;
        }
        if (messageDM instanceof ScreenshotMessageDM) {
            return MessageViewType.USER_SCREENSHOT_ATTACHMENT.key;
        }
        if (messageDM instanceof UserAttachmentMessageDM) {
            return MessageViewType.USER_ATTACHMENT_GENERIC.key;
        }
        if (messageDM instanceof AdminImageAttachmentMessageDM) {
            return MessageViewType.ADMIN_ATTACHMENT_IMAGE.key;
        }
        if (messageDM instanceof AdminAttachmentMessageDM) {
            return MessageViewType.ADMIN_ATTACHMENT_GENERIC.key;
        }
        if (messageDM instanceof RequestAppReviewMessageDM) {
            return MessageViewType.REQUESTED_APP_REVIEW.key;
        }
        if (messageDM instanceof ConfirmationRejectedMessageDM) {
            return MessageViewType.CONFIRMATION_REJECTED.key;
        }
        if (messageDM instanceof RequestScreenshotMessageDM) {
            return MessageViewType.ADMIN_REQUEST_ATTACHMENT.key;
        }
        if (messageDM instanceof RequestForReopenMessageDM) {
            return MessageViewType.REQUEST_FOR_REOPEN.key;
        }
        if (messageDM instanceof SystemDateMessageDM) {
            return MessageViewType.SYSTEM_DATE.key;
        }
        if (messageDM instanceof SystemDividerMessageDM) {
            return MessageViewType.SYSTEM_DIVIDER.key;
        }
        if (messageDM instanceof SystemPublishIdMessageDM) {
            return MessageViewType.SYSTEM_PUBLISH_ID.key;
        }
        if (messageDM instanceof SystemRedactedConversationMessageDM) {
            return MessageViewType.SYSTEM_CONVERSATION_REDACTED_MESSAGE.key;
        }
        return -1;
    }

    public MessageViewDataBinder viewTypeToDataBinder(int i) {
        MessageViewDataBinder messageViewDataBinder = this.viewTypeToDataBinderMap.get(i);
        if (messageViewDataBinder != null) {
            return messageViewDataBinder;
        }
        MessageViewType messageViewType = MessageViewType.getEnum(i);
        if (messageViewType == null) {
            return new AdminMessageViewDataBinder(this.context);
        }
        switch (AnonymousClass1.$SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[messageViewType.ordinal()]) {
            case 1:
                this.viewTypeToDataBinderMap.put(MessageViewType.ADMIN_TEXT_MESSAGE.key, new AdminMessageViewDataBinder(this.context));
                break;
            case 2:
                this.viewTypeToDataBinderMap.put(MessageViewType.USER_TEXT_MESSAGE.key, new UserMessageViewDataBinder(this.context));
                break;
            case 3:
                this.viewTypeToDataBinderMap.put(MessageViewType.USER_SCREENSHOT_ATTACHMENT.key, new ScreenshotMessageViewDataBinder(this.context));
                break;
            case 4:
                this.viewTypeToDataBinderMap.put(MessageViewType.ADMIN_ATTACHMENT_IMAGE.key, new AdminImageAttachmentMessageDataBinder(this.context));
                break;
            case 5:
                this.viewTypeToDataBinderMap.put(MessageViewType.ADMIN_ATTACHMENT_GENERIC.key, new AdminAttachmentMessageDataBinder(this.context));
                break;
            case 6:
                this.viewTypeToDataBinderMap.put(MessageViewType.REQUESTED_APP_REVIEW.key, new RequestAppReviewMessageDataBinder(this.context));
                break;
            case 7:
                this.viewTypeToDataBinderMap.put(MessageViewType.CONFIRMATION_REJECTED.key, new ConfirmationRejectedMessageDataBinder(this.context));
                break;
            case 8:
                this.viewTypeToDataBinderMap.put(MessageViewType.ADMIN_REQUEST_ATTACHMENT.key, new RequestScreenshotMessageDataBinder(this.context));
                break;
            case 9:
                this.viewTypeToDataBinderMap.put(MessageViewType.REQUEST_FOR_REOPEN.key, new AdminMessageViewDataBinder(this.context));
                break;
            case 10:
                this.viewTypeToDataBinderMap.put(MessageViewType.ADMIN_SUGGESTIONS_LIST.key, new AdminSuggestionsMessageViewDataBinder(this.context));
                break;
            case 11:
                this.viewTypeToDataBinderMap.put(MessageViewType.USER_SELECTABLE_OPTION.key, new UserSelectableOptionViewDataBinder(this.context));
                break;
            case 12:
                this.viewTypeToDataBinderMap.put(MessageViewType.SYSTEM_DATE.key, new SystemDateMessageDataBinder(this.context));
                break;
            case 13:
                this.viewTypeToDataBinderMap.put(MessageViewType.SYSTEM_DIVIDER.key, new SystemDividerMessageDataBinder(this.context));
                break;
            case 14:
                this.viewTypeToDataBinderMap.put(MessageViewType.SYSTEM_PUBLISH_ID.key, new SystemPublishIdMessageDataBinder(this.context));
                break;
            case 15:
                this.viewTypeToDataBinderMap.put(MessageViewType.ADMIN_REDACTED_MESSAGE.key, new AdminRedactedMessageDataBinder(this.context));
                break;
            case 16:
                this.viewTypeToDataBinderMap.put(MessageViewType.USER_REDACTED_MESSAGE.key, new UserRedactedMessageDataBinder(this.context));
                break;
            case 17:
                this.viewTypeToDataBinderMap.put(MessageViewType.SYSTEM_CONVERSATION_REDACTED_MESSAGE.key, new SystemRedactedConversationDataBinder(this.context));
                break;
            case 18:
                this.viewTypeToDataBinderMap.put(MessageViewType.USER_ATTACHMENT_GENERIC.key, new UserAttachmentMessageViewDataBinder(this.context));
                break;
            case 19:
                this.viewTypeToDataBinderMap.put(MessageViewType.ACTION_CARD_MESSAGE.key, new AdminActionCardMessageViewDataBinder(this.context));
                break;
            case 20:
                this.viewTypeToDataBinderMap.put(MessageViewType.USER_SMART_INTENT_MESSAGE.key, new UserSmartIntentMessageViewDataBinder(this.context));
                break;
            case 21:
                this.viewTypeToDataBinderMap.put(MessageViewType.ADMIN_CSAT_MESSAGE.key, new AdminCSATMessageViewBinder(this.context));
                break;
            case 22:
                this.viewTypeToDataBinderMap.put(MessageViewType.USER_RSP_CSAT_BOT.key, new UserResponseCSATMessageViewDataBinder(this.context));
                break;
        }
        return this.viewTypeToDataBinderMap.get(i);
    }

    /* JADX INFO: renamed from: com.helpshift.support.conversations.messages.MessageViewTypeConverter$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType;

        static {
            int[] iArr = new int[MessageViewType.values().length];
            $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType = iArr;
            try {
                iArr[MessageViewType.ADMIN_TEXT_MESSAGE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.USER_TEXT_MESSAGE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.USER_SCREENSHOT_ATTACHMENT.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.ADMIN_ATTACHMENT_IMAGE.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.ADMIN_ATTACHMENT_GENERIC.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.REQUESTED_APP_REVIEW.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.CONFIRMATION_REJECTED.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.ADMIN_REQUEST_ATTACHMENT.ordinal()] = 8;
            } catch (NoSuchFieldError unused8) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.REQUEST_FOR_REOPEN.ordinal()] = 9;
            } catch (NoSuchFieldError unused9) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.ADMIN_SUGGESTIONS_LIST.ordinal()] = 10;
            } catch (NoSuchFieldError unused10) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.USER_SELECTABLE_OPTION.ordinal()] = 11;
            } catch (NoSuchFieldError unused11) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.SYSTEM_DATE.ordinal()] = 12;
            } catch (NoSuchFieldError unused12) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.SYSTEM_DIVIDER.ordinal()] = 13;
            } catch (NoSuchFieldError unused13) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.SYSTEM_PUBLISH_ID.ordinal()] = 14;
            } catch (NoSuchFieldError unused14) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.ADMIN_REDACTED_MESSAGE.ordinal()] = 15;
            } catch (NoSuchFieldError unused15) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.USER_REDACTED_MESSAGE.ordinal()] = 16;
            } catch (NoSuchFieldError unused16) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.SYSTEM_CONVERSATION_REDACTED_MESSAGE.ordinal()] = 17;
            } catch (NoSuchFieldError unused17) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.USER_ATTACHMENT_GENERIC.ordinal()] = 18;
            } catch (NoSuchFieldError unused18) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.ACTION_CARD_MESSAGE.ordinal()] = 19;
            } catch (NoSuchFieldError unused19) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.USER_SMART_INTENT_MESSAGE.ordinal()] = 20;
            } catch (NoSuchFieldError unused20) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.ADMIN_CSAT_MESSAGE.ordinal()] = 21;
            } catch (NoSuchFieldError unused21) {
            }
            try {
                $SwitchMap$com$helpshift$support$conversations$messages$MessageViewType[MessageViewType.USER_RSP_CSAT_BOT.ordinal()] = 22;
            } catch (NoSuchFieldError unused22) {
            }
        }
    }

    public ConversationFooterViewBinder getConversationFooterViewBinder() {
        return this.conversationFooterViewBinder;
    }

    public AgentTypingMessageDataBinder getAgentTypingMessageDataBinder() {
        return this.agentTypingMessageDataBinder;
    }

    public HistoryLoadingViewBinder getHistoryLoadingViewBinder() {
        return this.historyLoadingViewBinder;
    }
}
