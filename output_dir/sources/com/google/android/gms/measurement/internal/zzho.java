package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzho implements Runnable {
    final /* synthetic */ Boolean zza;
    final /* synthetic */ zzhv zzb;

    zzho(zzhv zzhvVar, Boolean bool) {
        this.zzb = zzhvVar;
        this.zza = bool;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzb.zzZ(this.zza, true);
    }
}
