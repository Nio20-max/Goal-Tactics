package com.google.android.gms.measurement.internal;

import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzhm implements Runnable {
    final /* synthetic */ AtomicReference zza;
    final /* synthetic */ zzhv zzb;

    zzhm(zzhv zzhvVar, AtomicReference atomicReference) {
        this.zzb = zzhvVar;
        this.zza = atomicReference;
    }

    @Override // java.lang.Runnable
    public final void run() {
        synchronized (this.zza) {
            try {
                this.zza.set(Integer.valueOf(this.zzb.zzs.zzf().zze(this.zzb.zzs.zzh().zzl(), zzdw.zzM)));
            } finally {
                this.zza.notify();
            }
        }
    }
}
