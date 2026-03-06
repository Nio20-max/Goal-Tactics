package com.appsflyer.internal;

import com.appsflyer.internal.components.network.http.exceptions.ParsingException;
import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;

/* JADX INFO: loaded from: classes.dex */
public final class bl<ResponseBody> {
    final bq<ResponseBody> AFInAppEventParameterName;
    final z AFInAppEventType;
    public final ExecutorService AFKeystoreWrapper;
    public final AtomicBoolean valueOf = new AtomicBoolean(false);
    final bm values;

    public bl(z zVar, ExecutorService executorService, bm bmVar, bq<ResponseBody> bqVar) {
        this.AFInAppEventType = zVar;
        this.AFKeystoreWrapper = executorService;
        this.values = bmVar;
        this.AFInAppEventParameterName = bqVar;
    }

    /* JADX INFO: renamed from: com.appsflyer.internal.bl$3, reason: invalid class name */
    public class AnonymousClass3 implements Runnable {
        private /* synthetic */ bi AFInAppEventParameterName;

        public AnonymousClass3(bi biVar) {
            this.AFInAppEventParameterName = biVar;
        }

        @Override // java.lang.Runnable
        public final void run() throws Throwable {
            try {
                br<String> brVarAFInAppEventType = bl.this.values.AFInAppEventType(bl.this.AFInAppEventType);
                if (this.AFInAppEventParameterName != null) {
                    try {
                        this.AFInAppEventParameterName.values(new br(bl.this.AFInAppEventParameterName.values(brVarAFInAppEventType.valueOf), brVarAFInAppEventType.values, brVarAFInAppEventType.AFKeystoreWrapper, brVarAFInAppEventType.AFInAppEventParameterName, brVarAFInAppEventType.AFInAppEventType));
                    } catch (JSONException e) {
                        this.AFInAppEventParameterName.values(new ParsingException(e.getMessage(), e, brVarAFInAppEventType));
                    }
                }
            } catch (IOException e2) {
                bi biVar = this.AFInAppEventParameterName;
                if (biVar != null) {
                    biVar.values(e2);
                }
            }
        }
    }

    public final br<ResponseBody> AFKeystoreWrapper() throws Throwable {
        if (!this.valueOf.getAndSet(true)) {
            br<String> brVarAFInAppEventType = this.values.AFInAppEventType(this.AFInAppEventType);
            try {
                return new br<>(this.AFInAppEventParameterName.values(brVarAFInAppEventType.valueOf), brVarAFInAppEventType.values, brVarAFInAppEventType.AFKeystoreWrapper, brVarAFInAppEventType.AFInAppEventParameterName, brVarAFInAppEventType.AFInAppEventType);
            } catch (JSONException e) {
                throw new ParsingException(e.getMessage(), e, brVarAFInAppEventType);
            }
        }
        throw new IllegalStateException("Http call is already executed");
    }
}
