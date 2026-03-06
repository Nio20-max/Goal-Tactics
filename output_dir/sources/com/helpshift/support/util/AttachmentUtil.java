package com.helpshift.support.util;

import android.content.Context;
import android.net.Uri;
import com.helpshift.common.domain.AttachmentFileManagerDM;
import com.helpshift.conversation.dto.AttachmentPickerFile;
import com.helpshift.support.HSApiData;
import com.helpshift.util.AndroidFileUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.IOUtils;
import com.helpshift.util.ImageUtil;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

/* JADX INFO: loaded from: classes2.dex */
public final class AttachmentUtil {
    private static final int IMAGE_MAX_DIMENSION = 1024;
    private static final String TAG = "Helpshift_AttachUtil";

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v0, types: [com.helpshift.support.HSApiData] */
    /* JADX WARN: Type inference failed for: r1v1 */
    /* JADX WARN: Type inference failed for: r1v2 */
    /* JADX WARN: Type inference failed for: r1v3, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r1v4, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r1v5 */
    /* JADX WARN: Type inference failed for: r1v6, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r1v7, types: [java.io.FileInputStream, java.io.InputStream] */
    /* JADX WARN: Type inference failed for: r1v8 */
    public static String copyAttachment(String str) throws Throwable {
        FileOutputStream fileOutputStreamOpenFileOutput;
        ?? r1;
        Context applicationContext = HelpshiftContext.getApplicationContext();
        ?? hSApiData = new HSApiData(applicationContext);
        FileOutputStream fileOutputStream = null;
        try {
            try {
                String strBuildLocalAttachmentCopyFileName = buildLocalAttachmentCopyFileName(AndroidFileUtil.getFileExtension(str));
                File file = new File(applicationContext.getFilesDir(), strBuildLocalAttachmentCopyFileName);
                String absolutePath = file.getAbsolutePath();
                if (file.exists()) {
                    r1 = 0;
                } else {
                    hSApiData.storeFile(strBuildLocalAttachmentCopyFileName);
                    hSApiData = new FileInputStream(new File(str));
                    try {
                        fileOutputStreamOpenFileOutput = applicationContext.openFileOutput(strBuildLocalAttachmentCopyFileName, 0);
                        try {
                            byte[] bArr = new byte[8192];
                            while (true) {
                                int i = hSApiData.read(bArr);
                                if (i == -1) {
                                    break;
                                }
                                fileOutputStreamOpenFileOutput.write(bArr, 0, i);
                            }
                            if (ImageUtil.isResizableImage(absolutePath)) {
                                ImageUtil.scaleDownAndSaveWithMaxDimension(absolutePath, 1024);
                            }
                            fileOutputStream = fileOutputStreamOpenFileOutput;
                            r1 = hSApiData;
                        } catch (NullPointerException e) {
                            e = e;
                            HSLogger.d(TAG, "NPE", e);
                            IOUtils.closeQuitely(fileOutputStreamOpenFileOutput);
                            IOUtils.closeQuitely(hSApiData);
                            return null;
                        }
                    } catch (NullPointerException e2) {
                        e = e2;
                        fileOutputStreamOpenFileOutput = null;
                    } catch (Throwable th) {
                        th = th;
                        IOUtils.closeQuitely(fileOutputStream);
                        IOUtils.closeQuitely(hSApiData);
                        throw th;
                    }
                }
                IOUtils.closeQuitely(fileOutputStream);
                IOUtils.closeQuitely(r1);
                return absolutePath;
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = applicationContext;
            }
        } catch (NullPointerException e3) {
            e = e3;
            fileOutputStreamOpenFileOutput = null;
            hSApiData = 0;
        } catch (Throwable th3) {
            th = th3;
            hSApiData = 0;
        }
    }

    public static void copyAttachment(AttachmentPickerFile attachmentPickerFile) throws IOException {
        InputStream inputStreamOpenInputStream;
        Uri uri = (Uri) attachmentPickerFile.transientUri;
        if (uri == null) {
            HSLogger.d(TAG, "Can't proceed if uri is null");
            return;
        }
        Context applicationContext = HelpshiftContext.getApplicationContext();
        HSApiData hSApiData = new HSApiData(applicationContext);
        FileOutputStream fileOutputStreamOpenFileOutput = null;
        try {
            String strBuildLocalAttachmentCopyFileName = buildLocalAttachmentCopyFileName(AndroidFileUtil.getFileExtensionFromMimeType(applicationContext, uri));
            File file = new File(applicationContext.getFilesDir(), strBuildLocalAttachmentCopyFileName);
            String absolutePath = file.getAbsolutePath();
            if (!file.exists()) {
                hSApiData.storeFile(strBuildLocalAttachmentCopyFileName);
                inputStreamOpenInputStream = applicationContext.getContentResolver().openInputStream(uri);
                try {
                    fileOutputStreamOpenFileOutput = applicationContext.openFileOutput(strBuildLocalAttachmentCopyFileName, 0);
                    byte[] bArr = new byte[8192];
                    while (true) {
                        int i = inputStreamOpenInputStream.read(bArr);
                        if (i == -1) {
                            break;
                        } else {
                            fileOutputStreamOpenFileOutput.write(bArr, 0, i);
                        }
                    }
                    attachmentPickerFile.filePath = absolutePath;
                    attachmentPickerFile.isFileCompressionAndCopyingDone = true;
                    if (ImageUtil.isResizableImage(absolutePath)) {
                        ImageUtil.scaleDownAndSaveWithMaxDimension(absolutePath, 1024, ImageUtil.getExifOrientation(applicationContext, uri));
                    }
                } catch (Throwable th) {
                    th = th;
                    IOUtils.closeQuitely(fileOutputStreamOpenFileOutput);
                    IOUtils.closeQuitely(inputStreamOpenInputStream);
                    throw th;
                }
            } else {
                attachmentPickerFile.filePath = absolutePath;
                attachmentPickerFile.isFileCompressionAndCopyingDone = true;
                inputStreamOpenInputStream = null;
            }
            IOUtils.closeQuitely(fileOutputStreamOpenFileOutput);
            IOUtils.closeQuitely(inputStreamOpenInputStream);
        } catch (Throwable th2) {
            th = th2;
            inputStreamOpenInputStream = null;
        }
    }

    private static String buildLocalAttachmentCopyFileName(String str) {
        String str2 = AttachmentFileManagerDM.LOCAL_RSC_MESSAGE_PREFIX + UUID.randomUUID().toString() + "0-thumbnail";
        if (str == null) {
            return str2;
        }
        return str2 + "." + str;
    }
}
