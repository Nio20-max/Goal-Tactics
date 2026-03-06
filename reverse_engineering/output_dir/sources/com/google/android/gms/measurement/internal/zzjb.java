package com.google.android.gms.measurement.internal;

import android.os.Bundle;
import android.os.RemoteException;
import com.google.android.gms.common.internal.Preconditions;
import java.util.ArrayList;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzjb implements Runnable {
    final /* synthetic */ String zza;
    final /* synthetic */ String zzb;
    final /* synthetic */ zzp zzc;
    final /* synthetic */ com.google.android.gms.internal.measurement.zzcf zzd;
    final /* synthetic */ zzjj zze;

    zzjb(zzjj zzjjVar, String str, String str2, zzp zzpVar, com.google.android.gms.internal.measurement.zzcf zzcfVar) {
        this.zze = zzjjVar;
        this.zza = str;
        this.zzb = str2;
        this.zzc = zzpVar;
        this.zzd = zzcfVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzfs zzfsVar;
        ArrayList<Bundle> arrayList = new ArrayList<>();
        try {
            try {
                zzdz zzdzVar = this.zze.zzb;
                if (zzdzVar == null) {
                    this.zze.zzs.zzay().zzd().zzc("Failed to get conditional properties; not connected to service", this.zza, this.zzb);
                    zzfsVar = this.zze.zzs;
                } else {
                    Preconditions.checkNotNull(this.zzc);
                    arrayList = zzku.zzG(zzdzVar.zzf(this.zza, this.zzb, this.zzc));
                    this.zze.zzQ();
                    zzfsVar = this.zze.zzs;
                }
            } catch (RemoteException e) {
                this.zze.zzs.zzay().zzd().zzd("Failed to get conditional properties; remote exception", this.zza, this.zzb, e);
                zzfsVar = this.zze.zzs;
            }
            zzfsVar.zzv().zzP(this.zzd, arrayList);
        } catch (Throwable th) {
            this.zze.zzs.zzv().zzP(this.zzd, arrayList);
            throw th;
        }
    }
}
