package com.helpshift.db.conversation.tables;

/* JADX INFO: loaded from: classes2.dex */
public interface MessagesTable {
    public static final String TABLE_NAME = "messages";

    public interface Columns {
        public static final String AUTHOR_ID = "author_id";
        public static final String AUTHOR_NAME = "author_name";
        public static final String AUTHOR_ROLE = "author_role";
        public static final String AVATAR_IMAGE_LOCAL_PATH = "local_avatar_image_path";
        public static final String BODY = "body";
        public static final String CONVERSATION_ID = "conversation_id";
        public static final String CREATED_AT = "created_at";
        public static final String DELIVERY_STATE = "md_state";
        public static final String EPOCH_TIME_CREATE_AT = "epoch_time_created_at";
        public static final String HAS_OLDER_MESSAGES = "has_older_messages";
        public static final String ID = "_id";
        public static final String IS_REDACTED_MESSAGE = "is_redacted";
        public static final String LAST_CONVERSATIONS_REDACTION_TIME = "last_conv_redaction_time";
        public static final String MESSAGE_META = "meta";
        public static final String SERVER_ID = "server_id";
        public static final String TYPE = "type";
    }
}
