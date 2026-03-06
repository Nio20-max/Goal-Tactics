package com.google.android.gms.measurement.internal;

import android.os.Bundle;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzjt implements Runnable {
    final long zza;
    final long zzb;
    final /* synthetic */ zzju zzc;

    zzjt(zzju zzjuVar, long j, long j2) {
        this.zzc = zzjuVar;
        this.zza = j;
        this.zzb = j2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzc.zza.zzs.zzaz().zzp(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzjs
            @Override // java.lang.Runnable
            public final void run() {
                zzjt zzjtVar = this.zza;
                zzju zzjuVar = zzjtVar.zzc;
                long j = zzjtVar.zza;
                long j2 = zzjtVar.zzb;
                zzjuVar.zza.zzg();
                zzjuVar.zza.zzs.zzay().zzc().zza("Application going to the background");
                boolean z = true;
                zzjuVar.zza.zzs.zzm().zzl.zza(true);
                Bundle bundle = new Bundle();
                if (!zzjuVar.zza.zzs.zzf().zzu()) {
                    zzjuVar.zza.zzb.zzb(j2);
                    if (zzjuVar.zza.zzs.zzf().zzs(null, zzdw.zzag)) {
                        zzjw zzjwVar = zzjuVar.zza.zzb;
                        long j3 = zzjwVar.zzb;
                        zzjwVar.zzb = j2;
                        bundle.putLong("_et", j2 - j3);
                        zzku.zzJ(zzjuVar.zza.zzs.zzs().zzj(true), bundle, true);
                    } else {
                        z = false;
                    }
                    zzjuVar.zza.zzb.zzd(false, z, j2);
                }
                zzjuVar.zza.zzs.zzq().zzG("auto", "_ab", j, bundle);
            }
        });
    }
}
