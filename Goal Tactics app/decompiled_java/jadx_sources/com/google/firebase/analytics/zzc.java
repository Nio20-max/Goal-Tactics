package com.google.firebase.analytics;

import android.os.Bundle;
import com.google.android.gms.internal.measurement.zzee;
import com.google.android.gms.measurement.internal.zzgs;
import com.google.android.gms.measurement.internal.zzgt;
import com.google.android.gms.measurement.internal.zzhw;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-api@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzc implements zzhw {
    final /* synthetic */ zzee zza;

    zzc(zzee zzeeVar) {
        this.zza = zzeeVar;
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final int zza(String str) {
        return this.zza.zza(str);
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final long zzb() {
        return this.zza.zzb();
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final Object zzg(int i) {
        return this.zza.zzh(i);
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final String zzh() {
        return this.zza.zzl();
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final String zzi() {
        return this.zza.zzm();
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final String zzj() {
        return this.zza.zzn();
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final String zzk() {
        return this.zza.zzo();
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final List<Bundle> zzm(String str, String str2) {
        return this.zza.zzp(str, str2);
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final Map<String, Object> zzo(String str, String str2, boolean z) {
        return this.zza.zzq(str, str2, z);
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final void zzp(String str) {
        this.zza.zzu(str);
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final void zzq(String str, String str2, Bundle bundle) {
        this.zza.zzv(str, str2, bundle);
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final void zzr(String str) {
        this.zza.zzw(str);
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final void zzs(String str, String str2, Bundle bundle) {
        this.zza.zzy(str, str2, bundle);
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final void zzt(String str, String str2, Bundle bundle, long j) {
        this.zza.zzz(str, str2, bundle, j);
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final void zzu(zzgt zzgtVar) {
        this.zza.zzB(zzgtVar);
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final void zzv(Bundle bundle) {
        this.zza.zzD(bundle);
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final void zzw(zzgs zzgsVar) {
        this.zza.zzJ(zzgsVar);
    }

    @Override // com.google.android.gms.measurement.internal.zzhw
    public final void zzx(zzgt zzgtVar) {
        this.zza.zzO(zzgtVar);
    }
}
