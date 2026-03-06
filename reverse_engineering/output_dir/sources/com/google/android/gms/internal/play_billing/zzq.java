package com.google.android.gms.internal.play_billing;

import com.google.firebase.analytics.FirebaseAnalytics;

/* JADX INFO: compiled from: com.android.billingclient:billing@@4.0.0 */
/* JADX INFO: loaded from: classes.dex */
final class zzq<E> extends zzp<E> {
    static final zzp<Object> zza = new zzq(new Object[0], 0);
    final transient Object[] zzb;

    zzq(Object[] objArr, int i) {
        this.zzb = objArr;
    }

    @Override // java.util.List
    public final E get(int i) {
        zzj.zza(i, 0, FirebaseAnalytics.Param.INDEX);
        return (E) this.zzb[i];
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return 0;
    }

    @Override // com.google.android.gms.internal.play_billing.zzp, com.google.android.gms.internal.play_billing.zzm
    final int zza(Object[] objArr, int i) {
        System.arraycopy(this.zzb, 0, objArr, 0, 0);
        return 0;
    }

    @Override // com.google.android.gms.internal.play_billing.zzm
    final int zzb() {
        return 0;
    }

    @Override // com.google.android.gms.internal.play_billing.zzm
    final int zzc() {
        return 0;
    }

    @Override // com.google.android.gms.internal.play_billing.zzm
    final Object[] zze() {
        return this.zzb;
    }
}
