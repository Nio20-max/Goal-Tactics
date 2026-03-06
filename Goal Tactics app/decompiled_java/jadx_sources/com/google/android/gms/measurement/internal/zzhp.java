package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzhp implements Runnable {
    final /* synthetic */ zzag zza;
    final /* synthetic */ long zzb;
    final /* synthetic */ int zzc;
    final /* synthetic */ long zzd;
    final /* synthetic */ boolean zze;
    final /* synthetic */ zzhv zzf;

    zzhp(zzhv zzhvVar, zzag zzagVar, long j, int i, long j2, boolean z) {
        this.zzf = zzhvVar;
        this.zza = zzagVar;
        this.zzb = j;
        this.zzc = i;
        this.zzd = j2;
        this.zze = z;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzf.zzU(this.zza);
        this.zzf.zzK(this.zzb, false);
        zzhv.zzv(this.zzf, this.zza, this.zzc, this.zzd, true, this.zze);
    }
}
