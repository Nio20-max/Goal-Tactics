package com.helpshift.common.platform;

import android.content.Context;
import com.helpshift.common.conversation.ConversationDB;
import com.helpshift.conversation.dao.ConversationInboxDAO;
import com.helpshift.conversation.dao.PushNotificationData;
import com.helpshift.conversation.dto.AttachmentPickerFile;
import com.helpshift.conversation.dto.ConversationDetailDTO;
import com.helpshift.conversation.dto.dao.ConversationInboxRecord;
import com.helpshift.util.StringUtils;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class AndroidConversationInboxDAO implements ConversationInboxDAO {
    private static final String KEY_NOTIFICATION_COUNT = "notification_count";
    private static final String KEY_NOTIFICATION_TITLE = "notification_title";
    private static final String KEY_PUSH_NOTIFICATION_DATA = "push_notification_data";
    private ConversationDB conversationDB;
    private KVStore kvStore;

    public AndroidConversationInboxDAO(Context context, KVStore kVStore) {
        this.conversationDB = ConversationDB.getInstance(context);
        this.kvStore = kVStore;
    }

    private synchronized ConversationInboxRecord.Builder getConversationInboxRecordBuilder(long j) {
        ConversationInboxRecord.Builder builder;
        ConversationInboxRecord conversationInboxRecord = this.conversationDB.readConversationInboxRecord(j);
        if (conversationInboxRecord == null) {
            builder = new ConversationInboxRecord.Builder(j);
        } else {
            builder = new ConversationInboxRecord.Builder(conversationInboxRecord);
        }
        return builder;
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public synchronized void saveDescriptionDetail(long j, ConversationDetailDTO conversationDetailDTO) {
        ConversationInboxRecord.Builder conversationInboxRecordBuilder = getConversationInboxRecordBuilder(j);
        conversationInboxRecordBuilder.setDescription(conversationDetailDTO.title);
        conversationInboxRecordBuilder.setDescriptionTimeStamp(conversationDetailDTO.timestamp);
        conversationInboxRecordBuilder.setDescriptionType(conversationDetailDTO.type);
        this.conversationDB.storeConversationInboxRecord(conversationInboxRecordBuilder.build());
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public synchronized ConversationDetailDTO getDescriptionDetail(long j) {
        ConversationDetailDTO conversationDetailDTO;
        ConversationInboxRecord conversationInboxRecord = this.conversationDB.readConversationInboxRecord(j);
        conversationDetailDTO = null;
        if (conversationInboxRecord != null) {
            String str = conversationInboxRecord.description;
            long j2 = conversationInboxRecord.descriptionTimeStamp;
            int i = conversationInboxRecord.descriptionType;
            if (!StringUtils.isEmpty(str)) {
                conversationDetailDTO = new ConversationDetailDTO(str, j2, i);
            }
        }
        return conversationDetailDTO;
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public synchronized void saveName(long j, String str) {
        ConversationInboxRecord.Builder conversationInboxRecordBuilder = getConversationInboxRecordBuilder(j);
        conversationInboxRecordBuilder.setFormName(str);
        this.conversationDB.storeConversationInboxRecord(conversationInboxRecordBuilder.build());
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public synchronized String getName(long j) {
        ConversationInboxRecord conversationInboxRecord;
        conversationInboxRecord = this.conversationDB.readConversationInboxRecord(j);
        return conversationInboxRecord != null ? conversationInboxRecord.formName : null;
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public synchronized void saveEmail(long j, String str) {
        ConversationInboxRecord.Builder conversationInboxRecordBuilder = getConversationInboxRecordBuilder(j);
        conversationInboxRecordBuilder.setFormEmail(str);
        this.conversationDB.storeConversationInboxRecord(conversationInboxRecordBuilder.build());
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public synchronized String getEmail(long j) {
        ConversationInboxRecord conversationInboxRecord;
        conversationInboxRecord = this.conversationDB.readConversationInboxRecord(j);
        return conversationInboxRecord != null ? conversationInboxRecord.formEmail : null;
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public synchronized void saveImageAttachment(long j, AttachmentPickerFile attachmentPickerFile) {
        ConversationInboxRecord.Builder conversationInboxRecordBuilder = getConversationInboxRecordBuilder(j);
        conversationInboxRecordBuilder.setImageAttachmentDraft(attachmentPickerFile);
        this.conversationDB.storeConversationInboxRecord(conversationInboxRecordBuilder.build());
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public synchronized AttachmentPickerFile getImageAttachment(long j) {
        ConversationInboxRecord conversationInboxRecord;
        conversationInboxRecord = this.conversationDB.readConversationInboxRecord(j);
        return conversationInboxRecord != null ? conversationInboxRecord.imageAttachmentDraft : null;
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public synchronized void saveConversationInboxTimestamp(long j, String str) {
        ConversationInboxRecord.Builder conversationInboxRecordBuilder = getConversationInboxRecordBuilder(j);
        conversationInboxRecordBuilder.setLastSyncTimestamp(str);
        this.conversationDB.storeConversationInboxRecord(conversationInboxRecordBuilder.build());
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public synchronized String getConversationInboxTimestamp(long j) {
        ConversationInboxRecord conversationInboxRecord;
        conversationInboxRecord = this.conversationDB.readConversationInboxRecord(j);
        return conversationInboxRecord != null ? conversationInboxRecord.lastSyncTimestamp : null;
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public synchronized void saveConversationArchivalPrefillText(long j, String str) {
        ConversationInboxRecord.Builder conversationInboxRecordBuilder = getConversationInboxRecordBuilder(j);
        conversationInboxRecordBuilder.setArchivalText(str);
        this.conversationDB.storeConversationInboxRecord(conversationInboxRecordBuilder.build());
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public synchronized String getConversationArchivalPrefillText(long j) {
        ConversationInboxRecord conversationInboxRecord;
        conversationInboxRecord = this.conversationDB.readConversationInboxRecord(j);
        return conversationInboxRecord != null ? conversationInboxRecord.archivalText : null;
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public synchronized void saveUserReplyDraft(long j, String str) {
        if (str == null) {
            str = "";
        }
        ConversationInboxRecord.Builder conversationInboxRecordBuilder = getConversationInboxRecordBuilder(j);
        conversationInboxRecordBuilder.setReplyText(str);
        this.conversationDB.storeConversationInboxRecord(conversationInboxRecordBuilder.build());
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public synchronized String getUserReplyDraft(long j) {
        ConversationInboxRecord conversationInboxRecord;
        conversationInboxRecord = this.conversationDB.readConversationInboxRecord(j);
        return conversationInboxRecord != null ? conversationInboxRecord.replyText : "";
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public synchronized boolean getPersistMessageBox(long j) {
        ConversationInboxRecord conversationInboxRecord;
        conversationInboxRecord = this.conversationDB.readConversationInboxRecord(j);
        return conversationInboxRecord != null ? conversationInboxRecord.persistMessageBox : false;
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public synchronized void savePersistMessageBox(long j, boolean z) {
        ConversationInboxRecord.Builder conversationInboxRecordBuilder = getConversationInboxRecordBuilder(j);
        conversationInboxRecordBuilder.setPersistMessageBox(z);
        this.conversationDB.storeConversationInboxRecord(conversationInboxRecordBuilder.build());
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public PushNotificationData getPushNotificationData(String str) {
        String string = this.kvStore.getString(KEY_PUSH_NOTIFICATION_DATA);
        if (StringUtils.isEmpty(string)) {
            return null;
        }
        try {
            JSONObject jSONObject = new JSONObject(string);
            if (!jSONObject.has(str)) {
                return null;
            }
            JSONObject jSONObject2 = jSONObject.getJSONObject(str);
            return new PushNotificationData(jSONObject2.getInt(KEY_NOTIFICATION_COUNT), jSONObject2.getString(KEY_NOTIFICATION_TITLE));
        } catch (JSONException unused) {
            return null;
        }
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public void setPushNotificationData(String str, PushNotificationData pushNotificationData) {
        String string = this.kvStore.getString(KEY_PUSH_NOTIFICATION_DATA);
        if (StringUtils.isEmpty(string)) {
            string = "{}";
        }
        try {
            JSONObject jSONObject = new JSONObject(string);
            if (pushNotificationData == null) {
                jSONObject.remove(str);
            } else {
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put(KEY_NOTIFICATION_COUNT, pushNotificationData.count);
                jSONObject2.put(KEY_NOTIFICATION_TITLE, pushNotificationData.title);
                jSONObject.put(str, jSONObject2);
            }
            this.kvStore.setString(KEY_PUSH_NOTIFICATION_DATA, jSONObject.toString());
        } catch (JSONException unused) {
        }
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public void deleteUserData(long j) {
        if (j > 0) {
            this.conversationDB.deleteConversationInboxData(j);
        }
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public void saveHasOlderMessages(long j, boolean z) {
        ConversationInboxRecord.Builder conversationInboxRecordBuilder = getConversationInboxRecordBuilder(j);
        conversationInboxRecordBuilder.setHasOlderMessages(z);
        this.conversationDB.storeConversationInboxRecord(conversationInboxRecordBuilder.build());
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public boolean getHasOlderMessages(long j) {
        ConversationInboxRecord conversationInboxRecord = this.conversationDB.readConversationInboxRecord(j);
        if (conversationInboxRecord == null || conversationInboxRecord.hasOlderMessages == null) {
            return true;
        }
        return conversationInboxRecord.hasOlderMessages.booleanValue();
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public void saveLastConversationsRedactionTime(long j, long j2) {
        ConversationInboxRecord.Builder conversationInboxRecordBuilder = getConversationInboxRecordBuilder(j);
        conversationInboxRecordBuilder.setLastConversationsRedactionTime(Long.valueOf(j2));
        this.conversationDB.storeConversationInboxRecord(conversationInboxRecordBuilder.build());
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public Long getLastConversationsRedactionTime(long j) {
        ConversationInboxRecord conversationInboxRecord = this.conversationDB.readConversationInboxRecord(j);
        if (conversationInboxRecord != null) {
            return conversationInboxRecord.lastConversationsRedactionTime;
        }
        return null;
    }

    @Override // com.helpshift.conversation.dao.ConversationInboxDAO
    public void resetDataAfterConversationsDeletion(long j) {
        ConversationInboxRecord.Builder conversationInboxRecordBuilder = getConversationInboxRecordBuilder(j);
        conversationInboxRecordBuilder.setHasOlderMessages(true);
        conversationInboxRecordBuilder.setLastSyncTimestamp(null);
        this.conversationDB.storeConversationInboxRecord(conversationInboxRecordBuilder.build());
    }
}
