package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzhb implements Runnable {
    final /* synthetic */ String zza;
    final /* synthetic */ String zzb;
    final /* synthetic */ Object zzc;
    final /* synthetic */ long zzd;
    final /* synthetic */ zzhv zze;

    zzhb(zzhv zzhvVar, String str, String str2, Object obj, long j) {
        this.zze = zzhvVar;
        this.zza = str;
        this.zzb = str2;
        this.zzc = obj;
        this.zzd = j;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zze.zzX(this.zza, this.zzb, this.zzc, this.zzd);
    }
}
