package com.google.android.gms.measurement.internal;

import android.os.RemoteException;
import com.google.android.gms.common.internal.Preconditions;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzio implements Runnable {
    final /* synthetic */ AtomicReference zza;
    final /* synthetic */ zzp zzb;
    final /* synthetic */ zzjj zzc;

    zzio(zzjj zzjjVar, AtomicReference atomicReference, zzp zzpVar) {
        this.zzc = zzjjVar;
        this.zza = atomicReference;
        this.zzb = zzpVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        AtomicReference atomicReference;
        synchronized (this.zza) {
            try {
                try {
                } catch (RemoteException e) {
                    this.zzc.zzs.zzay().zzd().zzb("Failed to get app instance id", e);
                    atomicReference = this.zza;
                }
                if (!this.zzc.zzs.zzm().zzc().zzk()) {
                    this.zzc.zzs.zzay().zzl().zza("Analytics storage consent denied; will not get app instance id");
                    this.zzc.zzs.zzq().zzN(null);
                    this.zzc.zzs.zzm().zze.zzb(null);
                    this.zza.set(null);
                    return;
                }
                zzdz zzdzVar = this.zzc.zzb;
                if (zzdzVar == null) {
                    this.zzc.zzs.zzay().zzd().zza("Failed to get app instance id");
                    return;
                }
                Preconditions.checkNotNull(this.zzb);
                this.zza.set(zzdzVar.zzd(this.zzb));
                String str = (String) this.zza.get();
                if (str != null) {
                    this.zzc.zzs.zzq().zzN(str);
                    this.zzc.zzs.zzm().zze.zzb(str);
                }
                this.zzc.zzQ();
                atomicReference = this.zza;
                atomicReference.notify();
            } finally {
                this.zza.notify();
            }
        }
    }
}
