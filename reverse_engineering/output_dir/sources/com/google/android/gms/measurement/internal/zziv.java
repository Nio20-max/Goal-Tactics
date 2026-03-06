package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zziv extends zzam {
    final /* synthetic */ zzjj zza;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    zziv(zzjj zzjjVar, zzgn zzgnVar) {
        super(zzgnVar);
        this.zza = zzjjVar;
    }

    @Override // com.google.android.gms.measurement.internal.zzam
    public final void zzc() {
        this.zza.zzs.zzay().zzk().zza("Tasks have been queued for a long time");
    }
}
