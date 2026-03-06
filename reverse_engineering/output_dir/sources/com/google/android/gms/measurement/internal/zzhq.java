package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzhq implements Runnable {
    final /* synthetic */ zzag zza;
    final /* synthetic */ int zzb;
    final /* synthetic */ long zzc;
    final /* synthetic */ boolean zzd;
    final /* synthetic */ zzhv zze;

    zzhq(zzhv zzhvVar, zzag zzagVar, int i, long j, boolean z) {
        this.zze = zzhvVar;
        this.zza = zzagVar;
        this.zzb = i;
        this.zzc = j;
        this.zzd = z;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zze.zzU(this.zza);
        zzhv.zzv(this.zze, this.zza, this.zzb, this.zzc, false, this.zzd);
    }
}
