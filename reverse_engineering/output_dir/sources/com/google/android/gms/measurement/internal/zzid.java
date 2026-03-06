package com.google.android.gms.measurement.internal;

import android.os.Bundle;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzid implements Runnable {
    final /* synthetic */ Bundle zza;
    final /* synthetic */ zzic zzb;
    final /* synthetic */ zzic zzc;
    final /* synthetic */ long zzd;
    final /* synthetic */ zzij zze;

    zzid(zzij zzijVar, Bundle bundle, zzic zzicVar, zzic zzicVar2, long j) {
        this.zze = zzijVar;
        this.zza = bundle;
        this.zzb = zzicVar;
        this.zzc = zzicVar2;
        this.zzd = j;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzij.zzp(this.zze, this.zza, this.zzb, this.zzc, this.zzd);
    }
}
