package com.google.android.gms.measurement.internal;

import android.os.RemoteException;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zziu implements Runnable {
    final /* synthetic */ zzat zza;
    final /* synthetic */ String zzb;
    final /* synthetic */ com.google.android.gms.internal.measurement.zzcf zzc;
    final /* synthetic */ zzjj zzd;

    zziu(zzjj zzjjVar, zzat zzatVar, String str, com.google.android.gms.internal.measurement.zzcf zzcfVar) {
        this.zzd = zzjjVar;
        this.zza = zzatVar;
        this.zzb = str;
        this.zzc = zzcfVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzfs zzfsVar;
        byte[] bArrZzu = null;
        try {
            try {
                zzdz zzdzVar = this.zzd.zzb;
                if (zzdzVar == null) {
                    this.zzd.zzs.zzay().zzd().zza("Discarding data. Failed to send event to service to bundle");
                    zzfsVar = this.zzd.zzs;
                } else {
                    bArrZzu = zzdzVar.zzu(this.zza, this.zzb);
                    this.zzd.zzQ();
                    zzfsVar = this.zzd.zzs;
                }
            } catch (RemoteException e) {
                this.zzd.zzs.zzay().zzd().zzb("Failed to send event to the service to bundle", e);
                zzfsVar = this.zzd.zzs;
            }
            zzfsVar.zzv().zzR(this.zzc, bArrZzu);
        } catch (Throwable th) {
            this.zzd.zzs.zzv().zzR(this.zzc, bArrZzu);
            throw th;
        }
    }
}
