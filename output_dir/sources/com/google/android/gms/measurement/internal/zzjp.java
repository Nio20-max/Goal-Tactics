package com.google.android.gms.measurement.internal;

import android.app.job.JobParameters;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import com.google.android.gms.common.internal.Preconditions;
import com.google.android.gms.measurement.internal.zzjo;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
public final class zzjp<T extends Context & zzjo> {
    private final T zza;

    public zzjp(T t) {
        Preconditions.checkNotNull(t);
        this.zza = t;
    }

    private final zzei zzk() {
        return zzfs.zzp(this.zza, null, null).zzay();
    }

    public final int zza(final Intent intent, int i, final int i2) {
        zzfs zzfsVarZzp = zzfs.zzp(this.zza, null, null);
        final zzei zzeiVarZzay = zzfsVarZzp.zzay();
        if (intent == null) {
            zzeiVarZzay.zzk().zza("AppMeasurementService started with null intent");
            return 2;
        }
        String action = intent.getAction();
        zzfsVarZzp.zzaw();
        zzeiVarZzay.zzj().zzc("Local AppMeasurementService called. startId, action", Integer.valueOf(i2), action);
        if ("com.google.android.gms.measurement.UPLOAD".equals(action)) {
            zzh(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzjl
                @Override // java.lang.Runnable
                public final void run() {
                    this.zza.zzc(i2, zzeiVarZzay, intent);
                }
            });
        }
        return 2;
    }

    public final IBinder zzb(Intent intent) {
        if (intent == null) {
            zzk().zzd().zza("onBind called with null intent");
            return null;
        }
        String action = intent.getAction();
        if ("com.google.android.gms.measurement.START".equals(action)) {
            return new zzgk(zzkn.zzt(this.zza), null);
        }
        zzk().zzk().zzb("onBind received unknown action", action);
        return null;
    }

    public final /* synthetic */ void zzc(int i, zzei zzeiVar, Intent intent) {
        if (this.zza.zzc(i)) {
            zzeiVar.zzj().zzb("Local AppMeasurementService processed last upload request. StartId", Integer.valueOf(i));
            zzk().zzj().zza("Completed wakeful intent.");
            this.zza.zza(intent);
        }
    }

    public final /* synthetic */ void zzd(zzei zzeiVar, JobParameters jobParameters) {
        zzeiVar.zzj().zza("AppMeasurementJobService processed last upload request.");
        this.zza.zzb(jobParameters, false);
    }

    public final void zze() {
        zzfs zzfsVarZzp = zzfs.zzp(this.zza, null, null);
        zzei zzeiVarZzay = zzfsVarZzp.zzay();
        zzfsVarZzp.zzaw();
        zzeiVarZzay.zzj().zza("Local AppMeasurementService is starting up");
    }

    public final void zzf() {
        zzfs zzfsVarZzp = zzfs.zzp(this.zza, null, null);
        zzei zzeiVarZzay = zzfsVarZzp.zzay();
        zzfsVarZzp.zzaw();
        zzeiVarZzay.zzj().zza("Local AppMeasurementService is shutting down");
    }

    public final void zzg(Intent intent) {
        if (intent == null) {
            zzk().zzd().zza("onRebind called with null intent");
        } else {
            zzk().zzj().zzb("onRebind called. action", intent.getAction());
        }
    }

    public final void zzh(Runnable runnable) {
        zzkn zzknVarZzt = zzkn.zzt(this.zza);
        zzknVarZzt.zzaz().zzp(new zzjn(this, zzknVarZzt, runnable));
    }

    public final boolean zzi(final JobParameters jobParameters) {
        zzfs zzfsVarZzp = zzfs.zzp(this.zza, null, null);
        final zzei zzeiVarZzay = zzfsVarZzp.zzay();
        String string = jobParameters.getExtras().getString("action");
        zzfsVarZzp.zzaw();
        zzeiVarZzay.zzj().zzb("Local AppMeasurementJobService called. action", string);
        if (!"com.google.android.gms.measurement.UPLOAD".equals(string)) {
            return true;
        }
        zzh(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzjm
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.zzd(zzeiVarZzay, jobParameters);
            }
        });
        return true;
    }

    public final boolean zzj(Intent intent) {
        if (intent == null) {
            zzk().zzd().zza("onUnbind called with null intent");
            return true;
        }
        zzk().zzj().zzb("onUnbind called for intent. action", intent.getAction());
        return true;
    }
}
