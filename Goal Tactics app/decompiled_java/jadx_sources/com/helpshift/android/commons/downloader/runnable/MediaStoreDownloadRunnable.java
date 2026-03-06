package com.helpshift.android.commons.downloader.runnable;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.ParcelFileDescriptor;
import android.provider.MediaStore;
import android.text.TextUtils;
import com.helpshift.analytics.AnalyticsEventKey;
import com.helpshift.android.commons.downloader.HsUriUtils;
import com.helpshift.android.commons.downloader.contracts.DownloadRequestedFileInfo;
import com.helpshift.android.commons.downloader.contracts.NetworkAuthDataFetcher;
import com.helpshift.android.commons.downloader.contracts.OnDownloadFinishListener;
import com.helpshift.android.commons.downloader.contracts.OnProgressChangedListener;
import com.helpshift.android.commons.downloader.storage.DownloadInProgressCacheDbStorage;
import com.helpshift.util.HSLogger;
import java.io.Closeable;
import java.io.EOFException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: classes.dex */
public class MediaStoreDownloadRunnable extends BaseDownloadRunnable {
    private static final String TAG = "Helpshift_mediaRun";
    private Context context;
    private DownloadInProgressCacheDbStorage downloadInProgressCacheDbStorage;

    @Override // com.helpshift.android.commons.downloader.runnable.BaseDownloadRunnable
    protected boolean isGzipSupported() {
        return false;
    }

    public MediaStoreDownloadRunnable(Context context, DownloadRequestedFileInfo downloadRequestedFileInfo, DownloadInProgressCacheDbStorage downloadInProgressCacheDbStorage, NetworkAuthDataFetcher networkAuthDataFetcher, OnProgressChangedListener onProgressChangedListener, OnDownloadFinishListener onDownloadFinishListener) {
        super(downloadRequestedFileInfo, networkAuthDataFetcher, onProgressChangedListener, onDownloadFinishListener);
        this.context = context;
        this.downloadInProgressCacheDbStorage = downloadInProgressCacheDbStorage;
    }

    @Override // com.helpshift.android.commons.downloader.runnable.BaseDownloadRunnable
    protected long getAlreadyDownloadedBytes() {
        Uri cachedFileUri = getCachedFileUri();
        if (cachedFileUri != null) {
            ParcelFileDescriptor parcelFileDescriptorOpenFileDescriptor = null;
            try {
                try {
                    parcelFileDescriptorOpenFileDescriptor = this.context.getContentResolver().openFileDescriptor(cachedFileUri, AnalyticsEventKey.SMART_INTENT_SEARCH_RANK);
                    statSize = parcelFileDescriptorOpenFileDescriptor != null ? parcelFileDescriptorOpenFileDescriptor.getStatSize() : 0L;
                } catch (Throwable th) {
                    if (parcelFileDescriptorOpenFileDescriptor != null) {
                        try {
                            parcelFileDescriptorOpenFileDescriptor.close();
                        } catch (Exception unused) {
                        }
                    }
                    throw th;
                }
            } catch (Exception e) {
                HSLogger.e(TAG, "Exception while getting file size via Uri", e);
                if (parcelFileDescriptorOpenFileDescriptor != null) {
                }
            }
            if (parcelFileDescriptorOpenFileDescriptor != null) {
                try {
                    parcelFileDescriptorOpenFileDescriptor.close();
                } catch (Exception unused2) {
                }
            }
        }
        return statSize;
    }

    @Override // com.helpshift.android.commons.downloader.runnable.BaseDownloadRunnable
    protected void clearCache() {
        Uri cachedFileUri = getCachedFileUri();
        this.downloadInProgressCacheDbStorage.removeFilePath();
        deleteUri(cachedFileUri);
    }

