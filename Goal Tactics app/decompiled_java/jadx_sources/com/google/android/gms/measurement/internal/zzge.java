package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzge implements Runnable {
    final /* synthetic */ zzat zza;
    final /* synthetic */ String zzb;
    final /* synthetic */ zzgk zzc;

    zzge(zzgk zzgkVar, zzat zzatVar, String str) {
        this.zzc = zzgkVar;
        this.zza = zzatVar;
        this.zzb = str;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzc.zza.zzA();
        this.zzc.zza.zzE(this.zza, this.zzb);
    }
}
