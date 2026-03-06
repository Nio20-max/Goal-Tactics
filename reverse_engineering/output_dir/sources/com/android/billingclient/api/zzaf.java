package com.android.billingclient.api;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import com.android.billingclient.api.BillingClient;
import java.util.concurrent.Callable;

/* JADX INFO: compiled from: com.android.billingclient:billing@@4.0.0 */
/* JADX INFO: loaded from: classes.dex */
final class zzaf implements ServiceConnection {
    final /* synthetic */ BillingClientImpl zza;
    private final Object zzb = new Object();
    private boolean zzc = false;
    private BillingClientStateListener zzd;

    /* synthetic */ zzaf(BillingClientImpl billingClientImpl, BillingClientStateListener billingClientStateListener, zzy zzyVar) {
        this.zza = billingClientImpl;
        this.zzd = billingClientStateListener;
    }

    private final void zzd(BillingResult billingResult) {
        synchronized (this.zzb) {
            BillingClientStateListener billingClientStateListener = this.zzd;
            if (billingClientStateListener != null) {
                billingClientStateListener.onBillingSetupFinished(billingResult);
            }
        }
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", "Billing service connected.");
        this.zza.zzg = com.google.android.gms.internal.play_billing.zzc.zzn(iBinder);
        if (this.zza.zzH(new Callable() { // from class: com.android.billingclient.api.zzae
            @Override // java.util.concurrent.Callable
            public final Object call() throws Exception {
                this.zza.zza();
                return null;
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzad
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.zzb();
            }
        }, this.zza.zzD()) == null) {
            zzd(this.zza.zzF());
        }
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Billing service disconnected.");
        this.zza.zzg = null;
        this.zza.zza = 0;
        synchronized (this.zzb) {
            BillingClientStateListener billingClientStateListener = this.zzd;
            if (billingClientStateListener != null) {
                billingClientStateListener.onBillingServiceDisconnected();
            }
        }
    }

    public final /* synthetic */ Object zza() throws Exception {
        int iZzb;
        synchronized (this.zzb) {
            if (this.zzc) {
                return null;
            }
            int i = 3;
            try {
                String packageName = this.zza.zzf.getPackageName();
                int i2 = 16;
                iZzb = 3;
                while (true) {
                    if (i2 < 3) {
                        i2 = 0;
                        break;
                    }
                    try {
                        iZzb = this.zza.zzg.zzb(i2, packageName, BillingClient.SkuType.SUBS);
                        if (iZzb == 0) {
                            break;
                        }
                        i2--;
                    } catch (Exception unused) {
                        i = iZzb;
                        com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Exception while checking if billing is supported; try to reconnect");
                        this.zza.zza = 0;
                        this.zza.zzg = null;
                        iZzb = i;
                    }
                }
                boolean z = true;
                this.zza.zzj = i2 >= 5;
                this.zza.zzi = i2 >= 3;
                if (i2 < 3) {
                    com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", "In-app billing API does not support subscription on this device.");
                }
                int i3 = 16;
                while (true) {
                    if (i3 < 3) {
                        break;
                    }
                    iZzb = this.zza.zzg.zzb(i3, packageName, BillingClient.SkuType.INAPP);
                    if (iZzb == 0) {
                        this.zza.zzk = i3;
                        break;
                    }
                    i3--;
                }
                BillingClientImpl billingClientImpl = this.zza;
                billingClientImpl.zzs = billingClientImpl.zzk >= 16;
                BillingClientImpl billingClientImpl2 = this.zza;
                billingClientImpl2.zzr = billingClientImpl2.zzk >= 15;
                BillingClientImpl billingClientImpl3 = this.zza;
                billingClientImpl3.zzq = billingClientImpl3.zzk >= 14;
                BillingClientImpl billingClientImpl4 = this.zza;
                billingClientImpl4.zzp = billingClientImpl4.zzk >= 12;
                BillingClientImpl billingClientImpl5 = this.zza;
                billingClientImpl5.zzo = billingClientImpl5.zzk >= 10;
                BillingClientImpl billingClientImpl6 = this.zza;
                billingClientImpl6.zzn = billingClientImpl6.zzk >= 9;
                BillingClientImpl billingClientImpl7 = this.zza;
                billingClientImpl7.zzm = billingClientImpl7.zzk >= 8;
                BillingClientImpl billingClientImpl8 = this.zza;
                if (billingClientImpl8.zzk < 6) {
                    z = false;
                }
                billingClientImpl8.zzl = z;
                if (this.zza.zzk < 3) {
                    com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "In-app billing API version 3 is not supported on this device.");
                }
                if (iZzb == 0) {
                    this.zza.zza = 2;
                } else {
                    this.zza.zza = 0;
                    this.zza.zzg = null;
                }
            } catch (Exception unused2) {
            }
            if (iZzb == 0) {
                zzd(zzak.zzp);
            } else {
                zzd(zzak.zza);
            }
            return null;
        }
    }

    public final /* synthetic */ void zzb() {
        this.zza.zza = 0;
        this.zza.zzg = null;
        zzd(zzak.zzr);
    }

    final void zzc() {
        synchronized (this.zzb) {
            this.zzd = null;
            this.zzc = true;
        }
    }
}
