package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzep implements Runnable {
    final /* synthetic */ boolean zza;
    final /* synthetic */ zzeq zzb;

    zzep(zzeq zzeqVar, boolean z) {
        this.zzb = zzeqVar;
        this.zza = z;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzb.zzb.zzI(this.zza);
    }
}
