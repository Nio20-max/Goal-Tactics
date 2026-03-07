.class public Lcom/helpshift/common/conversation/ConversationDB;
.super Ljava/lang/Object;
.source "ConversationDB.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;,
        Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_ConverDB"

.field private static instance:Lcom/helpshift/common/conversation/ConversationDB;


# instance fields
.field private final KEY_ATTACHMENT_COUNT:Ljava/lang/String;

.field private final KEY_BOT_ACTION_TYPE:Ljava/lang/String;

.field private final KEY_BOT_ENDED_REASON:Ljava/lang/String;

.field private final KEY_CHATBOT_INFO:Ljava/lang/String;

.field private final KEY_CONTENT_TYPE:Ljava/lang/String;

.field private final KEY_CONVERSATION_ENDED_DELEGATE_SENT:Ljava/lang/String;

.field private final KEY_CSAT_FEEDBACK:Ljava/lang/String;

.field private final KEY_CSAT_RATING:Ljava/lang/String;

.field private final KEY_CSAT_STATE:Ljava/lang/String;

.field private final KEY_DATE_TIME:Ljava/lang/String;

.field private final KEY_FAQS:Ljava/lang/String;

.field private final KEY_FAQS_SOURCE:Ljava/lang/String;

.field private final KEY_FAQ_LANGUAGE:Ljava/lang/String;

.field private final KEY_FAQ_PUBLISH_ID:Ljava/lang/String;

.field private final KEY_FAQ_TITLE:Ljava/lang/String;

.field private final KEY_FILE_NAME:Ljava/lang/String;

.field private final KEY_FILE_PATH:Ljava/lang/String;

.field private final KEY_FOLLOW_UP_REJECTED_OPEN_CONVERSATION:Ljava/lang/String;

.field private final KEY_FOLLOW_UP_REJECTED_REASON:Ljava/lang/String;

.field private final KEY_HAS_NEXT_BOT:Ljava/lang/String;

.field private final KEY_IMAGE_ATTACHMENT_COMPRESSION_COPYING_DONE:Ljava/lang/String;

.field private final KEY_IMAGE_ATTACHMENT_DRAFT_FILE_PATH:Ljava/lang/String;

.field private final KEY_IMAGE_ATTACHMENT_DRAFT_ORIGINAL_NAME:Ljava/lang/String;

.field private final KEY_IMAGE_ATTACHMENT_DRAFT_ORIGINAL_SIZE:Ljava/lang/String;

.field private final KEY_IMAGE_ATTACHMENT_TYPE:Ljava/lang/String;

.field private final KEY_INCREMENT_MESSAGE_COUNT:Ljava/lang/String;

.field private final KEY_INPUT_KEYBOARD:Ljava/lang/String;

.field private final KEY_INPUT_LABEL:Ljava/lang/String;

.field private final KEY_INPUT_OPTIONS:Ljava/lang/String;

.field private final KEY_INPUT_PLACEHOLDER:Ljava/lang/String;

.field private final KEY_INPUT_REQUIRED:Ljava/lang/String;

.field private final KEY_INPUT_SEND_FEEDBACK_LABEL:Ljava/lang/String;

.field private final KEY_INPUT_SKIP_LABEL:Ljava/lang/String;

.field private final KEY_INPUT_START_CONV_LABEL:Ljava/lang/String;

.field private final KEY_IS_ANSWERED:Ljava/lang/String;

.field private final KEY_IS_AUTO_FILLED_PREISSUE:Ljava/lang/String;

.field private final KEY_IS_FEED_BACK_MESSAGE:Ljava/lang/String;

.field private final KEY_IS_MESSAGE_EMPTY:Ljava/lang/String;

.field private final KEY_IS_RESPONSE_SKIPPED:Ljava/lang/String;

.field private final KEY_IS_SUGGESTION_READ_EVENT_SENT:Ljava/lang/String;

.field private final KEY_IS_USER_ATTACHMENT_REJECTED:Ljava/lang/String;

.field private final KEY_IS_USER_ATTACHMENT_ZIPPED:Ljava/lang/String;

.field private final KEY_MESSAGE_SYNC_STATUS:Ljava/lang/String;

.field private final KEY_NEW_CONV_STARTED_CSAT:Ljava/lang/String;

.field private final KEY_OPTION_DATA:Ljava/lang/String;

.field private final KEY_OPTION_TITLE:Ljava/lang/String;

.field private final KEY_OPTION_TYPE:Ljava/lang/String;

.field private final KEY_ORIGINAL_MESSAGE_ID:Ljava/lang/String;

.field private final KEY_RATING_VALUE:Ljava/lang/String;

.field private final KEY_READ_AT:Ljava/lang/String;

.field private final KEY_REFERRED_MESSAGE_ID:Ljava/lang/String;

.field private final KEY_REFERRED_MESSAGE_TYPE:Ljava/lang/String;

.field private final KEY_SECURE_ATTACHMENT:Ljava/lang/String;

.field private final KEY_SEEN_AT_MESSAGE_CURSOR:Ljava/lang/String;

.field private final KEY_SEEN_SYNC_STATUS:Ljava/lang/String;

.field private final KEY_SELECTED_OPTION_DATA:Ljava/lang/String;

.field private final KEY_SHOW_NEW_CONV_BUTTON:Ljava/lang/String;

.field private final KEY_SIZE:Ljava/lang/String;

.field private final KEY_SMART_INTENT_IDs:Ljava/lang/String;

.field private final KEY_SMART_INTENT_LABELS:Ljava/lang/String;

.field private final KEY_SMART_INTENT_TREE_ID:Ljava/lang/String;

.field private final KEY_SMART_INTENT_USER_QUERY:Ljava/lang/String;

.field private final KEY_SUGGESTION_READ_FAQ_PUBLISH_ID:Ljava/lang/String;

.field private final KEY_THUMBNAIL_FILE_PATH:Ljava/lang/String;

.field private final KEY_THUMBNAIL_URL:Ljava/lang/String;

.field private final KEY_TIMEZONE_ID:Ljava/lang/String;

.field private final KEY_URL:Ljava/lang/String;

.field private final dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 169
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "csat_rating"

    .line 95
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_CSAT_RATING:Ljava/lang/String;

    const-string v0, "csat_state"

    .line 96
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_CSAT_STATE:Ljava/lang/String;

    const-string v0, "csat_feedback"

    .line 97
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_CSAT_FEEDBACK:Ljava/lang/String;

    const-string v0, "increment_message_count"

    .line 98
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_INCREMENT_MESSAGE_COUNT:Ljava/lang/String;

    const-string v0, "ended_delegate_sent"

    .line 99
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_CONVERSATION_ENDED_DELEGATE_SENT:Ljava/lang/String;

    const-string v0, "image_draft_orig_name"

    .line 100
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_IMAGE_ATTACHMENT_DRAFT_ORIGINAL_NAME:Ljava/lang/String;

    const-string v0, "image_draft_orig_size"

    .line 101
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_IMAGE_ATTACHMENT_DRAFT_ORIGINAL_SIZE:Ljava/lang/String;

    const-string v0, "image_draft_file_path"

    .line 102
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_IMAGE_ATTACHMENT_DRAFT_FILE_PATH:Ljava/lang/String;

    const-string v0, "image_copy_done"

    .line 103
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_IMAGE_ATTACHMENT_COMPRESSION_COPYING_DONE:Ljava/lang/String;

    const-string v0, "attachment_type"

    .line 104
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_IMAGE_ATTACHMENT_TYPE:Ljava/lang/String;

    const-string v0, "is_autofilled_preissue"

    .line 105
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_IS_AUTO_FILLED_PREISSUE:Ljava/lang/String;

    const-string v0, "smart_intent_ids"

    .line 106
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_SMART_INTENT_IDs:Ljava/lang/String;

    const-string v0, "smart_intent_tree_id"

    .line 107
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_SMART_INTENT_TREE_ID:Ljava/lang/String;

    const-string v0, "smart_intent_user_query"

    .line 108
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_SMART_INTENT_USER_QUERY:Ljava/lang/String;

    const-string v0, "referredMessageId"

    .line 111
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_REFERRED_MESSAGE_ID:Ljava/lang/String;

    const-string v0, "rejected_reason"

    .line 112
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_FOLLOW_UP_REJECTED_REASON:Ljava/lang/String;

    const-string v0, "rejected_conv_id"

    .line 113
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_FOLLOW_UP_REJECTED_OPEN_CONVERSATION:Ljava/lang/String;

    const-string v0, "is_answered"

    .line 114
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_IS_ANSWERED:Ljava/lang/String;

    const-string v0, "content_type"

    .line 115
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_CONTENT_TYPE:Ljava/lang/String;

    const-string v0, "file_name"

    .line 116
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_FILE_NAME:Ljava/lang/String;

    const-string v0, "url"

    .line 117
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_URL:Ljava/lang/String;

    const-string v0, "size"

    .line 118
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_SIZE:Ljava/lang/String;

    const-string v0, "thumbnail_url"

    .line 119
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_THUMBNAIL_URL:Ljava/lang/String;

    const-string v0, "thumbnailFilePath"

    .line 120
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_THUMBNAIL_FILE_PATH:Ljava/lang/String;

    const-string v0, "filePath"

    .line 121
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_FILE_PATH:Ljava/lang/String;

    const-string v0, "seen_cursor"

    .line 122
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_SEEN_AT_MESSAGE_CURSOR:Ljava/lang/String;

    const-string v0, "seen_sync_status"

    .line 123
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_SEEN_SYNC_STATUS:Ljava/lang/String;

    const-string v0, "read_at"

    .line 124
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_READ_AT:Ljava/lang/String;

    const-string v0, "input_keyboard"

    .line 125
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_INPUT_KEYBOARD:Ljava/lang/String;

    const-string v0, "input_required"

    .line 126
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_INPUT_REQUIRED:Ljava/lang/String;

    const-string v0, "input_skip_label"

    .line 127
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_INPUT_SKIP_LABEL:Ljava/lang/String;

    const-string v0, "input_placeholder"

    .line 129
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_INPUT_PLACEHOLDER:Ljava/lang/String;

    const-string v0, "input_label"

    .line 130
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_INPUT_LABEL:Ljava/lang/String;

    const-string v0, "input_options"

    .line 131
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_INPUT_OPTIONS:Ljava/lang/String;

    const-string v0, "option_type"

    .line 132
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_OPTION_TYPE:Ljava/lang/String;

    const-string v0, "option_title"

    .line 133
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_OPTION_TITLE:Ljava/lang/String;

    const-string v0, "option_data"

    .line 134
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_OPTION_DATA:Ljava/lang/String;

    const-string v0, "chatbot_info"

    .line 135
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_CHATBOT_INFO:Ljava/lang/String;

    const-string v0, "has_next_bot"

    .line 136
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_HAS_NEXT_BOT:Ljava/lang/String;

    const-string v0, "faqs"

    .line 137
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_FAQS:Ljava/lang/String;

    const-string v0, "faq_source"

    .line 138
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_FAQS_SOURCE:Ljava/lang/String;

    const-string v0, "faq_title"

    .line 139
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_FAQ_TITLE:Ljava/lang/String;

    const-string v0, "faq_publish_id"

    .line 140
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_FAQ_PUBLISH_ID:Ljava/lang/String;

    const-string v0, "faq_language"

    .line 141
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_FAQ_LANGUAGE:Ljava/lang/String;

    const-string v0, "is_response_skipped"

    .line 142
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_IS_RESPONSE_SKIPPED:Ljava/lang/String;

    const-string v0, "selected_option_data"

    .line 143
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_SELECTED_OPTION_DATA:Ljava/lang/String;

    const-string v0, "referred_message_type"

    .line 144
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_REFERRED_MESSAGE_TYPE:Ljava/lang/String;

    const-string v0, "bot_action_type"

    .line 145
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_BOT_ACTION_TYPE:Ljava/lang/String;

    const-string v0, "bot_ended_reason"

    .line 146
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_BOT_ENDED_REASON:Ljava/lang/String;

    const-string v0, "message_sync_status"

    .line 147
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_MESSAGE_SYNC_STATUS:Ljava/lang/String;

    const-string v0, "is_secure"

    .line 148
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_SECURE_ATTACHMENT:Ljava/lang/String;

    const-string v0, "is_user_attachment_zipped"

    .line 149
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_IS_USER_ATTACHMENT_ZIPPED:Ljava/lang/String;

    const-string v0, "is_user_attachment_rejected"

    .line 150
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_IS_USER_ATTACHMENT_REJECTED:Ljava/lang/String;

    const-string v0, "is_message_empty"

    .line 151
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_IS_MESSAGE_EMPTY:Ljava/lang/String;

    const-string v0, "is_suggestion_read_event_sent"

    .line 152
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_IS_SUGGESTION_READ_EVENT_SENT:Ljava/lang/String;

    const-string v0, "suggestion_read_faq_publish_id"

    .line 153
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_SUGGESTION_READ_FAQ_PUBLISH_ID:Ljava/lang/String;

    const-string v0, "dt"

    .line 154
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_DATE_TIME:Ljava/lang/String;

    const-string v0, "timezone_id"

    .line 155
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_TIMEZONE_ID:Ljava/lang/String;

    const-string v0, "attachment_count"

    .line 156
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_ATTACHMENT_COUNT:Ljava/lang/String;

    const-string v0, "original_message_server_id"

    .line 157
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_ORIGINAL_MESSAGE_ID:Ljava/lang/String;

    const-string v0, "intent_labels"

    .line 158
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_SMART_INTENT_LABELS:Ljava/lang/String;

    const-string v0, "is_feedback_message"

    .line 159
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_IS_FEED_BACK_MESSAGE:Ljava/lang/String;

    const-string v0, "input_send_feedback_label"

    .line 161
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_INPUT_SEND_FEEDBACK_LABEL:Ljava/lang/String;

    const-string v0, "input_start_conv_label"

    .line 162
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_INPUT_START_CONV_LABEL:Ljava/lang/String;

    const-string v0, "rating_value"

    .line 163
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_RATING_VALUE:Ljava/lang/String;

    const-string v0, "show_new_conv_button"

    .line 164
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_SHOW_NEW_CONV_BUTTON:Ljava/lang/String;

    const-string v0, "new_conv_started_csat"

    .line 165
    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->KEY_NEW_CONV_STARTED_CSAT:Ljava/lang/String;

    .line 170
    new-instance v0, Lcom/helpshift/db/conversation/ConversationDBHelper;

    new-instance v1, Lcom/helpshift/db/conversation/ConversationDatabaseContract;

    invoke-direct {v1}, Lcom/helpshift/db/conversation/ConversationDatabaseContract;-><init>()V

    invoke-direct {v0, p1, v1}, Lcom/helpshift/db/conversation/ConversationDBHelper;-><init>(Landroid/content/Context;Lcom/helpshift/db/conversation/ConversationDatabaseContract;)V

    iput-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    return-void
.end method