    @Override // com.helpshift.android.commons.downloader.runnable.BaseDownloadRunnable
    protected void processHttpResponse(InputStream inputStream, int i, int i2, String str) throws Throwable {
        ParcelFileDescriptor parcelFileDescriptorOpenFileDescriptor;
        long alreadyDownloadedBytes = getAlreadyDownloadedBytes();
        Uri fileUriToWriteResponseData = getFileUriToWriteResponseData();
        int i3 = 0;
        Closeable closeable = null;
        if (fileUriToWriteResponseData == null) {
            notifyDownloadFinish(false, null, i2, str);
            return;
        }
        this.downloadInProgressCacheDbStorage.insertFilePath(fileUriToWriteResponseData.toString());
        try {
            parcelFileDescriptorOpenFileDescriptor = this.context.getContentResolver().openFileDescriptor(fileUriToWriteResponseData, "w");
            try {
                if (parcelFileDescriptorOpenFileDescriptor == null) {
                    notifyDownloadFinish(false, null, i2, str);
                    closeFileStream(null);
                    HsUriUtils.closeParcelFileDescriptor(parcelFileDescriptorOpenFileDescriptor);
                    return;
                }
                FileOutputStream fileOutputStream = new FileOutputStream(parcelFileDescriptorOpenFileDescriptor.getFileDescriptor());
                int i4 = 8192;
                try {
                    byte[] bArr = new byte[8192];
                    long j = 0;
                    while (true) {
                        int i5 = inputStream.read(bArr, i3, i4);
                        if (i5 == -1) {
                            updateIsPendingFlag(fileUriToWriteResponseData, this.requestInfo.contentType);
                            this.downloadInProgressCacheDbStorage.removeFilePath();
                            HSLogger.d(TAG, "Download finished : " + this.requestInfo.url + "\n URI : " + fileUriToWriteResponseData);
                            notifyDownloadFinish(true, fileUriToWriteResponseData, i2, str);
                            closeFileStream(fileOutputStream);
                            HsUriUtils.closeParcelFileDescriptor(parcelFileDescriptorOpenFileDescriptor);
                            return;
                        }
                        if (i5 < 0) {
                            throw new EOFException();
                        }
                        fileOutputStream.write(bArr, i3, i5);
                        long statSize = (long) ((parcelFileDescriptorOpenFileDescriptor.getStatSize() / (((long) i) + alreadyDownloadedBytes)) * 100.0f);
                        if (statSize != j) {
                            notifyProgressChange((int) statSize);
                            j = statSize;
                        }
                        i3 = 0;
                        i4 = 8192;
                    }
                } catch (Throwable th) {
                    th = th;
                    closeable = fileOutputStream;
                    closeFileStream(closeable);
                    HsUriUtils.closeParcelFileDescriptor(parcelFileDescriptorOpenFileDescriptor);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (Throwable th3) {
            th = th3;
            parcelFileDescriptorOpenFileDescriptor = null;
        }
    }

    private Uri getFileUriToWriteResponseData() {
        Uri cachedFileUri = getCachedFileUri();
        return cachedFileUri != null ? cachedFileUri : createFile(generateFileName(), this.requestInfo.contentType);
    }

    private Uri createFile(String str, String str2) {
        Uri contentUri;
        if (Build.VERSION.SDK_INT < 29) {
            return null;
        }
        ContentValues contentValues = new ContentValues();
        ContentResolver contentResolver = this.context.getContentResolver();
        if (isImageType(str2)) {
            contentValues.put("_display_name", str);
            contentValues.put("mime_type", str2);
            contentValues.put("is_pending", (Integer) 1);
            contentUri = MediaStore.Images.Media.getContentUri("external_primary");
        } else {
            contentValues.put("_display_name", str);
            contentValues.put("mime_type", str2);
            contentValues.put("is_pending", (Integer) 1);
            contentUri = MediaStore.Downloads.getContentUri("external_primary");
        }
        return contentResolver.insert(contentUri, contentValues);
    }

    private void updateIsPendingFlag(Uri uri, String str) {
        if (Build.VERSION.SDK_INT < 29) {
            return;
        }
        ContentValues contentValues = new ContentValues();
        if (isImageType(str)) {
            contentValues.put("is_pending", (Integer) 0);
        } else {
            contentValues.put("is_pending", (Integer) 0);
        }
        this.context.getContentResolver().update(uri, contentValues, null, null);
    }

    private String generateFileName() {
        return "Support_" + System.currentTimeMillis() + this.requestInfo.url.substring(this.requestInfo.url.lastIndexOf("/") + 1);
    }

    private Uri getCachedFileUri() {
        String filePath = this.downloadInProgressCacheDbStorage.getFilePath();
        if (TextUtils.isEmpty(filePath)) {
            return null;
        }
        Uri uriBuildUri = buildUri(filePath);
        if (uriBuildUri != null) {
            return uriBuildUri;
        }
        this.downloadInProgressCacheDbStorage.removeFilePath();
        return null;
    }

    private Uri buildUri(String str) {
        if (!HsUriUtils.canReadFileAtUri(this.context, str)) {
            return null;
        }
        try {
            return Uri.parse(str);
        } catch (Exception e) {
            HSLogger.e(TAG, "Error while converting filePath to uri", e);
            return null;
        }
    }

    private boolean isImageType(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        try {
            return Pattern.compile("image/.*").matcher(str).matches();
        } catch (Exception e) {
            HSLogger.e(TAG, "Error when check image mime type", e);
            return false;
        }
    }

    private void deleteUri(Uri uri) {
        if (uri == null) {
            return;
        }
        try {
            this.context.getContentResolver().delete(uri, null, null);
        } catch (Exception e) {
            HSLogger.e(TAG, "Error when deleting a file via uri", e);
        }
    }
}
