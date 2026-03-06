package com.helpshift.common.conversation;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.text.TextUtils;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.helpshift.common.dao.DAOResult;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.conversation.activeconversation.message.AcceptedAppReviewMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminActionCardMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminBotControlMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminCSATMessageWithOptions;
import com.helpshift.conversation.activeconversation.message.AdminImageAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminMessageWithOptionInputDM;
import com.helpshift.conversation.activeconversation.message.AdminMessageWithTextInputDM;
import com.helpshift.conversation.activeconversation.message.AdminResolutionMessageWithOptions;
import com.helpshift.conversation.activeconversation.message.AttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.Author;
import com.helpshift.conversation.activeconversation.message.AutoRetriableMessageDM;
import com.helpshift.conversation.activeconversation.message.ConfirmationAcceptedMessageDM;
import com.helpshift.conversation.activeconversation.message.ConfirmationRejectedMessageDM;
import com.helpshift.conversation.activeconversation.message.FAQListMessageDM;
import com.helpshift.conversation.activeconversation.message.FAQListMessageWithOptionInputDM;
import com.helpshift.conversation.activeconversation.message.FollowupAcceptedMessageDM;
import com.helpshift.conversation.activeconversation.message.FollowupRejectedMessageDM;
import com.helpshift.conversation.activeconversation.message.ImageAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.MessageType;
import com.helpshift.conversation.activeconversation.message.RequestAppReviewMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestForReopenMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.ScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.UserAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.UserBotControlMessageDM;
import com.helpshift.conversation.activeconversation.message.UserMessageDM;
import com.helpshift.conversation.activeconversation.message.UserResponseMessageForCSATInput;
import com.helpshift.conversation.activeconversation.message.UserResponseMessageForOptionInput;
import com.helpshift.conversation.activeconversation.message.UserResponseMessageForTextInputDM;
import com.helpshift.conversation.activeconversation.message.UserSmartIntentMessageDM;
import com.helpshift.conversation.activeconversation.message.input.CSATRatingsInput;
import com.helpshift.conversation.activeconversation.message.input.OptionInput;
import com.helpshift.conversation.activeconversation.message.input.TextInput;
import com.helpshift.conversation.activeconversation.model.Action;
import com.helpshift.conversation.activeconversation.model.ActionCard;
import com.helpshift.conversation.activeconversation.model.ActionType;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.dto.AttachmentPickerFile;
import com.helpshift.conversation.dto.IssueState;
import com.helpshift.conversation.dto.dao.ConversationInboxRecord;
import com.helpshift.conversation.states.ConversationCSATState;
import com.helpshift.db.conversation.ConversationDBHelper;
import com.helpshift.db.conversation.ConversationDatabaseContract;
import com.helpshift.db.conversation.tables.ActionCardTable;
import com.helpshift.db.conversation.tables.ActionTable;
import com.helpshift.db.conversation.tables.ConversationInboxTable;
import com.helpshift.db.conversation.tables.ConversationTable;
import com.helpshift.db.conversation.tables.MessagesTable;
import com.helpshift.support.Faq;
import com.helpshift.support.constants.FaqsTable;
import com.helpshift.util.HSJSONUtils;
import com.helpshift.util.HSLogger;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationDB {
    private static final String TAG = "Helpshift_ConverDB";
    private static ConversationDB instance;
    private final ConversationDBHelper dbHelper;
    private final String KEY_CSAT_RATING = "csat_rating";
    private final String KEY_CSAT_STATE = "csat_state";
    private final String KEY_CSAT_FEEDBACK = "csat_feedback";
    private final String KEY_INCREMENT_MESSAGE_COUNT = "increment_message_count";
    private final String KEY_CONVERSATION_ENDED_DELEGATE_SENT = "ended_delegate_sent";
    private final String KEY_IMAGE_ATTACHMENT_DRAFT_ORIGINAL_NAME = "image_draft_orig_name";
    private final String KEY_IMAGE_ATTACHMENT_DRAFT_ORIGINAL_SIZE = "image_draft_orig_size";
    private final String KEY_IMAGE_ATTACHMENT_DRAFT_FILE_PATH = "image_draft_file_path";
    private final String KEY_IMAGE_ATTACHMENT_COMPRESSION_COPYING_DONE = "image_copy_done";
    private final String KEY_IMAGE_ATTACHMENT_TYPE = "attachment_type";
    private final String KEY_IS_AUTO_FILLED_PREISSUE = "is_autofilled_preissue";
    private final String KEY_SMART_INTENT_IDs = "smart_intent_ids";
    private final String KEY_SMART_INTENT_TREE_ID = "smart_intent_tree_id";
    private final String KEY_SMART_INTENT_USER_QUERY = "smart_intent_user_query";
    private final String KEY_REFERRED_MESSAGE_ID = "referredMessageId";
    private final String KEY_FOLLOW_UP_REJECTED_REASON = "rejected_reason";
    private final String KEY_FOLLOW_UP_REJECTED_OPEN_CONVERSATION = "rejected_conv_id";
    private final String KEY_IS_ANSWERED = "is_answered";
    private final String KEY_CONTENT_TYPE = FirebaseAnalytics.Param.CONTENT_TYPE;
    private final String KEY_FILE_NAME = "file_name";
    private final String KEY_URL = "url";
    private final String KEY_SIZE = "size";
    private final String KEY_THUMBNAIL_URL = "thumbnail_url";
    private final String KEY_THUMBNAIL_FILE_PATH = "thumbnailFilePath";
    private final String KEY_FILE_PATH = "filePath";
    private final String KEY_SEEN_AT_MESSAGE_CURSOR = "seen_cursor";
    private final String KEY_SEEN_SYNC_STATUS = "seen_sync_status";
    private final String KEY_READ_AT = "read_at";
    private final String KEY_INPUT_KEYBOARD = "input_keyboard";
    private final String KEY_INPUT_REQUIRED = "input_required";
    private final String KEY_INPUT_SKIP_LABEL = "input_skip_label";
    private final String KEY_INPUT_PLACEHOLDER = "input_placeholder";
    private final String KEY_INPUT_LABEL = "input_label";
    private final String KEY_INPUT_OPTIONS = "input_options";
    private final String KEY_OPTION_TYPE = "option_type";
    private final String KEY_OPTION_TITLE = "option_title";
    private final String KEY_OPTION_DATA = "option_data";
    private final String KEY_CHATBOT_INFO = "chatbot_info";
    private final String KEY_HAS_NEXT_BOT = "has_next_bot";
    private final String KEY_FAQS = "faqs";
    private final String KEY_FAQS_SOURCE = "faq_source";
    private final String KEY_FAQ_TITLE = "faq_title";
    private final String KEY_FAQ_PUBLISH_ID = "faq_publish_id";
    private final String KEY_FAQ_LANGUAGE = "faq_language";
    private final String KEY_IS_RESPONSE_SKIPPED = "is_response_skipped";
    private final String KEY_SELECTED_OPTION_DATA = "selected_option_data";
    private final String KEY_REFERRED_MESSAGE_TYPE = "referred_message_type";
    private final String KEY_BOT_ACTION_TYPE = "bot_action_type";
    private final String KEY_BOT_ENDED_REASON = "bot_ended_reason";
    private final String KEY_MESSAGE_SYNC_STATUS = "message_sync_status";
    private final String KEY_SECURE_ATTACHMENT = "is_secure";
    private final String KEY_IS_USER_ATTACHMENT_ZIPPED = "is_user_attachment_zipped";
    private final String KEY_IS_USER_ATTACHMENT_REJECTED = "is_user_attachment_rejected";
    private final String KEY_IS_MESSAGE_EMPTY = "is_message_empty";
    private final String KEY_IS_SUGGESTION_READ_EVENT_SENT = "is_suggestion_read_event_sent";
    private final String KEY_SUGGESTION_READ_FAQ_PUBLISH_ID = "suggestion_read_faq_publish_id";
    private final String KEY_DATE_TIME = "dt";
    private final String KEY_TIMEZONE_ID = "timezone_id";
    private final String KEY_ATTACHMENT_COUNT = "attachment_count";
    private final String KEY_ORIGINAL_MESSAGE_ID = "original_message_server_id";
    private final String KEY_SMART_INTENT_LABELS = "intent_labels";
    private final String KEY_IS_FEED_BACK_MESSAGE = "is_feedback_message";
    private final String KEY_INPUT_SEND_FEEDBACK_LABEL = "input_send_feedback_label";
    private final String KEY_INPUT_START_CONV_LABEL = "input_start_conv_label";
    private final String KEY_RATING_VALUE = "rating_value";
    private final String KEY_SHOW_NEW_CONV_BUTTON = "show_new_conv_button";
    private final String KEY_NEW_CONV_STARTED_CSAT = "new_conv_started_csat";

    private ConversationDB(Context context) {
        this.dbHelper = new ConversationDBHelper(context, new ConversationDatabaseContract());
    }

    public static synchronized ConversationDB getInstance(Context context) {
        if (instance == null) {
            instance = new ConversationDB(context);
        }
        return instance;
    }

    private static ContentValues faqToContentValues(Faq faq) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("question_id", faq.getId());
        contentValues.put("publish_id", faq.publish_id);
        contentValues.put("language", faq.language);
        contentValues.put("section_id", faq.section_publish_id);
        contentValues.put("title", faq.title);
        contentValues.put("body", faq.body);
        contentValues.put("helpful", Integer.valueOf(faq.is_helpful));
        contentValues.put("rtl", faq.is_rtl);
        contentValues.put("tags", String.valueOf(new JSONArray((Collection) faq.getTags())));
        contentValues.put("c_tags", String.valueOf(new JSONArray((Collection) faq.getCategoryTags())));
        return contentValues;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:25:0x003a A[Catch: all -> 0x003e, TRY_ENTER, TryCatch #4 {, blocks: (B:9:0x0020, B:25:0x003a, B:26:0x003d), top: B:33:0x0002 }] */
    /* JADX WARN: Type inference failed for: r0v0 */
    /* JADX WARN: Type inference failed for: r0v1, types: [android.database.Cursor] */
    /* JADX WARN: Type inference failed for: r0v2 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private synchronized com.helpshift.conversation.activeconversation.model.Conversation readConversation(java.lang.String r11, java.lang.String[] r12) {
        /*
            r10 = this;
            monitor-enter(r10)
            r0 = 0
            com.helpshift.db.conversation.ConversationDBHelper r1 = r10.dbHelper     // Catch: java.lang.Throwable -> L26 java.lang.Exception -> L28
            android.database.sqlite.SQLiteDatabase r2 = r1.getReadableDatabase()     // Catch: java.lang.Throwable -> L26 java.lang.Exception -> L28
            java.lang.String r3 = "issues"
            r4 = 0
            r7 = 0
            r8 = 0
            r9 = 0
            r5 = r11
            r6 = r12
            android.database.Cursor r11 = r2.query(r3, r4, r5, r6, r7, r8, r9)     // Catch: java.lang.Throwable -> L26 java.lang.Exception -> L28
            boolean r12 = r11.moveToFirst()     // Catch: java.lang.Exception -> L24 java.lang.Throwable -> L36
            if (r12 == 0) goto L1e
            com.helpshift.conversation.activeconversation.model.Conversation r0 = r10.cursorToReadableConversation(r11)     // Catch: java.lang.Exception -> L24 java.lang.Throwable -> L36
        L1e:
            if (r11 == 0) goto L34
        L20:
            r11.close()     // Catch: java.lang.Throwable -> L3e
            goto L34
        L24:
            r12 = move-exception
            goto L2a
        L26:
            r12 = move-exception
            goto L38
        L28:
            r12 = move-exception
            r11 = r0
        L2a:
            java.lang.String r1 = "Helpshift_ConverDB"
            java.lang.String r2 = "Error in read conversations with localId"
            com.helpshift.util.HSLogger.e(r1, r2, r12)     // Catch: java.lang.Throwable -> L36
            if (r11 == 0) goto L34
            goto L20
        L34:
            monitor-exit(r10)
            return r0
        L36:
            r12 = move-exception
            r0 = r11
        L38:
            if (r0 == 0) goto L3d
            r0.close()     // Catch: java.lang.Throwable -> L3e
        L3d:
            throw r12     // Catch: java.lang.Throwable -> L3e
        L3e:
            r11 = move-exception
            monitor-exit(r10)
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.common.conversation.ConversationDB.readConversation(java.lang.String, java.lang.String[]):com.helpshift.conversation.activeconversation.model.Conversation");
    }

    public synchronized DAOResult<List<Conversation>> readConversationsWithLocalId(long j) {
        ArrayList arrayList;
        arrayList = new ArrayList();
        Cursor cursorQuery = null;
        try {
            try {
                cursorQuery = this.dbHelper.getReadableDatabase().query(ConversationTable.TABLE_NAME, null, "user_local_id = ?", new String[]{String.valueOf(j)}, null, null, null);
                if (cursorQuery.moveToFirst()) {
                    do {
                        arrayList.add(cursorToReadableConversation(cursorQuery));
                    } while (cursorQuery.moveToNext());
                }
                if (cursorQuery != null) {
                    cursorQuery.close();
                }
            } catch (Exception e) {
                HSLogger.e(TAG, "Error in read conversations with localId", e);
                DAOResult<List<Conversation>> dAOResult = new DAOResult<>(false, arrayList);
                if (cursorQuery != null) {
                    cursorQuery.close();
                }
                return dAOResult;
            }
        } catch (Throwable th) {
            if (cursorQuery != null) {
                cursorQuery.close();
            }
            throw th;
        }
        return new DAOResult<>(true, arrayList);
    }

    public synchronized Conversation readConversationWithLocalId(Long l) {
        return readConversation("_id = ?", new String[]{String.valueOf(l)});
    }

    public synchronized void deleteConversationWithLocalId(long j) {
        String str;
        String str2;
        String[] strArr = {String.valueOf(j)};
        SQLiteDatabase writableDatabase = null;
        try {
            try {
                writableDatabase = this.dbHelper.getWritableDatabase();
                writableDatabase.beginTransaction();
                writableDatabase.delete(ConversationTable.TABLE_NAME, "_id = ?", strArr);
                writableDatabase.delete("messages", "conversation_id = ?", strArr);
                writableDatabase.setTransactionSuccessful();
                if (writableDatabase != null) {
                    try {
                        writableDatabase.endTransaction();
                    } catch (Exception e) {
                        e = e;
                        str = TAG;
                        str2 = "Exception in ending transaction deleteConversationWithLocalId : " + j;
                        HSLogger.e(str, str2, e);
                    }
                }
            } catch (Exception e2) {
                HSLogger.e(TAG, "Error in delete conversation with localId", e2);
                if (writableDatabase != null) {
                    try {
                        writableDatabase.endTransaction();
                    } catch (Exception e3) {
                        e = e3;
                        str = TAG;
                        str2 = "Exception in ending transaction deleteConversationWithLocalId : " + j;
                        HSLogger.e(str, str2, e);
                    }
                }
            }
        } finally {
        }
    }

    public synchronized Conversation readConversationWithServerId(String str) {
        return readConversation("server_id = ?", new String[]{String.valueOf(str)});
    }

    public synchronized Conversation readPreConversationWithServerId(String str) {
        return readConversation("pre_conv_server_id = ?", new String[]{String.valueOf(str)});
    }

    public synchronized long insertConversation(Conversation conversation) {
        long jInsert;
        jInsert = -1;
        try {
            jInsert = this.dbHelper.getWritableDatabase().insert(ConversationTable.TABLE_NAME, null, readableConversationToContentValues(conversation));
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in insert conversation", e);
        }
        return jInsert;
    }

    public synchronized DAOResult<List<Long>> insertConversations(List<Conversation> list) {
        SQLiteDatabase writableDatabase;
        SQLiteDatabase sQLiteDatabase = null;
        if (list.size() == 0) {
            return new DAOResult<>(true, null);
        }
        ArrayList arrayList = new ArrayList();
        Iterator<Conversation> it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(readableConversationToContentValues(it.next()));
        }
        ArrayList arrayList2 = new ArrayList();
        try {
            try {
                writableDatabase = this.dbHelper.getWritableDatabase();
            } catch (Exception e) {
                e = e;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            writableDatabase.beginTransaction();
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                arrayList2.add(Long.valueOf(writableDatabase.insert(ConversationTable.TABLE_NAME, null, (ContentValues) it2.next())));
            }
            writableDatabase.setTransactionSuccessful();
            if (writableDatabase != null) {
                try {
                    writableDatabase.endTransaction();
                } catch (Exception e2) {
                    HSLogger.e(TAG, "Error in insert conversations inside finally block", e2);
                }
            }
            return new DAOResult<>(true, arrayList2);
        } catch (Exception e3) {
            e = e3;
            sQLiteDatabase = writableDatabase;
            HSLogger.e(TAG, "Error in insert conversations", e);
            DAOResult<List<Long>> dAOResult = new DAOResult<>(false, arrayList2);
            if (sQLiteDatabase != null) {
                try {
                    sQLiteDatabase.endTransaction();
                } catch (Exception e4) {
                    HSLogger.e(TAG, "Error in insert conversations inside finally block", e4);
                }
            }
            return dAOResult;
        } catch (Throwable th2) {
            th = th2;
            sQLiteDatabase = writableDatabase;
            if (sQLiteDatabase != null) {
                try {
                    sQLiteDatabase.endTransaction();
                } catch (Exception e5) {
                    HSLogger.e(TAG, "Error in insert conversations inside finally block", e5);
                }
            }
            throw th;
        }
    }

    public synchronized void updateConversation(Conversation conversation) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(conversation);
        updateConversations(arrayList);
    }

    public synchronized void updateLastUserActivityTimeInConversation(Long l, long j) {
        ContentValues contentValues = new ContentValues();
        contentValues.put(ConversationTable.Columns.LAST_USER_ACTIVITY_TIME, Long.valueOf(j));
        try {
            this.dbHelper.getWritableDatabase().update(ConversationTable.TABLE_NAME, contentValues, "_id = ?", new String[]{String.valueOf(l)});
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in updateLastUserActivityTimeInConversation", e);
        }
    }

    public synchronized boolean updateConversations(List<Conversation> list) {
        if (list.size() == 0) {
            return true;
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (Conversation conversation : list) {
            arrayList.add(readableConversationToContentValues(conversation));
            arrayList2.add(new String[]{String.valueOf(conversation.localId)});
        }
        SQLiteDatabase writableDatabase = null;
        try {
            try {
                writableDatabase = this.dbHelper.getWritableDatabase();
                writableDatabase.beginTransaction();
                for (int i = 0; i < list.size(); i++) {
                    writableDatabase.update(ConversationTable.TABLE_NAME, (ContentValues) arrayList.get(i), "_id = ?", (String[]) arrayList2.get(i));
                }
                writableDatabase.setTransactionSuccessful();
                return true;
            } finally {
                if (writableDatabase != null) {
                    try {
                        writableDatabase.endTransaction();
                    } catch (Exception e) {
                        HSLogger.e(TAG, "Error in update conversations inside finally block", e);
                    }
                }
            }
        } catch (Exception e2) {
            HSLogger.e(TAG, "Error in update conversations", e2);
            if (writableDatabase != null) {
                try {
                    writableDatabase.endTransaction();
                } catch (Exception e3) {
                    HSLogger.e(TAG, "Error in update conversations inside finally block", e3);
                }
            }
            return false;
        }
    }

    public synchronized ConversationInboxRecord storeConversationInboxRecord(ConversationInboxRecord conversationInboxRecord) {
        String[] strArr = {String.valueOf(conversationInboxRecord.userLocalId)};
        ContentValues contentValuesConversationInboxRecordToContentValues = conversationInboxRecordToContentValues(conversationInboxRecord);
        try {
            SQLiteDatabase writableDatabase = this.dbHelper.getWritableDatabase();
            if (exists(writableDatabase, ConversationInboxTable.TABLE_NAME, "user_local_id = ?", strArr)) {
                writableDatabase.update(ConversationInboxTable.TABLE_NAME, contentValuesConversationInboxRecordToContentValues, "user_local_id = ?", strArr);
            } else {
                writableDatabase.insert(ConversationInboxTable.TABLE_NAME, null, contentValuesConversationInboxRecordToContentValues);
            }
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in store conversation inbox record", e);
        }
        return conversationInboxRecord;
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0046 A[Catch: all -> 0x004a, TRY_ENTER, TryCatch #3 {, blocks: (B:3:0x0001, B:10:0x002a, B:25:0x0046, B:26:0x0049), top: B:33:0x0001 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized com.helpshift.conversation.dto.dao.ConversationInboxRecord readConversationInboxRecord(long r10) {
        /*
            r9 = this;
            monitor-enter(r9)
            java.lang.String r3 = "user_local_id = ?"
            r0 = 1
            java.lang.String[] r4 = new java.lang.String[r0]     // Catch: java.lang.Throwable -> L4a
            r0 = 0
            java.lang.String r10 = java.lang.String.valueOf(r10)     // Catch: java.lang.Throwable -> L4a
            r4[r0] = r10     // Catch: java.lang.Throwable -> L4a
            r10 = 0
            com.helpshift.db.conversation.ConversationDBHelper r11 = r9.dbHelper     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L35
            android.database.sqlite.SQLiteDatabase r0 = r11.getReadableDatabase()     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L35
            java.lang.String r1 = "conversation_inbox"
            r2 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r11 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L35
            boolean r0 = r11.moveToFirst()     // Catch: java.lang.Exception -> L2e java.lang.Throwable -> L43
            if (r0 == 0) goto L28
            com.helpshift.conversation.dto.dao.ConversationInboxRecord r10 = r9.cursorToConversationInboxRecord(r11)     // Catch: java.lang.Exception -> L2e java.lang.Throwable -> L43
        L28:
            if (r11 == 0) goto L41
        L2a:
            r11.close()     // Catch: java.lang.Throwable -> L4a
            goto L41
        L2e:
            r0 = move-exception
            goto L37
        L30:
            r11 = move-exception
            r8 = r11
            r11 = r10
            r10 = r8
            goto L44
        L35:
            r0 = move-exception
            r11 = r10
        L37:
            java.lang.String r1 = "Helpshift_ConverDB"
            java.lang.String r2 = "Error in read conversation inbox record"
            com.helpshift.util.HSLogger.e(r1, r2, r0)     // Catch: java.lang.Throwable -> L43
            if (r11 == 0) goto L41
            goto L2a
        L41:
            monitor-exit(r9)
            return r10
        L43:
            r10 = move-exception
        L44:
            if (r11 == 0) goto L49
            r11.close()     // Catch: java.lang.Throwable -> L4a
        L49:
            throw r10     // Catch: java.lang.Throwable -> L4a
        L4a:
            r10 = move-exception
            monitor-exit(r9)
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.common.conversation.ConversationDB.readConversationInboxRecord(long):com.helpshift.conversation.dto.dao.ConversationInboxRecord");
    }

    public synchronized long insertMessage(MessageDM messageDM) {
        long jInsertMessageInternal;
        String str;
        String str2;
        jInsertMessageInternal = -1;
        ContentValues contentValues = readableMessageToContentValues(messageDM);
        SQLiteDatabase writableDatabase = null;
        try {
            try {
                writableDatabase = this.dbHelper.getWritableDatabase();
                writableDatabase.beginTransaction();
                jInsertMessageInternal = insertMessageInternal(writableDatabase, messageDM, contentValues);
                writableDatabase.setTransactionSuccessful();
                if (writableDatabase != null) {
                    try {
                        writableDatabase.endTransaction();
                    } catch (Exception e) {
                        e = e;
                        str = TAG;
                        str2 = "Error in insert message inside finally block";
                        HSLogger.e(str, str2, e);
                    }
                }
            } catch (Exception e2) {
                HSLogger.e(TAG, "Error in insert message", e2);
                if (writableDatabase != null) {
                    try {
                        writableDatabase.endTransaction();
                    } catch (Exception e3) {
                        e = e3;
                        str = TAG;
                        str2 = "Error in insert message inside finally block";
                        HSLogger.e(str, str2, e);
                    }
                }
            }
        } finally {
        }
        return jInsertMessageInternal;
    }

    public synchronized DAOResult<List<Long>> insertMessages(List<MessageDM> list) {
        SQLiteDatabase writableDatabase = null;
        if (list.isEmpty()) {
            return new DAOResult<>(true, null);
        }
        ArrayList arrayList = new ArrayList();
        Iterator<MessageDM> it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(readableMessageToContentValues(it.next()));
        }
        ArrayList arrayList2 = new ArrayList();
        try {
            try {
                writableDatabase = this.dbHelper.getWritableDatabase();
                writableDatabase.beginTransaction();
                int size = list.size();
                for (int i = 0; i < size; i++) {
                    arrayList2.add(Long.valueOf(insertMessageInternal(writableDatabase, list.get(i), (ContentValues) arrayList.get(i))));
                }
                writableDatabase.setTransactionSuccessful();
                return new DAOResult<>(true, arrayList2);
            } finally {
                if (0 != 0) {
                    try {
                        writableDatabase.endTransaction();
                    } catch (Exception e) {
                        HSLogger.e(TAG, "Error in insert messages inside finally block", e);
                    }
                }
            }
        } catch (Exception e2) {
            HSLogger.e(TAG, "Error in insert messages", e2);
            DAOResult<List<Long>> dAOResult = new DAOResult<>(false, arrayList2);
            if (writableDatabase != null) {
                try {
                    writableDatabase.endTransaction();
                } catch (Exception e3) {
                    HSLogger.e(TAG, "Error in insert messages inside finally block", e3);
                }
            }
            return dAOResult;
        }
    }

    private long insertMessageInternal(SQLiteDatabase sQLiteDatabase, MessageDM messageDM, ContentValues contentValues) {
        long jInsert = sQLiteDatabase.insert("messages", null, contentValues);
        if (messageDM.messageType == MessageType.ADMIN_ACTION_CARD) {
            insertActionCard(sQLiteDatabase, (AdminActionCardMessageDM) messageDM);
        }
        return jInsert;
    }

    private void insertActionCard(SQLiteDatabase sQLiteDatabase, AdminActionCardMessageDM adminActionCardMessageDM) {
        try {
            long jInsert = sQLiteDatabase.insert(ActionCardTable.TABLE_NAME, null, actionCardToContentValues(adminActionCardMessageDM.actionCard, adminActionCardMessageDM.serverId));
            adminActionCardMessageDM.actionCard.actionCardLocalId = Long.valueOf(jInsert);
            long jInsert2 = sQLiteDatabase.insert("actions", null, actionToContentValues(adminActionCardMessageDM.actionCard.action, jInsert));
            adminActionCardMessageDM.actionCard.action.actionLocalId = Long.valueOf(jInsert2);
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in insert action card", e);
        }
    }

    private ContentValues actionCardToContentValues(ActionCard actionCard, String str) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("message_id", str);
        contentValues.put("title", actionCard.title);
        contentValues.put(ActionCardTable.Columns.IMAGE_URL, actionCard.imageUrl);
        contentValues.put(ActionCardTable.Columns.IS_IMAGE_SECURE, Integer.valueOf(actionCard.isSecure ? 1 : 0));
        contentValues.put(ActionCardTable.Columns.FILE_PATH, actionCard.filePath);
        return contentValues;
    }

    private ContentValues actionToContentValues(Action action, long j) {
        ContentValues contentValues = new ContentValues();
        contentValues.put(ActionTable.Columns.ACTION_CARD_ID, Long.valueOf(j));
        contentValues.put(ActionTable.Columns.ACTION_SHA, action.actionSHA);
        contentValues.put(ActionTable.Columns.TITLE, action.actionTitle);
        contentValues.put("action_type", action.actionType.getValue());
        contentValues.put(ActionTable.Columns.DATA, new JSONObject(action.actionData).toString());
        return contentValues;
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x009f A[Catch: all -> 0x0110, TRY_ENTER, TryCatch #1 {, blocks: (B:3:0x0001, B:32:0x009f, B:34:0x00a5, B:35:0x00a8, B:76:0x0102, B:82:0x010f, B:78:0x0108, B:79:0x010b, B:57:0x00da, B:59:0x00e0, B:60:0x00e3, B:23:0x0089, B:25:0x008f, B:30:0x0096, B:67:0x00ec, B:69:0x00f2, B:74:0x00f9, B:48:0x00c4, B:50:0x00ca, B:55:0x00d1), top: B:88:0x0001, inners: #2, #3, #10 }] */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00da A[Catch: all -> 0x0110, TRY_ENTER, TryCatch #1 {, blocks: (B:3:0x0001, B:32:0x009f, B:34:0x00a5, B:35:0x00a8, B:76:0x0102, B:82:0x010f, B:78:0x0108, B:79:0x010b, B:57:0x00da, B:59:0x00e0, B:60:0x00e3, B:23:0x0089, B:25:0x008f, B:30:0x0096, B:67:0x00ec, B:69:0x00f2, B:74:0x00f9, B:48:0x00c4, B:50:0x00ca, B:55:0x00d1), top: B:88:0x0001, inners: #2, #3, #10 }] */
    /* JADX WARN: Removed duplicated region for block: B:80:0x010c  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x010e  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x00ec A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized java.util.List<com.helpshift.conversation.activeconversation.message.MessageDM> readMessagesForConversations(java.util.Collection<java.lang.Long> r13) {
        /*
            Method dump skipped, instruction units count: 275
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.common.conversation.ConversationDB.readMessagesForConversations(java.util.Collection):java.util.List");
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x0120 A[Catch: all -> 0x018f, TRY_ENTER, TryCatch #11 {, blocks: (B:3:0x0001, B:4:0x000a, B:6:0x0010, B:35:0x0120, B:37:0x0126, B:38:0x0129, B:79:0x0181, B:85:0x018e, B:81:0x0187, B:82:0x018a, B:60:0x0159, B:62:0x015f, B:63:0x0162, B:26:0x010a, B:28:0x0110, B:33:0x0117, B:70:0x016b, B:72:0x0171, B:77:0x0178, B:51:0x0143, B:53:0x0149, B:58:0x0150), top: B:100:0x0001, inners: #1, #2, #8 }] */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0159 A[Catch: all -> 0x018f, TRY_ENTER, TryCatch #11 {, blocks: (B:3:0x0001, B:4:0x000a, B:6:0x0010, B:35:0x0120, B:37:0x0126, B:38:0x0129, B:79:0x0181, B:85:0x018e, B:81:0x0187, B:82:0x018a, B:60:0x0159, B:62:0x015f, B:63:0x0162, B:26:0x010a, B:28:0x0110, B:33:0x0117, B:70:0x016b, B:72:0x0171, B:77:0x0178, B:51:0x0143, B:53:0x0149, B:58:0x0150), top: B:100:0x0001, inners: #1, #2, #8 }] */
    /* JADX WARN: Removed duplicated region for block: B:83:0x018b  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x018d  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x016b A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized java.util.Map<java.lang.Long, java.lang.Integer> getMessagesCountForConversations(java.util.List<java.lang.Long> r13, java.lang.String[] r14) {
        /*
            Method dump skipped, instruction units count: 402
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.common.conversation.ConversationDB.getMessagesCountForConversations(java.util.List, java.lang.String[]):java.util.Map");
    }

    public synchronized DAOResult<List<MessageDM>> readMessages(long j) {
        return readMessages("conversation_id = ?", new String[]{String.valueOf(j)});
    }

    public synchronized List<MessageDM> readMessages(long j, MessageType messageType) {
        return readMessages("conversation_id = ? AND type = ?", new String[]{String.valueOf(j), messageType.getValue()}).getData();
    }

    private DAOResult<List<MessageDM>> readMessages(String str, String[] strArr) {
        ArrayList arrayList = new ArrayList();
        Cursor cursorQuery = null;
        try {
            try {
                cursorQuery = this.dbHelper.getReadableDatabase().query("messages", null, str, strArr, null, null, null);
                if (cursorQuery.moveToFirst()) {
                    do {
                        MessageDM messageDMCursorToMessageDM = cursorToMessageDM(cursorQuery);
                        if (messageDMCursorToMessageDM != null) {
                            arrayList.add(messageDMCursorToMessageDM);
                        }
                    } while (cursorQuery.moveToNext());
                }
                if (cursorQuery != null) {
                    cursorQuery.close();
                }
                return new DAOResult<>(true, arrayList);
            } catch (Exception e) {
                HSLogger.e(TAG, "Error in read messages", e);
                DAOResult<List<MessageDM>> dAOResult = new DAOResult<>(false, arrayList);
                if (cursorQuery != null) {
                    cursorQuery.close();
                }
                return dAOResult;
            }
        } catch (Throwable th) {
            if (cursorQuery != null) {
                cursorQuery.close();
            }
            throw th;
        }
    }

    public synchronized void updateMessage(MessageDM messageDM) {
        String str;
        String str2;
        String[] strArr = {String.valueOf(messageDM.localId)};
        SQLiteDatabase writableDatabase = null;
        try {
            try {
                writableDatabase = this.dbHelper.getWritableDatabase();
                writableDatabase.beginTransaction();
                updateMessageInternal(writableDatabase, messageDM, "_id = ?", strArr);
                writableDatabase.setTransactionSuccessful();
                if (writableDatabase != null) {
                    try {
                        writableDatabase.endTransaction();
                    } catch (Exception e) {
                        e = e;
                        str = TAG;
                        str2 = "Error in update message inside finally block";
                        HSLogger.e(str, str2, e);
                    }
                }
            } catch (Exception e2) {
                HSLogger.e(TAG, "Error in update message", e2);
                if (writableDatabase != null) {
                    try {
                        writableDatabase.endTransaction();
                    } catch (Exception e3) {
                        e = e3;
                        str = TAG;
                        str2 = "Error in update message inside finally block";
                        HSLogger.e(str, str2, e);
                    }
                }
            }
        } finally {
        }
    }

    public synchronized boolean updateMessages(List<MessageDM> list) {
        if (list.size() == 0) {
            return true;
        }
        SQLiteDatabase writableDatabase = null;
        try {
            try {
                writableDatabase = this.dbHelper.getWritableDatabase();
                writableDatabase.beginTransaction();
                for (MessageDM messageDM : list) {
                    updateMessageInternal(writableDatabase, messageDM, "_id = ?", new String[]{String.valueOf(messageDM.localId)});
                }
                writableDatabase.setTransactionSuccessful();
                return true;
            } catch (Exception e) {
                HSLogger.e(TAG, "Error in update messages", e);
                if (writableDatabase != null) {
                    try {
                        writableDatabase.endTransaction();
                    } catch (Exception e2) {
                        HSLogger.e(TAG, "Error in update messages", e2);
                    }
                }
                return false;
            }
        } finally {
            if (writableDatabase != null) {
                try {
                    writableDatabase.endTransaction();
                } catch (Exception e3) {
                    HSLogger.e(TAG, "Error in update messages", e3);
                }
            }
        }
    }

    private void updateMessageInternal(SQLiteDatabase sQLiteDatabase, MessageDM messageDM, String str, String[] strArr) {
        sQLiteDatabase.update("messages", readableMessageToContentValues(messageDM), str, strArr);
        if (messageDM.messageType == MessageType.ADMIN_ACTION_CARD) {
            updateActionCard(sQLiteDatabase, (AdminActionCardMessageDM) messageDM);
        }
    }

    private void updateActionCard(SQLiteDatabase sQLiteDatabase, AdminActionCardMessageDM adminActionCardMessageDM) {
        if (adminActionCardMessageDM.actionCard.actionCardLocalId == null) {
            insertActionCard(sQLiteDatabase, adminActionCardMessageDM);
            return;
        }
        try {
            sQLiteDatabase.update(ActionCardTable.TABLE_NAME, actionCardToContentValues(adminActionCardMessageDM.actionCard, adminActionCardMessageDM.serverId), "_id = ?", new String[]{String.valueOf(adminActionCardMessageDM.actionCard.actionCardLocalId)});
            sQLiteDatabase.update("actions", actionToContentValues(adminActionCardMessageDM.actionCard.action, adminActionCardMessageDM.actionCard.actionCardLocalId.longValue()), "_id = ?", new String[]{String.valueOf(adminActionCardMessageDM.actionCard.action.actionLocalId)});
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in update action card", e);
        }
    }

    public synchronized boolean deleteMessagesForConversation(long j) {
        try {
            this.dbHelper.getWritableDatabase().delete("messages", "conversation_id= ? ", new String[]{String.valueOf(j)});
        } catch (Exception e) {
            HSLogger.e(TAG, "Error deleting messages for : " + j, e);
            return false;
        }
        return true;
    }

    private boolean exists(SQLiteDatabase sQLiteDatabase, String str, String str2, String[] strArr) {
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT COUNT(*) FROM ");
        sb.append(str);
        sb.append(" WHERE ");
        sb.append(str2);
        sb.append(" LIMIT 1");
        return DatabaseUtils.longForQuery(sQLiteDatabase, sb.toString(), strArr) > 0;
    }

    private ConversationInboxRecord cursorToConversationInboxRecord(Cursor cursor) {
        return new ConversationInboxRecord(cursor.getLong(cursor.getColumnIndex("user_local_id")), cursor.getString(cursor.getColumnIndex(ConversationInboxTable.Columns.FORM_NAME)), cursor.getString(cursor.getColumnIndex(ConversationInboxTable.Columns.FORM_EMAIL)), cursor.getString(cursor.getColumnIndex(ConversationInboxTable.Columns.DESCRIPTION_DRAFT)), cursor.getLong(cursor.getColumnIndex(ConversationInboxTable.Columns.DESCRIPTION_DRAFT_TIMESTAMP)), parseAndGetImageAttachmentDraft(cursor.getString(cursor.getColumnIndex(ConversationInboxTable.Columns.ATTACHMENT_DRAFT))), cursor.getInt(cursor.getColumnIndex(ConversationInboxTable.Columns.DESCRIPTION_TYPE)), cursor.getString(cursor.getColumnIndex(ConversationInboxTable.Columns.ARCHIVAL_TEXT)), cursor.getString(cursor.getColumnIndex(ConversationInboxTable.Columns.REPLY_TEXT)), cursor.getInt(cursor.getColumnIndex(ConversationInboxTable.Columns.PERSIST_MESSAGE_BOX)) == 1, cursor.getString(cursor.getColumnIndex(ConversationInboxTable.Columns.LAST_SYNC_TIMESTAMP)), com.helpshift.util.DatabaseUtils.parseBooleanColumnSafe(cursor, "has_older_messages"), (Long) com.helpshift.util.DatabaseUtils.parseColumnSafe(cursor, "last_conv_redaction_time", Long.class));
    }

    private ContentValues conversationInboxRecordToContentValues(ConversationInboxRecord conversationInboxRecord) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("user_local_id", Long.valueOf(conversationInboxRecord.userLocalId));
        contentValues.put(ConversationInboxTable.Columns.FORM_NAME, conversationInboxRecord.formName);
        contentValues.put(ConversationInboxTable.Columns.FORM_EMAIL, conversationInboxRecord.formEmail);
        contentValues.put(ConversationInboxTable.Columns.DESCRIPTION_DRAFT, conversationInboxRecord.description);
        contentValues.put(ConversationInboxTable.Columns.DESCRIPTION_DRAFT_TIMESTAMP, Long.valueOf(conversationInboxRecord.descriptionTimeStamp));
        contentValues.put(ConversationInboxTable.Columns.DESCRIPTION_TYPE, Integer.valueOf(conversationInboxRecord.descriptionType));
        contentValues.put(ConversationInboxTable.Columns.ARCHIVAL_TEXT, conversationInboxRecord.archivalText);
        contentValues.put(ConversationInboxTable.Columns.REPLY_TEXT, conversationInboxRecord.replyText);
        contentValues.put(ConversationInboxTable.Columns.PERSIST_MESSAGE_BOX, Integer.valueOf(conversationInboxRecord.persistMessageBox ? 1 : 0));
        contentValues.put(ConversationInboxTable.Columns.LAST_SYNC_TIMESTAMP, conversationInboxRecord.lastSyncTimestamp);
        if (conversationInboxRecord.hasOlderMessages != null) {
            contentValues.put("has_older_messages", Integer.valueOf(conversationInboxRecord.hasOlderMessages.booleanValue() ? 1 : 0));
        }
        contentValues.put("last_conv_redaction_time", conversationInboxRecord.lastConversationsRedactionTime);
        try {
            contentValues.put(ConversationInboxTable.Columns.ATTACHMENT_DRAFT, getImageAttachmentDraftMeta(conversationInboxRecord.imageAttachmentDraft));
        } catch (JSONException e) {
            HSLogger.e(TAG, "Error in generating meta string for image attachment", e);
        }
        return contentValues;
    }

    private ContentValues readableConversationToContentValues(Conversation conversation) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("user_local_id", Long.valueOf(conversation.userLocalId));
        contentValues.put("server_id", conversation.serverId);
        contentValues.put(ConversationTable.Columns.PRE_CONVERSATION_SERVER_ID, conversation.preConversationServerId);
        contentValues.put("publish_id", conversation.publishId);
        contentValues.put(ConversationTable.Columns.LOCAL_UUID, conversation.localUUID);
        contentValues.put("title", conversation.title);
        contentValues.put(ConversationTable.Columns.MESSAGE_CURSOR, conversation.messageCursor);
        contentValues.put(ConversationTable.Columns.IS_START_NEW_CONVERSATION_CLICKED, Integer.valueOf(conversation.isStartNewConversationClicked ? 1 : 0));
        contentValues.put("created_at", conversation.getCreatedAt());
        contentValues.put(ConversationTable.Columns.UPDATED_AT, conversation.updatedAt);
        contentValues.put("epoch_time_created_at", Long.valueOf(conversation.getEpochCreatedAtTime()));
        contentValues.put(ConversationTable.Columns.LAST_USER_ACTIVITY_TIME, Long.valueOf(conversation.lastUserActivityTime));
        contentValues.put(ConversationTable.Columns.ISSUE_TYPE, conversation.issueType);
        contentValues.put(ConversationTable.Columns.FULL_PRIVACY_ENABLED, Integer.valueOf(conversation.wasFullPrivacyEnabledAtCreation ? 1 : 0));
        contentValues.put("state", Integer.valueOf(conversation.state == null ? -1 : conversation.state.getValue()));
        contentValues.put("is_redacted", Integer.valueOf(conversation.isRedacted ? 1 : 0));
        contentValues.put("acid", conversation.acid);
        contentValues.put(ConversationTable.Columns.RESOLUTION_EXPIRY_AT, conversation.resolutionExpiryAt);
        contentValues.put(ConversationTable.Columns.CSAT_EXPIRY_AT, conversation.csatExpiryAt);
        contentValues.put(ConversationTable.Columns.FEEDBACK_BOT_ENABLED, Integer.valueOf(conversation.isFeedbackBotEnabled ? 1 : 0));
        contentValues.put(ConversationTable.Columns.CAN_START_NEW_CONVERSATION, Integer.valueOf(conversation.shouldAllowNewConversationCreation ? 1 : 0));
        try {
            contentValues.put("meta", getConversationMeta(conversation));
        } catch (JSONException e) {
            HSLogger.e(TAG, "Error in generating meta string for conversation", e);
        }
        return contentValues;
    }

    private String getImageAttachmentDraftMeta(AttachmentPickerFile attachmentPickerFile) throws JSONException {
        if (attachmentPickerFile == null) {
            return null;
        }
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("image_draft_orig_name", attachmentPickerFile.originalFileName);
        jSONObject.put("image_draft_orig_size", attachmentPickerFile.originalFileSize);
        jSONObject.put("image_draft_file_path", attachmentPickerFile.filePath);
        jSONObject.put("attachment_type", attachmentPickerFile.attachmentType);
        jSONObject.put("image_copy_done", attachmentPickerFile.isFileCompressionAndCopyingDone);
        return jSONObject.toString();
    }

    private String getConversationMeta(Conversation conversation) throws JSONException {
        ConversationCSATState conversationCSATState = conversation.csatState;
        JSONObject jSONObject = new JSONObject();
        String str = conversation.csatFeedback;
        int i = conversation.csatRating;
        jSONObject.put("csat_feedback", str);
        jSONObject.put("csat_rating", i);
        jSONObject.put("csat_state", conversationCSATState.getValue());
        jSONObject.put("increment_message_count", conversation.shouldIncrementMessageCount);
        jSONObject.put("ended_delegate_sent", conversation.isConversationEndedDelegateSent);
        jSONObject.put("is_autofilled_preissue", conversation.isAutoFilledPreIssue);
        if (StringUtils.isNotEmpty(conversation.smartIntentTreeId)) {
            jSONObject.put("smart_intent_tree_id", conversation.smartIntentTreeId);
        }
        if (StringUtils.isNotEmpty(conversation.smartIntentUserQuery)) {
            jSONObject.put("smart_intent_user_query", conversation.smartIntentUserQuery);
        }
        JSONArray jSONArrayListToJsonArray = HSJSONUtils.listToJsonArray(conversation.smartIntentIds);
        String string = jSONArrayListToJsonArray != null ? jSONArrayListToJsonArray.toString() : null;
        if (StringUtils.isNotEmpty(string)) {
            jSONObject.put("smart_intent_ids", string);
        }
        return jSONObject.toString();
    }

    private Conversation cursorToReadableConversation(Cursor cursor) {
        Long lValueOf = Long.valueOf(cursor.getLong(cursor.getColumnIndex("_id")));
        long j = cursor.getLong(cursor.getColumnIndex("user_local_id"));
        String string = cursor.getString(cursor.getColumnIndex("server_id"));
        String string2 = cursor.getString(cursor.getColumnIndex("publish_id"));
        String string3 = cursor.getString(cursor.getColumnIndex(ConversationTable.Columns.LOCAL_UUID));
        String string4 = cursor.getString(cursor.getColumnIndex("title"));
        String string5 = cursor.getString(cursor.getColumnIndex(ConversationTable.Columns.MESSAGE_CURSOR));
        boolean z = cursor.getInt(cursor.getColumnIndex(ConversationTable.Columns.IS_START_NEW_CONVERSATION_CLICKED)) == 1;
        String string6 = cursor.getString(cursor.getColumnIndex("meta"));
        String string7 = cursor.getString(cursor.getColumnIndex("created_at"));
        long j2 = cursor.getLong(cursor.getColumnIndex("epoch_time_created_at"));
        String string8 = cursor.getString(cursor.getColumnIndex(ConversationTable.Columns.UPDATED_AT));
        String string9 = cursor.getString(cursor.getColumnIndex(ConversationTable.Columns.PRE_CONVERSATION_SERVER_ID));
        long j3 = cursor.getLong(cursor.getColumnIndex(ConversationTable.Columns.LAST_USER_ACTIVITY_TIME));
        String string10 = cursor.getString(cursor.getColumnIndex(ConversationTable.Columns.ISSUE_TYPE));
        boolean booleanColumnSafe = com.helpshift.util.DatabaseUtils.parseBooleanColumnSafe(cursor, ConversationTable.Columns.FULL_PRIVACY_ENABLED, false);
        IssueState issueStateFromInt = IssueState.fromInt(cursor.getInt(cursor.getColumnIndex("state")));
        boolean booleanColumnSafe2 = com.helpshift.util.DatabaseUtils.parseBooleanColumnSafe(cursor, "is_redacted", false);
        String string11 = cursor.getString(cursor.getColumnIndex("acid"));
        Long l = (Long) com.helpshift.util.DatabaseUtils.parseColumnSafe(cursor, ConversationTable.Columns.RESOLUTION_EXPIRY_AT, Long.class);
        Long l2 = (Long) com.helpshift.util.DatabaseUtils.parseColumnSafe(cursor, ConversationTable.Columns.CSAT_EXPIRY_AT, Long.class);
        boolean z2 = cursor.getInt(cursor.getColumnIndex(ConversationTable.Columns.FEEDBACK_BOT_ENABLED)) == 1;
        boolean z3 = cursor.getInt(cursor.getColumnIndex(ConversationTable.Columns.CAN_START_NEW_CONVERSATION)) == 1;
        Conversation conversation = new Conversation(string4, issueStateFromInt, string7, j2, string8, string2, string5, string10, string11);
        conversation.serverId = string;
        conversation.preConversationServerId = string9;
        conversation.setLocalId(lValueOf.longValue());
        conversation.localUUID = string3;
        conversation.state = issueStateFromInt;
        conversation.userLocalId = j;
        conversation.isStartNewConversationClicked = z;
        conversation.lastUserActivityTime = j3;
        conversation.wasFullPrivacyEnabledAtCreation = booleanColumnSafe;
        conversation.isRedacted = booleanColumnSafe2;
        conversation.acid = string11;
        conversation.resolutionExpiryAt = l;
        conversation.csatExpiryAt = l2;
        conversation.isFeedbackBotEnabled = z2;
        conversation.shouldAllowNewConversationCreation = z3;
        parseAndSetMetaData(conversation, string6);
        return conversation;
    }

    private ContentValues readableMessageToContentValues(MessageDM messageDM) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("server_id", messageDM.serverId);
        contentValues.put(MessagesTable.Columns.CONVERSATION_ID, messageDM.conversationLocalId);
        contentValues.put("body", messageDM.body);
        contentValues.put("created_at", messageDM.getCreatedAt());
        contentValues.put("epoch_time_created_at", Long.valueOf(messageDM.getEpochCreatedAtTime()));
        contentValues.put("type", messageDM.messageType.getValue());
        contentValues.put(MessagesTable.Columns.DELIVERY_STATE, Integer.valueOf(messageDM.deliveryState));
        contentValues.put("is_redacted", Integer.valueOf(messageDM.isRedacted ? 1 : 0));
        Author author = messageDM.author;
        contentValues.put(MessagesTable.Columns.AUTHOR_NAME, author.authorName);
        contentValues.put(MessagesTable.Columns.AUTHOR_ID, author.authorId);
        contentValues.put(MessagesTable.Columns.AUTHOR_ROLE, author.role != null ? author.role.getValue() : null);
        contentValues.put(MessagesTable.Columns.AVATAR_IMAGE_LOCAL_PATH, author.localAvatarImagePath);
        try {
            contentValues.put("meta", getMessageMeta(messageDM));
        } catch (JSONException e) {
            HSLogger.e(TAG, "Error in generating meta string for message", e);
        }
        return contentValues;
    }

    private void parseAndSetMetaData(Conversation conversation, String str) {
        if (str == null) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            int iOptInt = jSONObject.optInt("csat_rating", 0);
            int iOptInt2 = jSONObject.optInt("csat_state", ConversationCSATState.NONE.getValue());
            ArrayList<String> arrayListJsonArrayToStringArrayList = null;
            String strOptString = jSONObject.optString("csat_feedback", null);
            conversation.csatRating = iOptInt;
            conversation.csatState = ConversationCSATState.fromInt(iOptInt2);
            conversation.csatFeedback = strOptString;
            conversation.shouldIncrementMessageCount = jSONObject.optBoolean("increment_message_count", false);
            conversation.isConversationEndedDelegateSent = jSONObject.optBoolean("ended_delegate_sent", false);
            conversation.isAutoFilledPreIssue = jSONObject.optBoolean("is_autofilled_preissue", false);
            conversation.smartIntentTreeId = jSONObject.optString("smart_intent_tree_id", null);
            conversation.smartIntentUserQuery = jSONObject.optString("smart_intent_user_query", null);
            if (!jSONObject.isNull("smart_intent_ids")) {
                arrayListJsonArrayToStringArrayList = HSJSONUtils.jsonArrayToStringArrayList(jSONObject.getString("smart_intent_ids"));
            }
            conversation.smartIntentIds = arrayListJsonArrayToStringArrayList;
        } catch (JSONException e) {
            HSLogger.e(TAG, "Error in parseAndSetMetaData", e);
        }
    }

    private AttachmentPickerFile parseAndGetImageAttachmentDraft(String str) {
        AttachmentPickerFile attachmentPickerFile = null;
        if (str == null) {
            return null;
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            String strOptString = jSONObject.optString("image_draft_orig_name", null);
            Long lValueOf = Long.valueOf(jSONObject.optLong("image_draft_orig_size", -1L));
            String strOptString2 = jSONObject.optString("image_draft_file_path", null);
            int iOptInt = jSONObject.optInt("attachment_type");
            boolean zOptBoolean = jSONObject.optBoolean("image_copy_done", false);
            if (lValueOf.longValue() == -1) {
                lValueOf = null;
            }
            AttachmentPickerFile attachmentPickerFile2 = new AttachmentPickerFile(strOptString2, strOptString, lValueOf);
            try {
                attachmentPickerFile2.isFileCompressionAndCopyingDone = zOptBoolean;
                attachmentPickerFile2.attachmentType = iOptInt;
                return attachmentPickerFile2;
            } catch (JSONException e) {
                e = e;
                attachmentPickerFile = attachmentPickerFile2;
                HSLogger.e(TAG, "Error in parseAndGetImageAttachmentDraft", e);
                return attachmentPickerFile;
            }
        } catch (JSONException e2) {
            e = e2;
        }
    }

    private Author getAuthor(String str, String str2, String str3, String str4, boolean z) {
        Author.AuthorRole authorRole;
        if (z) {
            authorRole = Author.AuthorRole.LOCAL_USER;
        } else {
            authorRole = Author.AuthorRole.getEnum(str3);
        }
        Author author = new Author(str, str2, authorRole);
        author.localAvatarImagePath = str4;
        return author;
    }

    private MessageDM cursorToMessageDM(Cursor cursor) throws Throwable {
        long j;
        long j2;
        JSONObject jSONObject;
        boolean z;
        int i;
        MessageDM adminMessageDM;
        MessageDM adminActionCardMessageDM;
        MessageDM messageDM;
        boolean z2;
        JSONObject jSONObject2;
        MessageDM messageDM2;
        MessageDM messageDM3;
        long j3 = cursor.getLong(cursor.getColumnIndex("_id"));
        long j4 = cursor.getLong(cursor.getColumnIndex(MessagesTable.Columns.CONVERSATION_ID));
        String string = cursor.getString(cursor.getColumnIndex("server_id"));
        String string2 = cursor.getString(cursor.getColumnIndex("body"));
        String string3 = cursor.getString(cursor.getColumnIndex("meta"));
        String string4 = cursor.getString(cursor.getColumnIndex("type"));
        String string5 = cursor.getString(cursor.getColumnIndex("created_at"));
        String string6 = cursor.getString(cursor.getColumnIndex(MessagesTable.Columns.AUTHOR_NAME));
        String string7 = cursor.getString(cursor.getColumnIndex(MessagesTable.Columns.AUTHOR_ROLE));
        String string8 = cursor.getString(cursor.getColumnIndex(MessagesTable.Columns.AUTHOR_ID));
        String string9 = cursor.getString(cursor.getColumnIndex(MessagesTable.Columns.AVATAR_IMAGE_LOCAL_PATH));
        int columnIndex = cursor.getColumnIndex("epoch_time_created_at");
        long jConvertToEpochTime = cursor.isNull(columnIndex) ? 0L : cursor.getLong(columnIndex);
        if (jConvertToEpochTime <= 0) {
            jConvertToEpochTime = HSDateFormatSpec.convertToEpochTime(string5);
        }
        long j5 = jConvertToEpochTime;
        int i2 = cursor.getInt(cursor.getColumnIndex(MessagesTable.Columns.DELIVERY_STATE));
        boolean booleanColumnSafe = com.helpshift.util.DatabaseUtils.parseBooleanColumnSafe(cursor, "is_redacted", false);
        MessageType messageTypeFromValue = MessageType.fromValue(string4);
        JSONObject jSONObjectJsonify = jsonify(string3);
        switch (AnonymousClass1.$SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[messageTypeFromValue.ordinal()]) {
            case 1:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                MessageDM userMessageDM = new UserMessageDM(string2, string5, j5, getAuthor(string6, string8, string7, string9, true));
                userMessageDM.serverId = string;
                adminActionCardMessageDM = userMessageDM;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 2:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                UserResponseMessageForTextInputDM userResponseMessageForTextInputDM = new UserResponseMessageForTextInputDM(string2, string5, j5, getAuthor(string6, string8, string7, string9, true), parseInputKeyboardFromMeta(jSONObject), parseBotInfoFromMeta(jSONObject), parseIsResponseSkippedFromMeta(jSONObject), parseReferredMessageIdFromMeta(jSONObject), parseIsMessageEmptyFromMeta(jSONObject));
                userResponseMessageForTextInputDM.serverId = string;
                userResponseMessageForTextInputDM.dateInMillis = parseDateTimeFromMeta(jSONObject);
                userResponseMessageForTextInputDM.timeZoneId = parseTimeZoneIdFromMeta(jSONObject);
                adminActionCardMessageDM = userResponseMessageForTextInputDM;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 3:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                MessageDM userResponseMessageForOptionInput = new UserResponseMessageForOptionInput(string2, string5, j5, getAuthor(string6, string8, string7, string9, true), parseBotInfoFromMeta(jSONObject), parseIsResponseSkippedFromMeta(jSONObject), parseSelectedOptionDataFromMeta(jSONObject), parseReferredMessageIdFromMeta(jSONObject), parseReferredMessageTypeFromMeta(jSONObject));
                userResponseMessageForOptionInput.serverId = string;
                adminActionCardMessageDM = userResponseMessageForOptionInput;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 4:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                MessageDM userResponseMessageForCSATInput = new UserResponseMessageForCSATInput(string2, string5, j5, getAuthor(string6, string8, string7, string9, true), parseRatingValueFromMeta(jSONObject), parseIsNewConvClickCSATFromMeta(jSONObject), parseBotInfoFromMeta(jSONObject), parseSelectedOptionDataFromMeta(jSONObject), parseReferredMessageIdFromMeta(jSONObject), parseAndGetMessageSyncState(string, jSONObject));
                userResponseMessageForCSATInput.serverId = string;
                adminActionCardMessageDM = userResponseMessageForCSATInput;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 5:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                MessageDM userSmartIntentMessageDM = new UserSmartIntentMessageDM(parseIntentLabelFromMeta(jSONObject), string5, j5, getAuthor(string6, string8, string7, string9, true));
                userSmartIntentMessageDM.body = string2;
                userSmartIntentMessageDM.serverId = string;
                adminActionCardMessageDM = userSmartIntentMessageDM;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 6:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                adminMessageDM = new AdminMessageDM(string, string2, string5, j5, getAuthor(string6, string8, string7, string9, false));
                adminActionCardMessageDM = adminMessageDM;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 7:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                adminActionCardMessageDM = new AdminMessageWithTextInputDM(string, string2, string5, j5, getAuthor(string6, string8, string7, string9, false), parseBotInfoFromMeta(jSONObject), parseInputPlaceholderFromMeta(jSONObject), parseInputRequiredFromMeta(jSONObject), parseInputLabelFromMeta(jSONObject), parseInputSkipLabelFromMeta(jSONObject), parseInputKeyboardFromMeta(jSONObject), parseIsMessageEmptyFromMeta(jSONObject));
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 8:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                List<OptionInput.Option> inputOptionsFromMeta = parseInputOptionsFromMeta(jSONObject);
                AdminMessageWithOptionInputDM adminMessageWithOptionInputDM = new AdminMessageWithOptionInputDM(string, string2, string5, j5, getAuthor(string6, string8, string7, string9, false), parseBotInfoFromMeta(jSONObject), parseInputRequiredFromMeta(jSONObject), parseInputLabelFromMeta(jSONObject), parseInputSkipLabelFromMeta(jSONObject), inputOptionsFromMeta, parseInputOptionTypeFromMeta(jSONObject, inputOptionsFromMeta.size()));
                adminMessageWithOptionInputDM.attachmentCount = parseAttachmentCountFromMeta(jSONObject);
                adminActionCardMessageDM = adminMessageWithOptionInputDM;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 9:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                List<OptionInput.Option> inputOptionsFromMeta2 = parseInputOptionsFromMeta(jSONObject);
                AdminResolutionMessageWithOptions adminResolutionMessageWithOptions = new AdminResolutionMessageWithOptions(string, string2, string5, j5, getAuthor(string6, string8, string7, string9, false), parseBotInfoFromMeta(jSONObject), parseInputRequiredFromMeta(jSONObject), parseInputLabelFromMeta(jSONObject), parseInputSkipLabelFromMeta(jSONObject), inputOptionsFromMeta2, parseInputOptionTypeFromMeta(jSONObject, inputOptionsFromMeta2.size()));
                adminResolutionMessageWithOptions.attachmentCount = parseAttachmentCountFromMeta(jSONObject);
                adminActionCardMessageDM = adminResolutionMessageWithOptions;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 10:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                adminActionCardMessageDM = new AdminCSATMessageWithOptions(string, string2, string5, j5, getAuthor(string6, string8, string7, string9, false), parseBotInfoFromMeta(jSONObject), parseInputRequiredFromMeta(jSONObject), parseInputLabelFromMeta(jSONObject), parseInputSkipLabelFromMeta(jSONObject), parseSendFeedbackLabelFromMeta(jSONObject), parseShowConvButtonFromMeta(jSONObject), parseStartNewConversationLabelFromMeta(jSONObject), parseCSATInputRatingsFromMeta(jSONObject), parseCSATRatingInputTypeFromMeta(jSONObject));
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 11:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                adminMessageDM = new FAQListMessageDM(string, string2, string5, j5, getAuthor(string6, string8, string7, string9, false), parseFAQListFromMeta(jSONObject), parseFAQListSourceFromMeta(jSONObject), parseIsSuggestionsReadEventSent(jSONObject), parseSuggestionReadFAQPublishId(jSONObject));
                adminActionCardMessageDM = adminMessageDM;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 12:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                adminActionCardMessageDM = new FAQListMessageWithOptionInputDM(string, string2, string5, j5, getAuthor(string6, string8, string7, string9, false), parseFAQListFromMeta(jSONObject), parseFAQListSourceFromMeta(jSONObject), parseBotInfoFromMeta(jSONObject), parseInputRequiredFromMeta(jSONObject), parseInputLabelFromMeta(jSONObject), parseInputSkipLabelFromMeta(jSONObject), parseInputOptionsFromMeta(jSONObject), parseIsSuggestionsReadEventSent(jSONObject), parseSuggestionReadFAQPublishId(jSONObject));
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 13:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                MessageDM acceptedAppReviewMessageDM = new AcceptedAppReviewMessageDM(string2, string5, j5, getAuthor(string6, string8, string7, string9, true), parseReferredMessageIdFromMeta(jSONObject), parseAndGetMessageSyncState(string, jSONObject));
                acceptedAppReviewMessageDM.serverId = string;
                adminActionCardMessageDM = acceptedAppReviewMessageDM;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 14:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                adminMessageDM = new RequestAppReviewMessageDM(string, string2, string5, j5, getAuthor(string6, string8, string7, string9, false), parseIsAnsweredFromMeta(jSONObject));
                adminActionCardMessageDM = adminMessageDM;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 15:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                MessageDM followupAcceptedMessageDM = new FollowupAcceptedMessageDM(string2, string5, j5, getAuthor(string6, string8, string7, string9, true), parseReferredMessageIdFromMeta(jSONObject), parseAndGetMessageSyncState(string, jSONObject));
                followupAcceptedMessageDM.serverId = string;
                adminActionCardMessageDM = followupAcceptedMessageDM;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 16:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                FollowupRejectedMessageDM followupRejectedMessageDM = new FollowupRejectedMessageDM(string2, string5, j5, getAuthor(string6, string8, string7, string9, true), parseReferredMessageIdFromMeta(jSONObject), parseAndGetMessageSyncState(string, jSONObject));
                followupRejectedMessageDM.serverId = string;
                parseAndSetFollowUpRejectedDataFromMeta(followupRejectedMessageDM, jSONObject);
                adminActionCardMessageDM = followupRejectedMessageDM;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 17:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                MessageDM confirmationAcceptedMessageDM = new ConfirmationAcceptedMessageDM(string2, string5, j5, getAuthor(string6, string8, string7, string9, true), parseAndGetMessageSyncState(string, jSONObject));
                confirmationAcceptedMessageDM.serverId = string;
                adminActionCardMessageDM = confirmationAcceptedMessageDM;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 18:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                MessageDM confirmationRejectedMessageDM = new ConfirmationRejectedMessageDM(string2, string5, j5, getAuthor(string6, string8, string7, string9, false), parseAndGetMessageSyncState(string, jSONObject));
                confirmationRejectedMessageDM.serverId = string;
                adminActionCardMessageDM = confirmationRejectedMessageDM;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 19:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                ImageAttachmentInfo imageAttachmentInfoFromMeta = parseImageAttachmentInfoFromMeta(jSONObject);
                ScreenshotMessageDM screenshotMessageDM = new ScreenshotMessageDM(string2, string5, j5, getAuthor(string6, string8, string7, string9, true), imageAttachmentInfoFromMeta.contentType, imageAttachmentInfoFromMeta.thumbnailUrl, imageAttachmentInfoFromMeta.fileName, imageAttachmentInfoFromMeta.url, imageAttachmentInfoFromMeta.size, imageAttachmentInfoFromMeta.isSecure);
                screenshotMessageDM.filePath = imageAttachmentInfoFromMeta.filePath;
                screenshotMessageDM.serverId = string;
                screenshotMessageDM.setRefersMessageId(parseReferredMessageIdFromMeta(jSONObject));
                screenshotMessageDM.isZipped = imageAttachmentInfoFromMeta.isZipped;
                screenshotMessageDM.isRejected = imageAttachmentInfoFromMeta.isRejected;
                messageDM = screenshotMessageDM;
                adminActionCardMessageDM = messageDM;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 20:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                AttachmentInfo attachmentInfoFromMeta = parseAttachmentInfoFromMeta(jSONObject);
                UserAttachmentMessageDM userAttachmentMessageDM = new UserAttachmentMessageDM(string2, string5, j5, getAuthor(string6, string8, string7, string9, true), attachmentInfoFromMeta.size, attachmentInfoFromMeta.contentType, attachmentInfoFromMeta.url, attachmentInfoFromMeta.fileName, attachmentInfoFromMeta.isSecure);
                userAttachmentMessageDM.filePath = attachmentInfoFromMeta.filePath;
                userAttachmentMessageDM.serverId = string;
                userAttachmentMessageDM.isZipped = attachmentInfoFromMeta.isZipped;
                userAttachmentMessageDM.isRejected = attachmentInfoFromMeta.isRejected;
                messageDM = userAttachmentMessageDM;
                adminActionCardMessageDM = messageDM;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 21:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                adminMessageDM = new RequestScreenshotMessageDM(string, string2, string5, j5, getAuthor(string6, string8, string7, string9, false), parseIsAnsweredFromMeta(jSONObject));
                adminActionCardMessageDM = adminMessageDM;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 22:
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                z = booleanColumnSafe;
                i = i2;
                AttachmentInfo attachmentInfoFromMeta2 = parseAttachmentInfoFromMeta(jSONObject);
                AdminAttachmentMessageDM adminAttachmentMessageDM = new AdminAttachmentMessageDM(string, string2, string5, j5, getAuthor(string6, string8, string7, string9, false), attachmentInfoFromMeta2.size, attachmentInfoFromMeta2.contentType, attachmentInfoFromMeta2.url, attachmentInfoFromMeta2.fileName, attachmentInfoFromMeta2.isSecure);
                adminAttachmentMessageDM.filePath = attachmentInfoFromMeta2.filePath;
                adminAttachmentMessageDM.updateState();
                messageDM = adminAttachmentMessageDM;
                adminActionCardMessageDM = messageDM;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 23:
                i = i2;
                ImageAttachmentInfo imageAttachmentInfoFromMeta2 = parseImageAttachmentInfoFromMeta(jSONObjectJsonify);
                j = j3;
                z = booleanColumnSafe;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                AdminImageAttachmentMessageDM adminImageAttachmentMessageDM = new AdminImageAttachmentMessageDM(string, string2, string5, j5, getAuthor(string6, string8, string7, string9, false), imageAttachmentInfoFromMeta2.url, imageAttachmentInfoFromMeta2.fileName, imageAttachmentInfoFromMeta2.thumbnailUrl, imageAttachmentInfoFromMeta2.contentType, imageAttachmentInfoFromMeta2.isSecure, imageAttachmentInfoFromMeta2.size);
                adminImageAttachmentMessageDM.filePath = imageAttachmentInfoFromMeta2.filePath;
                adminImageAttachmentMessageDM.thumbnailFilePath = imageAttachmentInfoFromMeta2.thumbnailFilePath;
                adminImageAttachmentMessageDM.updateState();
                messageDM3 = adminImageAttachmentMessageDM;
                adminActionCardMessageDM = messageDM3;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 24:
                i = i2;
                Author author = getAuthor(string6, string8, string7, string9, false);
                z2 = booleanColumnSafe;
                RequestForReopenMessageDM requestForReopenMessageDM = requestForReopenMessageDM;
                jSONObject2 = jSONObjectJsonify;
                RequestForReopenMessageDM requestForReopenMessageDM2 = new RequestForReopenMessageDM(string, string2, string5, j5, author);
                requestForReopenMessageDM.setAnswered(parseIsAnsweredFromMeta(jSONObject2));
                messageDM2 = requestForReopenMessageDM;
                z = z2;
                j = j3;
                j2 = j4;
                adminActionCardMessageDM = messageDM2;
                jSONObject = jSONObject2;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 25:
                i = i2;
                String botActionTypeFromMeta = parseBotActionTypeFromMeta(jSONObjectJsonify);
                String botInfoFromMeta = parseBotInfoFromMeta(jSONObjectJsonify);
                Boolean hasNextBotFromMeta = parseHasNextBotFromMeta(jSONObjectJsonify);
                Author author2 = getAuthor(string6, string8, string7, string9, false);
                z2 = booleanColumnSafe;
                AdminBotControlMessageDM adminBotControlMessageDM = adminBotControlMessageDM;
                jSONObject2 = jSONObjectJsonify;
                AdminBotControlMessageDM adminBotControlMessageDM2 = new AdminBotControlMessageDM(string, string2, string5, j5, author2, botActionTypeFromMeta, botInfoFromMeta);
                adminBotControlMessageDM.hasNextBot = hasNextBotFromMeta.booleanValue();
                messageDM2 = adminBotControlMessageDM;
                z = z2;
                j = j3;
                j2 = j4;
                adminActionCardMessageDM = messageDM2;
                jSONObject = jSONObject2;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 26:
                i = i2;
                MessageDM messageDM4 = userBotControlMessageDM;
                MessageDM userBotControlMessageDM = new UserBotControlMessageDM(string2, string5, j5, getAuthor(string6, string8, string7, string9, true), parseBotActionTypeFromMeta(jSONObjectJsonify), parseBotEndedReasonFromMeta(jSONObjectJsonify), parseBotInfoFromMeta(jSONObjectJsonify), parseReferredMessageIdFromMeta(jSONObjectJsonify), parseAndGetMessageSyncState(string, jSONObjectJsonify));
                messageDM4.serverId = string;
                z = booleanColumnSafe;
                j = j3;
                j2 = j4;
                jSONObject = jSONObjectJsonify;
                messageDM3 = messageDM4;
                adminActionCardMessageDM = messageDM3;
                adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                adminActionCardMessageDM.localId = Long.valueOf(j);
                adminActionCardMessageDM.deliveryState = i;
                adminActionCardMessageDM.isRedacted = z;
                parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                break;
            case 27:
                ActionCard actionCard = readActionCard(string);
                if (actionCard != null) {
                    i = i2;
                    z = booleanColumnSafe;
                    j = j3;
                    j2 = j4;
                    adminActionCardMessageDM = new AdminActionCardMessageDM(string, string2, string5, j5, getAuthor(string6, string8, string7, string9, false), getStringFromJson(jSONObjectJsonify, "original_message_server_id", ""), actionCard);
                    jSONObject = jSONObjectJsonify;
                    adminActionCardMessageDM.conversationLocalId = Long.valueOf(j2);
                    adminActionCardMessageDM.localId = Long.valueOf(j);
                    adminActionCardMessageDM.deliveryState = i;
                    adminActionCardMessageDM.isRedacted = z;
                    parseAndSetMessageSeenData(adminActionCardMessageDM, jSONObject);
                    parseFeedbackMessageData(adminActionCardMessageDM, jSONObject);
                    break;
                }
                break;
        }
        return null;
    }

    private void parseFeedbackMessageData(MessageDM messageDM, JSONObject jSONObject) {
        messageDM.isFeedbackMessage = jSONObject.optBoolean("is_feedback_message", false);
    }

    private List<String> parseIntentLabelFromMeta(JSONObject jSONObject) {
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("intent_labels");
        return jSONArrayOptJSONArray != null ? HSJSONUtils.convertJSONArrayToStringList(jSONArrayOptJSONArray) : new ArrayList();
    }

    private ActionCard readActionCard(String str) throws Throwable {
        ActionCard actionCard;
        boolean z = true;
        String[] strArr = {String.valueOf(str)};
        String str2 = "SELECT action_cards._id AS ac_id, action_cards.title, action_cards.image_url, action_cards.file_path, action_cards.is_image_secure, actions._id AS a_id, actions.action_sha, actions.action_title, actions.action_type, actions.action_data FROM " + ActionCardTable.TABLE_NAME + " JOIN actions ON action_cards._id = actions.action_card_id WHERE action_cards.message_id = ?  LIMIT 1";
        SQLiteDatabase sQLiteDatabase = null;
        actionCard = null;
        ActionCard actionCard2 = null;
        sQLiteDatabase = null;
        try {
            try {
                SQLiteDatabase readableDatabase = this.dbHelper.getReadableDatabase();
                try {
                    try {
                        readableDatabase.beginTransaction();
                        Cursor cursorRawQuery = readableDatabase.rawQuery(str2, strArr);
                        if (cursorRawQuery.moveToFirst()) {
                            Action action = new Action(cursorRawQuery.getString(cursorRawQuery.getColumnIndex(ActionTable.Columns.TITLE)), cursorRawQuery.getString(cursorRawQuery.getColumnIndex(ActionTable.Columns.ACTION_SHA)), ActionType.fromValue(cursorRawQuery.getString(cursorRawQuery.getColumnIndex("action_type"))), HSJSONUtils.toStringMap(jsonify(cursorRawQuery.getString(cursorRawQuery.getColumnIndex(ActionTable.Columns.DATA)))));
                            action.actionLocalId = Long.valueOf(cursorRawQuery.getLong(cursorRawQuery.getColumnIndex("a_id")));
                            String string = cursorRawQuery.getString(cursorRawQuery.getColumnIndex("title"));
                            String string2 = cursorRawQuery.getString(cursorRawQuery.getColumnIndex(ActionCardTable.Columns.IMAGE_URL));
                            if (cursorRawQuery.getInt(cursorRawQuery.getColumnIndex(ActionCardTable.Columns.IS_IMAGE_SECURE)) != 1) {
                                z = false;
                            }
                            actionCard = new ActionCard(string, string2, z, action);
                            try {
                                actionCard.actionCardLocalId = Long.valueOf(cursorRawQuery.getLong(cursorRawQuery.getColumnIndex("ac_id")));
                                actionCard.filePath = cursorRawQuery.getString(cursorRawQuery.getColumnIndex(ActionCardTable.Columns.FILE_PATH));
                                actionCard2 = actionCard;
                            } catch (Exception e) {
                                e = e;
                                sQLiteDatabase = readableDatabase;
                                HSLogger.e(TAG, "Error in read action card", e);
                                if (sQLiteDatabase != null) {
                                    try {
                                        sQLiteDatabase.endTransaction();
                                    } catch (Exception e2) {
                                        HSLogger.e(TAG, "Error in read action card inside finally block", e2);
                                    }
                                }
                                return actionCard;
                            }
                        }
                        readableDatabase.setTransactionSuccessful();
                        if (readableDatabase == null) {
                            return actionCard2;
                        }
                        try {
                            readableDatabase.endTransaction();
                            return actionCard2;
                        } catch (Exception e3) {
                            HSLogger.e(TAG, "Error in read action card inside finally block", e3);
                            return actionCard2;
                        }
                    } catch (Throwable th) {
                        th = th;
                        sQLiteDatabase = readableDatabase;
                        if (sQLiteDatabase != null) {
                            try {
                                sQLiteDatabase.endTransaction();
                            } catch (Exception e4) {
                                HSLogger.e(TAG, "Error in read action card inside finally block", e4);
                            }
                        }
                        throw th;
                    }
                } catch (Exception e5) {
                    e = e5;
                    actionCard = actionCard2;
                }
            } catch (Exception e6) {
                e = e6;
                actionCard = null;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }

    private OptionInput.Type parseInputOptionTypeFromMeta(JSONObject jSONObject, int i) {
        return OptionInput.Type.getType(getStringFromJson(jSONObject, "option_type", ""), i);
    }

    private CSATRatingsInput.Type parseCSATRatingInputTypeFromMeta(JSONObject jSONObject) {
        return CSATRatingsInput.Type.getType();
    }

    private boolean parseIsMessageEmptyFromMeta(JSONObject jSONObject) {
        return getBooleanFromJson(jSONObject, "is_message_empty", false);
    }

    private String parseBotActionTypeFromMeta(JSONObject jSONObject) {
        return jSONObject.optString("bot_action_type", "");
    }

    private String parseBotEndedReasonFromMeta(JSONObject jSONObject) {
        return jSONObject.optString("bot_ended_reason", "");
    }

    private String parseSuggestionReadFAQPublishId(JSONObject jSONObject) {
        return getStringFromJson(jSONObject, "suggestion_read_faq_publish_id", "");
    }

    private boolean parseIsSuggestionsReadEventSent(JSONObject jSONObject) {
        return getBooleanFromJson(jSONObject, "is_suggestion_read_event_sent", false);
    }

    private List<FAQListMessageDM.FAQ> parseFAQListFromMeta(JSONObject jSONObject) {
        ArrayList arrayList = new ArrayList();
        try {
            JSONArray jSONArray = jSONObject.getJSONArray("faqs");
            for (int i = 0; i < jSONArray.length(); i++) {
                JSONObject jSONObject2 = jSONArray.getJSONObject(i);
                arrayList.add(new FAQListMessageDM.FAQ(jSONObject2.getString("faq_title"), jSONObject2.getString("faq_publish_id"), jSONObject2.getString("faq_language")));
            }
        } catch (JSONException unused) {
        }
        return arrayList;
    }

    private String parseFAQListSourceFromMeta(JSONObject jSONObject) {
        try {
            return jSONObject.getString("faq_source");
        } catch (JSONException unused) {
            return "";
        }
    }

    private List<OptionInput.Option> parseInputOptionsFromMeta(JSONObject jSONObject) {
        ArrayList arrayList = new ArrayList();
        try {
            JSONArray jSONArray = jSONObject.getJSONArray("input_options");
            for (int i = 0; i < jSONArray.length(); i++) {
                JSONObject jSONObject2 = jSONArray.getJSONObject(i);
                arrayList.add(new OptionInput.Option(jSONObject2.getString("option_title"), jSONObject2.getString("option_data")));
            }
        } catch (JSONException unused) {
        }
        return arrayList;
    }

    private List<CSATRatingsInput.Rating> parseCSATInputRatingsFromMeta(JSONObject jSONObject) {
        ArrayList arrayList = new ArrayList();
        try {
            JSONArray jSONArray = jSONObject.getJSONArray("input_options");
            for (int i = 0; i < jSONArray.length(); i++) {
                JSONObject jSONObject2 = jSONArray.getJSONObject(i);
                arrayList.add(new CSATRatingsInput.Rating(jSONObject2.getString("option_title"), jSONObject2.getInt("rating_value"), jSONObject2.getString("option_data")));
            }
        } catch (JSONException unused) {
        }
        return arrayList;
    }

    private int parseAttachmentCountFromMeta(JSONObject jSONObject) {
        return getIntFromJson(jSONObject, "attachment_count", 0);
    }

    private int getIntFromJson(JSONObject jSONObject, String str, int i) {
        return jSONObject.optInt(str, i);
    }

    private String getStringFromJson(JSONObject jSONObject, String str, String str2) {
        return jSONObject.optString(str, str2);
    }

    private boolean getBooleanFromJson(JSONObject jSONObject, String str, boolean z) {
        return jSONObject.optBoolean(str, z);
    }

    private MessageType parseReferredMessageTypeFromMeta(JSONObject jSONObject) {
        return MessageType.fromValue(getStringFromJson(jSONObject, "referred_message_type", ""));
    }

    private String parseSelectedOptionDataFromMeta(JSONObject jSONObject) {
        return getStringFromJson(jSONObject, "selected_option_data", "{}");
    }

    private boolean parseIsResponseSkippedFromMeta(JSONObject jSONObject) {
        return getBooleanFromJson(jSONObject, "is_response_skipped", false);
    }

    private boolean parseIsNewConvClickCSATFromMeta(JSONObject jSONObject) {
        return getBooleanFromJson(jSONObject, "new_conv_started_csat", false);
    }

    private int parseRatingValueFromMeta(JSONObject jSONObject) {
        return getIntFromJson(jSONObject, "rating_value", 1);
    }

    private int parseInputKeyboardFromMeta(JSONObject jSONObject) {
        return getIntFromJson(jSONObject, "input_keyboard", 1);
    }

    private String parseInputSkipLabelFromMeta(JSONObject jSONObject) {
        return getStringFromJson(jSONObject, "input_skip_label", "");
    }

    private boolean parseShowConvButtonFromMeta(JSONObject jSONObject) {
        return getBooleanFromJson(jSONObject, "show_new_conv_button", true);
    }

    private String parseSendFeedbackLabelFromMeta(JSONObject jSONObject) {
        return getStringFromJson(jSONObject, "input_send_feedback_label", "");
    }

    private String parseStartNewConversationLabelFromMeta(JSONObject jSONObject) {
        return getStringFromJson(jSONObject, "input_start_conv_label", "");
    }

    private String parseInputLabelFromMeta(JSONObject jSONObject) {
        return getStringFromJson(jSONObject, "input_label", "");
    }

    private boolean parseInputRequiredFromMeta(JSONObject jSONObject) {
        return getBooleanFromJson(jSONObject, "input_required", false);
    }

    private String parseInputPlaceholderFromMeta(JSONObject jSONObject) {
        return getStringFromJson(jSONObject, "input_placeholder", "");
    }

    private String parseBotInfoFromMeta(JSONObject jSONObject) {
        return jSONObject.optString("chatbot_info", "{}");
    }

    private long parseDateTimeFromMeta(JSONObject jSONObject) {
        return jSONObject.optLong("dt", 0L);
    }

    private String parseTimeZoneIdFromMeta(JSONObject jSONObject) {
        return jSONObject.optString("timezone_id");
    }

    private Boolean parseHasNextBotFromMeta(JSONObject jSONObject) {
        return Boolean.valueOf(jSONObject.optBoolean("has_next_bot", false));
    }

    private int parseAndGetMessageSyncState(String str, JSONObject jSONObject) {
        if (StringUtils.isEmpty(str)) {
            return jSONObject.optInt("message_sync_status", 1);
        }
        return 2;
    }

    private void parseAndSetMessageSeenData(MessageDM messageDM, JSONObject jSONObject) {
        String strOptString = jSONObject.optString("read_at", "");
        String strOptString2 = jSONObject.optString("seen_cursor", null);
        boolean zOptBoolean = jSONObject.optBoolean("seen_sync_status", false);
        messageDM.seenAtMessageCursor = strOptString2;
        messageDM.isMessageSeenSynced = zOptBoolean;
        messageDM.readAt = strOptString;
    }

    private JSONObject jsonify(String str) {
        JSONObject jSONObject = new JSONObject();
        if (StringUtils.isEmpty(str)) {
            return jSONObject;
        }
        try {
            return new JSONObject(str);
        } catch (JSONException e) {
            HSLogger.e(TAG, "Exception in jsonify", e);
            return jSONObject;
        }
    }

    private String parseReferredMessageIdFromMeta(JSONObject jSONObject) {
        return jSONObject.optString("referredMessageId", null);
    }

    private boolean parseIsAnsweredFromMeta(JSONObject jSONObject) {
        return jSONObject.optBoolean("is_answered", false);
    }

    private AttachmentInfo parseAttachmentInfoFromMeta(JSONObject jSONObject) {
        return new AttachmentInfo(jSONObject);
    }

    private ImageAttachmentInfo parseImageAttachmentInfoFromMeta(JSONObject jSONObject) {
        return new ImageAttachmentInfo(jSONObject);
    }

    private void parseAndSetFollowUpRejectedDataFromMeta(FollowupRejectedMessageDM followupRejectedMessageDM, JSONObject jSONObject) {
        int iOptInt = jSONObject.optInt("rejected_reason");
        String strOptString = jSONObject.optString("rejected_conv_id", null);
        followupRejectedMessageDM.reason = iOptInt;
        followupRejectedMessageDM.openConversationId = strOptString;
    }

    private String getMessageMeta(MessageDM messageDM) throws JSONException {
        MessageType messageType = messageDM.messageType;
        JSONObject jSONObject = new JSONObject();
        switch (messageType) {
            case USER_RESP_FOR_TEXT_INPUT:
                UserResponseMessageForTextInputDM userResponseMessageForTextInputDM = (UserResponseMessageForTextInputDM) messageDM;
                buildMetaForBotInfo(jSONObject, userResponseMessageForTextInputDM.botInfo);
                buildMetaForInputKeyboard(jSONObject, userResponseMessageForTextInputDM.keyboard);
                buildMetaForIsResponseSkipped(jSONObject, userResponseMessageForTextInputDM.skipped);
                buildMetaForReferredMessageId(jSONObject, userResponseMessageForTextInputDM.getReferredMessageId());
                buildMetaForIsMessageEmpty(jSONObject, userResponseMessageForTextInputDM.isMessageEmpty);
                buildMetaForDateTime(jSONObject, userResponseMessageForTextInputDM);
                break;
            case USER_RESP_FOR_OPTION_INPUT:
                UserResponseMessageForOptionInput userResponseMessageForOptionInput = (UserResponseMessageForOptionInput) messageDM;
                buildMetaForBotInfo(jSONObject, userResponseMessageForOptionInput.botInfo);
                buildMetaForIsResponseSkipped(jSONObject, userResponseMessageForOptionInput.skipped);
                buildMetaForReferredMessageId(jSONObject, userResponseMessageForOptionInput.getReferredMessageId());
                buildMetaForReferredMessageType(jSONObject, userResponseMessageForOptionInput.referredMessageType);
                buildMetaForSelectedOptionData(jSONObject, userResponseMessageForOptionInput.optionData);
                break;
            case USER_RESP_FOR_CSAT:
                UserResponseMessageForCSATInput userResponseMessageForCSATInput = (UserResponseMessageForCSATInput) messageDM;
                buildMetaForBotInfo(jSONObject, userResponseMessageForCSATInput.botInfo);
                buildMetaForIsNewConvClickedCSAT(jSONObject, userResponseMessageForCSATInput.isNewConversationStarted);
                buildMetaForReferredMessageId(jSONObject, userResponseMessageForCSATInput.getReferredMessageId());
                buildMetaForSelectedOptionData(jSONObject, userResponseMessageForCSATInput.optionData);
                buildMetaForRatingValue(jSONObject, userResponseMessageForCSATInput.rating);
                buildMetaForMessageSyncState(jSONObject, userResponseMessageForCSATInput.messageSyncState);
                break;
            case USER_SMART_INTENT:
                buildMetaForIntentLabels(jSONObject, (UserSmartIntentMessageDM) messageDM);
                break;
            case ADMIN_TEXT:
                buildMetaForMessageSeenData(jSONObject, messageDM);
                break;
            case ADMIN_TEXT_WITH_TEXT_INPUT:
                AdminMessageWithTextInputDM adminMessageWithTextInputDM = (AdminMessageWithTextInputDM) messageDM;
                buildMetaForMessageSeenData(jSONObject, messageDM);
                buildMetaForInput(jSONObject, adminMessageWithTextInputDM.input);
                buildMetaForIsMessageEmpty(jSONObject, adminMessageWithTextInputDM.isMessageEmpty);
                break;
            case ADMIN_TEXT_WITH_OPTION_INPUT:
                buildMetaForMessageSeenData(jSONObject, messageDM);
                AdminMessageWithOptionInputDM adminMessageWithOptionInputDM = (AdminMessageWithOptionInputDM) messageDM;
                buildMetaForInput(jSONObject, adminMessageWithOptionInputDM.input);
                buildMetaForAttachmentCount(jSONObject, adminMessageWithOptionInputDM.attachmentCount);
                break;
            case ADMIN_RESOLUTION_QUESTION_MESSAGE:
                buildMetaForMessageSeenData(jSONObject, messageDM);
                AdminResolutionMessageWithOptions adminResolutionMessageWithOptions = (AdminResolutionMessageWithOptions) messageDM;
                buildMetaForInput(jSONObject, adminResolutionMessageWithOptions.input);
                buildMetaForAttachmentCount(jSONObject, adminResolutionMessageWithOptions.attachmentCount);
                break;
            case ADMIN_CSAT_MESSAGE:
                buildMetaForMessageSeenData(jSONObject, messageDM);
                buildMetaForCSATInput(jSONObject, ((AdminCSATMessageWithOptions) messageDM).csatRatingsInput);
                break;
            case FAQ_LIST:
                buildMetaForMessageSeenData(jSONObject, messageDM);
                FAQListMessageDM fAQListMessageDM = (FAQListMessageDM) messageDM;
                buildMetaForFAQList(jSONObject, fAQListMessageDM);
                buildMetaForIsSuggestionsReadEvent(jSONObject, fAQListMessageDM);
                buildMetaForFAQListSource(jSONObject, fAQListMessageDM);
                break;
            case FAQ_LIST_WITH_OPTION_INPUT:
                buildMetaForMessageSeenData(jSONObject, messageDM);
                buildMetaForFAQList(jSONObject, (FAQListMessageDM) messageDM);
                FAQListMessageWithOptionInputDM fAQListMessageWithOptionInputDM = (FAQListMessageWithOptionInputDM) messageDM;
                buildMetaForInput(jSONObject, fAQListMessageWithOptionInputDM.input);
                buildMetaForIsSuggestionsReadEvent(jSONObject, fAQListMessageWithOptionInputDM);
                buildMetaForFAQListSource(jSONObject, fAQListMessageWithOptionInputDM);
                break;
            case ACCEPTED_APP_REVIEW:
                AcceptedAppReviewMessageDM acceptedAppReviewMessageDM = (AcceptedAppReviewMessageDM) messageDM;
                buildMetaForReferredMessageId(jSONObject, acceptedAppReviewMessageDM.referredMessageId);
                buildMetaForAutoRetriableMessage(jSONObject, acceptedAppReviewMessageDM);
                break;
            case REQUESTED_APP_REVIEW:
                buildMetaForIsAnswered(jSONObject, ((RequestAppReviewMessageDM) messageDM).isAnswered);
                buildMetaForMessageSeenData(jSONObject, messageDM);
                break;
            case FOLLOWUP_ACCEPTED:
                FollowupAcceptedMessageDM followupAcceptedMessageDM = (FollowupAcceptedMessageDM) messageDM;
                buildMetaForReferredMessageId(jSONObject, followupAcceptedMessageDM.referredMessageId);
                buildMetaForAutoRetriableMessage(jSONObject, followupAcceptedMessageDM);
                break;
            case FOLLOWUP_REJECTED:
                FollowupRejectedMessageDM followupRejectedMessageDM = (FollowupRejectedMessageDM) messageDM;
                buildMetaForFollowUpRejected(jSONObject, followupRejectedMessageDM);
                buildMetaForAutoRetriableMessage(jSONObject, followupRejectedMessageDM);
                break;
            case CONFIRMATION_ACCEPTED:
                buildMetaForAutoRetriableMessage(jSONObject, (ConfirmationAcceptedMessageDM) messageDM);
                break;
            case CONFIRMATION_REJECTED:
                buildMetaForAutoRetriableMessage(jSONObject, (ConfirmationRejectedMessageDM) messageDM);
                break;
            case SCREENSHOT:
                buildMetaForScreenshotAttachmentMessage(jSONObject, (ScreenshotMessageDM) messageDM);
                break;
            case USER_ATTACHMENT:
                buildJsonObjectForAttachmentMessage(jSONObject, (UserAttachmentMessageDM) messageDM);
                break;
            case REQUESTED_SCREENSHOT:
                buildMetaForIsAnswered(jSONObject, ((RequestScreenshotMessageDM) messageDM).isAnswered);
                buildMetaForMessageSeenData(jSONObject, messageDM);
                break;
            case ADMIN_ATTACHMENT:
                buildJsonObjectForAttachmentMessage(jSONObject, (AttachmentMessageDM) messageDM);
                buildMetaForMessageSeenData(jSONObject, messageDM);
                break;
            case ADMIN_IMAGE_ATTACHMENT:
                buildMetaForImageAttachmentMessage(jSONObject, (ImageAttachmentMessageDM) messageDM);
                buildMetaForMessageSeenData(jSONObject, messageDM);
                break;
            case REQUEST_FOR_REOPEN:
                buildMetaForIsAnswered(jSONObject, ((RequestForReopenMessageDM) messageDM).isAnswered());
                buildMetaForMessageSeenData(jSONObject, messageDM);
                break;
            case ADMIN_BOT_CONTROL:
                buildMetaForAdminBotControlMessage(jSONObject, (AdminBotControlMessageDM) messageDM);
                break;
            case USER_BOT_CONTROL:
                UserBotControlMessageDM userBotControlMessageDM = (UserBotControlMessageDM) messageDM;
                buildMetaForUserBotControlMessage(jSONObject, userBotControlMessageDM);
                buildMetaForAutoRetriableMessage(jSONObject, userBotControlMessageDM);
                break;
            case ADMIN_ACTION_CARD:
                buildMetaForActionCardMessage(jSONObject, (AdminActionCardMessageDM) messageDM);
                break;
        }
        buildMetaForFeedbackMessageProperties(jSONObject, messageDM);
        return jSONObject.toString();
    }

    private void buildMetaForIntentLabels(JSONObject jSONObject, UserSmartIntentMessageDM userSmartIntentMessageDM) throws JSONException {
        jSONObject.put("intent_labels", HSJSONUtils.listToJsonArray(userSmartIntentMessageDM.intentLabels));
    }

    private void buildMetaForIsSuggestionsReadEvent(JSONObject jSONObject, FAQListMessageDM fAQListMessageDM) throws JSONException {
        jSONObject.put("is_suggestion_read_event_sent", fAQListMessageDM.isSuggestionsReadEventSent);
        jSONObject.put("suggestion_read_faq_publish_id", fAQListMessageDM.suggestionsReadFAQPublishId);
    }

    private void buildMetaForIsMessageEmpty(JSONObject jSONObject, boolean z) throws JSONException {
        jSONObject.put("is_message_empty", z);
    }

    private void buildMetaForAdminBotControlMessage(JSONObject jSONObject, AdminBotControlMessageDM adminBotControlMessageDM) throws JSONException {
        jSONObject.put("bot_action_type", adminBotControlMessageDM.actionType);
        jSONObject.put("has_next_bot", adminBotControlMessageDM.hasNextBot);
    }

    private void buildMetaForUserBotControlMessage(JSONObject jSONObject, UserBotControlMessageDM userBotControlMessageDM) throws JSONException {
        jSONObject.put("bot_action_type", userBotControlMessageDM.actionType);
        jSONObject.put("chatbot_info", userBotControlMessageDM.botInfo);
        jSONObject.put("bot_ended_reason", userBotControlMessageDM.reason);
        jSONObject.put("referredMessageId", userBotControlMessageDM.refersMessageId);
    }

    private void buildMetaForFAQList(JSONObject jSONObject, FAQListMessageDM fAQListMessageDM) throws JSONException {
        if (fAQListMessageDM.faqs != null) {
            JSONArray jSONArray = new JSONArray();
            for (FAQListMessageDM.FAQ faq : fAQListMessageDM.faqs) {
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put("faq_title", faq.title);
                jSONObject2.put("faq_publish_id", faq.publishId);
                jSONObject2.put("faq_language", faq.language);
                jSONArray.put(jSONObject2);
            }
            jSONObject.put("faqs", jSONArray);
        }
    }

    private void buildMetaForFAQListSource(JSONObject jSONObject, FAQListMessageDM fAQListMessageDM) throws JSONException {
        if (fAQListMessageDM.source != null) {
            jSONObject.put("faq_source", fAQListMessageDM.source);
        }
    }

    private void buildMetaForReferredMessageType(JSONObject jSONObject, MessageType messageType) throws JSONException {
        jSONObject.put("referred_message_type", messageType.getValue());
    }

    private void buildMetaForSelectedOptionData(JSONObject jSONObject, String str) throws JSONException {
        jSONObject.put("selected_option_data", str);
    }

    private void buildMetaForRatingValue(JSONObject jSONObject, int i) throws JSONException {
        jSONObject.put("rating_value", i);
    }

    private void buildMetaForIsResponseSkipped(JSONObject jSONObject, boolean z) throws JSONException {
        jSONObject.put("is_response_skipped", z);
    }

    private void buildMetaForIsNewConvClickedCSAT(JSONObject jSONObject, boolean z) throws JSONException {
        jSONObject.put("new_conv_started_csat", z);
    }

    private void buildMetaForInputKeyboard(JSONObject jSONObject, int i) throws JSONException {
        jSONObject.put("input_keyboard", i);
    }

    private void buildMetaForDateTime(JSONObject jSONObject, UserResponseMessageForTextInputDM userResponseMessageForTextInputDM) throws JSONException {
        if (userResponseMessageForTextInputDM.keyboard == 4) {
            jSONObject.put("dt", userResponseMessageForTextInputDM.dateInMillis);
            jSONObject.put("timezone_id", userResponseMessageForTextInputDM.timeZoneId);
        }
    }

    private void buildMetaForBotInfo(JSONObject jSONObject, String str) throws JSONException {
        jSONObject.put("chatbot_info", str);
    }

    private void buildMetaForInput(JSONObject jSONObject, TextInput textInput) throws JSONException {
        buildMetaForBotInfo(jSONObject, textInput.botInfo);
        jSONObject.put("input_required", textInput.required);
        jSONObject.put("input_skip_label", textInput.skipLabel);
        jSONObject.put("input_label", textInput.inputLabel);
        jSONObject.put("input_placeholder", textInput.placeholder);
        buildMetaForInputKeyboard(jSONObject, textInput.keyboard);
    }

    private void buildMetaForInput(JSONObject jSONObject, OptionInput optionInput) throws JSONException {
        buildMetaForBotInfo(jSONObject, optionInput.botInfo);
        jSONObject.put("input_required", optionInput.required);
        jSONObject.put("input_label", optionInput.inputLabel);
        jSONObject.put("input_skip_label", optionInput.skipLabel);
        if (optionInput.options != null) {
            JSONArray jSONArray = new JSONArray();
            for (OptionInput.Option option : optionInput.options) {
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put("option_title", option.title);
                jSONObject2.put("option_data", option.jsonData);
                jSONArray.put(jSONObject2);
            }
            jSONObject.put("input_options", jSONArray);
        }
        jSONObject.put("option_type", optionInput.type.toString());
    }

    private void buildMetaForCSATInput(JSONObject jSONObject, CSATRatingsInput cSATRatingsInput) throws JSONException {
        buildMetaForBotInfo(jSONObject, cSATRatingsInput.botInfo);
        jSONObject.put("input_required", cSATRatingsInput.required);
        jSONObject.put("input_label", cSATRatingsInput.inputLabel);
        jSONObject.put("input_skip_label", cSATRatingsInput.skipLabel);
        jSONObject.put("input_send_feedback_label", cSATRatingsInput.sendFeedbackLabel);
        jSONObject.put("input_start_conv_label", cSATRatingsInput.startNewConversationLabel);
        jSONObject.put("show_new_conv_button", cSATRatingsInput.showNewConversationButton);
        if (cSATRatingsInput.ratings != null) {
            JSONArray jSONArray = new JSONArray();
            for (CSATRatingsInput.Rating rating : cSATRatingsInput.ratings) {
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put("option_title", rating.title);
                jSONObject2.put("rating_value", rating.value);
                jSONObject2.put("option_data", rating.jsonData);
                jSONArray.put(jSONObject2);
            }
            jSONObject.put("input_options", jSONArray);
        }
        jSONObject.put("option_type", cSATRatingsInput.type.toString());
    }

    private JSONObject buildMetaForAttachmentCount(JSONObject jSONObject, int i) throws JSONException {
        jSONObject.put("attachment_count", i);
        return jSONObject;
    }

    private void buildMetaForMessageSeenData(JSONObject jSONObject, MessageDM messageDM) throws JSONException {
        jSONObject.put("seen_cursor", messageDM.seenAtMessageCursor);
        jSONObject.put("seen_sync_status", messageDM.isMessageSeenSynced);
        jSONObject.put("read_at", messageDM.readAt);
    }

    private void buildMetaForFeedbackMessageProperties(JSONObject jSONObject, MessageDM messageDM) throws JSONException {
        jSONObject.put("is_feedback_message", messageDM.isFeedbackMessage);
    }

    private void buildMetaForReferredMessageId(JSONObject jSONObject, String str) throws JSONException {
        jSONObject.put("referredMessageId", str);
    }

    private void buildMetaForFollowUpRejected(JSONObject jSONObject, FollowupRejectedMessageDM followupRejectedMessageDM) throws JSONException {
        jSONObject.put("referredMessageId", followupRejectedMessageDM.referredMessageId);
        jSONObject.put("rejected_reason", followupRejectedMessageDM.reason);
        jSONObject.put("rejected_conv_id", followupRejectedMessageDM.openConversationId);
    }

    private void buildMetaForIsAnswered(JSONObject jSONObject, boolean z) throws JSONException {
        jSONObject.put("is_answered", z);
    }

    private void buildJsonObjectForAttachmentMessage(JSONObject jSONObject, AttachmentMessageDM attachmentMessageDM) throws JSONException {
        jSONObject.put(FirebaseAnalytics.Param.CONTENT_TYPE, attachmentMessageDM.contentType);
        jSONObject.put("file_name", attachmentMessageDM.fileName);
        jSONObject.put("filePath", attachmentMessageDM.filePath);
        jSONObject.put("url", attachmentMessageDM.attachmentUrl);
        jSONObject.put("size", attachmentMessageDM.size);
        jSONObject.put("is_secure", attachmentMessageDM.isSecureAttachment);
        jSONObject.put("is_user_attachment_zipped", attachmentMessageDM.isZipped);
        jSONObject.put("is_user_attachment_rejected", attachmentMessageDM.isRejected);
    }

    private void buildMetaForScreenshotAttachmentMessage(JSONObject jSONObject, ScreenshotMessageDM screenshotMessageDM) throws JSONException {
        buildJsonObjectForAttachmentMessage(jSONObject, screenshotMessageDM);
        jSONObject.put("thumbnail_url", screenshotMessageDM.thumbnailUrl);
        jSONObject.put("referredMessageId", screenshotMessageDM.refersMessageId);
        jSONObject.put("is_secure", screenshotMessageDM.isSecureAttachment);
        jSONObject.put("is_user_attachment_zipped", screenshotMessageDM.isZipped);
        jSONObject.put("is_user_attachment_rejected", screenshotMessageDM.isRejected);
    }

    private void buildMetaForImageAttachmentMessage(JSONObject jSONObject, ImageAttachmentMessageDM imageAttachmentMessageDM) throws JSONException {
        buildJsonObjectForAttachmentMessage(jSONObject, imageAttachmentMessageDM);
        jSONObject.put("thumbnail_url", imageAttachmentMessageDM.thumbnailUrl);
        jSONObject.put("thumbnailFilePath", imageAttachmentMessageDM.thumbnailFilePath);
        jSONObject.put("is_secure", imageAttachmentMessageDM.isSecureAttachment);
    }

    private void buildMetaForAutoRetriableMessage(JSONObject jSONObject, AutoRetriableMessageDM autoRetriableMessageDM) throws JSONException {
        jSONObject.put("message_sync_status", autoRetriableMessageDM.getSyncStatus());
    }

    private void buildMetaForMessageSyncState(JSONObject jSONObject, int i) throws JSONException {
        jSONObject.put("message_sync_status", i);
    }

    private void buildMetaForActionCardMessage(JSONObject jSONObject, AdminActionCardMessageDM adminActionCardMessageDM) throws JSONException {
        jSONObject.put("original_message_server_id", adminActionCardMessageDM.originalMessageServerId);
    }

    public synchronized DAOResult<MessageDM> readMessageWithServerId(String str) {
        DAOResult<List<MessageDM>> messages = readMessages("server_id = ?", new String[]{String.valueOf(str)});
        MessageDM messageDM = null;
        if (!messages.isSuccess()) {
            return new DAOResult<>(false, null);
        }
        List<MessageDM> data = messages.getData();
        if (!ListUtils.isEmpty(data)) {
            messageDM = data.get(0);
        }
        return new DAOResult<>(true, messageDM);
    }

    public synchronized DAOResult<MessageDM> readMessageWithLocalId(Long l) {
        DAOResult<List<MessageDM>> messages = readMessages("_id = ?", new String[]{String.valueOf(l)});
        MessageDM messageDM = null;
        if (!messages.isSuccess()) {
            return new DAOResult<>(false, null);
        }
        List<MessageDM> data = messages.getData();
        if (!ListUtils.isEmpty(data)) {
            messageDM = data.get(0);
        }
        return new DAOResult<>(true, messageDM);
    }

    public synchronized void dropAndCreateDatabase() {
        ConversationDBHelper conversationDBHelper = this.dbHelper;
        conversationDBHelper.dropAndCreateAllTables(conversationDBHelper.getWritableDatabase());
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0050 A[Catch: all -> 0x0056, TRY_ENTER, TryCatch #2 {, blocks: (B:3:0x0001, B:5:0x0008, B:13:0x0036, B:29:0x0050, B:30:0x0053), top: B:38:0x0001 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized com.helpshift.support.Faq getAdminFAQSuggestion(java.lang.String r11, java.lang.String r12) {
        /*
            r10 = this;
            monitor-enter(r10)
            boolean r0 = com.helpshift.util.StringUtils.isEmpty(r11)     // Catch: java.lang.Throwable -> L56
            r1 = 0
            if (r0 != 0) goto L54
            boolean r0 = com.helpshift.util.StringUtils.isEmpty(r12)     // Catch: java.lang.Throwable -> L56
            if (r0 == 0) goto Lf
            goto L54
        Lf:
            com.helpshift.db.conversation.ConversationDBHelper r0 = r10.dbHelper     // Catch: java.lang.Throwable -> L3c java.lang.Exception -> L3e
            android.database.sqlite.SQLiteDatabase r2 = r0.getReadableDatabase()     // Catch: java.lang.Throwable -> L3c java.lang.Exception -> L3e
            java.lang.String r3 = "faq_suggestions"
            r4 = 0
            java.lang.String r5 = "publish_id = ? AND language = ?"
            r0 = 2
            java.lang.String[] r6 = new java.lang.String[r0]     // Catch: java.lang.Throwable -> L3c java.lang.Exception -> L3e
            r0 = 0
            r6[r0] = r11     // Catch: java.lang.Throwable -> L3c java.lang.Exception -> L3e
            r11 = 1
            r6[r11] = r12     // Catch: java.lang.Throwable -> L3c java.lang.Exception -> L3e
            r7 = 0
            r8 = 0
            r9 = 0
            android.database.Cursor r11 = r2.query(r3, r4, r5, r6, r7, r8, r9)     // Catch: java.lang.Throwable -> L3c java.lang.Exception -> L3e
            boolean r12 = r11.moveToFirst()     // Catch: java.lang.Exception -> L3a java.lang.Throwable -> L4c
            if (r12 == 0) goto L34
            com.helpshift.support.Faq r1 = r10.cursorToFaq(r11)     // Catch: java.lang.Exception -> L3a java.lang.Throwable -> L4c
        L34:
            if (r11 == 0) goto L4a
        L36:
            r11.close()     // Catch: java.lang.Throwable -> L56
            goto L4a
        L3a:
            r12 = move-exception
            goto L40
        L3c:
            r12 = move-exception
            goto L4e
        L3e:
            r12 = move-exception
            r11 = r1
        L40:
            java.lang.String r0 = "Helpshift_ConverDB"
            java.lang.String r2 = "Error in getAdminFAQSuggestion"
            com.helpshift.util.HSLogger.e(r0, r2, r12)     // Catch: java.lang.Throwable -> L4c
            if (r11 == 0) goto L4a
            goto L36
        L4a:
            monitor-exit(r10)
            return r1
        L4c:
            r12 = move-exception
            r1 = r11
        L4e:
            if (r1 == 0) goto L53
            r1.close()     // Catch: java.lang.Throwable -> L56
        L53:
            throw r12     // Catch: java.lang.Throwable -> L56
        L54:
            monitor-exit(r10)
            return r1
        L56:
            r11 = move-exception
            monitor-exit(r10)
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.common.conversation.ConversationDB.getAdminFAQSuggestion(java.lang.String, java.lang.String):com.helpshift.support.Faq");
    }

    public synchronized void insertOrUpdateAdminFAQSuggestion(Faq faq) {
        ContentValues contentValuesFaqToContentValues = faqToContentValues(faq);
        String[] strArr = {faq.publish_id, faq.language};
        try {
            SQLiteDatabase writableDatabase = this.dbHelper.getWritableDatabase();
            if (!exists(writableDatabase, FaqsTable.TABLE_NAME, "publish_id = ? AND language = ?", strArr)) {
                writableDatabase.insert(FaqsTable.TABLE_NAME, null, contentValuesFaqToContentValues);
            } else {
                writableDatabase.update(FaqsTable.TABLE_NAME, contentValuesFaqToContentValues, "publish_id = ? AND language = ?", strArr);
            }
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in insertOrUpdateAdminFAQSuggestion", e);
        }
    }

    private Faq cursorToFaq(Cursor cursor) {
        return new Faq(cursor.getLong(cursor.getColumnIndex("_id")), cursor.getString(cursor.getColumnIndex("question_id")), cursor.getString(cursor.getColumnIndex("publish_id")), cursor.getString(cursor.getColumnIndex("language")), cursor.getString(cursor.getColumnIndex("section_id")), cursor.getString(cursor.getColumnIndex("title")), cursor.getString(cursor.getColumnIndex("body")), cursor.getInt(cursor.getColumnIndex("helpful")), Boolean.valueOf(cursor.getInt(cursor.getColumnIndex("rtl")) == 1), HSJSONUtils.jsonArrayToStringArrayList(cursor.getString(cursor.getColumnIndex("tags"))), HSJSONUtils.jsonArrayToStringArrayList(cursor.getString(cursor.getColumnIndex("c_tags"))));
    }

    public synchronized void removeAdminFAQSuggestion(String str, String str2) {
        if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2)) {
            try {
                this.dbHelper.getWritableDatabase().delete(FaqsTable.TABLE_NAME, "publish_id = ? AND language = ?", new String[]{str, str2});
            } catch (Exception e) {
                HSLogger.e(TAG, "Error in removeAdminFAQSuggestion", e);
            }
        }
    }

    public synchronized void deleteConversationInboxData(long j) {
        try {
            this.dbHelper.getWritableDatabase().execSQL("delete from conversation_inbox where user_local_id = ?", new String[]{String.valueOf(j)});
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in delete conversationInboxData with UserLocalId", e);
        }
    }

    public synchronized void deleteConversations(long j) {
        String str = "delete from messages where messages.conversation_id IN  ( " + ("select issues._id from  " + ConversationTable.TABLE_NAME + "  where issues.user_local_id = ?") + " )";
        SQLiteDatabase writableDatabase = null;
        try {
            try {
                writableDatabase = this.dbHelper.getWritableDatabase();
                writableDatabase.beginTransaction();
                writableDatabase.execSQL(str, new String[]{String.valueOf(j)});
                writableDatabase.execSQL("delete from issues where user_local_id = ?", new String[]{String.valueOf(j)});
                writableDatabase.setTransactionSuccessful();
            } catch (Exception e) {
                HSLogger.e(TAG, "Error in delete conversations with UserLocalId", e);
                if (writableDatabase != null) {
                }
            }
        } finally {
            if (writableDatabase != null) {
                writableDatabase.endTransaction();
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x00a0 A[Catch: all -> 0x00a4, TRY_ENTER, TryCatch #1 {, blocks: (B:3:0x0001, B:10:0x0084, B:25:0x00a0, B:26:0x00a3), top: B:30:0x0001 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized java.lang.String getOldestMessageCursor(long r10) {
        /*
            r9 = this;
            monitor-enter(r9)
            java.lang.String r0 = "message_create_at"
            java.lang.String r1 = "issues.user_local_id"
            java.lang.String r2 = "issues._id"
            java.lang.String r3 = "messages.conversation_id"
            java.lang.String r4 = "messages.created_at"
            java.lang.String r5 = "messages.epoch_time_created_at"
            java.lang.StringBuilder r6 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> La4
            r6.<init>()     // Catch: java.lang.Throwable -> La4
            java.lang.String r7 = "SELECT "
            r6.append(r7)     // Catch: java.lang.Throwable -> La4
            r6.append(r4)     // Catch: java.lang.Throwable -> La4
            java.lang.String r4 = " AS "
            r6.append(r4)     // Catch: java.lang.Throwable -> La4
            r6.append(r0)     // Catch: java.lang.Throwable -> La4
            java.lang.String r4 = " FROM "
            r6.append(r4)     // Catch: java.lang.Throwable -> La4
            java.lang.String r4 = "issues"
            r6.append(r4)     // Catch: java.lang.Throwable -> La4
            java.lang.String r4 = " INNER JOIN "
            r6.append(r4)     // Catch: java.lang.Throwable -> La4
            java.lang.String r4 = "messages"
            r6.append(r4)     // Catch: java.lang.Throwable -> La4
            java.lang.String r4 = " ON "
            r6.append(r4)     // Catch: java.lang.Throwable -> La4
            r6.append(r2)     // Catch: java.lang.Throwable -> La4
            java.lang.String r2 = " = "
            r6.append(r2)     // Catch: java.lang.Throwable -> La4
            r6.append(r3)     // Catch: java.lang.Throwable -> La4
            java.lang.String r2 = " WHERE "
            r6.append(r2)     // Catch: java.lang.Throwable -> La4
            r6.append(r1)     // Catch: java.lang.Throwable -> La4
            java.lang.String r1 = " = ? ORDER BY "
            r6.append(r1)     // Catch: java.lang.Throwable -> La4
            r6.append(r5)     // Catch: java.lang.Throwable -> La4
            java.lang.String r1 = "  ASC LIMIT 1"
            r6.append(r1)     // Catch: java.lang.Throwable -> La4
            java.lang.String r1 = r6.toString()     // Catch: java.lang.Throwable -> La4
            r2 = 1
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch: java.lang.Throwable -> La4
            r3 = 0
            java.lang.String r10 = java.lang.String.valueOf(r10)     // Catch: java.lang.Throwable -> La4
            r2[r3] = r10     // Catch: java.lang.Throwable -> La4
            r10 = 0
            com.helpshift.db.conversation.ConversationDBHelper r11 = r9.dbHelper     // Catch: java.lang.Throwable -> L8a java.lang.Exception -> L8f
            android.database.sqlite.SQLiteDatabase r11 = r11.getReadableDatabase()     // Catch: java.lang.Throwable -> L8a java.lang.Exception -> L8f
            android.database.Cursor r11 = r11.rawQuery(r1, r2)     // Catch: java.lang.Throwable -> L8a java.lang.Exception -> L8f
            boolean r1 = r11.moveToFirst()     // Catch: java.lang.Exception -> L88 java.lang.Throwable -> L9d
            if (r1 == 0) goto L82
            int r0 = r11.getColumnIndex(r0)     // Catch: java.lang.Exception -> L88 java.lang.Throwable -> L9d
            java.lang.String r10 = r11.getString(r0)     // Catch: java.lang.Exception -> L88 java.lang.Throwable -> L9d
        L82:
            if (r11 == 0) goto L9b
        L84:
            r11.close()     // Catch: java.lang.Throwable -> La4
            goto L9b
        L88:
            r0 = move-exception
            goto L91
        L8a:
            r11 = move-exception
            r8 = r11
            r11 = r10
            r10 = r8
            goto L9e
        L8f:
            r0 = move-exception
            r11 = r10
        L91:
            java.lang.String r1 = "Helpshift_ConverDB"
            java.lang.String r2 = "Error in read messages"
            com.helpshift.util.HSLogger.e(r1, r2, r0)     // Catch: java.lang.Throwable -> L9d
            if (r11 == 0) goto L9b
            goto L84
        L9b:
            monitor-exit(r9)
            return r10
        L9d:
            r10 = move-exception
        L9e:
            if (r11 == 0) goto La3
            r11.close()     // Catch: java.lang.Throwable -> La4
        La3:
            throw r10     // Catch: java.lang.Throwable -> La4
        La4:
            r10 = move-exception
            monitor-exit(r9)
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.common.conversation.ConversationDB.getOldestMessageCursor(long):java.lang.String");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0055 A[Catch: all -> 0x0059, TRY_ENTER, TryCatch #2 {, blocks: (B:3:0x0001, B:11:0x0039, B:26:0x0055, B:27:0x0058), top: B:34:0x0001 }] */
    /* JADX WARN: Type inference failed for: r11v10 */
    /* JADX WARN: Type inference failed for: r11v11 */
    /* JADX WARN: Type inference failed for: r11v12 */
    /* JADX WARN: Type inference failed for: r11v3, types: [android.database.Cursor] */
    /* JADX WARN: Type inference failed for: r11v8 */
    /* JADX WARN: Type inference failed for: r11v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized java.lang.Long getOldestConversationEpochCreatedAtTime(long r11) {
        /*
            r10 = this;
            monitor-enter(r10)
            java.lang.String r3 = "user_local_id = ?"
            r0 = 1
            java.lang.String[] r4 = new java.lang.String[r0]     // Catch: java.lang.Throwable -> L59
            r0 = 0
            java.lang.String r11 = java.lang.String.valueOf(r11)     // Catch: java.lang.Throwable -> L59
            r4[r0] = r11     // Catch: java.lang.Throwable -> L59
            r11 = 0
            com.helpshift.db.conversation.ConversationDBHelper r12 = r10.dbHelper     // Catch: java.lang.Throwable -> L3f java.lang.Exception -> L44
            android.database.sqlite.SQLiteDatabase r0 = r12.getReadableDatabase()     // Catch: java.lang.Throwable -> L3f java.lang.Exception -> L44
            java.lang.String r1 = "issues"
            java.lang.String r12 = "epoch_time_created_at"
            java.lang.String[] r2 = new java.lang.String[]{r12}     // Catch: java.lang.Throwable -> L3f java.lang.Exception -> L44
            r5 = 0
            r6 = 0
            java.lang.String r7 = "epoch_time_created_at ASC"
            java.lang.String r8 = "1"
            android.database.Cursor r12 = r0.query(r1, r2, r3, r4, r5, r6, r7, r8)     // Catch: java.lang.Throwable -> L3f java.lang.Exception -> L44
            boolean r0 = r12.moveToFirst()     // Catch: java.lang.Exception -> L3d java.lang.Throwable -> L52
            if (r0 == 0) goto L37
            java.lang.String r0 = "epoch_time_created_at"
            java.lang.Class<java.lang.Long> r1 = java.lang.Long.class
            java.lang.Object r0 = com.helpshift.util.DatabaseUtils.parseColumnSafe(r12, r0, r1)     // Catch: java.lang.Exception -> L3d java.lang.Throwable -> L52
            java.lang.Long r0 = (java.lang.Long) r0     // Catch: java.lang.Exception -> L3d java.lang.Throwable -> L52
            r11 = r0
        L37:
            if (r12 == 0) goto L50
        L39:
            r12.close()     // Catch: java.lang.Throwable -> L59
            goto L50
        L3d:
            r0 = move-exception
            goto L46
        L3f:
            r12 = move-exception
            r9 = r12
            r12 = r11
            r11 = r9
            goto L53
        L44:
            r0 = move-exception
            r12 = r11
        L46:
            java.lang.String r1 = "Helpshift_ConverDB"
            java.lang.String r2 = "Error in getting latest conversation created_at time"
            com.helpshift.util.HSLogger.e(r1, r2, r0)     // Catch: java.lang.Throwable -> L52
            if (r12 == 0) goto L50
            goto L39
        L50:
            monitor-exit(r10)
            return r11
        L52:
            r11 = move-exception
        L53:
            if (r12 == 0) goto L58
            r12.close()     // Catch: java.lang.Throwable -> L59
        L58:
            throw r11     // Catch: java.lang.Throwable -> L59
        L59:
            r11 = move-exception
            monitor-exit(r10)
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.common.conversation.ConversationDB.getOldestConversationEpochCreatedAtTime(long):java.lang.Long");
    }

    private class ImageAttachmentInfo extends AttachmentInfo {
        final String thumbnailFilePath;
        final String thumbnailUrl;

        ImageAttachmentInfo(JSONObject jSONObject) {
            super(jSONObject);
            this.thumbnailUrl = jSONObject.optString("thumbnail_url", null);
            this.thumbnailFilePath = jSONObject.optString("thumbnailFilePath", null);
        }
    }

    private class AttachmentInfo {
        final String contentType;
        final String fileName;
        final String filePath;
        final boolean isRejected;
        final boolean isSecure;
        final boolean isZipped;
        final int size;
        final String url;

        AttachmentInfo(JSONObject jSONObject) {
            this.fileName = jSONObject.optString("file_name", null);
            this.contentType = jSONObject.optString(FirebaseAnalytics.Param.CONTENT_TYPE, null);
            this.url = jSONObject.optString("url", null);
            this.size = jSONObject.optInt("size", 0);
            this.filePath = jSONObject.optString("filePath", null);
            this.isSecure = jSONObject.optBoolean("is_secure", false);
            this.isZipped = jSONObject.optBoolean("is_user_attachment_zipped", false);
            this.isRejected = jSONObject.optBoolean("is_user_attachment_rejected", false);
        }
    }
}
