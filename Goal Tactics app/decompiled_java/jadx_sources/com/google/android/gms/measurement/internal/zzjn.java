package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzjn implements Runnable {
    final /* synthetic */ zzkn zza;
    final /* synthetic */ Runnable zzb;

    zzjn(zzjp zzjpVar, zzkn zzknVar, Runnable runnable) {
        this.zza = zzknVar;
        this.zzb = runnable;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zza.zzA();
        this.zza.zzz(this.zzb);
        this.zza.zzV();
    }
}
