package com.google.android.gms.measurement.internal;

import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import com.google.firebase.messaging.Constants;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzhs implements Runnable {
    final /* synthetic */ boolean zza;
    final /* synthetic */ Uri zzb;
    final /* synthetic */ String zzc;
    final /* synthetic */ String zzd;
    final /* synthetic */ zzhu zze;

    zzhs(zzhu zzhuVar, boolean z, Uri uri, String str, String str2) {
        this.zze = zzhuVar;
        this.zza = z;
        this.zzb = uri;
        this.zzc = str;
        this.zzd = str2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Bundle bundleZzs;
        Bundle bundleZzs2;
        zzhu zzhuVar = this.zze;
        boolean z = this.zza;
        Uri uri = this.zzb;
        String str = this.zzc;
        String str2 = this.zzd;
        zzhuVar.zza.zzg();
        try {
            zzku zzkuVarZzv = zzhuVar.zza.zzs.zzv();
            if (TextUtils.isEmpty(str2)) {
                bundleZzs = null;
            } else if (str2.contains("gclid") || str2.contains("utm_campaign") || str2.contains("utm_source") || str2.contains("utm_medium")) {
                String strValueOf = String.valueOf(str2);
                bundleZzs = zzkuVarZzv.zzs(Uri.parse(strValueOf.length() != 0 ? "https://google.com/search?".concat(strValueOf) : new String("https://google.com/search?")));
                if (bundleZzs != null) {
                    bundleZzs.putString("_cis", "referrer");
                }
            } else {
                zzkuVarZzv.zzs.zzay().zzc().zza("Activity created with data 'referrer' without required params");
                bundleZzs = null;
            }
            if (z && (bundleZzs2 = zzhuVar.zza.zzs.zzv().zzs(uri)) != null) {
                bundleZzs2.putString("_cis", "intent");
                if (!bundleZzs2.containsKey("gclid") && bundleZzs != null && bundleZzs.containsKey("gclid")) {
                    bundleZzs2.putString("_cer", String.format("gclid=%s", bundleZzs.getString("gclid")));
                }
                zzhuVar.zza.zzF(str, Constants.ScionAnalytics.EVENT_FIREBASE_CAMPAIGN, bundleZzs2);
                zzhuVar.zza.zzb.zza(str, bundleZzs2);
            }
            if (TextUtils.isEmpty(str2)) {
                return;
            }
            zzhuVar.zza.zzs.zzay().zzc().zzb("Activity created with referrer", str2);
            if (zzhuVar.zza.zzs.zzf().zzs(null, zzdw.zzaa)) {
                if (bundleZzs != null) {
                    zzhuVar.zza.zzF(str, Constants.ScionAnalytics.EVENT_FIREBASE_CAMPAIGN, bundleZzs);
                    zzhuVar.zza.zzb.zza(str, bundleZzs);
                } else {
                    zzhuVar.zza.zzs.zzay().zzc().zzb("Referrer does not contain valid parameters", str2);
                }
                zzhuVar.zza.zzV("auto", "_ldl", null, true);
                return;
            }
            if (!str2.contains("gclid") || (!str2.contains("utm_campaign") && !str2.contains("utm_source") && !str2.contains("utm_medium") && !str2.contains("utm_term") && !str2.contains("utm_content"))) {
                zzhuVar.zza.zzs.zzay().zzc().zza("Activity created with data 'referrer' without required params");
            } else {
                if (TextUtils.isEmpty(str2)) {
                    return;
                }
                zzhuVar.zza.zzV("auto", "_ldl", str2, true);
            }
        } catch (RuntimeException e) {
            zzhuVar.zza.zzs.zzay().zzd().zzb("Throwable caught in handleReferrerForOnActivityCreated", e);
        }
    }
}
