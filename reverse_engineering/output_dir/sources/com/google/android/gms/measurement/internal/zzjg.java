package com.google.android.gms.measurement.internal;

import android.content.ComponentName;
import android.content.Context;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzjg implements Runnable {
    final /* synthetic */ zzji zza;

    zzjg(zzji zzjiVar) {
        this.zza = zzjiVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzjj zzjjVar = this.zza.zza;
        Context contextZzau = zzjjVar.zzs.zzau();
        this.zza.zza.zzs.zzaw();
        zzjj.zzo(zzjjVar, new ComponentName(contextZzau, "com.google.android.gms.measurement.AppMeasurementService"));
    }
}
