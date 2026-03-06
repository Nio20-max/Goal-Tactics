package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzfv implements Runnable {
    final /* synthetic */ zzab zza;
    final /* synthetic */ zzgk zzb;

    zzfv(zzgk zzgkVar, zzab zzabVar) {
        this.zzb = zzgkVar;
        this.zza = zzabVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzb.zza.zzA();
        if (this.zza.zzc.zza() == null) {
            this.zzb.zza.zzM(this.zza);
        } else {
            this.zzb.zza.zzR(this.zza);
        }
    }
}
