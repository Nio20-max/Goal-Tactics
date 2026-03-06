package com.helpshift.db.conversation.tables;

/* JADX INFO: loaded from: classes2.dex */
public interface ConversationInboxTable {
    public static final String TABLE_NAME = "conversation_inbox";

    public interface Columns {
        public static final String ARCHIVAL_TEXT = "archival_text";
        public static final String ATTACHMENT_DRAFT = "attachment_draft";
        public static final String DESCRIPTION_DRAFT = "description_draft";
        public static final String DESCRIPTION_DRAFT_TIMESTAMP = "description_draft_timestamp";
        public static final String DESCRIPTION_TYPE = "description_type";
        public static final String FORM_EMAIL = "form_email";
        public static final String FORM_NAME = "form_name";
        public static final String HAS_OLDER_MESSAGES = "has_older_messages";
        public static final String LAST_CONVERSATIONS_REDACTION_TIME = "last_conv_redaction_time";
        public static final String LAST_SYNC_TIMESTAMP = "since";
        public static final String PERSIST_MESSAGE_BOX = "persist_message_box";
        public static final String REPLY_TEXT = "reply_text";
        public static final String USER_LOCAL_ID = "user_local_id";
    }
}
