package com.google.android.gms.measurement.internal;

import com.google.android.gms.internal.measurement.zzpl;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzgd implements Runnable {
    final /* synthetic */ zzat zza;
    final /* synthetic */ zzp zzb;
    final /* synthetic */ zzgk zzc;

    zzgd(zzgk zzgkVar, zzat zzatVar, zzp zzpVar) {
        this.zzc = zzgkVar;
        this.zza = zzatVar;
        this.zzb = zzpVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzat zzatVarZzb = this.zzc.zzb(this.zza, this.zzb);
        zzpl.zzc();
        if (this.zzc.zza.zzg().zzs(null, zzdw.zzav)) {
            this.zzc.zzw(zzatVarZzb, this.zzb);
        } else {
            this.zzc.zzB(zzatVarZzb, this.zzb);
        }
    }
}
