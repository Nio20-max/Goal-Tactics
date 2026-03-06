package com.google.android.gms.measurement.internal;

import com.google.android.gms.common.internal.Preconditions;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zziy implements Runnable {
    final /* synthetic */ zzp zza;
    final /* synthetic */ boolean zzb;
    final /* synthetic */ zzat zzc;
    final /* synthetic */ String zzd;
    final /* synthetic */ zzjj zze;

    zziy(zzjj zzjjVar, boolean z, zzp zzpVar, boolean z2, zzat zzatVar, String str) {
        this.zze = zzjjVar;
        this.zza = zzpVar;
        this.zzb = z2;
        this.zzc = zzatVar;
        this.zzd = str;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzdz zzdzVar = this.zze.zzb;
        if (zzdzVar == null) {
            this.zze.zzs.zzay().zzd().zza("Discarding data. Failed to send event to service");
            return;
        }
        Preconditions.checkNotNull(this.zza);
        this.zze.zzD(zzdzVar, this.zzb ? null : this.zzc, this.zza);
        this.zze.zzQ();
    }
}
