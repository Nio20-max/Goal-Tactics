package com.helpshift.util;

import android.content.Context;
import android.content.res.Resources;
import android.net.Uri;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/* JADX INFO: loaded from: classes2.dex */
public class AssetsUtil {
    private static final String TAG = "AssetsUtil";

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r6v0, types: [android.content.Context] */
    /* JADX WARN: Type inference failed for: r6v2 */
    /* JADX WARN: Type inference failed for: r6v3 */
    /* JADX WARN: Type inference failed for: r6v4, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r6v5, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r6v7, types: [java.io.Closeable, java.io.InputStream] */
    /* JADX WARN: Type inference failed for: r7v0, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r7v1 */
    /* JADX WARN: Type inference failed for: r7v3, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r7v6 */
    public static String readFileAsString(Context context, String str) throws Throwable {
        Throwable th;
        BufferedReader bufferedReader;
        try {
            try {
                context = context.getAssets().open(str);
            } catch (Throwable th2) {
                th = th2;
            }
            try {
                bufferedReader = new BufferedReader(new InputStreamReader(context));
                try {
                    StringBuilder sb = new StringBuilder();
                    while (true) {
                        String line = bufferedReader.readLine();
                        if (line != null) {
                            sb.append(line);
                        } else {
                            String string = sb.toString();
                            IOUtils.closeQuitely(context);
                            IOUtils.closeQuitely(bufferedReader);
                            return string;
                        }
                    }
                } catch (IOException e) {
                    e = e;
                    HSLogger.e(TAG, "Error reading the file : " + e.getMessage());
                    IOUtils.closeQuitely(context);
                    IOUtils.closeQuitely(bufferedReader);
                    return null;
                }
            } catch (IOException e2) {
                e = e2;
                bufferedReader = null;
            } catch (Throwable th3) {
                th = th3;
                str = 0;
                IOUtils.closeQuitely(context);
                IOUtils.closeQuitely(str);
                throw th;
            }
        } catch (IOException e3) {
            e = e3;
            context = 0;
            bufferedReader = null;
        } catch (Throwable th4) {
            str = 0;
            th = th4;
            context = 0;
        }
    }

    public static Uri getNotificationSoundUri(Context context, Integer num) {
        if (num == null) {
            return null;
        }
        return Uri.parse("android.resource://" + context.getPackageName() + "/" + num);
    }

    public static boolean resourceExists(Context context, Integer num) {
        if (context == null || num == null) {
            return false;
        }
        try {
            return context.getResources().getResourceName(num.intValue()) != null;
        } catch (Resources.NotFoundException unused) {
            return false;
        }
    }
}
