package com.google.android.gms.measurement.internal;

import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzhd implements Runnable {
    final /* synthetic */ long zza;
    final /* synthetic */ zzhv zzb;

    zzhd(zzhv zzhvVar, long j) {
        this.zzb = zzhvVar;
        this.zza = j;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzb.zzK(this.zza, true);
        this.zzb.zzs.zzt().zzu(new AtomicReference<>());
    }
}
