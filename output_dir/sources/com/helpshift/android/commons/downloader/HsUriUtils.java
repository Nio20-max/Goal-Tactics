package com.helpshift.android.commons.downloader;

import android.content.Context;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import com.helpshift.analytics.AnalyticsEventKey;
import java.io.IOException;

/* JADX INFO: loaded from: classes.dex */
public class HsUriUtils {
    public static boolean isValidUriPath(String str) {
        if (str == null || str.length() == 0) {
            return false;
        }
        return str.startsWith("content://");
    }

    public static boolean canReadFileAtUri(Context context, String str) {
        if (!isValidUriPath(str)) {
            return false;
        }
        try {
            ParcelFileDescriptor parcelFileDescriptorOpenFileDescriptor = context.getContentResolver().openFileDescriptor(Uri.parse(str), AnalyticsEventKey.SMART_INTENT_SEARCH_RANK);
            z = parcelFileDescriptorOpenFileDescriptor != null;
            closeParcelFileDescriptor(parcelFileDescriptorOpenFileDescriptor);
        } catch (Exception unused) {
            closeParcelFileDescriptor(null);
        } catch (Throwable th) {
            closeParcelFileDescriptor(null);
            throw th;
        }
        return z;
    }

    public static void closeParcelFileDescriptor(ParcelFileDescriptor parcelFileDescriptor) {
        if (parcelFileDescriptor != null) {
            try {
                parcelFileDescriptor.close();
            } catch (IOException unused) {
            }
        }
    }
}
