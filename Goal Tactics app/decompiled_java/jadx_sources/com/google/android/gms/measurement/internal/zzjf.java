package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzjf implements Runnable {
    final /* synthetic */ zzdz zza;
    final /* synthetic */ zzji zzb;

    zzjf(zzji zzjiVar, zzdz zzdzVar) {
        this.zzb = zzjiVar;
        this.zza = zzdzVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        synchronized (this.zzb) {
            this.zzb.zzb = false;
            if (!this.zzb.zza.zzL()) {
                this.zzb.zza.zzs.zzay().zzc().zza("Connected to remote service");
                this.zzb.zza.zzJ(this.zza);
            }
        }
    }
}
