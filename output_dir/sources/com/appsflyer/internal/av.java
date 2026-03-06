package com.appsflyer.internal;

import android.os.Build;
import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.Purchase;
import com.appsflyer.AFLogger;
import com.appsflyer.AppsFlyerLib;
import com.appsflyer.AppsFlyerProperties;
import com.appsflyer.internal.bl;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class av implements Runnable {
    final bv AFInAppEventParameterName;
    public final bh AFInAppEventType;
    private bb AFKeystoreWrapper;
    private final bd getLevel;
    public final ExecutorService valueOf;
    BillingClient values;

    public av(bh bhVar, bb bbVar, bv bvVar, ExecutorService executorService, bd bdVar) {
        this.AFInAppEventType = bhVar;
        this.AFKeystoreWrapper = bbVar;
        this.AFInAppEventParameterName = bvVar;
        this.valueOf = executorService;
        this.getLevel = bdVar;
    }

    static /* synthetic */ void AFInAppEventType(av avVar, final boolean z, List list) {
        Map<String, String> mapApply;
        boolean z2;
        final aj ajVarAFKeystoreWrapper = avVar.AFInAppEventType.AFKeystoreWrapper();
        if (ajVarAFKeystoreWrapper != null) {
            z2 = ajVarAFKeystoreWrapper.AFInAppEventType;
            mapApply = ajVarAFKeystoreWrapper.values != null ? ajVarAFKeystoreWrapper.values.apply(list) : null;
        } else {
            mapApply = null;
            z2 = false;
        }
        as asVar = new as(z2, z, list, mapApply);
        bd bdVar = avVar.getLevel;
        String str = String.format("https://%sars.%s/api/v1/android/validate_subscription", AppsFlyerLib.getInstance().getHostPrefix(), ac.AFInAppEventParameterName().getHostName());
        HashMap map = new HashMap();
        map.put("app_id", bdVar.valueOf.AFInAppEventParameterName.getPackageName());
        String string = AppsFlyerProperties.getInstance().getString(AppsFlyerProperties.APP_USER_ID);
        if (string != null) {
            map.put("cuid", string);
        }
        aa aaVar = bdVar.valueOf;
        map.put("app_version_name", z.AFKeystoreWrapper(aaVar.AFInAppEventParameterName, aaVar.AFInAppEventParameterName.getPackageName()));
        HashMap map2 = new HashMap();
        g gVarAFKeystoreWrapper = ab.AFKeystoreWrapper(bdVar.valueOf.AFInAppEventParameterName, new HashMap());
        String str2 = gVarAFKeystoreWrapper != null ? gVarAFKeystoreWrapper.values : null;
        if (str2 != null) {
            map2.put("advertising_id", str2);
        }
        map2.put("appsflyer_id", af.valueOf(new WeakReference(bdVar.valueOf.AFInAppEventParameterName)));
        StringBuilder sb = new StringBuilder();
        sb.append(Build.VERSION.SDK_INT);
        map2.put("os_version", sb.toString());
        map2.put("sdk_version", ac.AFInAppEventType);
        map.put("device_data", map2);
        map.put("is_cached", Boolean.valueOf(asVar.valueOf()));
        map.put("environment", asVar.AFInAppEventParameterName() ? "SANDBOX" : "PRODUCTION");
        map.put("additional_parameters", asVar.AFInAppEventType);
        ArrayList arrayList = new ArrayList();
        for (Purchase purchase : asVar.values) {
            HashMap map3 = new HashMap();
            map3.put("token", purchase.getPurchaseToken());
            map3.put("subscription_id", purchase.getSku());
            arrayList.add(map3);
        }
        map.put(BillingClient.FeatureType.SUBSCRIPTIONS, arrayList);
        z zVar = new z(str, new JSONObject(map).toString().getBytes(), "POST", Collections.emptyMap(), false);
        bj bjVar = new bj();
        zVar.AFInAppEventParameterName = bdVar.AFInAppEventType();
        ab abVar = bdVar.AFInAppEventType;
        bl blVar = new bl(zVar, abVar.AFKeystoreWrapper, abVar.valueOf, bjVar);
        bi<String> biVar = new bi<String>() { // from class: com.appsflyer.internal.av.3
            @Override // com.appsflyer.internal.bi
            public final void values(br<String> brVar) {
                if (brVar.values()) {
                    if (z) {
                        av.this.AFInAppEventParameterName.AFInAppEventType("ars_history_sent", true);
                    }
                    aj ajVar = ajVarAFKeystoreWrapper;
                    if (ajVar == null || ajVar.AFKeystoreWrapper == null) {
                        return;
                    }
                    ajVarAFKeystoreWrapper.AFKeystoreWrapper.accept(brVar.valueOf);
                    return;
                }
                aj ajVar2 = ajVarAFKeystoreWrapper;
                if (ajVar2 == null || ajVar2.AFInAppEventParameterName == null) {
                    return;
                }
                ajVarAFKeystoreWrapper.AFInAppEventParameterName.accept(brVar.valueOf);
            }

            @Override // com.appsflyer.internal.bi
            public final void values(Throwable th) {
                aj ajVar = ajVarAFKeystoreWrapper;
                if (ajVar != null && ajVar.AFInAppEventParameterName != null) {
                    ajVarAFKeystoreWrapper.AFInAppEventParameterName.accept(th.getMessage());
                }
                AFLogger.values(th);
            }
        };
        if (!blVar.valueOf.getAndSet(true)) {
            blVar.AFKeystoreWrapper.submit(new bl.AnonymousClass3(biVar));
            return;
        }
        throw new IllegalStateException("Http call is already executed");
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            if (this.values == null) {
                bb bbVar = this.AFKeystoreWrapper;
                BillingClient billingClientBuild = BillingClient.newBuilder(bbVar.AFInAppEventParameterName).setListener(new at(this)).enablePendingPurchases().build();
                this.values = billingClientBuild;
                billingClientBuild.startConnection(new au(this));
            }
        } catch (Throwable th) {
            if ((th instanceof NoSuchMethodError) || (th instanceof NoClassDefFoundError)) {
                AFLogger.AppsFlyer2dXConversionCallback("It seems your app uses different Play Billing library version than the SDK. Please use v.3.0.3");
            }
            AFLogger.AFInAppEventParameterName("Failed to setup Play billing", th);
        }
    }
}
