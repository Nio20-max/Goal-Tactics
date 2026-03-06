package com.helpshift.conversation.dto;

/* JADX INFO: loaded from: classes2.dex */
public class AttachmentPickerFile {
    public int attachmentType;
    public String filePath;
    public boolean isFileCompressionAndCopyingDone;
    public final String originalFileName;
    public final Long originalFileSize;
    public Object transientUri;

    public AttachmentPickerFile(String str, String str2, Long l) {
        this.filePath = str;
        this.originalFileName = str2;
        this.originalFileSize = l;
    }

    public AttachmentPickerFile(Object obj, String str, Long l) {
        this.transientUri = obj;
        this.originalFileName = str;
        this.originalFileSize = l;
    }
}
