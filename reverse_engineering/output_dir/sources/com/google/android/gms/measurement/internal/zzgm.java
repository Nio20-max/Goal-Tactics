package com.google.android.gms.measurement.internal;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
abstract class zzgm extends zzgl {
    private boolean zza;

    zzgm(zzfs zzfsVar) {
        super(zzfsVar);
        this.zzs.zzD();
    }

    protected void zzaA() {
    }

    protected abstract boolean zzf();

    protected final void zzu() {
        if (!zzx()) {
            throw new IllegalStateException("Not initialized");
        }
    }

    final boolean zzx() {
        return this.zza;
    }

    public final void zzv() {
        if (this.zza) {
            throw new IllegalStateException("Can't initialize twice");
        }
        if (zzf()) {
            return;
        }
        this.zzs.zzB();
        this.zza = true;
    }

    public final void zzw() {
        if (this.zza) {
            throw new IllegalStateException("Can't initialize twice");
        }
        zzaA();
        this.zzs.zzB();
        this.zza = true;
    }
}
