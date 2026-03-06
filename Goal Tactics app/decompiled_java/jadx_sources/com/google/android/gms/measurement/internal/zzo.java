package com.google.android.gms.measurement.internal;

import android.os.Bundle;
import android.os.RemoteException;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-sdk@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzo implements zzgt {
    public final com.google.android.gms.internal.measurement.zzci zza;
    final /* synthetic */ AppMeasurementDynamiteService zzb;

    zzo(AppMeasurementDynamiteService appMeasurementDynamiteService, com.google.android.gms.internal.measurement.zzci zzciVar) {
        this.zzb = appMeasurementDynamiteService;
        this.zza = zzciVar;
    }

    @Override // com.google.android.gms.measurement.internal.zzgt
    public final void onEvent(String str, String str2, Bundle bundle, long j) {
        try {
            this.zza.zze(str, str2, bundle, j);
        } catch (RemoteException e) {
            zzfs zzfsVar = this.zzb.zza;
            if (zzfsVar != null) {
                zzfsVar.zzay().zzk().zzb("Event listener threw exception", e);
            }
        }
    }
}
