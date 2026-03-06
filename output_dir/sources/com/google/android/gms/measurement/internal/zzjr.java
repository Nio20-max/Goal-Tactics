package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzjr implements Runnable {
    final /* synthetic */ long zza;
    final /* synthetic */ zzjy zzb;

    zzjr(zzjy zzjyVar, long j) {
        this.zzb = zzjyVar;
        this.zza = j;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzjy.zzj(this.zzb, this.zza);
    }
}
