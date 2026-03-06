package com.helpshift.conversation.dao;

import com.helpshift.conversation.dto.AttachmentPickerFile;
import com.helpshift.conversation.dto.ConversationDetailDTO;

/* JADX INFO: loaded from: classes2.dex */
public interface ConversationInboxDAO {
    void deleteUserData(long j);

    String getConversationArchivalPrefillText(long j);

    String getConversationInboxTimestamp(long j);

    ConversationDetailDTO getDescriptionDetail(long j);

    String getEmail(long j);

    boolean getHasOlderMessages(long j);

    AttachmentPickerFile getImageAttachment(long j);

    Long getLastConversationsRedactionTime(long j);

    String getName(long j);

    boolean getPersistMessageBox(long j);

    PushNotificationData getPushNotificationData(String str);

    String getUserReplyDraft(long j);

    void resetDataAfterConversationsDeletion(long j);

    void saveConversationArchivalPrefillText(long j, String str);

    void saveConversationInboxTimestamp(long j, String str);

    void saveDescriptionDetail(long j, ConversationDetailDTO conversationDetailDTO);

    void saveEmail(long j, String str);

    void saveHasOlderMessages(long j, boolean z);

    void saveImageAttachment(long j, AttachmentPickerFile attachmentPickerFile);

    void saveLastConversationsRedactionTime(long j, long j2);

    void saveName(long j, String str);

    void savePersistMessageBox(long j, boolean z);

    void saveUserReplyDraft(long j, String str);

    void setPushNotificationData(String str, PushNotificationData pushNotificationData);
}
