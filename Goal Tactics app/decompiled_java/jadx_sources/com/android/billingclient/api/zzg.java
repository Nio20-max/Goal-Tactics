package com.android.billingclient.api;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;

/* JADX INFO: compiled from: com.android.billingclient:billing@@4.0.0 */
/* JADX INFO: loaded from: classes.dex */
final class zzg extends BroadcastReceiver {
    final /* synthetic */ zzh zza;
    private final PurchasesUpdatedListener zzb;
    private boolean zzc;

    /* synthetic */ zzg(zzh zzhVar, PurchasesUpdatedListener purchasesUpdatedListener, zzf zzfVar) {
        this.zza = zzhVar;
        this.zzb = purchasesUpdatedListener;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        this.zzb.onPurchasesUpdated(com.google.android.gms.internal.play_billing.zza.zzg(intent, "BillingBroadcastManager"), com.google.android.gms.internal.play_billing.zza.zzi(intent.getExtras()));
    }

    public final void zzb(Context context, IntentFilter intentFilter) {
        if (this.zzc) {
            return;
        }
        context.registerReceiver(this.zza.zzb, intentFilter);
        this.zzc = true;
    }

    public final void zzc(Context context) {
        if (!this.zzc) {
            com.google.android.gms.internal.play_billing.zza.zzk("BillingBroadcastManager", "Receiver is not registered.");
        } else {
            context.unregisterReceiver(this.zza.zzb);
            this.zzc = false;
        }
    }
}
