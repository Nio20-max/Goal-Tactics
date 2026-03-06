package com.google.android.gms.measurement.internal;

import com.google.android.gms.common.internal.Preconditions;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzgc implements Runnable {
    final /* synthetic */ zzp zza;
    final /* synthetic */ zzgk zzb;

    zzgc(zzgk zzgkVar, zzp zzpVar) {
        this.zzb = zzgkVar;
        this.zza = zzpVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzb.zza.zzA();
        zzkn zzknVar = this.zzb.zza;
        zzp zzpVar = this.zza;
        zzknVar.zzaz().zzg();
        zzknVar.zzB();
        Preconditions.checkNotEmpty(zzpVar.zza);
        zzag zzagVarZzb = zzag.zzb(zzpVar.zzv);
        zzag zzagVarZzh = zzknVar.zzh(zzpVar.zza);
        zzknVar.zzay().zzj().zzc("Setting consent, package, consent", zzpVar.zza, zzagVarZzb);
        zzknVar.zzT(zzpVar.zza, zzagVarZzb);
        if (zzagVarZzb.zzm(zzagVarZzh)) {
            zzknVar.zzP(zzpVar);
        }
    }
}
