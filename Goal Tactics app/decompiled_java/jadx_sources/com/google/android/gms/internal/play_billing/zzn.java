package com.google.android.gms.internal.play_billing;

/* JADX INFO: compiled from: com.android.billingclient:billing@@4.0.0 */
/* JADX INFO: loaded from: classes.dex */
final class zzn<E> extends zzl<E> {
    private final zzp<E> zza;

    zzn(zzp<E> zzpVar, int i) {
        super(zzpVar.size(), i);
        this.zza = zzpVar;
    }

    @Override // com.google.android.gms.internal.play_billing.zzl
    protected final E zza(int i) {
        return this.zza.get(i);
    }
}