.method private actionCardToContentValues(Lcom/helpshift/conversation/activeconversation/model/ActionCard;Ljava/lang/String;)Landroid/content/ContentValues;
    .locals 2

    .line 569
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "message_id"

    .line 570
    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 571
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->title:Ljava/lang/String;

    const-string v1, "title"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 572
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->imageUrl:Ljava/lang/String;

    const-string v1, "image_url"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 573
    iget-boolean p2, p1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->isSecure:Z

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const-string v1, "is_image_secure"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 574
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->filePath:Ljava/lang/String;

    const-string p2, "file_path"

    invoke-virtual {v0, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private actionToContentValues(Lcom/helpshift/conversation/activeconversation/model/Action;J)Landroid/content/ContentValues;
    .locals 1

    .line 579
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 580
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    const-string p3, "action_card_id"

    invoke-virtual {v0, p3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 581
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Action;->actionSHA:Ljava/lang/String;

    const-string p3, "action_sha"

    invoke-virtual {v0, p3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 582
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Action;->actionTitle:Ljava/lang/String;

    const-string p3, "action_title"

    invoke-virtual {v0, p3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 583
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Action;->actionType:Lcom/helpshift/conversation/activeconversation/model/ActionType;

    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/model/ActionType;->getValue()Ljava/lang/String;

    move-result-object p2

    const-string p3, "action_type"

    invoke-virtual {v0, p3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 584
    new-instance p2, Lorg/json/JSONObject;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Action;->actionData:Ljava/util/Map;

    invoke-direct {p2, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "action_data"

    invoke-virtual {v0, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private buildJsonObjectForAttachmentMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2287
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->contentType:Ljava/lang/String;

    const-string v1, "content_type"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2288
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->fileName:Ljava/lang/String;

    const-string v1, "file_name"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2289
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->filePath:Ljava/lang/String;

    const-string v1, "filePath"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2290
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->attachmentUrl:Ljava/lang/String;

    const-string v1, "url"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2291
    iget v0, p2, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->size:I

    const-string v1, "size"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 2292
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->isSecureAttachment:Z

    const-string v1, "is_secure"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 2293
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->isZipped:Z

    const-string v1, "is_user_attachment_zipped"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 2294
    iget-boolean p2, p2, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->isRejected:Z

    const-string v0, "is_user_attachment_rejected"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForActionCardMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2331
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->originalMessageServerId:Ljava/lang/String;

    const-string v0, "original_message_server_id"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForAdminBotControlMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2124
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->actionType:Ljava/lang/String;

    const-string v1, "bot_action_type"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2125
    iget-boolean p2, p2, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->hasNextBot:Z

    const-string v0, "has_next_bot"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForAttachmentCount(Lorg/json/JSONObject;I)Lorg/json/JSONObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "attachment_count"

    .line 2249
    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    return-object p1
.end method

.method private buildMetaForAutoRetriableMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2320
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;->getSyncStatus()I

    move-result p2

    const-string v0, "message_sync_status"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForBotInfo(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "chatbot_info"

    .line 2196
    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForCSATInput(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2227
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->botInfo:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForBotInfo(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 2228
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->required:Z

    const-string v1, "input_required"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 2229
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->inputLabel:Ljava/lang/String;

    const-string v1, "input_label"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2230
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->skipLabel:Ljava/lang/String;

    const-string v1, "input_skip_label"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2231
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->sendFeedbackLabel:Ljava/lang/String;

    const-string v1, "input_send_feedback_label"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2232
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->startNewConversationLabel:Ljava/lang/String;

    const-string v1, "input_start_conv_label"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2233
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->showNewConversationButton:Z

    const-string v1, "show_new_conv_button"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 2234
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->ratings:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 2235
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 2236
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->ratings:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;

    .line 2237
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 2238
    iget-object v4, v2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->title:Ljava/lang/String;

    const-string v5, "option_title"

    invoke-virtual {v3, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2239
    iget v4, v2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->value:I

    const-string v5, "rating_value"

    invoke-virtual {v3, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 2240
    iget-object v2, v2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->jsonData:Ljava/lang/String;

    const-string v4, "option_data"

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2241
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    :cond_0
    const-string v1, "input_options"

    .line 2243
    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2245
    :cond_1
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->type:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;

    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "option_type"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForDateTime(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2189
    iget v0, p2, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;->keyboard:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 2190
    iget-wide v0, p2, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;->dateInMillis:J

    const-string v2, "dt"

    invoke-virtual {p1, v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 2191
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;->timeZoneId:Ljava/lang/String;

    const-string v0, "timezone_id"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    return-void
.end method

.method private buildMetaForFAQList(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2139
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;->faqs:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 2140
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 2141
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;->faqs:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;

    .line 2142
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 2143
    iget-object v3, v1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;->title:Ljava/lang/String;

    const-string v4, "faq_title"

    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2144
    iget-object v3, v1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;->publishId:Ljava/lang/String;

    const-string v4, "faq_publish_id"

    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2145
    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;->language:Ljava/lang/String;

    const-string v3, "faq_language"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2146
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    :cond_0
    const-string p2, "faqs"

    .line 2148
    invoke-virtual {p1, p2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    return-void
.end method

.method private buildMetaForFAQListSource(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2154
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;->source:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 2155
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;->source:Ljava/lang/String;

    const-string v0, "faq_source"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    return-void
.end method

.method private buildMetaForFeedbackMessageProperties(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2262
    iget-boolean p2, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isFeedbackMessage:Z

    const-string v0, "is_feedback_message"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForFollowUpRejected(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2273
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->referredMessageId:Ljava/lang/String;

    const-string v1, "referredMessageId"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2274
    iget v0, p2, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->reason:I

    const-string v1, "rejected_reason"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 2275
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->openConversationId:Ljava/lang/String;

    const-string v0, "rejected_conv_id"

    .line 2276
    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForImageAttachmentMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/ImageAttachmentMessageDM;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2311
    invoke-direct {p0, p1, p2}, Lcom/helpshift/common/conversation/ConversationDB;->buildJsonObjectForAttachmentMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;)V

    .line 2312
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/ImageAttachmentMessageDM;->thumbnailUrl:Ljava/lang/String;

    const-string v1, "thumbnail_url"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2313
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/ImageAttachmentMessageDM;->thumbnailFilePath:Ljava/lang/String;

    const-string v1, "thumbnailFilePath"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2314
    iget-boolean p2, p2, Lcom/helpshift/conversation/activeconversation/message/ImageAttachmentMessageDM;->isSecureAttachment:Z

    const-string v0, "is_secure"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForInput(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2209
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->botInfo:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForBotInfo(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 2210
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->required:Z

    const-string v1, "input_required"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 2211
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->inputLabel:Ljava/lang/String;

    const-string v1, "input_label"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2212
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->skipLabel:Ljava/lang/String;

    const-string v1, "input_skip_label"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2213
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->options:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 2214
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 2215
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->options:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;

    .line 2216
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 2217
    iget-object v4, v2, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;->title:Ljava/lang/String;

    const-string v5, "option_title"

    invoke-virtual {v3, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2218
    iget-object v2, v2, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;->jsonData:Ljava/lang/String;

    const-string v4, "option_data"

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2219
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    :cond_0
    const-string v1, "input_options"

    .line 2221
    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2223
    :cond_1
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->type:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "option_type"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForInput(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/input/TextInput;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2200
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->botInfo:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForBotInfo(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 2201
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->required:Z

    const-string v1, "input_required"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 2202
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->skipLabel:Ljava/lang/String;

    const-string v1, "input_skip_label"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2203
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->inputLabel:Ljava/lang/String;

    const-string v1, "input_label"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2204
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->placeholder:Ljava/lang/String;

    const-string v1, "input_placeholder"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2205
    iget p2, p2, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->keyboard:I

    invoke-direct {p0, p1, p2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForInputKeyboard(Lorg/json/JSONObject;I)V

    return-void
.end method

.method private buildMetaForInputKeyboard(Lorg/json/JSONObject;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "input_keyboard"

    .line 2184
    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForIntentLabels(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2108
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->intentLabels:Ljava/util/List;

    invoke-static {p2}, Lcom/helpshift/util/HSJSONUtils;->listToJsonArray(Ljava/util/List;)Lorg/json/JSONArray;

    move-result-object p2

    const-string v0, "intent_labels"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForIsAnswered(Lorg/json/JSONObject;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "is_answered"

    .line 2281
    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForIsMessageEmpty(Lorg/json/JSONObject;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "is_message_empty"

    .line 2119
    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForIsNewConvClickedCSAT(Lorg/json/JSONObject;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "new_conv_started_csat"

    .line 2180
    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForIsResponseSkipped(Lorg/json/JSONObject;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "is_response_skipped"

    .line 2175
    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForIsSuggestionsReadEvent(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2113
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;->isSuggestionsReadEventSent:Z

    const-string v1, "is_suggestion_read_event_sent"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 2114
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;->suggestionsReadFAQPublishId:Ljava/lang/String;

    const-string v0, "suggestion_read_faq_publish_id"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForMessageSeenData(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2255
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->seenAtMessageCursor:Ljava/lang/String;

    const-string v1, "seen_cursor"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2256
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isMessageSeenSynced:Z

    const-string v1, "seen_sync_status"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 2257
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->readAt:Ljava/lang/String;

    const-string v0, "read_at"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForMessageSyncState(Lorg/json/JSONObject;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "message_sync_status"

    .line 2325
    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForRatingValue(Lorg/json/JSONObject;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "rating_value"

    .line 2170
    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForReferredMessageId(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "referredMessageId"

    .line 2267
    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForReferredMessageType(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2161
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/MessageType;->getValue()Ljava/lang/String;

    move-result-object p2

    const-string v0, "referred_message_type"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForScreenshotAttachmentMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2300
    invoke-direct {p0, p1, p2}, Lcom/helpshift/common/conversation/ConversationDB;->buildJsonObjectForAttachmentMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;)V

    .line 2301
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->thumbnailUrl:Ljava/lang/String;

    const-string v1, "thumbnail_url"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2302
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->refersMessageId:Ljava/lang/String;

    const-string v1, "referredMessageId"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2303
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->isSecureAttachment:Z

    const-string v1, "is_secure"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 2304
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->isZipped:Z

    const-string v1, "is_user_attachment_zipped"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 2305
    iget-boolean p2, p2, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->isRejected:Z

    const-string v0, "is_user_attachment_rejected"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForSelectedOptionData(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "selected_option_data"

    .line 2166
    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void
.end method

.method private buildMetaForUserBotControlMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2130
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->actionType:Ljava/lang/String;

    const-string v1, "bot_action_type"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2131
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->botInfo:Ljava/lang/String;

    const-string v1, "chatbot_info"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2132
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->reason:Ljava/lang/String;

    const-string v1, "bot_ended_reason"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2134
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->refersMessageId:Ljava/lang/String;

    const-string v0, "referredMessageId"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void
.end method

.method private conversationInboxRecordToContentValues(Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;)Landroid/content/ContentValues;
    .locals 3

    .line 957
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 958
    iget-wide v1, p1, Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;->userLocalId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "user_local_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 959
    iget-object v1, p1, Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;->formName:Ljava/lang/String;

    const-string v2, "form_name"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 960
    iget-object v1, p1, Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;->formEmail:Ljava/lang/String;

    const-string v2, "form_email"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 961
    iget-object v1, p1, Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;->description:Ljava/lang/String;

    const-string v2, "description_draft"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 962
    iget-wide v1, p1, Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;->descriptionTimeStamp:J

    .line 964
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "description_draft_timestamp"

    .line 963
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 965
    iget v1, p1, Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;->descriptionType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "description_type"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 966
    iget-object v1, p1, Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;->archivalText:Ljava/lang/String;

    const-string v2, "archival_text"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 967
    iget-object v1, p1, Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;->replyText:Ljava/lang/String;

    const-string v2, "reply_text"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 968
    iget-boolean v1, p1, Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;->persistMessageBox:Z

    .line 969
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "persist_message_box"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 970
    iget-object v1, p1, Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;->lastSyncTimestamp:Ljava/lang/String;

    const-string v2, "since"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 972
    iget-object v1, p1, Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;->hasOlderMessages:Ljava/lang/Boolean;

    if-eqz v1, :cond_0

    .line 973
    iget-object v1, p1, Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;->hasOlderMessages:Ljava/lang/Boolean;

    .line 974
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "has_older_messages"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 976
    :cond_0
    iget-object v1, p1, Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;->lastConversationsRedactionTime:Ljava/lang/Long;

    const-string v2, "last_conv_redaction_time"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 980
    :try_start_0
    iget-object p1, p1, Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;->imageAttachmentDraft:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    invoke-direct {p0, p1}, Lcom/helpshift/common/conversation/ConversationDB;->getImageAttachmentDraftMeta(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "attachment_draft"

    .line 981
    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in generating meta string for image attachment"

    .line 984
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-object v0
.end method

.method private cursorToConversationInboxRecord(Landroid/database/Cursor;)Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;
    .locals 18

    move-object/from16 v0, p1

    const-string v1, "user_local_id"

    .line 913
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    const-string v1, "form_name"

    .line 915
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v1, "form_email"

    .line 917
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const-string v1, "description_draft"

    .line 919
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const-string v1, "description_draft_timestamp"

    .line 921
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    const-string v1, "attachment_draft"

    .line 923
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v15, p0

    .line 924
    invoke-direct {v15, v1}, Lcom/helpshift/common/conversation/ConversationDB;->parseAndGetImageAttachmentDraft(Ljava/lang/String;)Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    move-result-object v10

    const-string v1, "description_type"

    .line 926
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    const-string v1, "archival_text"

    .line 928
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    const-string v1, "reply_text"

    .line 930
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    const-string v1, "persist_message_box"

    .line 932
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    const/4 v14, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    const/4 v14, 0x0

    :goto_0
    const-string v1, "since"

    .line 935
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "has_older_messages"

    .line 937
    invoke-static {v0, v2}, Lcom/helpshift/util/DatabaseUtils;->parseBooleanColumnSafe(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v16

    .line 938
    const-class v2, Ljava/lang/Long;

    const-string v15, "last_conv_redaction_time"

    .line 939
    invoke-static {v0, v15, v2}, Lcom/helpshift/util/DatabaseUtils;->parseColumnSafe(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v17, v0

    check-cast v17, Ljava/lang/Long;

    .line 941
    new-instance v0, Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;

    move-object v2, v0

    move-object v15, v1

    invoke-direct/range {v2 .. v17}, Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/dto/AttachmentPickerFile;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/Boolean;Ljava/lang/Long;)V

    return-object v0
.end method

.method private cursorToFaq(Landroid/database/Cursor;)Lcom/helpshift/support/Faq;
    .locals 14

    .line 2414
    new-instance v13, Lcom/helpshift/support/Faq;

    const-string v0, "_id"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    const-string v0, "question_id"

    .line 2415
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v0, "publish_id"

    .line 2416
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string v0, "language"

    .line 2417
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v0, "section_id"

    .line 2418
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const-string v0, "title"

    .line 2419
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const-string v0, "body"

    .line 2420
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string v0, "helpful"

    .line 2421
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    const-string v0, "rtl"

    .line 2422
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    const/4 v10, 0x1

    if-ne v0, v10, :cond_0

    goto :goto_0

    :cond_0
    const/4 v10, 0x0

    :goto_0
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    const-string v0, "tags"

    .line 2424
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2423
    invoke-static {v0}, Lcom/helpshift/util/HSJSONUtils;->jsonArrayToStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v11

    const-string v0, "c_tags"

    .line 2428
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 2426
    invoke-static {p1}, Lcom/helpshift/util/HSJSONUtils;->jsonArrayToStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v12

    move-object v0, v13

    invoke-direct/range {v0 .. v12}, Lcom/helpshift/support/Faq;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Boolean;Ljava/util/List;Ljava/util/List;)V

    return-object v13
.end method

.method private cursorToMessageDM(Landroid/database/Cursor;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 33

    move-object/from16 v6, p0

    move-object/from16 v0, p1

    const-string v1, "_id"

    .line 1254
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    const-string v1, "conversation_id"

    .line 1255
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    const-string v1, "server_id"

    .line 1256
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    const-string v1, "body"

    .line 1257
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    const-string v1, "meta"

    .line 1258
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "type"

    .line 1259
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "created_at"

    .line 1260
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v17

    const-string v3, "author_name"

    .line 1261
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "author_role"

    .line 1262
    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "author_id"

    .line 1263
    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v11, "local_avatar_image_path"

    .line 1265
    invoke-interface {v0, v11}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v11

    invoke-interface {v0, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    const-string v13, "epoch_time_created_at"

    .line 1268
    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    .line 1269
    invoke-interface {v0, v13}, Landroid/database/Cursor;->isNull(I)Z

    move-result v15

    const-wide/16 v18, 0x0

    if-eqz v15, :cond_0

    move-wide/from16 v15, v18

    goto :goto_0

    .line 1270
    :cond_0
    invoke-interface {v0, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v15

    :goto_0
    cmp-long v13, v15, v18

    if-gtz v13, :cond_1

    .line 1271
    invoke-static/range {v17 .. v17}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v15

    :cond_1
    move-wide/from16 v18, v15

    const-string v13, "md_state"

    .line 1273
    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    const/4 v13, 0x0

    move/from16 v16, v15

    const-string v15, "is_redacted"

    .line 1274
    invoke-static {v0, v15, v13}, Lcom/helpshift/util/DatabaseUtils;->parseBooleanColumnSafe(Landroid/database/Cursor;Ljava/lang/String;Z)Z

    move-result v15

    .line 1275
    invoke-static {v2}, Lcom/helpshift/conversation/activeconversation/message/MessageType;->fromValue(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/MessageType;

    move-result-object v0

    .line 1277
    invoke-direct {v6, v1}, Lcom/helpshift/common/conversation/ConversationDB;->jsonify(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    .line 1278
    sget-object v1, Lcom/helpshift/common/conversation/ConversationDB$1;->$SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType:[I

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ordinal()I

    move-result v0

    aget v0, v1, v0

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    return-object v1

    .line 1598
    :pswitch_0
    invoke-direct {v6, v12}, Lcom/helpshift/common/conversation/ConversationDB;->readActionCard(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    move-result-object v20

    if-nez v20, :cond_2

    return-object v1

    :cond_2
    const-string v0, "original_message_server_id"

    const-string v1, ""

    .line 1602
    invoke-direct {v6, v13, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getStringFromJson(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 1603
    new-instance v22, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move/from16 v5, v23

    .line 1604
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    move-object/from16 v11, v22

    move-object v2, v13

    move-object v13, v14

    move-object/from16 v14, v17

    move v3, v15

    move/from16 v1, v16

    move-wide/from16 v15, v18

    move-object/from16 v17, v0

    move-object/from16 v18, v21

    move-object/from16 v19, v20

    invoke-direct/range {v11 .. v19}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/model/ActionCard;)V

    move/from16 v27, v1

    move/from16 v30, v3

    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object/from16 v7, v22

    move-object v9, v2

    goto/16 :goto_5

    :pswitch_1
    move-object v2, v13

    move/from16 v1, v16

    .line 1583
    invoke-direct {v6, v2}, Lcom/helpshift/common/conversation/ConversationDB;->parseBotActionTypeFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v20

    .line 1584
    invoke-direct {v6, v2}, Lcom/helpshift/common/conversation/ConversationDB;->parseBotInfoFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v21

    .line 1585
    invoke-direct {v6, v2}, Lcom/helpshift/common/conversation/ConversationDB;->parseBotEndedReasonFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v22

    .line 1586
    invoke-direct {v6, v2}, Lcom/helpshift/common/conversation/ConversationDB;->parseReferredMessageIdFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v23

    .line 1587
    invoke-direct {v6, v12, v2}, Lcom/helpshift/common/conversation/ConversationDB;->parseAndGetMessageSyncState(Ljava/lang/String;Lorg/json/JSONObject;)I

    move-result v24

    .line 1589
    new-instance v13, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;

    const/16 v16, 0x1

    move-object/from16 v0, p0

    move/from16 v27, v1

    move-object v1, v3

    move-object v3, v2

    move-object v2, v5

    move-object v5, v3

    move-object v3, v4

    move-object v4, v11

    move-object v11, v5

    move/from16 v5, v16

    .line 1591
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    move-object v1, v13

    move v2, v15

    move-object/from16 v15, v17

    move-wide/from16 v16, v18

    move-object/from16 v18, v0

    move-object/from16 v19, v20

    move-object/from16 v20, v22

    move-object/from16 v22, v23

    move/from16 v23, v24

    invoke-direct/range {v13 .. v23}, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 1594
    iput-object v12, v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    move/from16 v30, v2

    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v11

    goto/16 :goto_2

    :pswitch_2
    move v2, v15

    move/from16 v27, v16

    move-object v15, v13

    .line 1572
    invoke-direct {v6, v15}, Lcom/helpshift/common/conversation/ConversationDB;->parseBotActionTypeFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v20

    .line 1573
    invoke-direct {v6, v15}, Lcom/helpshift/common/conversation/ConversationDB;->parseBotInfoFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v21

    .line 1574
    invoke-direct {v6, v15}, Lcom/helpshift/common/conversation/ConversationDB;->parseHasNextBotFromMeta(Lorg/json/JSONObject;)Ljava/lang/Boolean;

    move-result-object v22

    .line 1575
    new-instance v13, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;

    const/16 v16, 0x0

    move-object/from16 v0, p0

    move-object v1, v3

    move v3, v2

    move-object v2, v5

    move v5, v3

    move-object v3, v4

    move-object v4, v11

    move v11, v5

    move/from16 v5, v16

    .line 1577
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    move v2, v11

    move-object v11, v13

    move-object v1, v13

    move-object v13, v14

    move-object/from16 v14, v17

    move-object v3, v15

    move-wide/from16 v15, v18

    move-object/from16 v17, v0

    move-object/from16 v18, v20

    move-object/from16 v19, v21

    invoke-direct/range {v11 .. v19}, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;)V

    .line 1579
    invoke-virtual/range {v22 .. v22}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, v1, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->hasNextBot:Z

    goto :goto_1

    :pswitch_3
    move v2, v15

    move/from16 v27, v16

    move-object v15, v13

    .line 1562
    new-instance v13, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    const/16 v16, 0x0

    move-object/from16 v0, p0

    move-object v1, v3

    move v3, v2

    move-object v2, v5

    move v5, v3

    move-object v3, v4

    move-object v4, v11

    move v11, v5

    move/from16 v5, v16

    .line 1567
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    move v2, v11

    move-object v11, v13

    move-object v1, v13

    move-object v13, v14

    move-object/from16 v14, v17

    move-object v3, v15

    move-wide/from16 v15, v18

    move-object/from16 v17, v0

    invoke-direct/range {v11 .. v17}, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;)V

    .line 1568
    invoke-direct {v6, v3}, Lcom/helpshift/common/conversation/ConversationDB;->parseIsAnsweredFromMeta(Lorg/json/JSONObject;)Z

    move-result v0

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->setAnswered(Z)V

    :goto_1
    move/from16 v30, v2

    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v7, v1

    move-object v9, v3

    goto/16 :goto_5

    :pswitch_4
    move v2, v15

    move/from16 v27, v16

    move-object v15, v13

    .line 1543
    invoke-direct {v6, v15}, Lcom/helpshift/common/conversation/ConversationDB;->parseImageAttachmentInfoFromMeta(Lorg/json/JSONObject;)Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;

    move-result-object v13

    .line 1544
    new-instance v1, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;

    const/16 v16, 0x0

    move-object/from16 v0, p0

    move-object/from16 p1, v1

    move-object v1, v3

    move v3, v2

    move-object v2, v5

    move v5, v3

    move-object v3, v4

    move-object v4, v11

    move v11, v5

    move/from16 v5, v16

    .line 1549
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    iget-object v1, v13, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;->url:Ljava/lang/String;

    iget-object v2, v13, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;->fileName:Ljava/lang/String;

    iget-object v3, v13, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;->thumbnailUrl:Ljava/lang/String;

    iget-object v4, v13, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;->contentType:Ljava/lang/String;

    iget-boolean v5, v13, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;->isSecure:Z

    move-wide/from16 v28, v7

    iget v7, v13, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;->size:I

    move v8, v11

    move-object/from16 v11, p1

    move/from16 v30, v8

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v14, v17

    move-wide/from16 v31, v9

    move-object v9, v15

    move-wide/from16 v15, v18

    move-object/from16 v17, v0

    move-object/from16 v18, v1

    move-object/from16 v19, v2

    move-object/from16 v20, v3

    move-object/from16 v21, v4

    move/from16 v22, v5

    move/from16 v23, v7

    invoke-direct/range {v11 .. v23}, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V

    .line 1556
    iget-object v0, v8, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;->filePath:Ljava/lang/String;

    move-object/from16 v1, p1

    iput-object v0, v1, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;->filePath:Ljava/lang/String;

    .line 1557
    iget-object v0, v8, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;->thumbnailFilePath:Ljava/lang/String;

    iput-object v0, v1, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;->thumbnailFilePath:Ljava/lang/String;

    .line 1558
    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;->updateState()V

    :goto_2
    move-object v7, v1

    goto/16 :goto_5

    :pswitch_5
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1524
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseAttachmentInfoFromMeta(Lorg/json/JSONObject;)Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;

    move-result-object v7

    .line 1525
    new-instance v8, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;

    const/4 v10, 0x0

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v10

    .line 1529
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    iget v1, v7, Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;->size:I

    iget-object v2, v7, Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;->contentType:Ljava/lang/String;

    iget-object v3, v7, Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;->url:Ljava/lang/String;

    iget-object v4, v7, Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;->fileName:Ljava/lang/String;

    iget-boolean v5, v7, Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;->isSecure:Z

    move-object v11, v8

    move-object v13, v14

    move-object/from16 v14, v17

    move-wide/from16 v15, v18

    move-object/from16 v17, v0

    move/from16 v18, v1

    move-object/from16 v19, v2

    move-object/from16 v20, v3

    move-object/from16 v21, v4

    move/from16 v22, v5

    invoke-direct/range {v11 .. v22}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 1538
    iget-object v0, v7, Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;->filePath:Ljava/lang/String;

    iput-object v0, v8, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->filePath:Ljava/lang/String;

    .line 1539
    invoke-virtual {v8}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->updateState()V

    goto/16 :goto_3

    :pswitch_6
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1515
    new-instance v22, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v7

    .line 1519
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    .line 1521
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseIsAnsweredFromMeta(Lorg/json/JSONObject;)Z

    move-result v1

    move-object/from16 v11, v22

    move-object v13, v14

    move-object/from16 v14, v17

    move-wide/from16 v15, v18

    move-object/from16 v17, v0

    move/from16 v18, v1

    invoke-direct/range {v11 .. v18}, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Z)V

    goto/16 :goto_4

    :pswitch_7
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1495
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseAttachmentInfoFromMeta(Lorg/json/JSONObject;)Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;

    move-result-object v7

    .line 1496
    new-instance v8, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    const/4 v10, 0x1

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v10

    .line 1499
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    iget v1, v7, Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;->size:I

    iget-object v2, v7, Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;->contentType:Ljava/lang/String;

    iget-object v3, v7, Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;->url:Ljava/lang/String;

    iget-object v4, v7, Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;->fileName:Ljava/lang/String;

    iget-boolean v5, v7, Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;->isSecure:Z

    move-object v13, v8

    move-object/from16 v15, v17

    move-wide/from16 v16, v18

    move-object/from16 v18, v0

    move/from16 v19, v1

    move-object/from16 v20, v2

    move-object/from16 v21, v3

    move-object/from16 v22, v4

    move/from16 v23, v5

    invoke-direct/range {v13 .. v23}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 1508
    iget-object v0, v7, Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;->filePath:Ljava/lang/String;

    iput-object v0, v8, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->filePath:Ljava/lang/String;

    .line 1509
    iput-object v12, v8, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->serverId:Ljava/lang/String;

    .line 1510
    iget-boolean v0, v7, Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;->isZipped:Z

    iput-boolean v0, v8, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->isZipped:Z

    .line 1511
    iget-boolean v0, v7, Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;->isRejected:Z

    iput-boolean v0, v8, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->isRejected:Z

    goto :goto_3

    :pswitch_8
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1475
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseImageAttachmentInfoFromMeta(Lorg/json/JSONObject;)Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;

    move-result-object v7

    .line 1476
    new-instance v8, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    const/4 v10, 0x1

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v10

    .line 1479
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    iget-object v1, v7, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;->contentType:Ljava/lang/String;

    iget-object v2, v7, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;->thumbnailUrl:Ljava/lang/String;

    iget-object v3, v7, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;->fileName:Ljava/lang/String;

    iget-object v4, v7, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;->url:Ljava/lang/String;

    iget v5, v7, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;->size:I

    iget-boolean v10, v7, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;->isSecure:Z

    move-object v13, v8

    move-object/from16 v15, v17

    move-wide/from16 v16, v18

    move-object/from16 v18, v0

    move-object/from16 v19, v1

    move-object/from16 v20, v2

    move-object/from16 v21, v3

    move-object/from16 v22, v4

    move/from16 v23, v5

    move/from16 v24, v10

    invoke-direct/range {v13 .. v24}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 1487
    iget-object v0, v7, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;->filePath:Ljava/lang/String;

    iput-object v0, v8, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->filePath:Ljava/lang/String;

    .line 1488
    iput-object v12, v8, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->serverId:Ljava/lang/String;

    .line 1489
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseReferredMessageIdFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->setRefersMessageId(Ljava/lang/String;)V

    .line 1490
    iget-boolean v0, v7, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;->isZipped:Z

    iput-boolean v0, v8, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->isZipped:Z

    .line 1491
    iget-boolean v0, v7, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;->isRejected:Z

    iput-boolean v0, v8, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->isRejected:Z

    :goto_3
    move-object v7, v8

    goto/16 :goto_5

    :pswitch_9
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1465
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v8

    .line 1468
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    .line 1470
    invoke-direct {v6, v12, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseAndGetMessageSyncState(Ljava/lang/String;Lorg/json/JSONObject;)I

    move-result v1

    move-object v13, v7

    move-object/from16 v15, v17

    move-wide/from16 v16, v18

    move-object/from16 v18, v0

    move/from16 v19, v1

    invoke-direct/range {v13 .. v19}, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;I)V

    .line 1472
    iput-object v12, v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    goto/16 :goto_5

    :pswitch_a
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1454
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;

    const/4 v8, 0x1

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v8

    .line 1457
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    .line 1459
    invoke-direct {v6, v12, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseAndGetMessageSyncState(Ljava/lang/String;Lorg/json/JSONObject;)I

    move-result v1

    move-object v13, v7

    move-object/from16 v15, v17

    move-wide/from16 v16, v18

    move-object/from16 v18, v0

    move/from16 v19, v1

    invoke-direct/range {v13 .. v19}, Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;I)V

    .line 1461
    iput-object v12, v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    goto/16 :goto_5

    :pswitch_b
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1444
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;

    const/4 v8, 0x1

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v8

    .line 1447
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    .line 1448
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseReferredMessageIdFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    .line 1449
    invoke-direct {v6, v12, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseAndGetMessageSyncState(Ljava/lang/String;Lorg/json/JSONObject;)I

    move-result v20

    move-object v13, v7

    move-object/from16 v15, v17

    move-wide/from16 v16, v18

    move-object/from16 v18, v0

    move-object/from16 v19, v1

    invoke-direct/range {v13 .. v20}, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;I)V

    .line 1450
    iput-object v12, v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    .line 1451
    move-object v0, v7

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;

    invoke-direct {v6, v0, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseAndSetFollowUpRejectedDataFromMeta(Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;Lorg/json/JSONObject;)V

    goto/16 :goto_5

    :pswitch_c
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1435
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;

    const/4 v8, 0x1

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v8

    .line 1438
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    .line 1439
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseReferredMessageIdFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    .line 1440
    invoke-direct {v6, v12, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseAndGetMessageSyncState(Ljava/lang/String;Lorg/json/JSONObject;)I

    move-result v20

    move-object v13, v7

    move-object/from16 v15, v17

    move-wide/from16 v16, v18

    move-object/from16 v18, v0

    move-object/from16 v19, v1

    invoke-direct/range {v13 .. v20}, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;I)V

    .line 1441
    iput-object v12, v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    goto/16 :goto_5

    :pswitch_d
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1426
    new-instance v22, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v7

    .line 1430
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    .line 1432
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseIsAnsweredFromMeta(Lorg/json/JSONObject;)Z

    move-result v1

    move-object/from16 v11, v22

    move-object v13, v14

    move-object/from16 v14, v17

    move-wide/from16 v15, v18

    move-object/from16 v17, v0

    move/from16 v18, v1

    invoke-direct/range {v11 .. v18}, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Z)V

    goto/16 :goto_4

    :pswitch_e
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1416
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;

    const/4 v8, 0x1

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v8

    .line 1419
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    .line 1421
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseReferredMessageIdFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    .line 1422
    invoke-direct {v6, v12, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseAndGetMessageSyncState(Ljava/lang/String;Lorg/json/JSONObject;)I

    move-result v20

    move-object v13, v7

    move-object/from16 v15, v17

    move-wide/from16 v16, v18

    move-object/from16 v18, v0

    move-object/from16 v19, v1

    invoke-direct/range {v13 .. v20}, Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;I)V

    .line 1423
    iput-object v12, v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    goto/16 :goto_5

    :pswitch_f
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1402
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v8

    .line 1404
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    .line 1405
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseFAQListFromMeta(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v1

    .line 1406
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseFAQListSourceFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v2

    .line 1407
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseBotInfoFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v20

    .line 1408
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputRequiredFromMeta(Lorg/json/JSONObject;)Z

    move-result v21

    .line 1409
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputLabelFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v22

    .line 1410
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputSkipLabelFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v23

    .line 1411
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputOptionsFromMeta(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v24

    .line 1412
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseIsSuggestionsReadEventSent(Lorg/json/JSONObject;)Z

    move-result v25

    .line 1413
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseSuggestionReadFAQPublishId(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v26

    move-object v11, v7

    move-object v13, v14

    move-object/from16 v14, v17

    move-wide/from16 v15, v18

    move-object/from16 v17, v0

    move-object/from16 v18, v1

    move-object/from16 v19, v2

    invoke-direct/range {v11 .. v26}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/util/List;ZLjava/lang/String;)V

    goto/16 :goto_5

    :pswitch_10
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1394
    new-instance v22, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v7

    .line 1395
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    .line 1396
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseFAQListFromMeta(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v1

    .line 1397
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseFAQListSourceFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v2

    .line 1398
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseIsSuggestionsReadEventSent(Lorg/json/JSONObject;)Z

    move-result v20

    .line 1399
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseSuggestionReadFAQPublishId(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v11, v22

    move-object v13, v14

    move-object/from16 v14, v17

    move-wide/from16 v15, v18

    move-object/from16 v17, v0

    move-object/from16 v18, v1

    move-object/from16 v19, v2

    invoke-direct/range {v11 .. v21}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/util/List;Ljava/lang/String;ZLjava/lang/String;)V

    goto/16 :goto_4

    :pswitch_11
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1376
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseCSATInputRatingsFromMeta(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v25

    .line 1377
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v8

    .line 1380
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    .line 1381
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseBotInfoFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    .line 1382
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputRequiredFromMeta(Lorg/json/JSONObject;)Z

    move-result v2

    .line 1383
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputLabelFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v20

    .line 1384
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputSkipLabelFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v21

    .line 1385
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseSendFeedbackLabelFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v22

    .line 1386
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseShowConvButtonFromMeta(Lorg/json/JSONObject;)Z

    move-result v23

    .line 1387
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseStartNewConversationLabelFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v24

    .line 1389
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseCSATRatingInputTypeFromMeta(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;

    move-result-object v26

    move-object v11, v7

    move-object v13, v14

    move-object/from16 v14, v17

    move-wide/from16 v15, v18

    move-object/from16 v17, v0

    move-object/from16 v18, v1

    move/from16 v19, v2

    invoke-direct/range {v11 .. v26}, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/util/List;Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;)V

    goto/16 :goto_5

    :pswitch_12
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1361
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputOptionsFromMeta(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v22

    .line 1362
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v8

    .line 1365
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    .line 1366
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseBotInfoFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    .line 1367
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputRequiredFromMeta(Lorg/json/JSONObject;)Z

    move-result v2

    .line 1368
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputLabelFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v20

    .line 1369
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputSkipLabelFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v21

    .line 1371
    invoke-interface/range {v22 .. v22}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v6, v9, v3}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputOptionTypeFromMeta(Lorg/json/JSONObject;I)Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    move-result-object v23

    move-object v11, v7

    move-object v13, v14

    move-object/from16 v14, v17

    move-wide/from16 v15, v18

    move-object/from16 v17, v0

    move-object/from16 v18, v1

    move/from16 v19, v2

    invoke-direct/range {v11 .. v23}, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;)V

    .line 1372
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseAttachmentCountFromMeta(Lorg/json/JSONObject;)I

    move-result v0

    iput v0, v7, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;->attachmentCount:I

    goto/16 :goto_5

    :pswitch_13
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1346
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputOptionsFromMeta(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v22

    .line 1347
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v8

    .line 1350
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    .line 1351
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseBotInfoFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    .line 1352
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputRequiredFromMeta(Lorg/json/JSONObject;)Z

    move-result v2

    .line 1353
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputLabelFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v20

    .line 1354
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputSkipLabelFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v21

    .line 1356
    invoke-interface/range {v22 .. v22}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v6, v9, v3}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputOptionTypeFromMeta(Lorg/json/JSONObject;I)Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    move-result-object v23

    move-object v11, v7

    move-object v13, v14

    move-object/from16 v14, v17

    move-wide/from16 v15, v18

    move-object/from16 v17, v0

    move-object/from16 v18, v1

    move/from16 v19, v2

    invoke-direct/range {v11 .. v23}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;)V

    .line 1357
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseAttachmentCountFromMeta(Lorg/json/JSONObject;)I

    move-result v0

    iput v0, v7, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;->attachmentCount:I

    goto/16 :goto_5

    :pswitch_14
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1334
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v8

    .line 1335
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    .line 1337
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseBotInfoFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    .line 1338
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputPlaceholderFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v2

    .line 1339
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputRequiredFromMeta(Lorg/json/JSONObject;)Z

    move-result v20

    .line 1340
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputLabelFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v21

    .line 1341
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputSkipLabelFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v22

    .line 1342
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputKeyboardFromMeta(Lorg/json/JSONObject;)I

    move-result v23

    .line 1343
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseIsMessageEmptyFromMeta(Lorg/json/JSONObject;)Z

    move-result v24

    move-object v11, v7

    move-object v13, v14

    move-object/from16 v14, v17

    move-wide/from16 v15, v18

    move-object/from16 v17, v0

    move-object/from16 v18, v1

    move-object/from16 v19, v2

    invoke-direct/range {v11 .. v24}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;IZ)V

    goto/16 :goto_5

    :pswitch_15
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1330
    new-instance v22, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v7

    .line 1331
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    move-object/from16 v11, v22

    move-object v13, v14

    move-object/from16 v14, v17

    move-wide/from16 v15, v18

    move-object/from16 v17, v0

    invoke-direct/range {v11 .. v17}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;)V

    :goto_4
    move-object/from16 v7, v22

    goto/16 :goto_5

    :pswitch_16
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1323
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;

    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseIntentLabelFromMeta(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v16

    const/4 v8, 0x1

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v8

    .line 1325
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v20

    move-object v15, v7

    invoke-direct/range {v15 .. v20}, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;-><init>(Ljava/util/List;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;)V

    .line 1326
    iput-object v14, v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->body:Ljava/lang/String;

    .line 1327
    iput-object v12, v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    goto/16 :goto_5

    :pswitch_17
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1311
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    const/4 v8, 0x1

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v8

    .line 1313
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    .line 1314
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseRatingValueFromMeta(Lorg/json/JSONObject;)I

    move-result v1

    .line 1315
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseIsNewConvClickCSATFromMeta(Lorg/json/JSONObject;)Z

    move-result v20

    .line 1316
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseBotInfoFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v21

    .line 1317
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseSelectedOptionDataFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v22

    .line 1318
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseReferredMessageIdFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v23

    .line 1319
    invoke-direct {v6, v12, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseAndGetMessageSyncState(Ljava/lang/String;Lorg/json/JSONObject;)I

    move-result v24

    move-object v13, v7

    move-object/from16 v15, v17

    move-wide/from16 v16, v18

    move-object/from16 v18, v0

    move/from16 v19, v1

    invoke-direct/range {v13 .. v24}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;IZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 1320
    iput-object v12, v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    goto/16 :goto_5

    :pswitch_18
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1300
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;

    const/4 v8, 0x1

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v8

    .line 1302
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    .line 1303
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseBotInfoFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    .line 1304
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseIsResponseSkippedFromMeta(Lorg/json/JSONObject;)Z

    move-result v20

    .line 1305
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseSelectedOptionDataFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v21

    .line 1306
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseReferredMessageIdFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v22

    .line 1307
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseReferredMessageTypeFromMeta(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/MessageType;

    move-result-object v23

    move-object v13, v7

    move-object/from16 v15, v17

    move-wide/from16 v16, v18

    move-object/from16 v18, v0

    move-object/from16 v19, v1

    invoke-direct/range {v13 .. v23}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 1308
    iput-object v12, v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    goto/16 :goto_5

    :pswitch_19
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1285
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;

    const/4 v8, 0x1

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v8

    .line 1287
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    .line 1288
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseInputKeyboardFromMeta(Lorg/json/JSONObject;)I

    move-result v1

    .line 1289
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseBotInfoFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v20

    .line 1290
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseIsResponseSkippedFromMeta(Lorg/json/JSONObject;)Z

    move-result v21

    .line 1291
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseReferredMessageIdFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v22

    .line 1292
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseIsMessageEmptyFromMeta(Lorg/json/JSONObject;)Z

    move-result v23

    move-object v13, v7

    move-object/from16 v15, v17

    move-wide/from16 v16, v18

    move-object/from16 v18, v0

    move/from16 v19, v1

    invoke-direct/range {v13 .. v23}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ILjava/lang/String;ZLjava/lang/String;Z)V

    .line 1294
    iput-object v12, v7, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;->serverId:Ljava/lang/String;

    .line 1295
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseDateTimeFromMeta(Lorg/json/JSONObject;)J

    move-result-wide v0

    iput-wide v0, v7, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;->dateInMillis:J

    .line 1296
    invoke-direct {v6, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseTimeZoneIdFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v7, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;->timeZoneId:Ljava/lang/String;

    goto :goto_5

    :pswitch_1a
    move-wide/from16 v28, v7

    move-wide/from16 v31, v9

    move-object v9, v13

    move/from16 v30, v15

    move/from16 v27, v16

    .line 1280
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    const/4 v8, 0x1

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v5

    move-object v3, v4

    move-object v4, v11

    move v5, v8

    .line 1281
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/conversation/ConversationDB;->getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    move-object v13, v7

    move-object/from16 v15, v17

    move-wide/from16 v16, v18

    move-object/from16 v18, v0

    invoke-direct/range {v13 .. v18}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;)V

    .line 1282
    iput-object v12, v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    .line 1614
    :goto_5
    invoke-static/range {v31 .. v32}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 1615
    invoke-static/range {v28 .. v29}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    move/from16 v0, v27

    .line 1616
    iput v0, v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->deliveryState:I

    move/from16 v0, v30

    .line 1617
    iput-boolean v0, v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isRedacted:Z

    .line 1618
    invoke-direct {v6, v7, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseAndSetMessageSeenData(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V

    .line 1619
    invoke-direct {v6, v7, v9}, Lcom/helpshift/common/conversation/ConversationDB;->parseFeedbackMessageData(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V

    return-object v7

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
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

.method private cursorToReadableConversation(Landroid/database/Cursor;)Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 34

    move-object/from16 v0, p1

    const-string v1, "_id"

    .line 1075
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "user_local_id"

    .line 1077
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    const-string v4, "server_id"

    .line 1078
    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "publish_id"

    .line 1080
    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    const-string v5, "uuid"

    .line 1082
    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "title"

    .line 1083
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const-string v6, "message_cursor"

    .line 1085
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    const-string v6, "start_new_conversation_action"

    .line 1087
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-ne v6, v9, :cond_0

    const/4 v15, 0x1

    goto :goto_0

    :cond_0
    const/4 v15, 0x0

    :goto_0
    const-string v6, "meta"

    .line 1090
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    const-string v6, "created_at"

    .line 1092
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    const-string v6, "epoch_time_created_at"

    .line 1094
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v16

    const-string v6, "updated_at"

    .line 1096
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    const-string v6, "pre_conv_server_id"

    .line 1099
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    const-string v6, "last_user_activity_time"

    .line 1101
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    move-object/from16 v20, v10

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    const-string v6, "issue_type"

    .line 1103
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v21

    const-string v6, "full_privacy_enabled"

    .line 1105
    invoke-static {v0, v6, v8}, Lcom/helpshift/util/DatabaseUtils;->parseBooleanColumnSafe(Landroid/database/Cursor;Ljava/lang/String;Z)Z

    move-result v6

    const-string v8, "state"

    .line 1107
    invoke-interface {v0, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    .line 1108
    invoke-static {v8}, Lcom/helpshift/conversation/dto/IssueState;->fromInt(I)Lcom/helpshift/conversation/dto/IssueState;

    move-result-object v8

    move/from16 v22, v6

    const-string v6, "is_redacted"

    move-object/from16 v23, v8

    const/4 v8, 0x0

    .line 1110
    invoke-static {v0, v6, v8}, Lcom/helpshift/util/DatabaseUtils;->parseBooleanColumnSafe(Landroid/database/Cursor;Ljava/lang/String;Z)Z

    move-result v6

    const-string v8, "acid"

    .line 1111
    invoke-interface {v0, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    move/from16 v24, v6

    .line 1114
    const-class v6, Ljava/lang/Long;

    move-object/from16 v25, v8

    const-string v8, "resolution_expiry_at"

    .line 1115
    invoke-static {v0, v8, v6}, Lcom/helpshift/util/DatabaseUtils;->parseColumnSafe(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    move-object v8, v6

    check-cast v8, Ljava/lang/Long;

    .line 1117
    const-class v6, Ljava/lang/Long;

    move-object/from16 v26, v8

    const-string v8, "csat_expiry_at"

    .line 1118
    invoke-static {v0, v8, v6}, Lcom/helpshift/util/DatabaseUtils;->parseColumnSafe(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    move-object v8, v6

    check-cast v8, Ljava/lang/Long;

    const-string v6, "feedback_bots_enabled"

    .line 1120
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    move-object/from16 v27, v8

    const/4 v8, 0x1

    if-ne v6, v8, :cond_1

    const/4 v6, 0x1

    goto :goto_1

    :cond_1
    const/4 v6, 0x0

    :goto_1
    const-string v8, "can_start_new_conversation"

    .line 1123
    invoke-interface {v0, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    const/4 v8, 0x1

    if-ne v0, v8, :cond_2

    const/4 v0, 0x1

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    .line 1126
    :goto_2
    new-instance v8, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move/from16 v19, v0

    move/from16 v29, v6

    move/from16 v0, v22

    move/from16 v28, v24

    move-object v6, v8

    move-object v0, v8

    move-object/from16 p1, v23

    move-object/from16 v30, v26

    move-object/from16 v31, v27

    move-object/from16 v8, p1

    move-wide/from16 v32, v9

    move-object/from16 v9, v20

    move-wide/from16 v23, v2

    move-object v2, v11

    move-wide/from16 v10, v16

    move-object v3, v12

    move-object/from16 v12, v18

    move-object/from16 v17, v3

    move v3, v15

    move-object/from16 v15, v21

    move-object/from16 v16, v25

    invoke-direct/range {v6 .. v16}, Lcom/helpshift/conversation/activeconversation/model/Conversation;-><init>(Ljava/lang/String;Lcom/helpshift/conversation/dto/IssueState;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1135
    iput-object v4, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    .line 1136
    iput-object v2, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    .line 1137
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->setLocalId(J)V

    .line 1138
    iput-object v5, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localUUID:Ljava/lang/String;

    move-object/from16 v1, p1

    .line 1139
    iput-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    move-wide/from16 v1, v23

    .line 1140
    iput-wide v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    .line 1141
    iput-boolean v3, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isStartNewConversationClicked:Z

    move-wide/from16 v1, v32

    .line 1142
    iput-wide v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->lastUserActivityTime:J

    move/from16 v1, v22

    .line 1143
    iput-boolean v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->wasFullPrivacyEnabledAtCreation:Z

    move/from16 v1, v28

    .line 1144
    iput-boolean v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    move-object/from16 v1, v25

    .line 1145
    iput-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    move-object/from16 v6, v30

    .line 1146
    iput-object v6, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->resolutionExpiryAt:Ljava/lang/Long;

    move-object/from16 v6, v31

    .line 1147
    iput-object v6, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatExpiryAt:Ljava/lang/Long;

    move/from16 v8, v29

    .line 1148
    iput-boolean v8, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    move/from16 v8, v19

    .line 1149
    iput-boolean v8, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldAllowNewConversationCreation:Z

    move-object/from16 v1, p0

    move-object/from16 v2, v17

    .line 1150
    invoke-direct {v1, v0, v2}, Lcom/helpshift/common/conversation/ConversationDB;->parseAndSetMetaData(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;)V

    return-object v0
.end method

.method private exists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 2

    .line 905
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SELECT COUNT(*) FROM "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " WHERE "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " LIMIT 1"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, p4}, Landroid/database/DatabaseUtils;->longForQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)J

    move-result-wide p1

    const-wide/16 p3, 0x0

    cmp-long v0, p1, p3

    if-lez v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private static faqToContentValues(Lcom/helpshift/support/Faq;)Landroid/content/ContentValues;
    .locals 3

    .line 181
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 182
    invoke-virtual {p0}, Lcom/helpshift/support/Faq;->getId()Ljava/lang/String;

    move-result-object v1

    const-string v2, "question_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    iget-object v1, p0, Lcom/helpshift/support/Faq;->publish_id:Ljava/lang/String;

    const-string v2, "publish_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    iget-object v1, p0, Lcom/helpshift/support/Faq;->language:Ljava/lang/String;

    const-string v2, "language"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    iget-object v1, p0, Lcom/helpshift/support/Faq;->section_publish_id:Ljava/lang/String;

    const-string v2, "section_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    iget-object v1, p0, Lcom/helpshift/support/Faq;->title:Ljava/lang/String;

    const-string v2, "title"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    iget-object v1, p0, Lcom/helpshift/support/Faq;->body:Ljava/lang/String;

    const-string v2, "body"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    iget v1, p0, Lcom/helpshift/support/Faq;->is_helpful:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "helpful"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 189
    iget-object v1, p0, Lcom/helpshift/support/Faq;->is_rtl:Ljava/lang/Boolean;

    const-string v2, "rtl"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 190
    new-instance v1, Lorg/json/JSONArray;

    invoke-virtual {p0}, Lcom/helpshift/support/Faq;->getTags()Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "tags"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    new-instance v1, Lorg/json/JSONArray;

    .line 192
    invoke-virtual {p0}, Lcom/helpshift/support/Faq;->getCategoryTags()Ljava/util/List;

    move-result-object p0

    invoke-direct {v1, p0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "c_tags"

    invoke-virtual {v0, v1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private getAuthor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/Author;
    .locals 0

    if-eqz p5, :cond_0

    .line 1242
    sget-object p3, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->LOCAL_USER:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    goto :goto_0

    .line 1245
    :cond_0
    invoke-static {p3}, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->getEnum(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    move-result-object p3

    .line 1247
    :goto_0
    new-instance p5, Lcom/helpshift/conversation/activeconversation/message/Author;

    invoke-direct {p5, p1, p2, p3}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V

    .line 1248
    iput-object p4, p5, Lcom/helpshift/conversation/activeconversation/message/Author;->localAvatarImagePath:Ljava/lang/String;

    return-object p5
.end method

.method private getBooleanFromJson(Lorg/json/JSONObject;Ljava/lang/String;Z)Z
    .locals 0

    .line 1819
    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method private getConversationMeta(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1047
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    .line 1048
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 1049
    iget-object v2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatFeedback:Ljava/lang/String;

    .line 1050
    iget v3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatRating:I

    const-string v4, "csat_feedback"

    .line 1051
    invoke-virtual {v1, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "csat_rating"

    .line 1052
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 1053
    invoke-virtual {v0}, Lcom/helpshift/conversation/states/ConversationCSATState;->getValue()I

    move-result v0

    const-string v2, "csat_state"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 1054
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldIncrementMessageCount:Z

    const-string v2, "increment_message_count"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 1055
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isConversationEndedDelegateSent:Z

    const-string v2, "ended_delegate_sent"

    .line 1056
    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 1057
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isAutoFilledPreIssue:Z

    const-string v2, "is_autofilled_preissue"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 1060
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentTreeId:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1061
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentTreeId:Ljava/lang/String;

    const-string v2, "smart_intent_tree_id"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1063
    :cond_0
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentUserQuery:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1064
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentUserQuery:Ljava/lang/String;

    const-string v2, "smart_intent_user_query"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1066
    :cond_1
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentIds:Ljava/util/List;

    invoke-static {p1}, Lcom/helpshift/util/HSJSONUtils;->listToJsonArray(Ljava/util/List;)Lorg/json/JSONArray;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 1067
    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    .line 1068
    :goto_0
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "smart_intent_ids"

    .line 1069
    invoke-virtual {v1, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1071
    :cond_3
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getImageAttachmentDraftMeta(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 1036
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 1037
    iget-object v1, p1, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->originalFileName:Ljava/lang/String;

    const-string v2, "image_draft_orig_name"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1038
    iget-object v1, p1, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->originalFileSize:Ljava/lang/Long;

    const-string v2, "image_draft_orig_size"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1039
    iget-object v1, p1, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->filePath:Ljava/lang/String;

    const-string v2, "image_draft_file_path"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1040
    iget v1, p1, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->attachmentType:I

    const-string v2, "attachment_type"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 1041
    iget-boolean p1, p1, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->isFileCompressionAndCopyingDone:Z

    const-string v1, "image_copy_done"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 1043
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/helpshift/common/conversation/ConversationDB;
    .locals 2

    const-class v0, Lcom/helpshift/common/conversation/ConversationDB;

    monitor-enter v0

    .line 174
    :try_start_0
    sget-object v1, Lcom/helpshift/common/conversation/ConversationDB;->instance:Lcom/helpshift/common/conversation/ConversationDB;

    if-nez v1, :cond_0

    .line 175
    new-instance v1, Lcom/helpshift/common/conversation/ConversationDB;

    invoke-direct {v1, p0}, Lcom/helpshift/common/conversation/ConversationDB;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/helpshift/common/conversation/ConversationDB;->instance:Lcom/helpshift/common/conversation/ConversationDB;

    .line 177
    :cond_0
    sget-object p0, Lcom/helpshift/common/conversation/ConversationDB;->instance:Lcom/helpshift/common/conversation/ConversationDB;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private getIntFromJson(Lorg/json/JSONObject;Ljava/lang/String;I)I
    .locals 0

    .line 1811
    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method private getMessageMeta(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1956
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    .line 1957
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 1958
    sget-object v2, Lcom/helpshift/common/conversation/ConversationDB$1;->$SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType:[I

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ordinal()I

    move-result v0

    aget v0, v2, v0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    .line 2096
    :pswitch_0
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    .line 2097
    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForActionCardMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V

    goto/16 :goto_0

    .line 2079
    :pswitch_1
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;

    .line 2080
    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForUserBotControlMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;)V

    .line 2081
    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForAutoRetriableMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;)V

    goto/16 :goto_0

    .line 2076
    :pswitch_2
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;

    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForAdminBotControlMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;)V

    goto/16 :goto_0

    .line 2041
    :pswitch_3
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    .line 2042
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->isAnswered()Z

    move-result v0

    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForIsAnswered(Lorg/json/JSONObject;Z)V

    .line 2043
    invoke-direct {p0, v1, p1}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForMessageSeenData(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    goto/16 :goto_0

    .line 2066
    :pswitch_4
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/ImageAttachmentMessageDM;

    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForImageAttachmentMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/ImageAttachmentMessageDM;)V

    .line 2067
    invoke-direct {p0, v1, p1}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForMessageSeenData(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    goto/16 :goto_0

    .line 2061
    :pswitch_5
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;

    .line 2062
    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildJsonObjectForAttachmentMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;)V

    .line 2063
    invoke-direct {p0, v1, p1}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForMessageSeenData(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    goto/16 :goto_0

    .line 2035
    :pswitch_6
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;

    .line 2037
    iget-boolean v0, v0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isAnswered:Z

    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForIsAnswered(Lorg/json/JSONObject;Z)V

    .line 2038
    invoke-direct {p0, v1, p1}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForMessageSeenData(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    goto/16 :goto_0

    .line 2073
    :pswitch_7
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildJsonObjectForAttachmentMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;)V

    goto/16 :goto_0

    .line 2070
    :pswitch_8
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForScreenshotAttachmentMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;)V

    goto/16 :goto_0

    .line 2088
    :pswitch_9
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;

    .line 2089
    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForAutoRetriableMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;)V

    goto/16 :goto_0

    .line 2084
    :pswitch_a
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;

    .line 2085
    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForAutoRetriableMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;)V

    goto/16 :goto_0

    .line 2051
    :pswitch_b
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;

    .line 2052
    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForFollowUpRejected(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;)V

    .line 2053
    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForAutoRetriableMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;)V

    goto/16 :goto_0

    .line 2046
    :pswitch_c
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;

    .line 2047
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->referredMessageId:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForReferredMessageId(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 2048
    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForAutoRetriableMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;)V

    goto/16 :goto_0

    .line 2056
    :pswitch_d
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;

    .line 2057
    iget-boolean v0, v0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->isAnswered:Z

    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForIsAnswered(Lorg/json/JSONObject;Z)V

    .line 2058
    invoke-direct {p0, v1, p1}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForMessageSeenData(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    goto/16 :goto_0

    .line 2030
    :pswitch_e
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;

    .line 2031
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;->referredMessageId:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForReferredMessageId(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 2032
    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForAutoRetriableMessage(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;)V

    goto/16 :goto_0

    .line 2023
    :pswitch_f
    invoke-direct {p0, v1, p1}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForMessageSeenData(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 2024
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;

    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForFAQList(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;)V

    .line 2025
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;

    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForInput(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;)V

    .line 2026
    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForIsSuggestionsReadEvent(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;)V

    .line 2027
    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForFAQListSource(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;)V

    goto/16 :goto_0

    .line 2017
    :pswitch_10
    invoke-direct {p0, v1, p1}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForMessageSeenData(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 2018
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;

    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForFAQList(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;)V

    .line 2019
    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForIsSuggestionsReadEvent(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;)V

    .line 2020
    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForFAQListSource(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;)V

    goto/16 :goto_0

    .line 2013
    :pswitch_11
    invoke-direct {p0, v1, p1}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForMessageSeenData(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 2014
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->csatRatingsInput:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForCSATInput(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;)V

    goto/16 :goto_0

    .line 2008
    :pswitch_12
    invoke-direct {p0, v1, p1}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForMessageSeenData(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 2009
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;

    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForInput(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;)V

    .line 2010
    iget v0, v0, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;->attachmentCount:I

    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForAttachmentCount(Lorg/json/JSONObject;I)Lorg/json/JSONObject;

    goto/16 :goto_0

    .line 2003
    :pswitch_13
    invoke-direct {p0, v1, p1}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForMessageSeenData(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 2004
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;

    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForInput(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;)V

    .line 2005
    iget v0, v0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;->attachmentCount:I

    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForAttachmentCount(Lorg/json/JSONObject;I)Lorg/json/JSONObject;

    goto/16 :goto_0

    .line 1996
    :pswitch_14
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;

    .line 1998
    invoke-direct {p0, v1, p1}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForMessageSeenData(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 1999
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForInput(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/input/TextInput;)V

    .line 2000
    iget-boolean v0, v0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->isMessageEmpty:Z

    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForIsMessageEmpty(Lorg/json/JSONObject;Z)V

    goto :goto_0

    .line 1993
    :pswitch_15
    invoke-direct {p0, v1, p1}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForMessageSeenData(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    goto :goto_0

    .line 2092
    :pswitch_16
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;

    .line 2093
    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForIntentLabels(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;)V

    goto :goto_0

    .line 1982
    :pswitch_17
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    .line 1984
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->botInfo:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForBotInfo(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 1985
    iget-boolean v2, v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->isNewConversationStarted:Z

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForIsNewConvClickedCSAT(Lorg/json/JSONObject;Z)V

    .line 1987
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->getReferredMessageId()Ljava/lang/String;

    move-result-object v2

    .line 1986
    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForReferredMessageId(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 1988
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->optionData:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForSelectedOptionData(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 1989
    iget v2, v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->rating:I

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForRatingValue(Lorg/json/JSONObject;I)V

    .line 1990
    iget v0, v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->messageSyncState:I

    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForMessageSyncState(Lorg/json/JSONObject;I)V

    goto :goto_0

    .line 1971
    :pswitch_18
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;

    .line 1973
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;->botInfo:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForBotInfo(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 1974
    iget-boolean v2, v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;->skipped:Z

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForIsResponseSkipped(Lorg/json/JSONObject;Z)V

    .line 1976
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;->getReferredMessageId()Ljava/lang/String;

    move-result-object v2

    .line 1975
    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForReferredMessageId(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 1977
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;->referredMessageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForReferredMessageType(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 1979
    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;->optionData:Ljava/lang/String;

    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForSelectedOptionData(Lorg/json/JSONObject;Ljava/lang/String;)V

    goto :goto_0

    .line 1960
    :pswitch_19
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;

    .line 1962
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;->botInfo:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForBotInfo(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 1963
    iget v2, v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;->keyboard:I

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForInputKeyboard(Lorg/json/JSONObject;I)V

    .line 1964
    iget-boolean v2, v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;->skipped:Z

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForIsResponseSkipped(Lorg/json/JSONObject;Z)V

    .line 1966
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;->getReferredMessageId()Ljava/lang/String;

    move-result-object v2

    .line 1965
    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForReferredMessageId(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 1967
    iget-boolean v2, v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;->isMessageEmpty:Z

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForIsMessageEmpty(Lorg/json/JSONObject;Z)V

    .line 1968
    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForDateTime(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;)V

    .line 2101
    :goto_0
    invoke-direct {p0, v1, p1}, Lcom/helpshift/common/conversation/ConversationDB;->buildMetaForFeedbackMessageProperties(Lorg/json/JSONObject;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 2103
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
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

.method private getStringFromJson(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1815
    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private insertActionCard(Landroid/database/sqlite/SQLiteDatabase;Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V
    .locals 5

    .line 555
    :try_start_0
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->serverId:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->actionCardToContentValues(Lcom/helpshift/conversation/activeconversation/model/ActionCard;Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v0

    const-string v1, "action_cards"

    const/4 v2, 0x0

    .line 556
    invoke-virtual {p1, v1, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    .line 557
    iget-object v3, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iput-object v4, v3, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->actionCardLocalId:Ljava/lang/Long;

    .line 558
    iget-object v3, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v3, v3, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->action:Lcom/helpshift/conversation/activeconversation/model/Action;

    invoke-direct {p0, v3, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->actionToContentValues(Lcom/helpshift/conversation/activeconversation/model/Action;J)Landroid/content/ContentValues;

    move-result-object v0

    const-string v1, "actions"

    .line 559
    invoke-virtual {p1, v1, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    .line 560
    iget-object p1, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->action:Lcom/helpshift/conversation/activeconversation/model/Action;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    iput-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Action;->actionLocalId:Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "Helpshift_ConverDB"

    const-string v0, "Error in insert action card"

    .line 564
    invoke-static {p2, v0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method private insertMessageInternal(Landroid/database/sqlite/SQLiteDatabase;Lcom/helpshift/conversation/activeconversation/message/MessageDM;Landroid/content/ContentValues;)J
    .locals 3

    const-string v0, "messages"

    const/4 v1, 0x0

    .line 546
    invoke-virtual {p1, v0, v1, p3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    .line 547
    iget-object p3, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_ACTION_CARD:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne p3, v2, :cond_0

    .line 548
    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    invoke-direct {p0, p1, p2}, Lcom/helpshift/common/conversation/ConversationDB;->insertActionCard(Landroid/database/sqlite/SQLiteDatabase;Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V

    :cond_0
    return-wide v0
.end method

.method private jsonify(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3

    .line 1913
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 1915
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    .line 1920
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Exception in jsonify"

    .line 1923
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-object v0
.end method

.method private parseAndGetImageAttachmentDraft(Ljava/lang/String;)Lcom/helpshift/conversation/dto/AttachmentPickerFile;
    .locals 11

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 1218
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "image_draft_orig_name"

    .line 1219
    invoke-virtual {v1, p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v2, "image_draft_orig_size"

    const-wide/16 v3, -0x1

    .line 1220
    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-string v5, "image_draft_file_path"

    .line 1221
    invoke-virtual {v1, v5, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "attachment_type"

    .line 1222
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    const-string v7, "image_copy_done"

    const/4 v8, 0x0

    .line 1224
    invoke-virtual {v1, v7, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 1225
    new-instance v7, Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    .line 1226
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    cmp-long v10, v8, v3

    if-nez v10, :cond_1

    move-object v2, v0

    :cond_1
    invoke-direct {v7, v5, p1, v2}, Lcom/helpshift/conversation/dto/AttachmentPickerFile;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 1227
    :try_start_1
    iput-boolean v1, v7, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->isFileCompressionAndCopyingDone:Z

    .line 1228
    iput v6, v7, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->attachmentType:I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    move-object v0, v7

    goto :goto_0

    :catch_1
    move-exception p1

    :goto_0
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in parseAndGetImageAttachmentDraft"

    .line 1231
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v7, v0

    :goto_1
    return-object v7
.end method

.method private parseAndGetMessageSyncState(Ljava/lang/String;Lorg/json/JSONObject;)I
    .locals 1

    .line 1894
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x2

    return p1

    :cond_0
    const/4 p1, 0x1

    const-string v0, "message_sync_status"

    .line 1898
    invoke-virtual {p2, v0, p1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method private parseAndSetFollowUpRejectedDataFromMeta(Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;Lorg/json/JSONObject;)V
    .locals 3

    const-string v0, "rejected_reason"

    .line 1947
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    const-string v1, "rejected_conv_id"

    const/4 v2, 0x0

    .line 1948
    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1950
    iput v0, p1, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->reason:I

    .line 1951
    iput-object p2, p1, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->openConversationId:Ljava/lang/String;

    return-void
.end method

.method private parseAndSetMessageSeenData(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V
    .locals 4

    const-string v0, "read_at"

    const-string v1, ""

    .line 1903
    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "seen_cursor"

    const/4 v2, 0x0

    .line 1904
    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "seen_sync_status"

    const/4 v3, 0x0

    .line 1905
    invoke-virtual {p2, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p2

    .line 1906
    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->seenAtMessageCursor:Ljava/lang/String;

    .line 1907
    iput-boolean p2, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isMessageSeenSynced:Z

    .line 1908
    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->readAt:Ljava/lang/String;

    return-void
.end method

.method private parseAndSetMetaData(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;)V
    .locals 6

    const-string v0, "smart_intent_ids"

    if-nez p2, :cond_0

    return-void

    .line 1187
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p2, "csat_rating"

    const/4 v2, 0x0

    .line 1188
    invoke-virtual {v1, p2, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p2

    const-string v3, "csat_state"

    .line 1189
    sget-object v4, Lcom/helpshift/conversation/states/ConversationCSATState;->NONE:Lcom/helpshift/conversation/states/ConversationCSATState;

    invoke-virtual {v4}, Lcom/helpshift/conversation/states/ConversationCSATState;->getValue()I

    move-result v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    const-string v4, "csat_feedback"

    const/4 v5, 0x0

    .line 1190
    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1191
    iput p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatRating:I

    .line 1192
    invoke-static {v3}, Lcom/helpshift/conversation/states/ConversationCSATState;->fromInt(I)Lcom/helpshift/conversation/states/ConversationCSATState;

    move-result-object p2

    iput-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    .line 1193
    iput-object v4, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatFeedback:Ljava/lang/String;

    const-string p2, "increment_message_count"

    .line 1196
    invoke-virtual {v1, p2, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldIncrementMessageCount:Z

    const-string p2, "ended_delegate_sent"

    .line 1199
    invoke-virtual {v1, p2, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isConversationEndedDelegateSent:Z

    const-string p2, "is_autofilled_preissue"

    .line 1201
    invoke-virtual {v1, p2, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isAutoFilledPreIssue:Z

    const-string p2, "smart_intent_tree_id"

    .line 1202
    invoke-virtual {v1, p2, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentTreeId:Ljava/lang/String;

    const-string p2, "smart_intent_user_query"

    .line 1203
    invoke-virtual {v1, p2, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentUserQuery:Ljava/lang/String;

    .line 1204
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_0

    .line 1205
    :cond_1
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/helpshift/util/HSJSONUtils;->jsonArrayToStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    :goto_0
    iput-object v5, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentIds:Ljava/util/List;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string p2, "Helpshift_ConverDB"

    const-string v0, "Error in parseAndSetMetaData"

    .line 1208
    invoke-static {p2, v0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    return-void
.end method

.method private parseAttachmentCountFromMeta(Lorg/json/JSONObject;)I
    .locals 2

    const-string v0, "attachment_count"

    const/4 v1, 0x0

    .line 1807
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getIntFromJson(Lorg/json/JSONObject;Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method private parseAttachmentInfoFromMeta(Lorg/json/JSONObject;)Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;
    .locals 1

    .line 1937
    new-instance v0, Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;

    invoke-direct {v0, p0, p1}, Lcom/helpshift/common/conversation/ConversationDB$AttachmentInfo;-><init>(Lcom/helpshift/common/conversation/ConversationDB;Lorg/json/JSONObject;)V

    return-object v0
.end method

.method private parseBotActionTypeFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 2

    const-string v0, "bot_action_type"

    const-string v1, ""

    .line 1729
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseBotEndedReasonFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 2

    const-string v0, "bot_ended_reason"

    const-string v1, ""

    .line 1734
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseBotInfoFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 2

    const-string v0, "chatbot_info"

    const-string v1, "{}"

    .line 1877
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseCSATInputRatingsFromMeta(Lorg/json/JSONObject;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;",
            ">;"
        }
    .end annotation

    .line 1790
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    const-string v1, "input_options"

    .line 1792
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    const/4 v1, 0x0

    .line 1793
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 1794
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 1795
    new-instance v3, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;

    const-string v4, "option_title"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "rating_value"

    .line 1796
    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    const-string v6, "option_data"

    .line 1797
    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v4, v5, v2}, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 1795
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    :cond_0
    return-object v0
.end method

.method private parseCSATRatingInputTypeFromMeta(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;
    .locals 0

    .line 1721
    invoke-static {}, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;->getType()Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;

    move-result-object p1

    return-object p1
.end method

.method private parseDateTimeFromMeta(Lorg/json/JSONObject;)J
    .locals 3

    const-string v0, "dt"

    const-wide/16 v1, 0x0

    .line 1882
    invoke-virtual {p1, v0, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method private parseFAQListFromMeta(Lorg/json/JSONObject;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;",
            ">;"
        }
    .end annotation

    .line 1746
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    const-string v1, "faqs"

    .line 1748
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    const/4 v1, 0x0

    .line 1749
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 1750
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 1751
    new-instance v3, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;

    const-string v4, "faq_title"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "faq_publish_id"

    .line 1752
    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "faq_language"

    .line 1753
    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v4, v5, v2}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1751
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    :cond_0
    return-object v0
.end method

.method private parseFAQListSourceFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 1

    :try_start_0
    const-string v0, "faq_source"

    .line 1765
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p1, ""

    :goto_0
    return-object p1
.end method

.method private parseFeedbackMessageData(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V
    .locals 2

    const-string v0, "is_feedback_message"

    const/4 v1, 0x0

    .line 1624
    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isFeedbackMessage:Z

    return-void
.end method

.method private parseHasNextBotFromMeta(Lorg/json/JSONObject;)Ljava/lang/Boolean;
    .locals 2

    const-string v0, "has_next_bot"

    const/4 v1, 0x0

    .line 1890
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method private parseImageAttachmentInfoFromMeta(Lorg/json/JSONObject;)Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;
    .locals 1

    .line 1941
    new-instance v0, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;

    invoke-direct {v0, p0, p1}, Lcom/helpshift/common/conversation/ConversationDB$ImageAttachmentInfo;-><init>(Lcom/helpshift/common/conversation/ConversationDB;Lorg/json/JSONObject;)V

    return-object v0
.end method

.method private parseInputKeyboardFromMeta(Lorg/json/JSONObject;)I
    .locals 2

    const-string v0, "input_keyboard"

    const/4 v1, 0x1

    .line 1843
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getIntFromJson(Lorg/json/JSONObject;Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method private parseInputLabelFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 2

    const-string v0, "input_label"

    const-string v1, ""

    .line 1863
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getStringFromJson(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseInputOptionTypeFromMeta(Lorg/json/JSONObject;I)Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;
    .locals 2

    const-string v0, "option_type"

    const-string v1, ""

    .line 1717
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getStringFromJson(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p2}, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;->getType(Ljava/lang/String;I)Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    move-result-object p1

    return-object p1
.end method

.method private parseInputOptionsFromMeta(Lorg/json/JSONObject;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;",
            ">;"
        }
    .end annotation

    .line 1774
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    const-string v1, "input_options"

    .line 1776
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    const/4 v1, 0x0

    .line 1777
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 1778
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 1779
    new-instance v3, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;

    const-string v4, "option_title"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "option_data"

    .line 1780
    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v4, v2}, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1779
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    :cond_0
    return-object v0
.end method

.method private parseInputPlaceholderFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 2

    const-string v0, "input_placeholder"

    const-string v1, ""

    .line 1871
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getStringFromJson(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseInputRequiredFromMeta(Lorg/json/JSONObject;)Z
    .locals 2

    const-string v0, "input_required"

    const/4 v1, 0x0

    .line 1867
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getBooleanFromJson(Lorg/json/JSONObject;Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method private parseInputSkipLabelFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 2

    const-string v0, "input_skip_label"

    const-string v1, ""

    .line 1847
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getStringFromJson(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseIntentLabelFromMeta(Lorg/json/JSONObject;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "intent_labels"

    .line 1628
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    .line 1629
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_0

    .line 1631
    invoke-static {p1}, Lcom/helpshift/util/HSJSONUtils;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method private parseIsAnsweredFromMeta(Lorg/json/JSONObject;)Z
    .locals 2

    const-string v0, "is_answered"

    const/4 v1, 0x0

    .line 1933
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method private parseIsMessageEmptyFromMeta(Lorg/json/JSONObject;)Z
    .locals 2

    const-string v0, "is_message_empty"

    const/4 v1, 0x0

    .line 1725
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getBooleanFromJson(Lorg/json/JSONObject;Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method private parseIsNewConvClickCSATFromMeta(Lorg/json/JSONObject;)Z
    .locals 2

    const-string v0, "new_conv_started_csat"

    const/4 v1, 0x0

    .line 1835
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getBooleanFromJson(Lorg/json/JSONObject;Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method private parseIsResponseSkippedFromMeta(Lorg/json/JSONObject;)Z
    .locals 2

    const-string v0, "is_response_skipped"

    const/4 v1, 0x0

    .line 1831
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getBooleanFromJson(Lorg/json/JSONObject;Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method private parseIsSuggestionsReadEventSent(Lorg/json/JSONObject;)Z
    .locals 2

    const-string v0, "is_suggestion_read_event_sent"

    const/4 v1, 0x0

    .line 1742
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getBooleanFromJson(Lorg/json/JSONObject;Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method private parseRatingValueFromMeta(Lorg/json/JSONObject;)I
    .locals 2

    const-string v0, "rating_value"

    const/4 v1, 0x1

    .line 1839
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getIntFromJson(Lorg/json/JSONObject;Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method private parseReferredMessageIdFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 2

    const-string v0, "referredMessageId"

    const/4 v1, 0x0

    .line 1929
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseReferredMessageTypeFromMeta(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/MessageType;
    .locals 2

    const-string v0, "referred_message_type"

    const-string v1, ""

    .line 1823
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getStringFromJson(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/helpshift/conversation/activeconversation/message/MessageType;->fromValue(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/MessageType;

    move-result-object p1

    return-object p1
.end method

.method private parseSelectedOptionDataFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 2

    const-string v0, "selected_option_data"

    const-string v1, "{}"

    .line 1827
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getStringFromJson(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseSendFeedbackLabelFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 2

    const-string v0, "input_send_feedback_label"

    const-string v1, ""

    .line 1855
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getStringFromJson(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseShowConvButtonFromMeta(Lorg/json/JSONObject;)Z
    .locals 2

    const-string v0, "show_new_conv_button"

    const/4 v1, 0x1

    .line 1851
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getBooleanFromJson(Lorg/json/JSONObject;Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method private parseStartNewConversationLabelFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 2

    const-string v0, "input_start_conv_label"

    const-string v1, ""

    .line 1859
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getStringFromJson(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseSuggestionReadFAQPublishId(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 2

    const-string v0, "suggestion_read_faq_publish_id"

    const-string v1, ""

    .line 1738
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->getStringFromJson(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseTimeZoneIdFromMeta(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 1

    const-string v0, "timezone_id"

    .line 1886
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private readActionCard(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/ActionCard;
    .locals 11

    const-string v0, "Error in read action card inside finally block"

    const-string v1, "Helpshift_ConverDB"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/String;

    .line 1640
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v4, 0x0

    aput-object p1, v3, v4

    .line 1657
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SELECT "

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "action_cards._id"

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " AS ac_id, "

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "action_cards.title"

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ", "

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "action_cards.image_url"

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "action_cards.file_path"

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "action_cards.is_image_secure"

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "actions._id"

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " AS a_id, "

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "actions.action_sha"

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "actions.action_title"

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "actions.action_type"

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "actions.action_data"

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " FROM "

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "action_cards"

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " JOIN "

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "actions"

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " ON "

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " = "

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "actions.action_card_id"

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " WHERE "

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "action_cards.message_id"

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " = ?  LIMIT 1"

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v5, 0x0

    .line 1672
    :try_start_0
    iget-object v6, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v6}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1673
    :try_start_1
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1675
    invoke-virtual {v6, p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    .line 1676
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "action_type"

    .line 1678
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/helpshift/conversation/activeconversation/model/ActionType;->fromValue(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/ActionType;

    move-result-object v3

    const-string v7, "action_data"

    .line 1680
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/helpshift/common/conversation/ConversationDB;->jsonify(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    invoke-static {v7}, Lcom/helpshift/util/HSJSONUtils;->toStringMap(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v7

    .line 1682
    new-instance v8, Lcom/helpshift/conversation/activeconversation/model/Action;

    const-string v9, "action_title"

    invoke-interface {p1, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    invoke-interface {p1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    const-string v10, "action_sha"

    .line 1683
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v10

    invoke-interface {p1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v9, v10, v3, v7}, Lcom/helpshift/conversation/activeconversation/model/Action;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/model/ActionType;Ljava/util/Map;)V

    const-string v3, "a_id"

    .line 1686
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v8, Lcom/helpshift/conversation/activeconversation/model/Action;->actionLocalId:Ljava/lang/Long;

    .line 1688
    new-instance v3, Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    const-string v7, "title"

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const-string v9, "image_url"

    .line 1689
    invoke-interface {p1, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    invoke-interface {p1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    const-string v10, "is_image_secure"

    .line 1690
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v10

    invoke-interface {p1, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    if-ne v10, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-direct {v3, v7, v9, v2, v8}, Lcom/helpshift/conversation/activeconversation/model/ActionCard;-><init>(Ljava/lang/String;Ljava/lang/String;ZLcom/helpshift/conversation/activeconversation/model/Action;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    const-string v2, "ac_id"

    .line 1692
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, v3, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->actionCardLocalId:Ljava/lang/Long;

    const-string v2, "file_path"

    .line 1693
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v3, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->filePath:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v5, v3

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_2

    .line 1696
    :cond_1
    :goto_1
    :try_start_3
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v6, :cond_3

    .line 1704
    :try_start_4
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_5

    :catch_1
    move-exception p1

    .line 1707
    invoke-static {v1, v0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_5

    :catchall_0
    move-exception p1

    move-object v5, v6

    goto :goto_6

    :catch_2
    move-exception p1

    move-object v3, v5

    :goto_2
    move-object v5, v6

    goto :goto_3

    :catchall_1
    move-exception p1

    goto :goto_6

    :catch_3
    move-exception p1

    move-object v3, v5

    :goto_3
    :try_start_5
    const-string v2, "Error in read action card"

    .line 1699
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-eqz v5, :cond_2

    .line 1704
    :try_start_6
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_4

    :catch_4
    move-exception p1

    .line 1707
    invoke-static {v1, v0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_4
    move-object v5, v3

    :cond_3
    :goto_5
    return-object v5

    :goto_6
    if-eqz v5, :cond_4

    .line 1704
    :try_start_7
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5

    goto :goto_7

    :catch_5
    move-exception v2

    .line 1707
    invoke-static {v1, v0, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1710
    :cond_4
    :goto_7
    throw p1
.end method

.method private declared-synchronized readConversation(Ljava/lang/String;[Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 10

    monitor-enter p0

    const/4 v0, 0x0

    .line 200
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v1}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "issues"

    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v5, p1

    move-object v6, p2

    .line 201
    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 208
    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 209
    invoke-direct {p0, p1}, Lcom/helpshift/common/conversation/ConversationDB;->cursorToReadableConversation(Landroid/database/Cursor;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_0
    if-eqz p1, :cond_1

    .line 217
    :goto_0
    :try_start_2
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_2

    :catch_0
    move-exception p2

    goto :goto_1

    :catchall_0
    move-exception p2

    goto :goto_3

    :catch_1
    move-exception p2

    move-object p1, v0

    :goto_1
    :try_start_3
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in read conversations with localId"

    .line 213
    invoke-static {v1, v2, p2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz p1, :cond_1

    goto :goto_0

    .line 220
    :cond_1
    :goto_2
    monitor-exit p0

    return-object v0

    :catchall_1
    move-exception p2

    move-object v0, p1

    :goto_3
    if-eqz v0, :cond_2

    .line 217
    :try_start_4
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 219
    :cond_2
    throw p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private readMessages(Ljava/lang/String;[Ljava/lang/String;)Lcom/helpshift/common/dao/DAOResult;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Lcom/helpshift/common/dao/DAOResult<",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;>;"
        }
    .end annotation

    .line 758
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 761
    :try_start_0
    iget-object v2, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v2}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v4, "messages"

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v6, p1

    move-object v7, p2

    .line 762
    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 770
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 772
    :cond_0
    invoke-direct {p0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->cursorToMessageDM(Landroid/database/Cursor;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 776
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 778
    :cond_1
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p1, :cond_0

    :cond_2
    if-eqz v1, :cond_3

    .line 787
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 790
    :cond_3
    new-instance p1, Lcom/helpshift/common/dao/DAOResult;

    const/4 p2, 0x1

    invoke-direct {p1, p2, v0}, Lcom/helpshift/common/dao/DAOResult;-><init>(ZLjava/lang/Object;)V

    return-object p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_1
    const-string p2, "Helpshift_ConverDB"

    const-string v2, "Error in read messages"

    .line 782
    invoke-static {p2, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 783
    new-instance p1, Lcom/helpshift/common/dao/DAOResult;

    const/4 p2, 0x0

    invoke-direct {p1, p2, v0}, Lcom/helpshift/common/dao/DAOResult;-><init>(ZLjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_4

    .line 787
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_4
    return-object p1

    :goto_0
    if-eqz v1, :cond_5

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 789
    :cond_5
    throw p1
.end method

.method private readableConversationToContentValues(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Landroid/content/ContentValues;
    .locals 3

    .line 990
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 991
    iget-wide v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "user_local_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 992
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    const-string v2, "server_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 993
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    const-string v2, "pre_conv_server_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 995
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->publishId:Ljava/lang/String;

    const-string v2, "publish_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 996
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localUUID:Ljava/lang/String;

    const-string v2, "uuid"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 997
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->title:Ljava/lang/String;

    const-string v2, "title"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 998
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageCursor:Ljava/lang/String;

    const-string v2, "message_cursor"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 999
    iget-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isStartNewConversationClicked:Z

    .line 1000
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "start_new_conversation_action"

    .line 999
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1001
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->getCreatedAt()Ljava/lang/String;

    move-result-object v1

    const-string v2, "created_at"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1002
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->updatedAt:Ljava/lang/String;

    const-string v2, "updated_at"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1004
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->getEpochCreatedAtTime()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "epoch_time_created_at"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1005
    iget-wide v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->lastUserActivityTime:J

    .line 1006
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "last_user_activity_time"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1007
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    const-string v2, "issue_type"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1008
    iget-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->wasFullPrivacyEnabledAtCreation:Z

    .line 1009
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "full_privacy_enabled"

    .line 1008
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1010
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    if-nez v1, :cond_0

    const/4 v1, -0x1

    goto :goto_0

    :cond_0
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 1011
    invoke-virtual {v1}, Lcom/helpshift/conversation/dto/IssueState;->getValue()I

    move-result v1

    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "state"

    .line 1010
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1012
    iget-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    .line 1013
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "is_redacted"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1014
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    const-string v2, "acid"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1015
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->resolutionExpiryAt:Ljava/lang/Long;

    const-string v2, "resolution_expiry_at"

    .line 1016
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1017
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatExpiryAt:Ljava/lang/Long;

    const-string v2, "csat_expiry_at"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1018
    iget-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "feedback_bots_enabled"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1019
    iget-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldAllowNewConversationCreation:Z

    .line 1020
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "can_start_new_conversation"

    .line 1019
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1022
    :try_start_0
    invoke-direct {p0, p1}, Lcom/helpshift/common/conversation/ConversationDB;->getConversationMeta(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "meta"

    .line 1023
    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in generating meta string for conversation"

    .line 1026
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    return-object v0
.end method

.method private readableMessageToContentValues(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Landroid/content/ContentValues;
    .locals 4

    .line 1155
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 1156
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    const-string v2, "server_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1157
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    const-string v2, "conversation_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1158
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->body:Ljava/lang/String;

    const-string v2, "body"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1159
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getCreatedAt()Ljava/lang/String;

    move-result-object v1

    const-string v2, "created_at"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1161
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "epoch_time_created_at"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1162
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/message/MessageType;->getValue()Ljava/lang/String;

    move-result-object v1

    const-string v2, "type"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1163
    iget v1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->deliveryState:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "md_state"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1164
    iget-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isRedacted:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "is_redacted"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1166
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    .line 1167
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/message/Author;->authorName:Ljava/lang/String;

    const-string v3, "author_name"

    invoke-virtual {v0, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1168
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/message/Author;->authorId:Ljava/lang/String;

    const-string v3, "author_id"

    invoke-virtual {v0, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1169
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/message/Author;->role:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    if-eqz v2, :cond_0

    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/message/Author;->role:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    invoke-virtual {v2}, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->getValue()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    const-string v3, "author_role"

    .line 1170
    invoke-virtual {v0, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1171
    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/message/Author;->localAvatarImagePath:Ljava/lang/String;

    const-string v2, "local_avatar_image_path"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    const-string v1, "meta"

    .line 1174
    invoke-direct {p0, p1}, Lcom/helpshift/common/conversation/ConversationDB;->getMessageMeta(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in generating meta string for message"

    .line 1177
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    return-object v0
.end method

.method private updateActionCard(Landroid/database/sqlite/SQLiteDatabase;Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V
    .locals 6

    const-string v0, "_id = ?"

    .line 866
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->actionCardLocalId:Ljava/lang/Long;

    if-nez v1, :cond_0

    .line 867
    invoke-direct {p0, p1, p2}, Lcom/helpshift/common/conversation/ConversationDB;->insertActionCard(Landroid/database/sqlite/SQLiteDatabase;Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V

    return-void

    .line 872
    :cond_0
    :try_start_0
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v2, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->serverId:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->actionCardToContentValues(Lcom/helpshift/conversation/activeconversation/model/ActionCard;Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/String;

    .line 874
    iget-object v4, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v4, v4, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->actionCardLocalId:Ljava/lang/Long;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "action_cards"

    .line 875
    invoke-virtual {p1, v4, v1, v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 877
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->action:Lcom/helpshift/conversation/activeconversation/model/Action;

    iget-object v3, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v3, v3, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->actionCardLocalId:Ljava/lang/Long;

    .line 878
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-direct {p0, v1, v3, v4}, Lcom/helpshift/common/conversation/ConversationDB;->actionToContentValues(Lcom/helpshift/conversation/activeconversation/model/Action;J)Landroid/content/ContentValues;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/String;

    .line 880
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->action:Lcom/helpshift/conversation/activeconversation/model/Action;

    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/model/Action;->actionLocalId:Ljava/lang/Long;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    aput-object p2, v2, v5

    const-string p2, "actions"

    .line 881
    invoke-virtual {p1, p2, v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "Helpshift_ConverDB"

    const-string v0, "Error in update action card"

    .line 884
    invoke-static {p2, v0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method private updateMessageInternal(Landroid/database/sqlite/SQLiteDatabase;Lcom/helpshift/conversation/activeconversation/message/MessageDM;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 2

    .line 854
    invoke-direct {p0, p2}, Lcom/helpshift/common/conversation/ConversationDB;->readableMessageToContentValues(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Landroid/content/ContentValues;

    move-result-object v0

    const-string v1, "messages"

    .line 855
    invoke-virtual {p1, v1, v0, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 859
    iget-object p3, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object p4, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_ACTION_CARD:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne p3, p4, :cond_0

    .line 860
    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    invoke-direct {p0, p1, p2}, Lcom/helpshift/common/conversation/ConversationDB;->updateActionCard(Landroid/database/sqlite/SQLiteDatabase;Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized deleteConversationInboxData(J)V
    .locals 4

    monitor-enter p0

    :try_start_0
    const-string v0, "delete from conversation_inbox where user_local_id = ?"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2452
    :try_start_1
    iget-object v1, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v1}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    .line 2453
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v2, v3

    invoke-virtual {v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    const-string p2, "Helpshift_ConverDB"

    const-string v0, "Error in delete conversationInboxData with UserLocalId"

    .line 2456
    invoke-static {p2, v0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 2458
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized deleteConversationWithLocalId(J)V
    .locals 5

    monitor-enter p0

    :try_start_0
    const-string v0, "_id = ?"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 265
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "conversation_id = ?"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v3, 0x0

    .line 270
    :try_start_1
    iget-object v4, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v4}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 271
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v4, "issues"

    .line 272
    invoke-virtual {v3, v4, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    const-string v0, "messages"

    .line 273
    invoke-virtual {v3, v0, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 274
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v3, :cond_0

    .line 282
    :try_start_2
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_3
    const-string v1, "Helpshift_ConverDB"

    .line 286
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception in ending transaction deleteConversationWithLocalId : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 287
    :goto_0
    invoke-static {v1, p1, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    :try_start_4
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in delete conversation with localId"

    .line 277
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v3, :cond_0

    .line 282
    :try_start_5
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1

    :catch_2
    move-exception v0

    :try_start_6
    const-string v1, "Helpshift_ConverDB"

    .line 286
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception in ending transaction deleteConversationWithLocalId : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_0

    .line 291
    :cond_0
    :goto_1
    monitor-exit p0

    return-void

    :goto_2
    if-eqz v3, :cond_1

    .line 282
    :try_start_7
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_3

    :catch_3
    move-exception v1

    :try_start_8
    const-string v2, "Helpshift_ConverDB"

    .line 286
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception in ending transaction deleteConversationWithLocalId : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 287
    invoke-static {v2, p1, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 290
    :cond_1
    :goto_3
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized deleteConversations(J)V
    .locals 7

    monitor-enter p0

    :try_start_0
    const-string v0, "issues._id"

    const-string v1, "issues.user_local_id"

    const-string v2, "messages.conversation_id"

    .line 2468
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "select "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " from  "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "issues"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "  where "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " = ?"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2472
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "delete from messages where "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " IN  ( "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " )"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "delete from issues where user_local_id = ?"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v2, 0x0

    .line 2480
    :try_start_1
    iget-object v3, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v3}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 2481
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/String;

    .line 2482
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v2, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    new-array v0, v3, [Ljava/lang/String;

    .line 2483
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v0, v6

    invoke-virtual {v2, v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2484
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_0

    .line 2491
    :goto_0
    :try_start_2
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception p1

    :try_start_3
    const-string p2, "Helpshift_ConverDB"

    const-string v0, "Error in delete conversations with UserLocalId"

    .line 2487
    invoke-static {p2, v0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v2, :cond_0

    goto :goto_0

    .line 2494
    :cond_0
    :goto_1
    monitor-exit p0

    return-void

    :goto_2
    if-eqz v2, :cond_1

    .line 2491
    :try_start_4
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 2493
    :cond_1
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized deleteMessagesForConversation(J)Z
    .locals 6

    monitor-enter p0

    :try_start_0
    const-string v0, "conversation_id= ? "

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    .line 890
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 893
    :try_start_1
    iget-object v3, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v3}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v5, "messages"

    .line 894
    invoke-virtual {v3, v5, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 895
    monitor-exit p0

    return v1

    :catch_0
    move-exception v0

    :try_start_2
    const-string v1, "Helpshift_ConverDB"

    .line 898
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error deleting messages for : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 899
    monitor-exit p0

    return v4

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized dropAndCreateDatabase()V
    .locals 2

    monitor-enter p0

    .line 2359
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/helpshift/db/conversation/ConversationDBHelper;->dropAndCreateAllTables(Landroid/database/sqlite/SQLiteDatabase;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2360
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getAdminFAQSuggestion(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/support/Faq;
    .locals 10

    monitor-enter p0

    .line 2363
    :try_start_0
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4

    invoke-static {p2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz v0, :cond_0

    goto :goto_4

    .line 2370
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "faq_suggestions"

    const/4 v4, 0x0

    const-string v5, "publish_id = ? AND language = ?"

    const/4 v0, 0x2

    new-array v6, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p1, v6, v0

    const/4 p1, 0x1

    aput-object p2, v6, p1

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 2371
    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2377
    :try_start_2
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 2378
    invoke-direct {p0, p1}, Lcom/helpshift/common/conversation/ConversationDB;->cursorToFaq(Landroid/database/Cursor;)Lcom/helpshift/support/Faq;

    move-result-object v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_1
    if-eqz p1, :cond_2

    .line 2386
    :goto_0
    :try_start_3
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_2

    :catch_0
    move-exception p2

    goto :goto_1

    :catchall_0
    move-exception p2

    goto :goto_3

    :catch_1
    move-exception p2

    move-object p1, v1

    :goto_1
    :try_start_4
    const-string v0, "Helpshift_ConverDB"

    const-string v2, "Error in getAdminFAQSuggestion"

    .line 2382
    invoke-static {v0, v2, p2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz p1, :cond_2

    goto :goto_0

    .line 2389
    :cond_2
    :goto_2
    monitor-exit p0

    return-object v1

    :catchall_1
    move-exception p2

    move-object v1, p1

    :goto_3
    if-eqz v1, :cond_3

    .line 2386
    :try_start_5
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 2388
    :cond_3
    throw p2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 2364
    :cond_4
    :goto_4
    monitor-exit p0

    return-object v1

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getMessagesCountForConversations(Ljava/util/List;[Ljava/lang/String;)Ljava/util/Map;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 656
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 657
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    const/4 v3, 0x0

    .line 659
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_6

    goto :goto_0

    :cond_0
    const/16 v1, 0x384

    const/4 v2, 0x0

    .line 665
    :try_start_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v1, v3}, Lcom/helpshift/util/DatabaseUtils;->createBatches(ILjava/util/List;)Ljava/util/List;

    move-result-object p1

    .line 668
    iget-object v1, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v1}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 669
    :try_start_2
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 670
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 672
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    invoke-static {v4}, Lcom/helpshift/util/DatabaseUtils;->makePlaceholders(I)Ljava/lang/String;

    move-result-object v4

    .line 673
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 675
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "conversation_id IN ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ")"

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 677
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 679
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 681
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    .line 682
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_2
    if-eqz p2, :cond_3

    .line 686
    array-length v3, p2

    .line 687
    invoke-static {v3}, Lcom/helpshift/util/DatabaseUtils;->makePlaceholders(I)Ljava/lang/String;

    move-result-object v3

    .line 688
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "type IN ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v6, " AND "

    .line 691
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 692
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 694
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v4, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 698
    :cond_3
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    new-array v7, v3, [Ljava/lang/String;

    .line 699
    invoke-interface {v4, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    const-string v4, "messages"

    const-string v3, "COUNT(*) AS COUNT"

    const-string v6, "conversation_id"

    .line 701
    filled-new-array {v3, v6}, [Ljava/lang/String;

    move-result-object v6

    .line 704
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "conversation_id"

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v3, v1

    move-object v5, v6

    move-object v6, v8

    move-object v8, v9

    move-object v9, v10

    move-object v10, v11

    .line 701
    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 710
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_4
    const-string v3, "conversation_id"

    .line 713
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    const-string v5, "COUNT"

    .line 714
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 715
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 716
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_4

    goto/16 :goto_1

    .line 719
    :cond_5
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v1, :cond_7

    .line 726
    :try_start_3
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_7

    .line 727
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_5

    :catchall_0
    move-exception p1

    goto :goto_4

    :catch_0
    move-exception p1

    :try_start_4
    const-string p2, "Helpshift_ConverDB"

    const-string v1, "Error in get messages count inside finally block, "

    .line 731
    invoke-static {p2, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v2, :cond_a

    .line 735
    :goto_3
    :try_start_5
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    goto :goto_a

    :goto_4
    if-eqz v2, :cond_6

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 737
    :cond_6
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_6

    :cond_7
    :goto_5
    if-eqz v2, :cond_a

    goto :goto_3

    :catchall_1
    move-exception p1

    move-object p2, v2

    move-object v2, v1

    goto :goto_b

    :catch_1
    move-exception p1

    move-object p2, v2

    move-object v2, v1

    goto :goto_6

    :catchall_2
    move-exception p1

    move-object p2, v2

    goto :goto_b

    :catch_2
    move-exception p1

    move-object p2, v2

    :goto_6
    :try_start_6
    const-string v1, "Helpshift_ConverDB"

    const-string v3, "Error in get messages count"

    .line 722
    invoke-static {v1, v3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    if-eqz v2, :cond_9

    .line 726
    :try_start_7
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_9

    .line 727
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_9

    :catchall_3
    move-exception p1

    goto :goto_8

    :catch_3
    move-exception p1

    :try_start_8
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in get messages count inside finally block, "

    .line 731
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    if-eqz p2, :cond_a

    .line 735
    :goto_7
    :try_start_9
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    goto :goto_a

    :goto_8
    if-eqz p2, :cond_8

    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 737
    :cond_8
    throw p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_6

    :cond_9
    :goto_9
    if-eqz p2, :cond_a

    goto :goto_7

    .line 739
    :cond_a
    :goto_a
    monitor-exit p0

    return-object v0

    :catchall_4
    move-exception p1

    :goto_b
    if-eqz v2, :cond_c

    .line 726
    :try_start_a
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 727
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_4
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    goto :goto_e

    :catchall_5
    move-exception p1

    goto :goto_d

    :catch_4
    move-exception v0

    :try_start_b
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in get messages count inside finally block, "

    .line 731
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    if-eqz p2, :cond_d

    .line 735
    :goto_c
    :try_start_c
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    goto :goto_f

    :goto_d
    if-eqz p2, :cond_b

    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 737
    :cond_b
    throw p1

    :cond_c
    :goto_e
    if-eqz p2, :cond_d

    goto :goto_c

    .line 738
    :cond_d
    :goto_f
    throw p1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    :catchall_6
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getOldestConversationEpochCreatedAtTime(J)Ljava/lang/Long;
    .locals 10

    monitor-enter p0

    :try_start_0
    const-string v3, "user_local_id = ?"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    .line 2543
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/4 p1, 0x0

    .line 2545
    :try_start_1
    iget-object p2, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {p2}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "issues"

    const-string p2, "epoch_time_created_at"

    .line 2546
    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "epoch_time_created_at ASC"

    const-string v8, "1"

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2554
    :try_start_2
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "epoch_time_created_at"

    .line 2555
    const-class v1, Ljava/lang/Long;

    .line 2556
    invoke-static {p2, v0, v1}, Lcom/helpshift/util/DatabaseUtils;->parseColumnSafe(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-object p1, v0

    :cond_0
    if-eqz p2, :cond_1

    .line 2564
    :goto_0
    :try_start_3
    invoke-interface {p2}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_2

    :catch_0
    move-exception v0

    goto :goto_1

    :catchall_0
    move-exception p2

    move-object v9, p2

    move-object p2, p1

    move-object p1, v9

    goto :goto_3

    :catch_1
    move-exception v0

    move-object p2, p1

    :goto_1
    :try_start_4
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in getting latest conversation created_at time"

    .line 2560
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz p2, :cond_1

    goto :goto_0

    .line 2567
    :cond_1
    :goto_2
    monitor-exit p0

    return-object p1

    :catchall_1
    move-exception p1

    :goto_3
    if-eqz p2, :cond_2

    .line 2564
    :try_start_5
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 2566
    :cond_2
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getOldestMessageCursor(J)Ljava/lang/String;
    .locals 9

    monitor-enter p0

    :try_start_0
    const-string v0, "message_create_at"

    const-string v1, "issues.user_local_id"

    const-string v2, "issues._id"

    const-string v3, "messages.conversation_id"

    const-string v4, "messages.created_at"

    const-string v5, "messages.epoch_time_created_at"

    .line 2508
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SELECT "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " AS "

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " FROM "

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "issues"

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " INNER JOIN "

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "messages"

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " ON "

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " = "

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " WHERE "

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " = ? ORDER BY "

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "  ASC LIMIT 1"

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    .line 2518
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v2, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/4 p1, 0x0

    .line 2520
    :try_start_1
    iget-object p2, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {p2}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p2

    .line 2521
    invoke-virtual {p2, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2523
    :try_start_2
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2524
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_0
    if-eqz p2, :cond_1

    .line 2532
    :goto_0
    :try_start_3
    invoke-interface {p2}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_2

    :catch_0
    move-exception v0

    goto :goto_1

    :catchall_0
    move-exception p2

    move-object v8, p2

    move-object p2, p1

    move-object p1, v8

    goto :goto_3

    :catch_1
    move-exception v0

    move-object p2, p1

    :goto_1
    :try_start_4
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in read messages"

    .line 2528
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz p2, :cond_1

    goto :goto_0

    .line 2536
    :cond_1
    :goto_2
    monitor-exit p0

    return-object p1

    :catchall_1
    move-exception p1

    :goto_3
    if-eqz p2, :cond_2

    .line 2532
    :try_start_5
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 2534
    :cond_2
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized insertConversation(Lcom/helpshift/conversation/activeconversation/model/Conversation;)J
    .locals 5

    monitor-enter p0

    .line 306
    :try_start_0
    invoke-direct {p0, p1}, Lcom/helpshift/common/conversation/ConversationDB;->readableConversationToContentValues(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Landroid/content/ContentValues;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v0, -0x1

    .line 309
    :try_start_1
    iget-object v2, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v2}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "issues"

    const/4 v4, 0x0

    .line 310
    invoke-virtual {v2, v3, v4, p1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    const-string v2, "Helpshift_ConverDB"

    const-string v3, "Error in insert conversation"

    .line 313
    invoke-static {v2, v3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 315
    :goto_0
    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized insertConversations(Ljava/util/List;)Lcom/helpshift/common/dao/DAOResult;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;)",
            "Lcom/helpshift/common/dao/DAOResult<",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation

    monitor-enter p0

    .line 319
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 320
    new-instance p1, Lcom/helpshift/common/dao/DAOResult;

    invoke-direct {p1, v1, v2}, Lcom/helpshift/common/dao/DAOResult;-><init>(ZLjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    monitor-exit p0

    return-object p1

    .line 323
    :cond_0
    :try_start_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 324
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 325
    invoke-direct {p0, v3}, Lcom/helpshift/common/conversation/ConversationDB;->readableConversationToContentValues(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Landroid/content/ContentValues;

    move-result-object v3

    .line 326
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 329
    :cond_1
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 331
    :try_start_2
    iget-object v3, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v3}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 332
    :try_start_3
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 333
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/ContentValues;

    const-string v5, "issues"

    .line 334
    invoke-virtual {v3, v5, v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    .line 335
    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 337
    :cond_2
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v3, :cond_3

    .line 346
    :try_start_4
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_2

    :catch_0
    move-exception v0

    :try_start_5
    const-string v2, "Helpshift_ConverDB"

    const-string v3, "Error in insert conversations inside finally block"

    .line 349
    invoke-static {v2, v3, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 353
    :cond_3
    :goto_2
    new-instance v0, Lcom/helpshift/common/dao/DAOResult;

    invoke-direct {v0, v1, p1}, Lcom/helpshift/common/dao/DAOResult;-><init>(ZLjava/lang/Object;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    move-object v2, v3

    goto :goto_5

    :catch_1
    move-exception v0

    move-object v2, v3

    goto :goto_3

    :catchall_1
    move-exception p1

    goto :goto_5

    :catch_2
    move-exception v0

    :goto_3
    :try_start_6
    const-string v1, "Helpshift_ConverDB"

    const-string v3, "Error in insert conversations"

    .line 340
    invoke-static {v1, v3, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 341
    new-instance v0, Lcom/helpshift/common/dao/DAOResult;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p1}, Lcom/helpshift/common/dao/DAOResult;-><init>(ZLjava/lang/Object;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    if-eqz v2, :cond_4

    .line 346
    :try_start_7
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    goto :goto_4

    :catch_3
    move-exception p1

    :try_start_8
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in insert conversations inside finally block"

    .line 349
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 341
    :cond_4
    :goto_4
    monitor-exit p0

    return-object v0

    :goto_5
    if-eqz v2, :cond_5

    .line 346
    :try_start_9
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_4
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    goto :goto_6

    :catch_4
    move-exception v0

    :try_start_a
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in insert conversations inside finally block"

    .line 349
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 352
    :cond_5
    :goto_6
    throw p1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized insertMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)J
    .locals 5

    monitor-enter p0

    const-wide/16 v0, -0x1

    .line 482
    :try_start_0
    invoke-direct {p0, p1}, Lcom/helpshift/common/conversation/ConversationDB;->readableMessageToContentValues(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Landroid/content/ContentValues;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v3, 0x0

    .line 485
    :try_start_1
    iget-object v4, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v4}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 486
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 487
    invoke-direct {p0, v3, p1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->insertMessageInternal(Landroid/database/sqlite/SQLiteDatabase;Lcom/helpshift/conversation/activeconversation/message/MessageDM;Landroid/content/ContentValues;)J

    move-result-wide v0

    .line 488
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v3, :cond_0

    .line 496
    :try_start_2
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_3
    const-string v2, "Helpshift_ConverDB"

    const-string v3, "Error in insert message inside finally block"

    .line 499
    :goto_0
    invoke-static {v2, v3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_1
    move-exception p1

    :try_start_4
    const-string v2, "Helpshift_ConverDB"

    const-string v4, "Error in insert message"

    .line 491
    invoke-static {v2, v4, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v3, :cond_0

    .line 496
    :try_start_5
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1

    :catch_2
    move-exception p1

    :try_start_6
    const-string v2, "Helpshift_ConverDB"

    const-string v3, "Error in insert message inside finally block"
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_0

    .line 503
    :cond_0
    :goto_1
    monitor-exit p0

    return-wide v0

    :goto_2
    if-eqz v3, :cond_1

    .line 496
    :try_start_7
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_3

    :catch_3
    move-exception v0

    :try_start_8
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in insert message inside finally block"

    .line 499
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 502
    :cond_1
    :goto_3
    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized insertMessages(Ljava/util/List;)Lcom/helpshift/common/dao/DAOResult;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)",
            "Lcom/helpshift/common/dao/DAOResult<",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation

    monitor-enter p0

    .line 507
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 508
    new-instance p1, Lcom/helpshift/common/dao/DAOResult;

    invoke-direct {p1, v2, v1}, Lcom/helpshift/common/dao/DAOResult;-><init>(ZLjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    monitor-exit p0

    return-object p1

    .line 511
    :cond_0
    :try_start_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 512
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 513
    invoke-direct {p0, v4}, Lcom/helpshift/common/conversation/ConversationDB;->readableMessageToContentValues(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Landroid/content/ContentValues;

    move-result-object v4

    .line 514
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 517
    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const/4 v4, 0x0

    .line 519
    :try_start_2
    iget-object v5, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v5}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 520
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 521
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x0

    :goto_1
    if-ge v6, v5, :cond_2

    .line 523
    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/ContentValues;

    invoke-direct {p0, v1, v7, v8}, Lcom/helpshift/common/conversation/ConversationDB;->insertMessageInternal(Landroid/database/sqlite/SQLiteDatabase;Lcom/helpshift/conversation/activeconversation/message/MessageDM;Landroid/content/ContentValues;)J

    move-result-wide v7

    .line 524
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 526
    :cond_2
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v1, :cond_3

    .line 535
    :try_start_3
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :catch_0
    move-exception p1

    :try_start_4
    const-string v0, "Helpshift_ConverDB"

    const-string v1, "Error in insert messages inside finally block"

    .line 538
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 542
    :cond_3
    :goto_2
    new-instance p1, Lcom/helpshift/common/dao/DAOResult;

    invoke-direct {p1, v2, v3}, Lcom/helpshift/common/dao/DAOResult;-><init>(ZLjava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    goto :goto_4

    :catch_1
    move-exception p1

    :try_start_5
    const-string v0, "Helpshift_ConverDB"

    const-string v2, "Error in insert messages"

    .line 529
    invoke-static {v0, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 530
    new-instance p1, Lcom/helpshift/common/dao/DAOResult;

    invoke-direct {p1, v4, v3}, Lcom/helpshift/common/dao/DAOResult;-><init>(ZLjava/lang/Object;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz v1, :cond_4

    .line 535
    :try_start_6
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_3

    :catch_2
    move-exception v0

    :try_start_7
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in insert messages inside finally block"

    .line 538
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 530
    :cond_4
    :goto_3
    monitor-exit p0

    return-object p1

    :goto_4
    if-eqz v1, :cond_5

    .line 535
    :try_start_8
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_5

    :catch_3
    move-exception v0

    :try_start_9
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in insert messages inside finally block"

    .line 538
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 541
    :cond_5
    :goto_5
    throw p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized insertOrUpdateAdminFAQSuggestion(Lcom/helpshift/support/Faq;)V
    .locals 5

    monitor-enter p0

    .line 2393
    :try_start_0
    invoke-static {p1}, Lcom/helpshift/common/conversation/ConversationDB;->faqToContentValues(Lcom/helpshift/support/Faq;)Landroid/content/ContentValues;

    move-result-object v0

    const-string v1, "publish_id = ? AND language = ?"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    .line 2397
    iget-object v4, p1, Lcom/helpshift/support/Faq;->publish_id:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object p1, p1, Lcom/helpshift/support/Faq;->language:Ljava/lang/String;

    aput-object p1, v2, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2399
    :try_start_1
    iget-object p1, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {p1}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const-string v3, "faq_suggestions"

    .line 2400
    invoke-direct {p0, p1, v3, v1, v2}, Lcom/helpshift/common/conversation/ConversationDB;->exists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v1, "faq_suggestions"

    const/4 v2, 0x0

    .line 2402
    invoke-virtual {p1, v1, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_0

    :cond_0
    const-string v3, "faq_suggestions"

    .line 2405
    invoke-virtual {p1, v3, v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    const-string v0, "Helpshift_ConverDB"

    const-string v1, "Error in insertOrUpdateAdminFAQSuggestion"

    .line 2409
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 2411
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized readConversationInboxRecord(J)Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;
    .locals 9

    monitor-enter p0

    :try_start_0
    const-string v3, "user_local_id = ?"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    .line 455
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/4 p1, 0x0

    .line 457
    :try_start_1
    iget-object p2, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {p2}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "conversation_inbox"

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 458
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 465
    :try_start_2
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 466
    invoke-direct {p0, p2}, Lcom/helpshift/common/conversation/ConversationDB;->cursorToConversationInboxRecord(Landroid/database/Cursor;)Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;

    move-result-object p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_0
    if-eqz p2, :cond_1

    .line 474
    :goto_0
    :try_start_3
    invoke-interface {p2}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_2

    :catch_0
    move-exception v0

    goto :goto_1

    :catchall_0
    move-exception p2

    move-object v8, p2

    move-object p2, p1

    move-object p1, v8

    goto :goto_3

    :catch_1
    move-exception v0

    move-object p2, p1

    :goto_1
    :try_start_4
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in read conversation inbox record"

    .line 470
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz p2, :cond_1

    goto :goto_0

    .line 477
    :cond_1
    :goto_2
    monitor-exit p0

    return-object p1

    :catchall_1
    move-exception p1

    :goto_3
    if-eqz p2, :cond_2

    .line 474
    :try_start_5
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 476
    :cond_2
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized readConversationWithLocalId(Ljava/lang/Long;)Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 3

    monitor-enter p0

    :try_start_0
    const-string v0, "_id = ?"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 259
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v2

    .line 260
    invoke-direct {p0, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->readConversation(Ljava/lang/String;[Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized readConversationWithServerId(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 3

    monitor-enter p0

    :try_start_0
    const-string v0, "server_id = ?"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 295
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v2

    .line 296
    invoke-direct {p0, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->readConversation(Ljava/lang/String;[Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized readConversationsWithLocalId(J)Lcom/helpshift/common/dao/DAOResult;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lcom/helpshift/common/dao/DAOResult<",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;>;"
        }
    .end annotation

    monitor-enter p0

    .line 224
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    const-string v5, "user_local_id = ?"

    const/4 v10, 0x1

    new-array v6, v10, [Ljava/lang/String;

    .line 227
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v6, p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 229
    :try_start_1
    iget-object p1, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {p1}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "issues"

    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 230
    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 238
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 240
    :cond_0
    invoke-direct {p0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->cursorToReadableConversation(Landroid/database/Cursor;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object p1

    .line 241
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez p1, :cond_0

    :cond_1
    if-eqz v1, :cond_2

    .line 251
    :try_start_2
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 254
    :cond_2
    new-instance p1, Lcom/helpshift/common/dao/DAOResult;

    invoke-direct {p1, v10, v0}, Lcom/helpshift/common/dao/DAOResult;-><init>(ZLjava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_3
    const-string v2, "Helpshift_ConverDB"

    const-string v3, "Error in read conversations with localId"

    .line 246
    invoke-static {v2, v3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 247
    new-instance p1, Lcom/helpshift/common/dao/DAOResult;

    invoke-direct {p1, p2, v0}, Lcom/helpshift/common/dao/DAOResult;-><init>(ZLjava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v1, :cond_3

    .line 251
    :try_start_4
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 247
    :cond_3
    monitor-exit p0

    return-object p1

    :goto_0
    if-eqz v1, :cond_4

    .line 251
    :try_start_5
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 253
    :cond_4
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized readMessageWithLocalId(Ljava/lang/Long;)Lcom/helpshift/common/dao/DAOResult;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            ")",
            "Lcom/helpshift/common/dao/DAOResult<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    const-string v0, "_id = ?"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    .line 2348
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v3, 0x0

    aput-object p1, v2, v3

    .line 2349
    invoke-direct {p0, v0, v2}, Lcom/helpshift/common/conversation/ConversationDB;->readMessages(Ljava/lang/String;[Ljava/lang/String;)Lcom/helpshift/common/dao/DAOResult;

    move-result-object p1

    .line 2350
    invoke-virtual {p1}, Lcom/helpshift/common/dao/DAOResult;->isSuccess()Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 2351
    new-instance p1, Lcom/helpshift/common/dao/DAOResult;

    invoke-direct {p1, v3, v2}, Lcom/helpshift/common/dao/DAOResult;-><init>(ZLjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    .line 2353
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 2354
    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 2355
    :goto_0
    new-instance p1, Lcom/helpshift/common/dao/DAOResult;

    invoke-direct {p1, v1, v2}, Lcom/helpshift/common/dao/DAOResult;-><init>(ZLjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized readMessageWithServerId(Ljava/lang/String;)Lcom/helpshift/common/dao/DAOResult;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/helpshift/common/dao/DAOResult<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    const-string v0, "server_id = ?"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    .line 2336
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v3, 0x0

    aput-object p1, v2, v3

    .line 2337
    invoke-direct {p0, v0, v2}, Lcom/helpshift/common/conversation/ConversationDB;->readMessages(Ljava/lang/String;[Ljava/lang/String;)Lcom/helpshift/common/dao/DAOResult;

    move-result-object p1

    .line 2338
    invoke-virtual {p1}, Lcom/helpshift/common/dao/DAOResult;->isSuccess()Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 2339
    new-instance p1, Lcom/helpshift/common/dao/DAOResult;

    invoke-direct {p1, v3, v2}, Lcom/helpshift/common/dao/DAOResult;-><init>(ZLjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    .line 2341
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 2342
    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 2343
    :goto_0
    new-instance p1, Lcom/helpshift/common/dao/DAOResult;

    invoke-direct {p1, v1, v2}, Lcom/helpshift/common/dao/DAOResult;-><init>(ZLjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized readMessages(J)Lcom/helpshift/common/dao/DAOResult;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lcom/helpshift/common/dao/DAOResult<",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;>;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    const-string v0, "conversation_id = ?"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 744
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v2

    .line 745
    invoke-direct {p0, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->readMessages(Ljava/lang/String;[Ljava/lang/String;)Lcom/helpshift/common/dao/DAOResult;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized readMessages(JLcom/helpshift/conversation/activeconversation/message/MessageType;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/helpshift/conversation/activeconversation/message/MessageType;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    const-string v0, "conversation_id = ? AND type = ?"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 753
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v2

    const/4 p1, 0x1

    invoke-virtual {p3}, Lcom/helpshift/conversation/activeconversation/message/MessageType;->getValue()Ljava/lang/String;

    move-result-object p2

    aput-object p2, v1, p1

    .line 754
    invoke-direct {p0, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->readMessages(Ljava/lang/String;[Ljava/lang/String;)Lcom/helpshift/common/dao/DAOResult;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized readMessagesForConversations(Ljava/util/Collection;)Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/Long;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 590
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_6

    const/16 v1, 0x384

    const/4 v2, 0x0

    .line 595
    :try_start_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v1, v3}, Lcom/helpshift/util/DatabaseUtils;->createBatches(ILjava/util/List;)Ljava/util/List;

    move-result-object p1

    .line 598
    iget-object v1, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v1}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 599
    :try_start_2
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 601
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 602
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    invoke-static {v4}, Lcom/helpshift/util/DatabaseUtils;->makePlaceholders(I)Ljava/lang/String;

    move-result-object v4

    .line 603
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "conversation_id IN ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ")"

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 604
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    new-array v7, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    .line 605
    :goto_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_1

    .line 606
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v7, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_1
    const-string v4, "messages"

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v3, v1

    .line 609
    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 617
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 619
    :cond_2
    invoke-direct {p0, v2}, Lcom/helpshift/common/conversation/ConversationDB;->cursorToMessageDM(Landroid/database/Cursor;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 625
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 627
    :cond_3
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_2

    goto :goto_0

    .line 630
    :cond_4
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v1, :cond_6

    .line 637
    :try_start_3
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 638
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_4

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_0
    move-exception p1

    :try_start_4
    const-string v1, "Helpshift_ConverDB"

    const-string v3, "Error in read messages inside finally block, "

    .line 642
    invoke-static {v1, v3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v2, :cond_9

    .line 646
    :goto_2
    :try_start_5
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    goto :goto_9

    :goto_3
    if-eqz v2, :cond_5

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 648
    :cond_5
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_6

    :cond_6
    :goto_4
    if-eqz v2, :cond_9

    goto :goto_2

    :catchall_1
    move-exception p1

    move-object v11, v2

    move-object v2, v1

    move-object v1, v11

    goto :goto_a

    :catch_1
    move-exception p1

    move-object v11, v2

    move-object v2, v1

    move-object v1, v11

    goto :goto_5

    :catchall_2
    move-exception p1

    move-object v1, v2

    goto :goto_a

    :catch_2
    move-exception p1

    move-object v1, v2

    :goto_5
    :try_start_6
    const-string v3, "Helpshift_ConverDB"

    const-string v4, "Error in read messages"

    .line 633
    invoke-static {v3, v4, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    if-eqz v2, :cond_8

    .line 637
    :try_start_7
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_8

    .line 638
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_8

    :catchall_3
    move-exception p1

    goto :goto_7

    :catch_3
    move-exception p1

    :try_start_8
    const-string v2, "Helpshift_ConverDB"

    const-string v3, "Error in read messages inside finally block, "

    .line 642
    invoke-static {v2, v3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    if-eqz v1, :cond_9

    .line 646
    :goto_6
    :try_start_9
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_9

    :goto_7
    if-eqz v1, :cond_7

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 648
    :cond_7
    throw p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_6

    :cond_8
    :goto_8
    if-eqz v1, :cond_9

    goto :goto_6

    .line 650
    :cond_9
    :goto_9
    monitor-exit p0

    return-object v0

    :catchall_4
    move-exception p1

    :goto_a
    if-eqz v2, :cond_b

    .line 637
    :try_start_a
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 638
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_4
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    goto :goto_d

    :catchall_5
    move-exception p1

    goto :goto_c

    :catch_4
    move-exception v0

    :try_start_b
    const-string v2, "Helpshift_ConverDB"

    const-string v3, "Error in read messages inside finally block, "

    .line 642
    invoke-static {v2, v3, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    if-eqz v1, :cond_c

    .line 646
    :goto_b
    :try_start_c
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_e

    :goto_c
    if-eqz v1, :cond_a

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 648
    :cond_a
    throw p1

    :cond_b
    :goto_d
    if-eqz v1, :cond_c

    goto :goto_b

    .line 649
    :cond_c
    :goto_e
    throw p1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    :catchall_6
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized readPreConversationWithServerId(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 3

    monitor-enter p0

    :try_start_0
    const-string v0, "pre_conv_server_id = ?"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 301
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v2

    .line 302
    invoke-direct {p0, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->readConversation(Ljava/lang/String;[Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized removeAdminFAQSuggestion(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    monitor-enter p0

    .line 2432
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    :try_start_1
    const-string v0, "publish_id = ? AND language = ?"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object p2, v1, p1

    .line 2438
    iget-object p1, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {p1}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const-string p2, "faq_suggestions"

    .line 2439
    invoke-virtual {p1, p2, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    const-string p2, "Helpshift_ConverDB"

    const-string v0, "Error in removeAdminFAQSuggestion"

    .line 2442
    invoke-static {p2, v0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 2445
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized storeConversationInboxRecord(Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;)Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;
    .locals 5

    monitor-enter p0

    :try_start_0
    const-string v0, "user_local_id = ?"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 429
    iget-wide v3, p1, Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;->userLocalId:J

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 430
    invoke-direct {p0, p1}, Lcom/helpshift/common/conversation/ConversationDB;->conversationInboxRecordToContentValues(Lcom/helpshift/conversation/dto/dao/ConversationInboxRecord;)Landroid/content/ContentValues;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 432
    :try_start_1
    iget-object v3, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v3}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v4, "conversation_inbox"

    .line 434
    invoke-direct {p0, v3, v4, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->exists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, "conversation_inbox"

    .line 436
    invoke-virtual {v3, v4, v2, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const-string v0, "conversation_inbox"

    const/4 v1, 0x0

    .line 442
    invoke-virtual {v3, v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in store conversation inbox record"

    .line 446
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 448
    :goto_0
    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized updateConversation(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 1

    monitor-enter p0

    .line 357
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 358
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 359
    invoke-virtual {p0, v0}, Lcom/helpshift/common/conversation/ConversationDB;->updateConversations(Ljava/util/List;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 360
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized updateConversations(Ljava/util/List;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;)Z"
        }
    .end annotation

    monitor-enter p0

    .line 382
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 383
    monitor-exit p0

    return v1

    .line 385
    :cond_0
    :try_start_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 386
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 387
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 388
    invoke-direct {p0, v4}, Lcom/helpshift/common/conversation/ConversationDB;->readableConversationToContentValues(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Landroid/content/ContentValues;

    move-result-object v6

    .line 389
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-array v6, v1, [Ljava/lang/String;

    .line 390
    iget-object v4, v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v6, v5

    .line 391
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    const-string v4, "_id = ?"
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 396
    :try_start_2
    iget-object v6, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v6}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 397
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const/4 v6, 0x0

    .line 398
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v7

    if-ge v6, v7, :cond_2

    const-string v7, "issues"

    .line 400
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/ContentValues;

    .line 402
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Ljava/lang/String;

    .line 399
    invoke-virtual {v3, v7, v8, v4, v9}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 404
    :cond_2
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v3, :cond_3

    .line 413
    :try_start_3
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :catch_0
    move-exception p1

    :try_start_4
    const-string v0, "Helpshift_ConverDB"

    const-string v2, "Error in update conversations inside finally block"

    .line 416
    invoke-static {v0, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 420
    :cond_3
    :goto_2
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    goto :goto_4

    :catch_1
    move-exception p1

    :try_start_5
    const-string v0, "Helpshift_ConverDB"

    const-string v1, "Error in update conversations"

    .line 407
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz v3, :cond_4

    .line 413
    :try_start_6
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_3

    :catch_2
    move-exception p1

    :try_start_7
    const-string v0, "Helpshift_ConverDB"

    const-string v1, "Error in update conversations inside finally block"

    .line 416
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 408
    :cond_4
    :goto_3
    monitor-exit p0

    return v5

    :goto_4
    if-eqz v3, :cond_5

    .line 413
    :try_start_8
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_5

    :catch_3
    move-exception v0

    :try_start_9
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in update conversations inside finally block"

    .line 416
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 419
    :cond_5
    :goto_5
    throw p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized updateLastUserActivityTimeInConversation(Ljava/lang/Long;J)V
    .locals 2

    monitor-enter p0

    .line 364
    :try_start_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "last_user_activity_time"

    .line 365
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p2, "_id = ?"

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 368
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, p3, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 370
    :try_start_1
    iget-object p1, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {p1}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const-string v1, "issues"

    .line 371
    invoke-virtual {p1, v1, v0, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    const-string p2, "Helpshift_ConverDB"

    const-string p3, "Error in updateLastUserActivityTimeInConversation"

    .line 377
    invoke-static {p2, p3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 379
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized updateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 4

    monitor-enter p0

    :try_start_0
    const-string v0, "_id = ?"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 795
    iget-object v3, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v2, 0x0

    .line 798
    :try_start_1
    iget-object v3, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v3}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 799
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 800
    invoke-direct {p0, v2, p1, v0, v1}, Lcom/helpshift/common/conversation/ConversationDB;->updateMessageInternal(Landroid/database/sqlite/SQLiteDatabase;Lcom/helpshift/conversation/activeconversation/message/MessageDM;Ljava/lang/String;[Ljava/lang/String;)V

    .line 801
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_0

    .line 809
    :try_start_2
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_3
    const-string v0, "Helpshift_ConverDB"

    const-string v1, "Error in update message inside finally block"

    .line 812
    :goto_0
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_1
    move-exception p1

    :try_start_4
    const-string v0, "Helpshift_ConverDB"

    const-string v1, "Error in update message"

    .line 804
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v2, :cond_0

    .line 809
    :try_start_5
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1

    :catch_2
    move-exception p1

    :try_start_6
    const-string v0, "Helpshift_ConverDB"

    const-string v1, "Error in update message inside finally block"
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_0

    .line 817
    :cond_0
    :goto_1
    monitor-exit p0

    return-void

    :goto_2
    if-eqz v2, :cond_1

    .line 809
    :try_start_7
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_3

    :catch_3
    move-exception v0

    :try_start_8
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in update message inside finally block"

    .line 812
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 815
    :cond_1
    :goto_3
    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized updateMessages(Ljava/util/List;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)Z"
        }
    .end annotation

    monitor-enter p0

    .line 820
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 821
    monitor-exit p0

    return v1

    :cond_0
    const/4 v0, 0x0

    :try_start_1
    const-string v2, "_id = ?"
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const/4 v3, 0x0

    .line 827
    :try_start_2
    iget-object v4, p0, Lcom/helpshift/common/conversation/ConversationDB;->dbHelper:Lcom/helpshift/db/conversation/ConversationDBHelper;

    invoke-virtual {v4}, Lcom/helpshift/db/conversation/ConversationDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 828
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 829
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    new-array v5, v1, [Ljava/lang/String;

    .line 830
    iget-object v6, v4, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    .line 831
    invoke-direct {p0, v0, v4, v2, v5}, Lcom/helpshift/common/conversation/ConversationDB;->updateMessageInternal(Landroid/database/sqlite/SQLiteDatabase;Lcom/helpshift/conversation/activeconversation/message/MessageDM;Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0

    .line 833
    :cond_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v0, :cond_2

    .line 842
    :try_start_3
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_4
    const-string v0, "Helpshift_ConverDB"

    const-string v2, "Error in update messages"

    .line 845
    invoke-static {v0, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 849
    :cond_2
    :goto_1
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_1
    move-exception p1

    :try_start_5
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in update messages"

    .line 836
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz v0, :cond_3

    .line 842
    :try_start_6
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_2

    :catch_2
    move-exception p1

    :try_start_7
    const-string v0, "Helpshift_ConverDB"

    const-string v1, "Error in update messages"

    .line 845
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 837
    :cond_3
    :goto_2
    monitor-exit p0

    return v3

    :goto_3
    if-eqz v0, :cond_4

    .line 842
    :try_start_8
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_4

    :catch_3
    move-exception v0

    :try_start_9
    const-string v1, "Helpshift_ConverDB"

    const-string v2, "Error in update messages"

    .line 845
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 848
    :cond_4
    :goto_4
    throw p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method
