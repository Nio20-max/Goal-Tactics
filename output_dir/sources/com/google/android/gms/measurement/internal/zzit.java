package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzit extends zzam {
    final /* synthetic */ zzjj zza;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    zzit(zzjj zzjjVar, zzgn zzgnVar) {
        super(zzgnVar);
        this.zza = zzjjVar;
    }

    @Override // com.google.android.gms.measurement.internal.zzam
    public final void zzc() {
        zzjj zzjjVar = this.zza;
        zzjjVar.zzg();
        if (zzjjVar.zzL()) {
            zzjjVar.zzs.zzay().zzj().zza("Inactivity, disconnecting from the service");
            zzjjVar.zzs();
        }
    }
}
