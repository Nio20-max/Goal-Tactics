package com.google.android.gms.internal.measurement;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
public final class zzpe implements zzpd {
    public static final zzhu<Boolean> zza;
    public static final zzhu<Long> zzb;

    static {
        zzhr zzhrVar = new zzhr(zzhk.zza("com.google.android.gms.measurement"));
        zza = zzhrVar.zze("measurement.validation.internal_limits_internal_event_params", false);
        zzb = zzhrVar.zzc("measurement.id.validation.internal_limits_internal_event_params", 0L);
    }

    @Override // com.google.android.gms.internal.measurement.zzpd
    public final boolean zza() {
        return zza.zzb().booleanValue();
    }
}
