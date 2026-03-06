package com.google.android.gms.measurement.internal;

import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzkg implements zzek {
    final /* synthetic */ String zza;
    final /* synthetic */ zzkn zzb;

    zzkg(zzkn zzknVar, String str) {
        this.zzb = zzknVar;
        this.zza = str;
    }

    @Override // com.google.android.gms.measurement.internal.zzek
    public final void zza(String str, int i, Throwable th, byte[] bArr, Map<String, List<String>> map) {
        this.zzb.zzJ(i, th, bArr, this.zza);
    }
}
