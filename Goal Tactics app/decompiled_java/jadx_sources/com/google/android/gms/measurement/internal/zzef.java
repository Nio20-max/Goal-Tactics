package com.google.android.gms.measurement.internal;

import android.util.Log;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzef implements Runnable {
    final /* synthetic */ int zza;
    final /* synthetic */ String zzb;
    final /* synthetic */ Object zzc;
    final /* synthetic */ Object zzd;
    final /* synthetic */ Object zze;
    final /* synthetic */ zzei zzf;

    zzef(zzei zzeiVar, int i, String str, Object obj, Object obj2, Object obj3) {
        this.zzf = zzeiVar;
        this.zza = i;
        this.zzb = str;
        this.zzc = obj;
        this.zzd = obj2;
        this.zze = obj3;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzex zzexVarZzm = this.zzf.zzs.zzm();
        if (!zzexVarZzm.zzx()) {
            Log.println(6, this.zzf.zzq(), "Persisted config not initialized. Not logging error/warn");
            return;
        }
        if (this.zzf.zza == 0) {
            if (this.zzf.zzs.zzf().zzy()) {
                zzei zzeiVar = this.zzf;
                zzeiVar.zzs.zzaw();
                zzeiVar.zza = 'C';
            } else {
                zzei zzeiVar2 = this.zzf;
                zzeiVar2.zzs.zzaw();
                zzeiVar2.zza = 'c';
            }
        }
        if (this.zzf.zzb < 0) {
            zzei zzeiVar3 = this.zzf;
            zzeiVar3.zzs.zzf().zzh();
            zzeiVar3.zzb = 42097L;
        }
        char cCharAt = "01VDIWEA?".charAt(this.zza);
        char c = this.zzf.zza;
        long j = this.zzf.zzb;
        String strZzo = zzei.zzo(true, this.zzb, this.zzc, this.zzd, this.zze);
        StringBuilder sb = new StringBuilder(String.valueOf(strZzo).length() + 24);
        sb.append("2");
        sb.append(cCharAt);
        sb.append(c);
        sb.append(j);
        sb.append(":");
        sb.append(strZzo);
        String string = sb.toString();
        if (string.length() > 1024) {
            string = this.zzb.substring(0, 1024);
        }
        zzev zzevVar = zzexVarZzm.zzb;
        if (zzevVar != null) {
            zzevVar.zzb(string, 1L);
        }
    }
}
