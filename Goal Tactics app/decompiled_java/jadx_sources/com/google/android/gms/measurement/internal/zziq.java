package com.google.android.gms.measurement.internal;

import android.os.RemoteException;
import com.google.android.gms.common.internal.Preconditions;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zziq implements Runnable {
    final /* synthetic */ zzp zza;
    final /* synthetic */ zzjj zzb;

    zziq(zzjj zzjjVar, zzp zzpVar) {
        this.zzb = zzjjVar;
        this.zza = zzpVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzdz zzdzVar = this.zzb.zzb;
        if (zzdzVar == null) {
            this.zzb.zzs.zzay().zzd().zza("Discarding data. Failed to send app launch");
            return;
        }
        try {
            Preconditions.checkNotNull(this.zza);
            zzdzVar.zzj(this.zza);
            this.zzb.zzs.zzi().zzm();
            this.zzb.zzD(zzdzVar, null, this.zza);
            this.zzb.zzQ();
        } catch (RemoteException e) {
            this.zzb.zzs.zzay().zzd().zzb("Failed to send app launch to the service", e);
        }
    }
}
