package com.appsflyer.internal;

import com.appsflyer.internal.components.network.http.exceptions.HttpException;
import java.io.InterruptedIOException;

/* JADX INFO: loaded from: classes.dex */
public final class bs extends bn<bu> {
    private final bw AFInAppEventParameterName;
    private final aa AFInAppEventType;
    public bu AFKeystoreWrapper;
    private final bd AFLogger$LogLevel;
    private final String AFVersionDeclaration;
    private final cb getLevel;
    public ap valueOf;
    private final bx values;

    public bs(bw bwVar, aa aaVar, ca caVar, bx bxVar, bd bdVar, cb cbVar, String str) {
        super(bt.RC_CDN, new bt[0], "UpdateRemoteConfiguration");
        this.AFKeystoreWrapper = null;
        this.AFInAppEventParameterName = bwVar;
        this.AFInAppEventType = aaVar;
        this.values = bxVar;
        this.AFLogger$LogLevel = bdVar;
        this.getLevel = cbVar;
        this.AFVersionDeclaration = str;
    }

    @Override // com.appsflyer.internal.bn
    public final bo values() throws Exception {
        try {
            bu buVarAFKeystoreWrapper = AFKeystoreWrapper();
            this.AFKeystoreWrapper = buVarAFKeystoreWrapper;
            if (buVarAFKeystoreWrapper == bu.FAILURE) {
                return bo.FAILURE;
            }
            return bo.SUCCESS;
        } catch (InterruptedIOException | InterruptedException unused) {
            this.AFKeystoreWrapper = bu.FAILURE;
            return bo.TIMEOUT;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:13:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0057 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private com.appsflyer.internal.bu AFKeystoreWrapper() throws java.lang.InterruptedException, java.io.InterruptedIOException {
        /*
            Method dump skipped, instruction units count: 597
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.bs.AFKeystoreWrapper():com.appsflyer.internal.bu");
    }

    private void AFInAppEventType(String str, long j, br<?> brVar, ao aoVar, cw cwVar, Throwable th) {
        long j2;
        int i;
        Throwable cause;
        long j3;
        if (brVar != null) {
            j2 = brVar.AFInAppEventType.AFKeystoreWrapper;
            i = brVar.values;
        } else {
            j2 = 0;
            i = 0;
        }
        if (th instanceof HttpException) {
            cause = th.getCause();
            j3 = ((HttpException) th).getMetrics().AFKeystoreWrapper;
        } else {
            cause = th;
            j3 = j2;
        }
        this.valueOf = new ap(aoVar != null ? aoVar.valueOf : null, str, j3, System.currentTimeMillis() - j, i, cwVar, cause);
    }
}
