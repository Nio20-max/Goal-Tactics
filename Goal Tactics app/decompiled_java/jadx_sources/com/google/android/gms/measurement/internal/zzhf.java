package com.google.android.gms.measurement.internal;

import android.os.Bundle;
import com.google.android.gms.common.internal.Preconditions;
import com.google.android.gms.measurement.api.AppMeasurementSdk;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzhf implements Runnable {
    final /* synthetic */ Bundle zza;
    final /* synthetic */ zzhv zzb;

    zzhf(zzhv zzhvVar, Bundle bundle) {
        this.zzb = zzhvVar;
        this.zza = bundle;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzhv zzhvVar = this.zzb;
        Bundle bundle = this.zza;
        zzhvVar.zzg();
        zzhvVar.zza();
        Preconditions.checkNotNull(bundle);
        Preconditions.checkNotEmpty(bundle.getString("name"));
        if (!zzhvVar.zzs.zzJ()) {
            zzhvVar.zzs.zzay().zzj().zza("Conditional property not cleared since app measurement is disabled");
            return;
        }
        try {
            zzhvVar.zzs.zzt().zzE(new zzab(bundle.getString("app_id"), zzhvVar.zzs.zzf().zzs(null, zzdw.zzap) ? "" : bundle.getString("origin"), zzhvVar.zzs.zzf().zzs(null, zzdw.zzap) ? new zzkq(bundle.getString("name"), 0L, null, "") : new zzkq(bundle.getString("name"), 0L, null, null), bundle.getLong(AppMeasurementSdk.ConditionalUserProperty.CREATION_TIMESTAMP), bundle.getBoolean("active"), bundle.getString(AppMeasurementSdk.ConditionalUserProperty.TRIGGER_EVENT_NAME), null, bundle.getLong(AppMeasurementSdk.ConditionalUserProperty.TRIGGER_TIMEOUT), null, bundle.getLong(AppMeasurementSdk.ConditionalUserProperty.TIME_TO_LIVE), zzhvVar.zzs.zzv().zzz(bundle.getString("app_id"), bundle.getString(AppMeasurementSdk.ConditionalUserProperty.EXPIRED_EVENT_NAME), bundle.getBundle(AppMeasurementSdk.ConditionalUserProperty.EXPIRED_EVENT_PARAMS), zzhvVar.zzs.zzf().zzs(null, zzdw.zzap) ? "" : bundle.getString("origin"), bundle.getLong(AppMeasurementSdk.ConditionalUserProperty.CREATION_TIMESTAMP), true, true)));
        } catch (IllegalArgumentException unused) {
        }
    }
}
