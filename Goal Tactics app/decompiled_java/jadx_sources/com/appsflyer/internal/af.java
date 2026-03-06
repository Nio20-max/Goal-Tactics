package com.appsflyer.internal;

import android.content.Context;
import android.content.SharedPreferences;
import com.appsflyer.AFLogger;
import com.appsflyer.AppsFlyerProperties;
import com.helpshift.analytics.AnalyticsEventKey;
import com.helpshift.db.legacy_profile.tables.ProfileTable;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.lang.ref.WeakReference;
import java.security.SecureRandom;

/* JADX INFO: loaded from: classes.dex */
public final class af {
    private static String values;

    public static synchronized String valueOf(WeakReference<Context> weakReference) {
        if (weakReference.get() == null) {
            return values;
        }
        if (values == null) {
            String string = null;
            if (weakReference.get() != null) {
                string = ac.AFInAppEventType(weakReference.get()).getString("AF_INSTALLATION", null);
            }
            if (string != null) {
                values = string;
            } else {
                try {
                    File file = new File(weakReference.get().getFilesDir(), "AF_INSTALLATION");
                    if (file.exists()) {
                        values = values(file);
                        file.delete();
                    } else {
                        long jCurrentTimeMillis = System.currentTimeMillis();
                        StringBuilder sb = new StringBuilder();
                        sb.append(jCurrentTimeMillis);
                        sb.append("-");
                        sb.append(Math.abs(new SecureRandom().nextLong()));
                        values = sb.toString();
                    }
                    String str = values;
                    SharedPreferences.Editor editorEdit = ac.AFInAppEventType(weakReference.get()).edit();
                    editorEdit.putString("AF_INSTALLATION", str);
                    editorEdit.apply();
                } catch (Exception e) {
                    AFLogger.valueOf("Error getting AF unique ID", e);
                }
            }
            if (values != null) {
                AppsFlyerProperties.getInstance().set(ProfileTable.Columns.COLUMN_UID, values);
            }
        }
        return values;
    }

    private static String values(File file) throws Throwable {
        byte[] bArr;
        RandomAccessFile randomAccessFile;
        RandomAccessFile randomAccessFile2 = null;
        byte[] bArr2 = null;
        randomAccessFile2 = null;
        try {
            try {
                randomAccessFile = new RandomAccessFile(file, AnalyticsEventKey.SMART_INTENT_SEARCH_RANK);
            } catch (IOException e) {
                e = e;
                bArr = null;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            bArr2 = new byte[(int) randomAccessFile.length()];
            randomAccessFile.readFully(bArr2);
            randomAccessFile.close();
            try {
                randomAccessFile.close();
            } catch (IOException e2) {
                AFLogger.valueOf("Exception while trying to close the InstallationFile", e2);
            }
        } catch (IOException e3) {
            e = e3;
            bArr = bArr2;
            randomAccessFile2 = randomAccessFile;
            AFLogger.valueOf("Exception while reading InstallationFile: ", e);
            if (randomAccessFile2 != null) {
                try {
                    randomAccessFile2.close();
                } catch (IOException e4) {
                    AFLogger.valueOf("Exception while trying to close the InstallationFile", e4);
                }
            }
            bArr2 = bArr;
        } catch (Throwable th2) {
            th = th2;
            randomAccessFile2 = randomAccessFile;
            if (randomAccessFile2 != null) {
                try {
                    randomAccessFile2.close();
                } catch (IOException e5) {
                    AFLogger.valueOf("Exception while trying to close the InstallationFile", e5);
                }
            }
            throw th;
        }
        if (bArr2 == null) {
            bArr2 = new byte[0];
        }
        return new String(bArr2);
    }
}
