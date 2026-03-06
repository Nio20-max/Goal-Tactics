package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzjq implements Runnable {
    final /* synthetic */ long zza;
    final /* synthetic */ zzjy zzb;

    zzjq(zzjy zzjyVar, long j) {
        this.zzb = zzjyVar;
        this.zza = j;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzjy.zzl(this.zzb, this.zza);
    }
}
