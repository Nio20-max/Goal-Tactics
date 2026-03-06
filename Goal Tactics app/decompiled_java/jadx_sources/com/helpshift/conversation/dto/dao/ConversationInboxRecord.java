package com.helpshift.conversation.dto.dao;

import com.helpshift.conversation.dto.AttachmentPickerFile;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationInboxRecord {
    public final String archivalText;
    public final String description;
    public final long descriptionTimeStamp;
    public final int descriptionType;
    public final String formEmail;
    public final String formName;
    public final Boolean hasOlderMessages;
    public final AttachmentPickerFile imageAttachmentDraft;
    public final Long lastConversationsRedactionTime;
    public final String lastSyncTimestamp;
    public final boolean persistMessageBox;
    public final String replyText;
    public final long userLocalId;

    public ConversationInboxRecord(long j, String str, String str2, String str3, long j2, AttachmentPickerFile attachmentPickerFile, int i, String str4, String str5, boolean z, String str6, Boolean bool, Long l) {
        this.userLocalId = j;
        this.formName = str;
        this.formEmail = str2;
        this.description = str3;
        this.descriptionTimeStamp = j2;
        this.imageAttachmentDraft = attachmentPickerFile;
        this.descriptionType = i;
        this.archivalText = str4;
        this.replyText = str5;
        this.persistMessageBox = z;
        this.lastSyncTimestamp = str6;
        this.hasOlderMessages = bool;
        this.lastConversationsRedactionTime = l;
    }

    public static final class Builder {
        private String archivalText;
        private String description;
        private long descriptionTimeStamp;
        private int descriptionType;
        private String formEmail;
        private String formName;
        private Boolean hasOlderMessages;
        private AttachmentPickerFile imageAttachmentDraft;
        private Long lastConversationsRedactionTime;
        private String lastSyncTimestamp;
        private boolean persistMessageBox;
        private String replyText;
        private long userLocalId;

        public Builder(long j) {
            this.userLocalId = j;
        }

        public Builder(ConversationInboxRecord conversationInboxRecord) {
            this.userLocalId = conversationInboxRecord.userLocalId;
            this.formName = conversationInboxRecord.formName;
            this.formEmail = conversationInboxRecord.formEmail;
            this.description = conversationInboxRecord.description;
            this.descriptionTimeStamp = conversationInboxRecord.descriptionTimeStamp;
            this.imageAttachmentDraft = conversationInboxRecord.imageAttachmentDraft;
            this.descriptionType = conversationInboxRecord.descriptionType;
            this.archivalText = conversationInboxRecord.archivalText;
            this.lastSyncTimestamp = conversationInboxRecord.lastSyncTimestamp;
            this.persistMessageBox = conversationInboxRecord.persistMessageBox;
            this.replyText = conversationInboxRecord.replyText;
            this.hasOlderMessages = conversationInboxRecord.hasOlderMessages;
            this.lastConversationsRedactionTime = conversationInboxRecord.lastConversationsRedactionTime;
        }

        public Builder setFormName(String str) {
            this.formName = str;
            return this;
        }

        public Builder setFormEmail(String str) {
            this.formEmail = str;
            return this;
        }

        public Builder setDescription(String str) {
            this.description = str;
            return this;
        }

        public Builder setDescriptionTimeStamp(long j) {
            this.descriptionTimeStamp = j;
            return this;
        }

        public Builder setImageAttachmentDraft(AttachmentPickerFile attachmentPickerFile) {
            this.imageAttachmentDraft = attachmentPickerFile;
            return this;
        }

        public Builder setDescriptionType(int i) {
            this.descriptionType = i;
            return this;
        }

        public Builder setArchivalText(String str) {
            this.archivalText = str;
            return this;
        }

        public Builder setReplyText(String str) {
            this.replyText = str;
            return this;
        }

        public Builder setLastSyncTimestamp(String str) {
            this.lastSyncTimestamp = str;
            return this;
        }

        public Builder setPersistMessageBox(boolean z) {
            this.persistMessageBox = z;
            return this;
        }

        public Builder setHasOlderMessages(boolean z) {
            this.hasOlderMessages = Boolean.valueOf(z);
            return this;
        }

        public Builder setLastConversationsRedactionTime(Long l) {
            this.lastConversationsRedactionTime = l;
            return this;
        }

        public ConversationInboxRecord build() {
            return new ConversationInboxRecord(this.userLocalId, this.formName, this.formEmail, this.description, this.descriptionTimeStamp, this.imageAttachmentDraft, this.descriptionType, this.archivalText, this.replyText, this.persistMessageBox, this.lastSyncTimestamp, this.hasOlderMessages, this.lastConversationsRedactionTime);
        }
    }
}
