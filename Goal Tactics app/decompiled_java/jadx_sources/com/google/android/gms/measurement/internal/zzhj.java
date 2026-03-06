package com.google.android.gms.measurement.internal;

import android.os.Bundle;
import android.text.TextUtils;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzhj implements zzkt {
    final /* synthetic */ zzhv zza;

    zzhj(zzhv zzhvVar) {
        this.zza = zzhvVar;
    }

    @Override // com.google.android.gms.measurement.internal.zzkt
    public final void zza(String str, String str2, Bundle bundle) {
        if (TextUtils.isEmpty(str)) {
            this.zza.zzC("auto", "_err", bundle);
        } else {
            this.zza.zzE("auto", "_err", bundle, str);
        }
    }
}
