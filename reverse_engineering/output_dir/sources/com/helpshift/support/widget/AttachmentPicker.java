package com.helpshift.support.widget;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import androidx.fragment.app.Fragment;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.helpshift.common.platform.Device;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.conversation.dto.AttachmentPickerFile;
import com.helpshift.support.fragments.AttachmentPreviewFragment;
import com.helpshift.support.widget.AttachmentPicker.AttachmentPickerListener;
import com.helpshift.util.AndroidFileUtil;
import com.helpshift.util.AttachmentConstants;
import com.helpshift.util.AttachmentDataProvider;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HSPattern;
import com.helpshift.util.ImageUtil;
import java.lang.ref.WeakReference;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class AttachmentPicker<T extends Fragment & AttachmentPickerListener> {
    public static final int ATTACHMENT_FILE_NOT_FOUND = -1;
    public static final int ATTACHMENT_FILE_SIZE_LIMIT_EXCEEDED = -3;
    public static final int INVALID_URI = -5;
    private static final long MAX_ATTACHMENT_FILE_SIZE_LIMIT = 26214400;
    public static final int NO_APPS_TO_OPEN_ATTACHMENTS_INTENT = -4;
    private static final String TAG = "Helpshift_AttPicker";
    public static final int UNSUPPORTED_ATTACHMENT_TYPE = -2;
    private final String KEY_EXTRA_DATA = "key_extra_data";
    private WeakReference<T> attachmentPickerListenerRef;
    private final Context context;
    private final Device device;
    private Bundle extraData;
    private SDKConfigurationDM sdkConfigurationDM;
    private int selectedAttachmentTypeOption;

    public interface AttachmentPickerListener {
        void askForReadStoragePermission();

        void onAttachmentPickerResultFailure(int i, Long l);

        void onAttachmentPickerResultSuccess(AttachmentPickerFile attachmentPickerFile, Bundle bundle);
    }

    public AttachmentPicker(Context context, Device device, T t, SDKConfigurationDM sDKConfigurationDM) {
        this.context = context;
        this.device = device;
        this.attachmentPickerListenerRef = new WeakReference<>(t);
        this.sdkConfigurationDM = sDKConfigurationDM;
    }

    public void launchPicker(Bundle bundle) {
        this.extraData = bundle;
        this.selectedAttachmentTypeOption = getSelectedAttachmentTypeOption();
        HSLogger.d(TAG, "Checking permission before launching attachment picker");
        int i = AnonymousClass1.$SwitchMap$com$helpshift$common$platform$Device$PermissionState[this.device.checkPermission(Device.PermissionType.READ_STORAGE).ordinal()];
        if (i == 1) {
            startActivityForResult(AttachmentDataProvider.getIntentForAttachmentType(this.context, this.selectedAttachmentTypeOption, 1, this.sdkConfigurationDM.getWhiteListAttachmentMimeTypes()), 1);
            return;
        }
        if (i == 2) {
            HSLogger.d(TAG, "READ_STORAGE permission is not granted and can't be requested, starting alternate flow");
            startActivityForResult(AttachmentDataProvider.getIntentForAttachmentType(this.context, this.selectedAttachmentTypeOption, 2, this.sdkConfigurationDM.getWhiteListAttachmentMimeTypes()), 2);
        } else {
            if (i != 3) {
                return;
            }
            HSLogger.d(TAG, "READ_STORAGE permission is not granted but can be requested");
            T t = this.attachmentPickerListenerRef.get();
            if (t != null) {
                t.askForReadStoragePermission();
            }
        }
    }

    /* JADX INFO: renamed from: com.helpshift.support.widget.AttachmentPicker$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$common$platform$Device$PermissionState;

        static {
            int[] iArr = new int[Device.PermissionState.values().length];
            $SwitchMap$com$helpshift$common$platform$Device$PermissionState = iArr;
            try {
                iArr[Device.PermissionState.AVAILABLE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$common$platform$Device$PermissionState[Device.PermissionState.UNAVAILABLE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$common$platform$Device$PermissionState[Device.PermissionState.REQUESTABLE.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
        }
    }

    public void onAttachmentPickRequestResult(int i, Intent intent) {
        Uri data = intent.getData();
        if (i == 1) {
            HSLogger.d(TAG, "Processing attachment uri with flow when permissions are available");
            processUriForAttachment(data);
        } else if (i == 2) {
            HSLogger.d(TAG, "Processing attachment uri with flow when permissions are not available");
            int flags = intent.getFlags() & 1;
            if (Build.VERSION.SDK_INT >= 19) {
                this.context.getContentResolver().takePersistableUriPermission(data, flags);
            }
            processUriForAttachment(data);
        }
    }

    private void processUriForAttachment(Uri uri) {
        if (isUriValid(uri)) {
            if (isAttachmentWhiteListed(uri)) {
                if (AndroidFileUtil.doesFileFromUriExistAndCanRead(uri, this.context)) {
                    AttachmentPickerFile attachmentPickerFileCreateAttachmentPickerFileFromUri = createAttachmentPickerFileFromUri(uri);
                    Long l = attachmentPickerFileCreateAttachmentPickerFileFromUri.originalFileSize;
                    if (l == null || l.longValue() <= MAX_ATTACHMENT_FILE_SIZE_LIMIT || (attachmentPickerFileCreateAttachmentPickerFileFromUri.attachmentType == 1 && ImageUtil.isResizableImage(uri, this.context))) {
                        HSLogger.d(TAG, "Attachment picker result success, path: " + uri);
                        sendAttachmentPickerResultSuccessCallback(attachmentPickerFileCreateAttachmentPickerFileFromUri, this.extraData);
                        return;
                    }
                    HSLogger.d(TAG, "Attachment picker file size limit exceeded (in bytes): " + l + ", returning failure");
                    sendAttachmentPickerResultFailureCallback(-3, Long.valueOf(MAX_ATTACHMENT_FILE_SIZE_LIMIT));
                    return;
                }
                HSLogger.d(TAG, "Attachment picker file reading error, returning failure");
                sendAttachmentPickerResultFailureCallback(-1, null);
                return;
            }
            HSLogger.d(TAG, "Attachment picker file invalid mime type, returning failure");
            sendAttachmentPickerResultFailureCallback(-2, null);
            return;
        }
        HSLogger.d(TAG, "Attachment picker file invalid mime type, returning failure");
        sendAttachmentPickerResultFailureCallback(-5, null);
    }

    private boolean isUriValid(Uri uri) {
        return FirebaseAnalytics.Param.CONTENT.equals(uri.getScheme());
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x006b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private com.helpshift.conversation.dto.AttachmentPickerFile createAttachmentPickerFileFromUri(android.net.Uri r9) {
        /*
            r8 = this;
            android.content.Context r0 = r8.context
            android.content.ContentResolver r0 = r0.getContentResolver()
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            r1 = r0
            r2 = r9
            android.database.Cursor r1 = r1.query(r2, r3, r4, r5, r6)
            r2 = 0
            if (r1 == 0) goto L6b
            boolean r3 = r1.moveToFirst()     // Catch: java.lang.Throwable -> L64
            if (r3 == 0) goto L6b
            java.lang.String r3 = "_display_name"
            int r3 = r1.getColumnIndex(r3)     // Catch: java.lang.Throwable -> L64
            java.lang.String r3 = r1.getString(r3)     // Catch: java.lang.Throwable -> L64
            java.lang.String r0 = r0.getType(r9)     // Catch: java.lang.Throwable -> L64
            boolean r4 = com.helpshift.util.StringUtils.isEmpty(r3)     // Catch: java.lang.Throwable -> L64
            if (r4 == 0) goto L35
            java.util.UUID r3 = java.util.UUID.randomUUID()     // Catch: java.lang.Throwable -> L64
            java.lang.String r3 = r3.toString()     // Catch: java.lang.Throwable -> L64
        L35:
            java.lang.String r4 = "_size"
            int r4 = r1.getColumnIndex(r4)     // Catch: java.lang.Throwable -> L64
            boolean r5 = r1.isNull(r4)     // Catch: java.lang.Throwable -> L64
            if (r5 != 0) goto L6d
            java.lang.String r4 = r1.getString(r4)     // Catch: java.lang.Throwable -> L64
            if (r4 == 0) goto L6d
            java.lang.Long r2 = java.lang.Long.valueOf(r4)     // Catch: java.lang.NumberFormatException -> L4c java.lang.Throwable -> L64
            goto L6d
        L4c:
            r4 = move-exception
            java.lang.String r5 = "Helpshift_AttPicker"
            java.lang.StringBuilder r6 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L64
            r6.<init>()     // Catch: java.lang.Throwable -> L64
            java.lang.String r7 = "Error getting size due to "
            r6.append(r7)     // Catch: java.lang.Throwable -> L64
            r6.append(r4)     // Catch: java.lang.Throwable -> L64
            java.lang.String r4 = r6.toString()     // Catch: java.lang.Throwable -> L64
            com.helpshift.util.HSLogger.d(r5, r4)     // Catch: java.lang.Throwable -> L64
            goto L6d
        L64:
            r9 = move-exception
            if (r1 == 0) goto L6a
            r1.close()
        L6a:
            throw r9
        L6b:
            r0 = r2
            r3 = r0
        L6d:
            if (r1 == 0) goto L72
            r1.close()
        L72:
            com.helpshift.conversation.dto.AttachmentPickerFile r1 = new com.helpshift.conversation.dto.AttachmentPickerFile
            r1.<init>(r9, r3, r2)
            boolean r9 = com.helpshift.util.StringUtils.isEmpty(r0)
            if (r9 != 0) goto L89
            java.lang.String r9 = "image/"
            boolean r9 = r0.startsWith(r9)
            if (r9 == 0) goto L89
            r9 = 1
            r1.attachmentType = r9
            goto L8d
        L89:
            int r9 = r8.selectedAttachmentTypeOption
            r1.attachmentType = r9
        L8d:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.support.widget.AttachmentPicker.createAttachmentPickerFileFromUri(android.net.Uri):com.helpshift.conversation.dto.AttachmentPickerFile");
    }

    private boolean isAttachmentWhiteListed(Uri uri) {
        List<String> whiteListAttachmentMimeTypes = this.sdkConfigurationDM.getWhiteListAttachmentMimeTypes();
        if (whiteListAttachmentMimeTypes.contains(AttachmentConstants.ALLOW_ALL_MIME)) {
            return true;
        }
        String type = this.context.getContentResolver().getType(uri);
        return whiteListAttachmentMimeTypes.contains(type) || !HSPattern.isValidMime(type) || AttachmentConstants.UNKNOWN_FILE_MIME.equals(type);
    }

    private void sendAttachmentPickerResultSuccessCallback(AttachmentPickerFile attachmentPickerFile, Bundle bundle) {
        T t = this.attachmentPickerListenerRef.get();
        if (t != null) {
            t.onAttachmentPickerResultSuccess(attachmentPickerFile, bundle);
        }
    }

    private void sendAttachmentPickerResultFailureCallback(int i, Long l) {
        T t = this.attachmentPickerListenerRef.get();
        if (t != null) {
            t.onAttachmentPickerResultFailure(i, l);
        }
    }

    private void startActivityForResult(Intent intent, int i) {
        try {
            T t = this.attachmentPickerListenerRef.get();
            if (t == null || t.getActivity() == null) {
                return;
            }
            t.startActivityForResult(intent, i);
        } catch (ActivityNotFoundException e) {
            HSLogger.e(TAG, "Error occurred while starting app for handling attachment pick intent " + e);
            sendAttachmentPickerResultFailureCallback(-4, null);
        }
    }

    public void onSaveInstanceState(Bundle bundle) {
        bundle.putBundle("key_extra_data", this.extraData);
    }

    public void onViewStateRestored(Bundle bundle) {
        if (bundle.containsKey("key_extra_data")) {
            this.extraData = bundle.getBundle("key_extra_data");
        }
    }

    private int getSelectedAttachmentTypeOption() {
        return this.extraData.getInt(AttachmentPreviewFragment.KEY_ATTACHMENT_TYPE);
    }
}
