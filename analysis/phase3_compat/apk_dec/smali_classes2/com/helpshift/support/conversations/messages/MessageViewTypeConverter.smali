.class public Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;
.super Ljava/lang/Object;
.source "MessageViewTypeConverter.java"


# instance fields
.field private agentTypingMessageDataBinder:Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder;

.field private final context:Landroid/content/Context;

.field private conversationFooterViewBinder:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;

.field private historyLoadingViewBinder:Lcom/helpshift/support/conversations/messages/HistoryLoadingViewBinder;

.field private viewTypeToDataBinderMap:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/helpshift/support/conversations/messages/MessageViewDataBinder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    .line 61
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    .line 62
    new-instance v0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;

    invoke-direct {v0, p1}, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->conversationFooterViewBinder:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;

    .line 63
    new-instance v0, Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder;

    invoke-direct {v0, p1}, Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->agentTypingMessageDataBinder:Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder;

    .line 64
    new-instance v0, Lcom/helpshift/support/conversations/messages/HistoryLoadingViewBinder;

    invoke-direct {v0, p1}, Lcom/helpshift/support/conversations/messages/HistoryLoadingViewBinder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->historyLoadingViewBinder:Lcom/helpshift/support/conversations/messages/HistoryLoadingViewBinder;

    return-void
.end method


# virtual methods
.method public getAgentTypingMessageDataBinder()Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder;
    .locals 1

    .line 234
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->agentTypingMessageDataBinder:Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder;

    return-object v0
.end method

.method public getConversationFooterViewBinder()Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;
    .locals 1

    .line 230
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->conversationFooterViewBinder:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;

    return-object v0
.end method

.method public getHistoryLoadingViewBinder()Lcom/helpshift/support/conversations/messages/HistoryLoadingViewBinder;
    .locals 1

    .line 238
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->historyLoadingViewBinder:Lcom/helpshift/support/conversations/messages/HistoryLoadingViewBinder;

    return-object v0
.end method

.method public messageToViewType(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)I
    .locals 1

    .line 68
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isRedacted:Z

    if-eqz v0, :cond_1

    .line 69
    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isAdminMessage:Z

    if-eqz p1, :cond_0

    .line 70
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_REDACTED_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 73
    :cond_0
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_REDACTED_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 76
    :cond_1
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    if-eqz v0, :cond_2

    .line 77
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_RSP_CSAT_BOT:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 79
    :cond_2
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    if-eqz v0, :cond_3

    .line 80
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_CSAT_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 82
    :cond_3
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;

    if-eqz v0, :cond_4

    .line 83
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_SUGGESTIONS_LIST:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 85
    :cond_4
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;

    if-eqz v0, :cond_5

    .line 86
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_SELECTABLE_OPTION:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 88
    :cond_5
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    if-eqz v0, :cond_6

    .line 89
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->ACTION_CARD_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 91
    :cond_6
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;

    if-eqz v0, :cond_7

    .line 92
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_SMART_INTENT_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 94
    :cond_7
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;

    if-eqz v0, :cond_8

    .line 95
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_TEXT_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 97
    :cond_8
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    if-eqz v0, :cond_9

    .line 98
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_TEXT_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 100
    :cond_9
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    if-eqz v0, :cond_a

    .line 101
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_SCREENSHOT_ATTACHMENT:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 103
    :cond_a
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    if-eqz v0, :cond_b

    .line 104
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_ATTACHMENT_GENERIC:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 106
    :cond_b
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;

    if-eqz v0, :cond_c

    .line 107
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_ATTACHMENT_IMAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 109
    :cond_c
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;

    if-eqz v0, :cond_d

    .line 110
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_ATTACHMENT_GENERIC:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 112
    :cond_d
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;

    if-eqz v0, :cond_e

    .line 113
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->REQUESTED_APP_REVIEW:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 115
    :cond_e
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;

    if-eqz v0, :cond_f

    .line 116
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->CONFIRMATION_REJECTED:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 118
    :cond_f
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;

    if-eqz v0, :cond_10

    .line 119
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_REQUEST_ATTACHMENT:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 121
    :cond_10
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    if-eqz v0, :cond_11

    .line 122
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->REQUEST_FOR_REOPEN:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 124
    :cond_11
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/SystemDateMessageDM;

    if-eqz v0, :cond_12

    .line 125
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->SYSTEM_DATE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 127
    :cond_12
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;

    if-eqz v0, :cond_13

    .line 128
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->SYSTEM_DIVIDER:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 130
    :cond_13
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/SystemPublishIdMessageDM;

    if-eqz v0, :cond_14

    .line 131
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->SYSTEM_PUBLISH_ID:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    .line 133
    :cond_14
    instance-of p1, p1, Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;

    if-eqz p1, :cond_15

    .line 134
    sget-object p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->SYSTEM_CONVERSATION_REDACTED_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget p1, p1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return p1

    :cond_15
    const/4 p1, -0x1

    return p1
