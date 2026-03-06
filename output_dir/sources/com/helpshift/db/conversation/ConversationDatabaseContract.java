package com.helpshift.db.conversation;

import com.helpshift.db.base.DatabaseContract;
import com.helpshift.db.base.DropAndCreateDatabaseMigrator;
import com.helpshift.db.base.IMigrator;
import com.helpshift.db.conversation.migration.ConversationDbMigration_10_to_11;
import com.helpshift.db.conversation.migration.ConversationDbMigration_11_to_12;
import com.helpshift.db.conversation.migration.ConversationDbMigration_6_to_7;
import com.helpshift.db.conversation.migration.ConversationDbMigration_7_to_8;
import com.helpshift.db.conversation.migration.ConversationDbMigration_8_to_9;
import com.helpshift.db.conversation.migration.ConversationDbMigration_9_to_10;
import com.helpshift.db.conversation.tables.ActionCardTable;
import com.helpshift.db.conversation.tables.ConversationInboxTable;
import com.helpshift.db.conversation.tables.ConversationTable;
import com.helpshift.support.constants.FaqsTable;
import com.helpshift.support.db.SupportDBNameRepo;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationDatabaseContract implements DatabaseContract {
    public static final String CREATE_ACTION_CARD_TABLE = "CREATE TABLE IF NOT EXISTS action_cards ( _id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,image_url TEXT,file_path TEXT,is_image_secure INTEGER,message_id TEXT NOT NULL,FOREIGN KEY(message_id) REFERENCES messages (server_id));";
    public static final String CREATE_ACTION_TABLE = "CREATE TABLE IF NOT EXISTS actions ( _id INTEGER PRIMARY KEY AUTOINCREMENT,action_sha TEXT NOT NULL,action_title TEXT NOT NULL,action_type TEXT NOT NULL,action_data TEXT NOT NULL,action_card_id INTEGER NOT NULL,FOREIGN KEY(action_card_id) REFERENCES action_cards (_id));";
    private static final String TAG = "ConversationDatabase";
    private final String CREATE_MESSAGES_TABLE = "CREATE TABLE messages ( _id INTEGER PRIMARY KEY AUTOINCREMENT, server_id TEXT, conversation_id TEXT, body TEXT, author_name TEXT, type TEXT, meta TEXT, is_redacted INTEGER, created_at TEXT, epoch_time_created_at INTEGER NOT NULL, md_state INTEGER, author_id TEXT, local_avatar_image_path TEXT, author_role TEXT  );";
    private final String CREATE_SERVER_ID_INDEX_MESSAGES_TABLE = "CREATE INDEX SERVER_IDX ON messages(server_id)";
    private final String CREATE_CONVERSATION_TABLE = "CREATE TABLE issues ( _id INTEGER PRIMARY KEY AUTOINCREMENT,server_id TEXT UNIQUE, pre_conv_server_id TEXT UNIQUE, publish_id TEXT, uuid TEXT NOT NULL, user_local_id TEXT NOT NULL, title TEXT NOT NULL,issue_type TEXT NOT NULL, state INTEGER NOT NULL, show_agent_name INTEGER,message_cursor TEXT,start_new_conversation_action INTEGER, is_redacted INTEGER, meta TEXT,last_user_activity_time INTEGER, full_privacy_enabled INTEGER, epoch_time_created_at INTEGER NOT NULL, created_at TEXT NOT NULL,updated_at TEXT NOT NULL, acid TEXT, resolution_expiry_at INTEGER, csat_expiry_at INTEGER, can_start_new_conversation INTEGER, feedback_bots_enabled INTEGER  );";
    private final String CREATE_CONVERSATION_INBOX_TABLE = "CREATE TABLE conversation_inbox ( user_local_id TEXT PRIMARY KEY NOT NULL, form_name TEXT,form_email TEXT,description_draft TEXT,description_draft_timestamp TEXT,attachment_draft TEXT,description_type TEXT,archival_text TEXT, reply_text TEXT, persist_message_box INT, since TEXT, has_older_messages INT, last_conv_redaction_time INT );";
    private final String CREATE_FAQ_LIST_SUGGESTIONS_CACHE_TABLE = "CREATE TABLE faq_suggestions ( _id INTEGER PRIMARY KEY AUTOINCREMENT,question_id TEXT NOT NULL,publish_id TEXT NOT NULL,language TEXT NOT NULL,section_id TEXT NOT NULL,title TEXT NOT NULL,body TEXT NOT NULL,helpful INTEGER,rtl INTEGER,tags TEXT,c_tags TEXT );";

    @Override // com.helpshift.db.base.DatabaseContract
    public int getDatabaseVersion() {
        return 12;
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public String getTag() {
        return TAG;
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public String getDatabaseName() {
        return SupportDBNameRepo.getIssuesDbName();
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<String> getCreateTableQueries() {
        return Arrays.asList("CREATE TABLE issues ( _id INTEGER PRIMARY KEY AUTOINCREMENT,server_id TEXT UNIQUE, pre_conv_server_id TEXT UNIQUE, publish_id TEXT, uuid TEXT NOT NULL, user_local_id TEXT NOT NULL, title TEXT NOT NULL,issue_type TEXT NOT NULL, state INTEGER NOT NULL, show_agent_name INTEGER,message_cursor TEXT,start_new_conversation_action INTEGER, is_redacted INTEGER, meta TEXT,last_user_activity_time INTEGER, full_privacy_enabled INTEGER, epoch_time_created_at INTEGER NOT NULL, created_at TEXT NOT NULL,updated_at TEXT NOT NULL, acid TEXT, resolution_expiry_at INTEGER, csat_expiry_at INTEGER, can_start_new_conversation INTEGER, feedback_bots_enabled INTEGER  );", "CREATE TABLE conversation_inbox ( user_local_id TEXT PRIMARY KEY NOT NULL, form_name TEXT,form_email TEXT,description_draft TEXT,description_draft_timestamp TEXT,attachment_draft TEXT,description_type TEXT,archival_text TEXT, reply_text TEXT, persist_message_box INT, since TEXT, has_older_messages INT, last_conv_redaction_time INT );", "CREATE TABLE messages ( _id INTEGER PRIMARY KEY AUTOINCREMENT, server_id TEXT, conversation_id TEXT, body TEXT, author_name TEXT, type TEXT, meta TEXT, is_redacted INTEGER, created_at TEXT, epoch_time_created_at INTEGER NOT NULL, md_state INTEGER, author_id TEXT, local_avatar_image_path TEXT, author_role TEXT  );", "CREATE INDEX SERVER_IDX ON messages(server_id)", "CREATE TABLE faq_suggestions ( _id INTEGER PRIMARY KEY AUTOINCREMENT,question_id TEXT NOT NULL,publish_id TEXT NOT NULL,language TEXT NOT NULL,section_id TEXT NOT NULL,title TEXT NOT NULL,body TEXT NOT NULL,helpful INTEGER,rtl INTEGER,tags TEXT,c_tags TEXT );", CREATE_ACTION_CARD_TABLE, CREATE_ACTION_TABLE);
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<IMigrator> getMigratorsForUpgrade(int i) {
        ArrayList arrayList = new ArrayList();
        if (i >= 6) {
            if (i == 6) {
                arrayList.add(new ConversationDbMigration_6_to_7());
            }
            if (i <= 7) {
                arrayList.add(new ConversationDbMigration_7_to_8());
            }
            if (i <= 8) {
                arrayList.add(new ConversationDbMigration_8_to_9());
            }
            if (i <= 9) {
                arrayList.add(new ConversationDbMigration_9_to_10());
            }
            if (i <= 10) {
                arrayList.add(new ConversationDbMigration_10_to_11());
            }
            if (i <= 11) {
                arrayList.add(new ConversationDbMigration_11_to_12());
            }
        } else {
            arrayList.add(new DropAndCreateDatabaseMigrator(this));
        }
        return arrayList;
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<String> getTableNames() {
        return Arrays.asList("actions", ActionCardTable.TABLE_NAME, "messages", ConversationInboxTable.TABLE_NAME, ConversationTable.TABLE_NAME, FaqsTable.TABLE_NAME);
    }
}
