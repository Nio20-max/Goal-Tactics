package com.google.android.gms.internal.measurement;

import androidx.core.internal.view.SupportMenu;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-base@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzjk {
    private final Object zza;
    private final int zzb;

    zzjk(Object obj, int i) {
        this.zza = obj;
        this.zzb = i;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof zzjk)) {
            return false;
        }
        zzjk zzjkVar = (zzjk) obj;
        return this.zza == zzjkVar.zza && this.zzb == zzjkVar.zzb;
    }

    public final int hashCode() {
        return (System.identityHashCode(this.zza) * SupportMenu.USER_MASK) + this.zzb;
    }
}