.end method

.method public viewTypeToDataBinder(I)Lcom/helpshift/support/conversations/messages/MessageViewDataBinder;
    .locals 4

    .line 141
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder;

    if-eqz v0, :cond_0

    return-object v0

    .line 147
    :cond_0
    invoke-static {p1}, Lcom/helpshift/support/conversations/messages/MessageViewType;->getEnum(I)Lcom/helpshift/support/conversations/messages/MessageViewType;

    move-result-object v0

    if-nez v0, :cond_1

    .line 151
    new-instance p1, Lcom/helpshift/support/conversations/messages/AdminMessageViewDataBinder;

    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {p1, v0}, Lcom/helpshift/support/conversations/messages/AdminMessageViewDataBinder;-><init>(Landroid/content/Context;)V

    return-object p1

    .line 155
    :cond_1
    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter$1;->$SwitchMap$com$helpshift$support$conversations$messages$MessageViewType:[I

    invoke-virtual {v0}, Lcom/helpshift/support/conversations/messages/MessageViewType;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    .line 222
    :pswitch_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_RSP_CSAT_BOT:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 219
    :pswitch_1
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_CSAT_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 215
    :pswitch_2
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_SMART_INTENT_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;-><init>(Landroid/content/Context;)V

    .line 216
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 212
    :pswitch_3
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->ACTION_CARD_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 209
    :pswitch_4
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_ATTACHMENT_GENERIC:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 205
    :pswitch_5
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->SYSTEM_CONVERSATION_REDACTED_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/SystemRedactedConversationDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/SystemRedactedConversationDataBinder;-><init>(Landroid/content/Context;)V

    .line 206
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 202
    :pswitch_6
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_REDACTED_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/UserRedactedMessageDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/UserRedactedMessageDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 199
    :pswitch_7
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_REDACTED_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/AdminRedactedMessageDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/AdminRedactedMessageDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 196
    :pswitch_8
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->SYSTEM_PUBLISH_ID:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/SystemPublishIdMessageDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/SystemPublishIdMessageDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 193
    :pswitch_9
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->SYSTEM_DIVIDER:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/SystemDividerMessageDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/SystemDividerMessageDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 190
    :pswitch_a
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->SYSTEM_DATE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/SystemDateMessageDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/SystemDateMessageDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 187
    :pswitch_b
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_SELECTABLE_OPTION:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/UserSelectableOptionViewDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/UserSelectableOptionViewDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 184
    :pswitch_c
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_SUGGESTIONS_LIST:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/AdminSuggestionsMessageViewDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/AdminSuggestionsMessageViewDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 181
    :pswitch_d
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->REQUEST_FOR_REOPEN:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/AdminMessageViewDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/AdminMessageViewDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 178
    :pswitch_e
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_REQUEST_ATTACHMENT:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 175
    :pswitch_f
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->CONFIRMATION_REJECTED:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/ConfirmationRejectedMessageDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/ConfirmationRejectedMessageDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 172
    :pswitch_10
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->REQUESTED_APP_REVIEW:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/RequestAppReviewMessageDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/RequestAppReviewMessageDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 169
    :pswitch_11
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_ATTACHMENT_GENERIC:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/AdminAttachmentMessageDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/AdminAttachmentMessageDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 166
    :pswitch_12
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_ATTACHMENT_IMAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/AdminImageAttachmentMessageDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/AdminImageAttachmentMessageDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 163
    :pswitch_13
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_SCREENSHOT_ATTACHMENT:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 160
    :pswitch_14
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_TEXT_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 157
    :pswitch_15
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    sget-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_TEXT_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    iget v1, v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    new-instance v2, Lcom/helpshift/support/conversations/messages/AdminMessageViewDataBinder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/support/conversations/messages/AdminMessageViewDataBinder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 226
    :goto_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/MessageViewTypeConverter;->viewTypeToDataBinderMap:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder;

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
