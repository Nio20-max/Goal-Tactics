package com.google.android.gms.measurement.internal;

import android.content.ComponentName;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzje implements Runnable {
    final /* synthetic */ ComponentName zza;
    final /* synthetic */ zzji zzb;

    zzje(zzji zzjiVar, ComponentName componentName) {
        this.zzb = zzjiVar;
        this.zza = componentName;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzjj.zzo(this.zzb.zza, this.zza);
    }
}
