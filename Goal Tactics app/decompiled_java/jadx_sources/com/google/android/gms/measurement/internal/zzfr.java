package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzfr implements Runnable {
    final /* synthetic */ zzgu zza;
    final /* synthetic */ zzfs zzb;

    zzfr(zzfs zzfsVar, zzgu zzguVar) {
        this.zzb = zzfsVar;
        this.zza = zzguVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzfs.zzA(this.zzb, this.zza);
        this.zzb.zzH(this.zza.zzg);
    }
}
