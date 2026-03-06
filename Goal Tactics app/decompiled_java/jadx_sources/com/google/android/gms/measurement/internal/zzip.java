package com.google.android.gms.measurement.internal;

import android.os.RemoteException;
import com.google.android.gms.common.internal.Preconditions;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzip implements Runnable {
    final /* synthetic */ zzp zza;
    final /* synthetic */ com.google.android.gms.internal.measurement.zzcf zzb;
    final /* synthetic */ zzjj zzc;

    zzip(zzjj zzjjVar, zzp zzpVar, com.google.android.gms.internal.measurement.zzcf zzcfVar) {
        this.zzc = zzjjVar;
        this.zza = zzpVar;
        this.zzb = zzcfVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzfs zzfsVar;
        String strZzd = null;
        try {
            try {
                if (this.zzc.zzs.zzm().zzc().zzk()) {
                    zzdz zzdzVar = this.zzc.zzb;
                    if (zzdzVar == null) {
                        this.zzc.zzs.zzay().zzd().zza("Failed to get app instance id");
                        zzfsVar = this.zzc.zzs;
                    } else {
                        Preconditions.checkNotNull(this.zza);
                        strZzd = zzdzVar.zzd(this.zza);
                        if (strZzd != null) {
                            this.zzc.zzs.zzq().zzN(strZzd);
                            this.zzc.zzs.zzm().zze.zzb(strZzd);
                        }
                        this.zzc.zzQ();
                        zzfsVar = this.zzc.zzs;
                    }
                } else {
                    this.zzc.zzs.zzay().zzl().zza("Analytics storage consent denied; will not get app instance id");
                    this.zzc.zzs.zzq().zzN(null);
                    this.zzc.zzs.zzm().zze.zzb(null);
                    zzfsVar = this.zzc.zzs;
                }
            } catch (RemoteException e) {
                this.zzc.zzs.zzay().zzd().zzb("Failed to get app instance id", e);
                zzfsVar = this.zzc.zzs;
            }
            zzfsVar.zzv().zzU(this.zzb, strZzd);
        } catch (Throwable th) {
            this.zzc.zzs.zzv().zzU(this.zzb, null);
            throw th;
        }
    }
}
