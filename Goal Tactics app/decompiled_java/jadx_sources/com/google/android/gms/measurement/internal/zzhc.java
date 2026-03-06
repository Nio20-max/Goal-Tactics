package com.google.android.gms.measurement.internal;

import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzhc implements Runnable {
    final /* synthetic */ AtomicReference zza;
    final /* synthetic */ boolean zzb;
    final /* synthetic */ zzhv zzc;

    zzhc(zzhv zzhvVar, AtomicReference atomicReference, boolean z) {
        this.zzc = zzhvVar;
        this.zza = atomicReference;
        this.zzb = z;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzc.zzs.zzt().zzx(this.zza, this.zzb);
    }
}
