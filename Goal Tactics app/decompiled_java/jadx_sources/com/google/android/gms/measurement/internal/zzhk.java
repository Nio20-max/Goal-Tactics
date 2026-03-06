package com.google.android.gms.measurement.internal;

import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzhk implements Runnable {
    final /* synthetic */ AtomicReference zza;
    final /* synthetic */ zzhv zzb;

    zzhk(zzhv zzhvVar, AtomicReference atomicReference) {
        this.zzb = zzhvVar;
        this.zza = atomicReference;
    }

    @Override // java.lang.Runnable
    public final void run() {
        synchronized (this.zza) {
            try {
                this.zza.set(this.zzb.zzs.zzf().zzo(this.zzb.zzs.zzh().zzl(), zzdw.zzK));
            } finally {
                this.zza.notify();
            }
        }
    }
}
