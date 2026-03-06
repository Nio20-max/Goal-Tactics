package com.google.android.gms.measurement.internal;

import com.google.android.gms.common.internal.Preconditions;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzkm {
    com.google.android.gms.internal.measurement.zzfy zza;
    List<Long> zzb;
    List<com.google.android.gms.internal.measurement.zzfo> zzc;
    long zzd;
    final /* synthetic */ zzkn zze;

    /* synthetic */ zzkm(zzkn zzknVar, zzkl zzklVar) {
        this.zze = zzknVar;
    }

    private static final long zzb(com.google.android.gms.internal.measurement.zzfo zzfoVar) {
        return ((zzfoVar.zzd() / 1000) / 60) / 60;
    }

    public final boolean zza(long j, com.google.android.gms.internal.measurement.zzfo zzfoVar) {
        Preconditions.checkNotNull(zzfoVar);
        if (this.zzc == null) {
            this.zzc = new ArrayList();
        }
        if (this.zzb == null) {
            this.zzb = new ArrayList();
        }
        if (this.zzc.size() > 0 && zzb(this.zzc.get(0)) != zzb(zzfoVar)) {
            return false;
        }
        long jZzbt = this.zzd + ((long) zzfoVar.zzbt());
        this.zze.zzg();
        if (jZzbt >= Math.max(0, zzdw.zzh.zza(null).intValue())) {
            return false;
        }
        this.zzd = jZzbt;
        this.zzc.add(zzfoVar);
        this.zzb.add(Long.valueOf(j));
        int size = this.zzc.size();
        this.zze.zzg();
        return size < Math.max(1, zzdw.zzi.zza(null).intValue());
    }
}
