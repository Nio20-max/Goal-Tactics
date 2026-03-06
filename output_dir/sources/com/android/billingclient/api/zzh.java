package com.android.billingclient.api;

import android.content.Context;
import android.content.IntentFilter;

/* JADX INFO: compiled from: com.android.billingclient:billing@@4.0.0 */
/* JADX INFO: loaded from: classes.dex */
final class zzh {
    private final Context zza;
    private final zzg zzb;

    zzh(Context context, PurchasesUpdatedListener purchasesUpdatedListener) {
        this.zza = context;
        this.zzb = new zzg(this, purchasesUpdatedListener, null);
    }

    final PurchasesUpdatedListener zzb() {
        return this.zzb.zzb;
    }

    final void zzc() {
        this.zzb.zzc(this.zza);
    }

    final void zzd() {
        this.zzb.zzb(this.zza, new IntentFilter("com.android.vending.billing.PURCHASES_UPDATED"));
    }
}
