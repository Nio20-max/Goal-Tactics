package com.appsflyer.internal;

import com.appsflyer.AFLogger;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class l {
    final be AFKeystoreWrapper;

    public interface d {
        void valueOf(String str, String str2, String str3);

        void values(String str);
    }

    l() {
    }

    public l(be beVar) {
        this.AFKeystoreWrapper = beVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x00e3 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String AFInAppEventParameterName(com.appsflyer.internal.n r7) {
        /*
            Method dump skipped, instruction units count: 236
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.l.AFInAppEventParameterName(com.appsflyer.internal.n):java.lang.String");
    }

    public final List<n> AFInAppEventType() {
        ArrayList arrayList = new ArrayList();
        try {
            File file = new File(this.AFKeystoreWrapper.values.getFilesDir(), "AFRequestCache");
            if (!file.exists()) {
                file.mkdir();
            }
            File[] fileArrListFiles = file.listFiles();
            if (fileArrListFiles == null) {
                return arrayList;
            }
            for (File file2 : fileArrListFiles) {
                StringBuilder sb = new StringBuilder("CACHE: Found cached request");
                sb.append(file2.getName());
                AFLogger.values(sb.toString());
                arrayList.add(values(file2));
            }
        } catch (Exception e) {
            AFLogger.valueOf("CACHE: Could not get cached requests", e);
        }
        return arrayList;
    }

    private static n values(File file) throws Throwable {
        FileReader fileReader;
        FileReader fileReader2 = null;
        try {
            fileReader = new FileReader(file);
            try {
                char[] cArr = new char[(int) file.length()];
                fileReader.read(cArr);
                n nVar = new n(cArr);
                nVar.AFInAppEventParameterName = file.getName();
                try {
                    fileReader.close();
                } catch (IOException e) {
                    AFLogger.values(e);
                }
                return nVar;
            } catch (Exception unused) {
                if (fileReader != null) {
                    try {
                        fileReader.close();
                    } catch (IOException e2) {
                        AFLogger.values(e2);
                    }
                }
                return null;
            } catch (Throwable th) {
                th = th;
                fileReader2 = fileReader;
                if (fileReader2 != null) {
                    try {
                        fileReader2.close();
                    } catch (IOException e3) {
                        AFLogger.values(e3);
                    }
                }
                throw th;
            }
        } catch (Exception unused2) {
            fileReader = null;
        } catch (Throwable th2) {
            th = th2;
        }
    }

    public final boolean valueOf(String str) {
        File file = new File(new File(this.AFKeystoreWrapper.values.getFilesDir(), "AFRequestCache"), str);
        StringBuilder sb = new StringBuilder("CACHE: Deleting ");
        sb.append(str);
        sb.append(" from cache");
        AFLogger.values(sb.toString());
        if (!file.exists()) {
            return true;
        }
        try {
            return file.delete();
        } catch (Exception e) {
            StringBuilder sb2 = new StringBuilder("CACHE: Could not delete ");
            sb2.append(str);
            sb2.append(" from cache");
            AFLogger.valueOf(sb2.toString(), e);
            return false;
        }
    }
}
