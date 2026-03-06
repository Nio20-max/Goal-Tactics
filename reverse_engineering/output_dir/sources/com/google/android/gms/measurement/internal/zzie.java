package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzie implements Runnable {
    final /* synthetic */ zzic zza;
    final /* synthetic */ zzic zzb;
    final /* synthetic */ long zzc;
    final /* synthetic */ boolean zzd;
    final /* synthetic */ zzij zze;

    zzie(zzij zzijVar, zzic zzicVar, zzic zzicVar2, long j, boolean z) {
        this.zze = zzijVar;
        this.zza = zzicVar;
        this.zzb = zzicVar2;
        this.zzc = j;
        this.zzd = z;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zze.zzB(this.zza, this.zzb, this.zzc, this.zzd, null);
    }
}
