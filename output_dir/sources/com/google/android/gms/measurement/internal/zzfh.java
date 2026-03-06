package com.google.android.gms.measurement.internal;

import java.util.List;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzfh implements com.google.android.gms.internal.measurement.zzr {
    final /* synthetic */ zzfj zza;

    zzfh(zzfj zzfjVar) {
        this.zza = zzfjVar;
    }

    @Override // com.google.android.gms.internal.measurement.zzr
    public final void zza(int i, String str, List<String> list, boolean z, boolean z2) {
        int i2 = i - 1;
        zzeg zzegVarZzi = i2 != 0 ? i2 != 1 ? i2 != 3 ? i2 != 4 ? this.zza.zzs.zzay().zzi() : z ? this.zza.zzs.zzay().zzm() : !z2 ? this.zza.zzs.zzay().zzl() : this.zza.zzs.zzay().zzk() : this.zza.zzs.zzay().zzj() : z ? this.zza.zzs.zzay().zzh() : !z2 ? this.zza.zzs.zzay().zze() : this.zza.zzs.zzay().zzd() : this.zza.zzs.zzay().zzc();
        int size = list.size();
        if (size == 1) {
            zzegVarZzi.zzb(str, list.get(0));
            return;
        }
        if (size == 2) {
            zzegVarZzi.zzc(str, list.get(0), list.get(1));
        } else if (size != 3) {
            zzegVarZzi.zza(str);
        } else {
            zzegVarZzi.zzd(str, list.get(0), list.get(1), list.get(2));
        }
    }
}
