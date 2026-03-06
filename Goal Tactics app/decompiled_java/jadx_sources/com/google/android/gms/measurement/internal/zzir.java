package com.google.android.gms.measurement.internal;

import android.os.RemoteException;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzir implements Runnable {
    final /* synthetic */ zzic zza;
    final /* synthetic */ zzjj zzb;

    zzir(zzjj zzjjVar, zzic zzicVar) {
        this.zzb = zzjjVar;
        this.zza = zzicVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzdz zzdzVar = this.zzb.zzb;
        if (zzdzVar == null) {
            this.zzb.zzs.zzay().zzd().zza("Failed to send current screen to service");
            return;
        }
        try {
            zzic zzicVar = this.zza;
            if (zzicVar == null) {
                zzdzVar.zzq(0L, null, null, this.zzb.zzs.zzau().getPackageName());
            } else {
                zzdzVar.zzq(zzicVar.zzc, zzicVar.zza, zzicVar.zzb, this.zzb.zzs.zzau().getPackageName());
            }
            this.zzb.zzQ();
        } catch (RemoteException e) {
            this.zzb.zzs.zzay().zzd().zzb("Failed to send current screen to the service", e);
        }
    }
}
