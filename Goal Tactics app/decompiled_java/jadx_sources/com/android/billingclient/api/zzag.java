package com.android.billingclient.api;

import java.util.List;

/* JADX INFO: compiled from: com.android.billingclient:billing@@4.0.0 */
/* JADX INFO: loaded from: classes.dex */
final class zzag {
    private final List<PurchaseHistoryRecord> zza;
    private final BillingResult zzb;

    zzag(BillingResult billingResult, List<PurchaseHistoryRecord> list) {
        this.zza = list;
        this.zzb = billingResult;
    }

    final BillingResult zza() {
        return this.zzb;
    }

    final List<PurchaseHistoryRecord> zzb() {
        return this.zza;
    }
}
