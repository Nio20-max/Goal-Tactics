package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzka extends zzam {
    final /* synthetic */ zzkb zza;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    zzka(zzkb zzkbVar, zzgn zzgnVar) {
        super(zzgnVar);
        this.zza = zzkbVar;
    }

    @Override // com.google.android.gms.measurement.internal.zzam
    public final void zzc() {
        this.zza.zza();
        this.zza.zzs.zzay().zzj().zza("Starting upload from DelayedRunnable");
        this.zza.zzf.zzV();
    }
}
