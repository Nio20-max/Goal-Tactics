package com.appsflyer;

import android.content.Context;
import android.os.Build;
import android.security.KeyPairGeneratorSpec;
import android.security.keystore.KeyGenParameterSpec;
import com.appsflyer.internal.z;
import java.io.IOException;
import java.math.BigInteger;
import java.security.KeyPairGenerator;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.spec.AlgorithmParameterSpec;
import java.util.Calendar;
import javax.security.auth.x500.X500Principal;

/* JADX INFO: loaded from: classes.dex */
public class AFKeystoreWrapper {
    private Context AFKeystoreWrapper;
    public KeyStore valueOf;
    public final Object AFInAppEventParameterName = new Object();
    public String values = "";
    public int AFInAppEventType = 0;

    public AFKeystoreWrapper(Context context) {
        this.AFKeystoreWrapper = context;
        AFLogger.values("Initialising KeyStore..");
        try {
            KeyStore keyStore = KeyStore.getInstance("AndroidKeyStore");
            this.valueOf = keyStore;
            keyStore.load(null);
        } catch (IOException | KeyStoreException | NoSuchAlgorithmException | CertificateException e) {
            AFLogger.valueOf("Couldn't load keystore instance of type: AndroidKeyStore", e);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0021, code lost:
    
        r1 = r4.split(",");
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0029, code lost:
    
        if (r1.length != 3) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x002b, code lost:
    
        com.appsflyer.AFLogger.values("Found a matching AF key with alias:\n".concat(java.lang.String.valueOf(r4)));
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0038, code lost:
    
        r3 = r1[1].trim().split(com.ironsource.sdk.constants.Constants.RequestParameters.EQUAL);
        r1 = r1[2].trim().split(com.ironsource.sdk.constants.Constants.RequestParameters.EQUAL);
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0052, code lost:
    
        if (r3.length != 2) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0055, code lost:
    
        if (r1.length != 2) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0057, code lost:
    
        r7.values = r3[1].trim();
        r7.AFInAppEventType = java.lang.Integer.parseInt(r1[1].trim());
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x006c, code lost:
    
        r1 = th;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean AFKeystoreWrapper() {
        /*
            r7 = this;
            java.lang.Object r0 = r7.AFInAppEventParameterName
            monitor-enter(r0)
            java.security.KeyStore r1 = r7.valueOf     // Catch: java.lang.Throwable -> L8d
            r2 = 1
            r3 = 0
            if (r1 == 0) goto L8a
            java.util.Enumeration r1 = r1.aliases()     // Catch: java.lang.Throwable -> L6e
        Ld:
            boolean r4 = r1.hasMoreElements()     // Catch: java.lang.Throwable -> L6e
            if (r4 == 0) goto L8a
            java.lang.Object r4 = r1.nextElement()     // Catch: java.lang.Throwable -> L6e
            java.lang.String r4 = (java.lang.String) r4     // Catch: java.lang.Throwable -> L6e
            if (r4 == 0) goto Ld
            boolean r5 = valueOf(r4)     // Catch: java.lang.Throwable -> L6e
            if (r5 == 0) goto Ld
            java.lang.String r1 = ","
            java.lang.String[] r1 = r4.split(r1)     // Catch: java.lang.Throwable -> L6e
            int r5 = r1.length     // Catch: java.lang.Throwable -> L6e
            r6 = 3
            if (r5 != r6) goto L8a
            java.lang.String r5 = "Found a matching AF key with alias:\n"
            java.lang.String r4 = java.lang.String.valueOf(r4)     // Catch: java.lang.Throwable -> L6e
            java.lang.String r4 = r5.concat(r4)     // Catch: java.lang.Throwable -> L6e
            com.appsflyer.AFLogger.values(r4)     // Catch: java.lang.Throwable -> L6e
            r3 = r1[r2]     // Catch: java.lang.Throwable -> L6c
            java.lang.String r3 = r3.trim()     // Catch: java.lang.Throwable -> L6c
            java.lang.String r4 = "="
            java.lang.String[] r3 = r3.split(r4)     // Catch: java.lang.Throwable -> L6c
            r4 = 2
            r1 = r1[r4]     // Catch: java.lang.Throwable -> L6c
            java.lang.String r1 = r1.trim()     // Catch: java.lang.Throwable -> L6c
            java.lang.String r5 = "="
            java.lang.String[] r1 = r1.split(r5)     // Catch: java.lang.Throwable -> L6c
            int r5 = r3.length     // Catch: java.lang.Throwable -> L6c
            if (r5 != r4) goto L8b
            int r5 = r1.length     // Catch: java.lang.Throwable -> L6c
            if (r5 != r4) goto L8b
            r3 = r3[r2]     // Catch: java.lang.Throwable -> L6c
            java.lang.String r3 = r3.trim()     // Catch: java.lang.Throwable -> L6c
            r7.values = r3     // Catch: java.lang.Throwable -> L6c
            r1 = r1[r2]     // Catch: java.lang.Throwable -> L6c
            java.lang.String r1 = r1.trim()     // Catch: java.lang.Throwable -> L6c
            int r1 = java.lang.Integer.parseInt(r1)     // Catch: java.lang.Throwable -> L6c
            r7.AFInAppEventType = r1     // Catch: java.lang.Throwable -> L6c
            goto L8b
        L6c:
            r1 = move-exception
            goto L70
        L6e:
            r1 = move-exception
            r2 = 0
        L70:
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L8d
            java.lang.String r4 = "Couldn't list KeyStore Aliases: "
            r3.<init>(r4)     // Catch: java.lang.Throwable -> L8d
            java.lang.Class r4 = r1.getClass()     // Catch: java.lang.Throwable -> L8d
            java.lang.String r4 = r4.getName()     // Catch: java.lang.Throwable -> L8d
            r3.append(r4)     // Catch: java.lang.Throwable -> L8d
            java.lang.String r3 = r3.toString()     // Catch: java.lang.Throwable -> L8d
            com.appsflyer.AFLogger.valueOf(r3, r1)     // Catch: java.lang.Throwable -> L8d
            goto L8b
        L8a:
            r2 = 0
        L8b:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L8d
            return r2
        L8d:
            r1 = move-exception
            monitor-exit(r0)
            throw r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.AFKeystoreWrapper.AFKeystoreWrapper():boolean");
    }

    public final void AFKeystoreWrapper(String str) {
        AFLogger.values("Creating a new key with alias: ".concat(String.valueOf(str)));
        try {
            Calendar calendar = Calendar.getInstance();
            Calendar calendar2 = Calendar.getInstance();
            calendar2.add(1, 5);
            AlgorithmParameterSpec algorithmParameterSpecBuild = null;
            synchronized (this.AFInAppEventParameterName) {
                if (!this.valueOf.containsAlias(str)) {
                    if (Build.VERSION.SDK_INT >= 23) {
                        algorithmParameterSpecBuild = new KeyGenParameterSpec.Builder(str, 3).setCertificateSubject(new X500Principal("CN=AndroidSDK, O=AppsFlyer")).setCertificateSerialNumber(BigInteger.ONE).setCertificateNotBefore(calendar.getTime()).setCertificateNotAfter(calendar2.getTime()).build();
                    } else if (Build.VERSION.SDK_INT >= 18 && !z.valueOf()) {
                        algorithmParameterSpecBuild = new KeyPairGeneratorSpec.Builder(this.AFKeystoreWrapper).setAlias(str).setSubject(new X500Principal("CN=AndroidSDK, O=AppsFlyer")).setSerialNumber(BigInteger.ONE).setStartDate(calendar.getTime()).setEndDate(calendar2.getTime()).build();
                    }
                    KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA", "AndroidKeyStore");
                    keyPairGenerator.initialize(algorithmParameterSpecBuild);
                    keyPairGenerator.generateKeyPair();
                } else {
                    AFLogger.values("Alias already exists: ".concat(String.valueOf(str)));
                }
            }
        } catch (Throwable th) {
            StringBuilder sb = new StringBuilder("Exception ");
            sb.append(th.getMessage());
            sb.append(" occurred");
            AFLogger.valueOf(sb.toString(), th);
        }
    }

    private static boolean valueOf(String str) {
        return str.startsWith("com.appsflyer");
    }

    public final String valueOf() {
        StringBuilder sb = new StringBuilder();
        sb.append("com.appsflyer,");
        synchronized (this.AFInAppEventParameterName) {
            sb.append("KSAppsFlyerId=");
            sb.append(this.values);
            sb.append(",");
            sb.append("KSAppsFlyerRICounter=");
            sb.append(this.AFInAppEventType);
        }
        return sb.toString();
    }

    public final String values() {
        String str;
        synchronized (this.AFInAppEventParameterName) {
            str = this.values;
        }
        return str;
    }

    public final int AFInAppEventType() {
        int i;
        synchronized (this.AFInAppEventParameterName) {
            i = this.AFInAppEventType;
        }
        return i;
    }
}
