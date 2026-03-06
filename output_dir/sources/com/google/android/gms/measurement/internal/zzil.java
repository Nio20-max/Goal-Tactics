package com.google.android.gms.measurement.internal;

import com.google.android.gms.common.internal.Preconditions;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzil implements Runnable {
    final /* synthetic */ zzp zza;
    final /* synthetic */ boolean zzb;
    final /* synthetic */ zzkq zzc;
    final /* synthetic */ zzjj zzd;

    zzil(zzjj zzjjVar, zzp zzpVar, boolean z, zzkq zzkqVar) {
        this.zzd = zzjjVar;
        this.zza = zzpVar;
        this.zzb = z;
        this.zzc = zzkqVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzdz zzdzVar = this.zzd.zzb;
        if (zzdzVar == null) {
            this.zzd.zzs.zzay().zzd().zza("Discarding data. Failed to set user property");
            return;
        }
        Preconditions.checkNotNull(this.zza);
        this.zzd.zzD(zzdzVar, this.zzb ? null : this.zzc, this.zza);
        this.zzd.zzQ();
    }
}
