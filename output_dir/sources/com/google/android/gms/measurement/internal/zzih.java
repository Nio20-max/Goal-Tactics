package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzih implements Runnable {
    final /* synthetic */ zzic zza;
    final /* synthetic */ long zzb;
    final /* synthetic */ zzij zzc;

    zzih(zzij zzijVar, zzic zzicVar, long j) {
        this.zzc = zzijVar;
        this.zza = zzicVar;
        this.zzb = j;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzc.zzC(this.zza, false, this.zzb);
        zzij zzijVar = this.zzc;
        zzijVar.zza = null;
        zzijVar.zzs.zzt().zzG(null);
    }
}
