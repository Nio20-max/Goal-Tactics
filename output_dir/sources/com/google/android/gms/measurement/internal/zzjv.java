package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzjv extends zzam {
    final /* synthetic */ zzjw zza;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    zzjv(zzjw zzjwVar, zzgn zzgnVar) {
        super(zzgnVar);
        this.zza = zzjwVar;
    }

    @Override // com.google.android.gms.measurement.internal.zzam
    public final void zzc() {
        zzjw zzjwVar = this.zza;
        zzjwVar.zzc.zzg();
        zzjwVar.zzd(false, false, zzjwVar.zzc.zzs.zzav().elapsedRealtime());
        zzjwVar.zzc.zzs.zzd().zzf(zzjwVar.zzc.zzs.zzav().elapsedRealtime());
    }
}
