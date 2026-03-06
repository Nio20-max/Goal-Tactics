package com.helpshift.widget;

import com.helpshift.conversation.dto.AttachmentPickerFile;

/* JADX INFO: loaded from: classes2.dex */
public class ImageAttachmentViewState extends HSBaseObservable {
    protected AttachmentPickerFile attachmentPickerFile;
    protected boolean clickable = true;

    public AttachmentPickerFile getAttachmentPickerFile() {
        return this.attachmentPickerFile;
    }

    public String getImagePath() {
        AttachmentPickerFile attachmentPickerFile = this.attachmentPickerFile;
        return (attachmentPickerFile == null || attachmentPickerFile.filePath == null) ? "" : this.attachmentPickerFile.filePath;
    }

    public boolean isClickable() {
        return this.clickable;
    }

    @Override // com.helpshift.widget.HSBaseObservable
    protected void notifyInitialState() {
        notifyChange(this);
    }
}
