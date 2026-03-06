package com.helpshift.common.domain;

import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.dto.AttachmentPickerFile;
import java.io.File;

/* JADX INFO: loaded from: classes2.dex */
public class AttachmentFileManagerDM {
    public static final String LOCAL_RSC_MESSAGE_PREFIX = "localRscMessage_";
    private Domain domain;
    Platform platform;

    public interface Listener {
        void onCompressAndCopyFailure(RootAPIException rootAPIException);

        void onCompressAndCopySuccess(AttachmentPickerFile attachmentPickerFile);
    }

    public AttachmentFileManagerDM(Domain domain, Platform platform) {
        this.domain = domain;
        this.platform = platform;
    }

    public void compressAndCopyAttachment(final AttachmentPickerFile attachmentPickerFile, final Listener listener) {
        this.domain.runParallel(new F() { // from class: com.helpshift.common.domain.AttachmentFileManagerDM.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                try {
                    AttachmentFileManagerDM.this.platform.compressAndCopyAttachment(attachmentPickerFile);
                    listener.onCompressAndCopySuccess(attachmentPickerFile);
                } catch (RootAPIException e) {
                    listener.onCompressAndCopyFailure(e);
                    throw e;
                }
            }
        });
    }

    public void deleteAttachmentLocalCopy(AttachmentPickerFile attachmentPickerFile) {
        if (attachmentPickerFile == null || attachmentPickerFile.filePath == null || !attachmentPickerFile.isFileCompressionAndCopyingDone) {
            return;
        }
        new File(attachmentPickerFile.filePath).delete();
    }
}
