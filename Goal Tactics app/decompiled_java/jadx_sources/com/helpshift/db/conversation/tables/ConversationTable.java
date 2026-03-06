package com.helpshift.db.conversation.tables;

/* JADX INFO: loaded from: classes2.dex */
public interface ConversationTable {
    public static final String TABLE_NAME = "issues";

    public interface Columns {
        public static final String ACID = "acid";
        public static final String CAN_START_NEW_CONVERSATION = "can_start_new_conversation";
        public static final String CONVERSATION_META = "meta";
        public static final String CREATED_AT = "created_at";
        public static final String CSAT_EXPIRY_AT = "csat_expiry_at";
        public static final String EPOCH_TIME_CREATE_AT = "epoch_time_created_at";
        public static final String FEEDBACK_BOT_ENABLED = "feedback_bots_enabled";
        public static final String FULL_PRIVACY_ENABLED = "full_privacy_enabled";
        public static final String ID = "_id";
        public static final String ISSUE_TYPE = "issue_type";
        public static final String IS_REDACTED_CONVERSATION = "is_redacted";
        public static final String IS_START_NEW_CONVERSATION_CLICKED = "start_new_conversation_action";
        public static final String LAST_USER_ACTIVITY_TIME = "last_user_activity_time";
        public static final String LOCAL_UUID = "uuid";
        public static final String MESSAGE_CURSOR = "message_cursor";
        public static final String PRE_CONVERSATION_SERVER_ID = "pre_conv_server_id";
        public static final String PUBLISH_ID = "publish_id";
        public static final String RESOLUTION_EXPIRY_AT = "resolution_expiry_at";
        public static final String SERVER_ID = "server_id";
        public static final String SHOW_AGENT_NAME = "show_agent_name";
        public static final String STATE = "state";
        public static final String TITLE = "title";
        public static final String UPDATED_AT = "updated_at";
        public static final String USER_LOCAL_ID = "user_local_id";
    }
}
