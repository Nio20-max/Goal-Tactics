package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzal implements Runnable {
    final /* synthetic */ zzgn zza;
    final /* synthetic */ zzam zzb;

    zzal(zzam zzamVar, zzgn zzgnVar) {
        this.zzb = zzamVar;
        this.zza = zzgnVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zza.zzaw();
        if (zzaa.zza()) {
            this.zza.zzaz().zzp(this);
            return;
        }
        boolean zZze = this.zzb.zze();
        this.zzb.zzd = 0L;
        if (zZze) {
            this.zzb.zzc();
        }
    }
}
