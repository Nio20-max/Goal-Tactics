package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzif implements Runnable {
    final /* synthetic */ zzij zza;

    zzif(zzij zzijVar) {
        this.zza = zzijVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzij zzijVar = this.zza;
        zzijVar.zza = zzijVar.zzh;
    }
}
