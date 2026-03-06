package com.google.android.gms.measurement.internal;

import android.os.Handler;
import android.os.Looper;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
public final class zzjy extends zzf {
    protected final zzjx zza;
    protected final zzjw zzb;
    protected final zzju zzc;
    private Handler zzd;

    zzjy(zzfs zzfsVar) {
        super(zzfsVar);
        this.zza = new zzjx(this);
        this.zzb = new zzjw(this);
        this.zzc = new zzju(this);
    }

    static /* bridge */ /* synthetic */ void zzj(zzjy zzjyVar, long j) {
        zzjyVar.zzg();
        zzjyVar.zzm();
        zzjyVar.zzs.zzay().zzj().zzb("Activity paused, time", Long.valueOf(j));
        zzjyVar.zzc.zza(j);
        if (zzjyVar.zzs.zzf().zzu()) {
            zzjyVar.zzb.zzb(j);
        }
    }

    static /* bridge */ /* synthetic */ void zzl(zzjy zzjyVar, long j) {
        zzjyVar.zzg();
        zzjyVar.zzm();
        zzjyVar.zzs.zzay().zzj().zzb("Activity resumed, time", Long.valueOf(j));
        if (zzjyVar.zzs.zzf().zzu() || zzjyVar.zzs.zzm().zzl.zzb()) {
            zzjyVar.zzb.zzc(j);
        }
        zzjyVar.zzc.zzb();
        zzjx zzjxVar = zzjyVar.zza;
        zzjxVar.zza.zzg();
        if (zzjxVar.zza.zzs.zzJ()) {
            zzjxVar.zzb(zzjxVar.zza.zzs.zzav().currentTimeMillis(), false);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzm() {
        zzg();
        if (this.zzd == null) {
            this.zzd = new com.google.android.gms.internal.measurement.zzby(Looper.getMainLooper());
        }
    }

    @Override // com.google.android.gms.measurement.internal.zzf
    protected final boolean zzf() {
        return false;
    }
}
