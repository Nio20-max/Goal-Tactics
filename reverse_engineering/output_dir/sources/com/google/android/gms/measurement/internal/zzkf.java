package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzkf implements Runnable {
    final /* synthetic */ zzko zza;
    final /* synthetic */ zzkn zzb;

    zzkf(zzkn zzknVar, zzko zzkoVar) {
        this.zzb = zzknVar;
        this.zza = zzkoVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzkn.zzy(this.zzb, this.zza);
        this.zzb.zzQ();
    }
}
