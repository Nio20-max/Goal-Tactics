package com.appsflyer.internal;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.os.Process;
import com.appsflyer.AFLogger;
import java.io.ByteArrayInputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public final class z {
    public boolean AFInAppEventParameterName;
    public final Map<String, String> AFInAppEventType;
    public final String AFKeystoreWrapper;
    private final byte[] AFLogger$LogLevel;
    private final boolean AFVersionDeclaration;
    private boolean AppsFlyer2dXConversionCallback;
    public int valueOf;
    public final String values;

    public z() {
    }

    public static boolean AFKeystoreWrapper(Context context, Intent intent) {
        return context.getPackageManager().queryIntentServices(intent, 0).size() > 0;
    }

    public static boolean AFInAppEventType(Context context, String str) {
        if (str == null) {
            throw new IllegalArgumentException("permission is null");
        }
        int iCheckPermission = context.checkPermission(str, Process.myPid(), Process.myUid());
        StringBuilder sb = new StringBuilder("is Permission Available: ");
        sb.append(str);
        sb.append("; res: ");
        sb.append(iCheckPermission);
        AFLogger.AFKeystoreWrapper(sb.toString());
        return iCheckPermission == 0;
    }

    public static boolean valueOf() {
        return Build.BRAND.equals("OPPO");
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0065  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static java.util.Map<java.lang.String, java.lang.String> AFInAppEventType(android.content.Context r12, java.util.Map<java.lang.String, java.lang.String> r13, android.net.Uri r14) {
        /*
            Method dump skipped, instruction units count: 228
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.z.AFInAppEventType(android.content.Context, java.util.Map, android.net.Uri):java.util.Map");
    }

    public static String AFInAppEventParameterName(PackageManager packageManager, String str) throws NoSuchAlgorithmException, PackageManager.NameNotFoundException, CertificateException {
        Signature[] signatureArr = packageManager.getPackageInfo(str, 64).signatures;
        if (signatureArr == null) {
            return null;
        }
        X509Certificate x509Certificate = (X509Certificate) CertificateFactory.getInstance("X.509").generateCertificate(new ByteArrayInputStream(signatureArr[0].toByteArray()));
        MessageDigest messageDigest = MessageDigest.getInstance("SHA256");
        messageDigest.update(x509Certificate.getEncoded());
        return String.format("%032X", new BigInteger(1, messageDigest.digest()));
    }

    public static long values(Context context, String str) {
        try {
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(str, 0);
            if (Build.VERSION.SDK_INT >= 28) {
                return packageInfo.getLongVersionCode();
            }
            return packageInfo.versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            AFLogger.valueOf(e.getMessage(), e);
            return 0L;
        }
    }

    public static String AFKeystoreWrapper(Context context, String str) {
        try {
            return context.getPackageManager().getPackageInfo(str, 0).versionName;
        } catch (PackageManager.NameNotFoundException e) {
            AFLogger.valueOf(e.getMessage(), e);
            return "";
        }
    }

    public z(String str, byte[] bArr, String str2, Map<String, String> map, boolean z) {
        this.AppsFlyer2dXConversionCallback = true;
        this.AFInAppEventParameterName = false;
        this.valueOf = -1;
        this.values = str;
        this.AFLogger$LogLevel = bArr;
        this.AFKeystoreWrapper = str2;
        this.AFInAppEventType = map;
        this.AFVersionDeclaration = false;
    }

    public z(String str, String str2) {
        this(str, null, str2, new HashMap(), false);
    }

    public final byte[] AFKeystoreWrapper() {
        return this.AFLogger$LogLevel;
    }

    public final boolean AFInAppEventType() {
        return this.AFVersionDeclaration;
    }

    public final boolean AFInAppEventParameterName() {
        return this.AppsFlyer2dXConversionCallback;
    }

    public final boolean values() {
        return this.AFInAppEventParameterName;
    }
}
