package com.android.billingclient.api;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.RemoteException;
import android.text.TextUtils;
import com.android.billingclient.BuildConfig;
import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.Purchase;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: com.android.billingclient:billing@@4.0.0 */
/* JADX INFO: loaded from: classes.dex */
class BillingClientImpl extends BillingClient {
    private volatile int zza;
    private final String zzb;
    private final Handler zzc;
    private volatile zzh zzd;
    private Context zze;
    private Context zzf;
    private volatile com.google.android.gms.internal.play_billing.zzd zzg;
    private volatile zzaf zzh;
    private boolean zzi;
    private boolean zzj;
    private int zzk;
    private boolean zzl;
    private boolean zzm;
    private boolean zzn;
    private boolean zzo;
    private boolean zzp;
    private boolean zzq;
    private boolean zzr;
    private boolean zzs;
    private boolean zzt;
    private ExecutorService zzu;

    private BillingClientImpl(Activity activity, boolean z, String str) {
        this(activity.getApplicationContext(), z, new zzah(), str, null);
    }

    private void initialize(Context context, PurchasesUpdatedListener purchasesUpdatedListener, boolean z) {
        Context applicationContext = context.getApplicationContext();
        this.zzf = applicationContext;
        this.zzd = new zzh(applicationContext, purchasesUpdatedListener);
        this.zze = context;
        this.zzt = z;
    }

    private int launchBillingFlowCpp(Activity activity, BillingFlowParams billingFlowParams) {
        return launchBillingFlow(activity, billingFlowParams).getResponseCode();
    }

    private void launchPriceChangeConfirmationFlow(Activity activity, PriceChangeFlowParams priceChangeFlowParams, long j) {
        launchPriceChangeConfirmationFlow(activity, priceChangeFlowParams, new zzah(j));
    }

    private void startConnection(long j) {
        zzah zzahVar = new zzah(j);
        if (isReady()) {
            com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", "Service connection is valid. No need to re-initialize.");
            zzahVar.onBillingSetupFinished(zzak.zzp);
            return;
        }
        if (this.zza == 1) {
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Client is already in the process of connecting to billing service.");
            zzahVar.onBillingSetupFinished(zzak.zzd);
            return;
        }
        if (this.zza == 3) {
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Client was already closed and can't be reused. Please create another instance.");
            zzahVar.onBillingSetupFinished(zzak.zzq);
            return;
        }
        this.zza = 1;
        this.zzd.zzd();
        com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", "Starting in-app billing setup.");
        this.zzh = new zzaf(this, zzahVar, null);
        Intent intent = new Intent("com.android.vending.billing.InAppBillingService.BIND");
        intent.setPackage("com.android.vending");
        List<ResolveInfo> listQueryIntentServices = this.zzf.getPackageManager().queryIntentServices(intent, 0);
        if (listQueryIntentServices != null && !listQueryIntentServices.isEmpty()) {
            ResolveInfo resolveInfo = listQueryIntentServices.get(0);
            if (resolveInfo.serviceInfo != null) {
                String str = resolveInfo.serviceInfo.packageName;
                String str2 = resolveInfo.serviceInfo.name;
                if (!"com.android.vending".equals(str) || str2 == null) {
                    com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "The device doesn't have valid Play Store.");
                } else {
                    ComponentName componentName = new ComponentName(str, str2);
                    Intent intent2 = new Intent(intent);
                    intent2.setComponent(componentName);
                    intent2.putExtra("playBillingLibraryVersion", this.zzb);
                    if (this.zzf.bindService(intent2, this.zzh, 1)) {
                        com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", "Service was bonded successfully.");
                        return;
                    }
                    com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Connection to Billing service is blocked.");
                }
            }
        }
        this.zza = 0;
        com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", "Billing service unavailable on device.");
        zzahVar.onBillingSetupFinished(zzak.zzc);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Handler zzD() {
        return Looper.myLooper() == null ? this.zzc : new Handler(Looper.myLooper());
    }

    private final BillingResult zzE(final BillingResult billingResult) {
        if (Thread.interrupted()) {
            return billingResult;
        }
        this.zzc.post(new Runnable() { // from class: com.android.billingclient.api.zzq
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.zzs(billingResult);
            }
        });
        return billingResult;
    }

    private final BillingResult zzG(final String str) {
        try {
            return ((Integer) zzH(new Callable() { // from class: com.android.billingclient.api.zzn
                @Override // java.util.concurrent.Callable
                public final Object call() {
                    return this.zza.zzn(str);
                }
            }, 5000L, null, zzD()).get(5000L, TimeUnit.MILLISECONDS)).intValue() == 0 ? zzak.zzp : zzak.zzi;
        } catch (Exception unused) {
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Exception while checking if billing is supported; try to reconnect");
            return zzak.zzq;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final <T> Future<T> zzH(Callable<T> callable, long j, final Runnable runnable, Handler handler) {
        long j2 = (long) (j * 0.95d);
        if (this.zzu == null) {
            this.zzu = Executors.newFixedThreadPool(com.google.android.gms.internal.play_billing.zza.zza, new zzac(this));
        }
        try {
            final Future<T> futureSubmit = this.zzu.submit(callable);
            handler.postDelayed(new Runnable() { // from class: com.android.billingclient.api.zzw
                @Override // java.lang.Runnable
                public final void run() {
                    Future future = futureSubmit;
                    Runnable runnable2 = runnable;
                    if (future.isDone() || future.isCancelled()) {
                        return;
                    }
                    future.cancel(true);
                    com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Async task is taking too long, cancel it!");
                    if (runnable2 != null) {
                        runnable2.run();
                    }
                }
            }, j2);
            return futureSubmit;
        } catch (Exception e) {
            String strValueOf = String.valueOf(e);
            StringBuilder sb = new StringBuilder(String.valueOf(strValueOf).length() + 28);
            sb.append("Async task throws exception ");
            sb.append(strValueOf);
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", sb.toString());
            return null;
        }
    }

    private final void zzI(final BillingResult billingResult, final PriceChangeConfirmationListener priceChangeConfirmationListener) {
        if (Thread.interrupted()) {
            return;
        }
        this.zzc.post(new Runnable() { // from class: com.android.billingclient.api.zzs
            @Override // java.lang.Runnable
            public final void run() {
                priceChangeConfirmationListener.onPriceChangeConfirmationResult(billingResult);
            }
        });
    }

    static /* synthetic */ zzag zzi(BillingClientImpl billingClientImpl, String str) {
        String strValueOf = String.valueOf(str);
        com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", strValueOf.length() != 0 ? "Querying purchase history, item type: ".concat(strValueOf) : new String("Querying purchase history, item type: "));
        ArrayList arrayList = new ArrayList();
        Bundle bundleZzf = com.google.android.gms.internal.play_billing.zza.zzf(billingClientImpl.zzn, billingClientImpl.zzt, billingClientImpl.zzb);
        String string = null;
        while (billingClientImpl.zzl) {
            try {
                Bundle bundleZzh = billingClientImpl.zzg.zzh(6, billingClientImpl.zzf.getPackageName(), str, string, bundleZzf);
                BillingResult billingResultZza = zzam.zza(bundleZzh, "BillingClient", "getPurchaseHistory()");
                if (billingResultZza != zzak.zzp) {
                    return new zzag(billingResultZza, null);
                }
                ArrayList<String> stringArrayList = bundleZzh.getStringArrayList("INAPP_PURCHASE_ITEM_LIST");
                ArrayList<String> stringArrayList2 = bundleZzh.getStringArrayList("INAPP_PURCHASE_DATA_LIST");
                ArrayList<String> stringArrayList3 = bundleZzh.getStringArrayList("INAPP_DATA_SIGNATURE_LIST");
                for (int i = 0; i < stringArrayList2.size(); i++) {
                    String str2 = stringArrayList2.get(i);
                    String str3 = stringArrayList3.get(i);
                    String strValueOf2 = String.valueOf(stringArrayList.get(i));
                    com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", strValueOf2.length() != 0 ? "Purchase record found for sku : ".concat(strValueOf2) : new String("Purchase record found for sku : "));
                    try {
                        PurchaseHistoryRecord purchaseHistoryRecord = new PurchaseHistoryRecord(str2, str3);
                        if (TextUtils.isEmpty(purchaseHistoryRecord.getPurchaseToken())) {
                            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "BUG: empty/null token!");
                        }
                        arrayList.add(purchaseHistoryRecord);
                    } catch (JSONException e) {
                        String strValueOf3 = String.valueOf(e);
                        StringBuilder sb = new StringBuilder(String.valueOf(strValueOf3).length() + 48);
                        sb.append("Got an exception trying to decode the purchase: ");
                        sb.append(strValueOf3);
                        com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", sb.toString());
                        return new zzag(zzak.zzl, null);
                    }
                }
                string = bundleZzh.getString("INAPP_CONTINUATION_TOKEN");
                String strValueOf4 = String.valueOf(string);
                com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", strValueOf4.length() != 0 ? "Continuation token: ".concat(strValueOf4) : new String("Continuation token: "));
                if (TextUtils.isEmpty(string)) {
                    return new zzag(zzak.zzp, arrayList);
                }
            } catch (RemoteException e2) {
                String strValueOf5 = String.valueOf(e2);
                StringBuilder sb2 = new StringBuilder(String.valueOf(strValueOf5).length() + 64);
                sb2.append("Got exception trying to get purchase history: ");
                sb2.append(strValueOf5);
                sb2.append("; try to reconnect");
                com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", sb2.toString());
                return new zzag(zzak.zzq, null);
            }
        }
        com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "getPurchaseHistory is not supported on current device");
        return new zzag(zzak.zzj, null);
    }

    static /* synthetic */ Purchase.PurchasesResult zzk(BillingClientImpl billingClientImpl, String str) {
        String strValueOf = String.valueOf(str);
        com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", strValueOf.length() != 0 ? "Querying owned items, item type: ".concat(strValueOf) : new String("Querying owned items, item type: "));
        ArrayList arrayList = new ArrayList();
        Bundle bundleZzf = com.google.android.gms.internal.play_billing.zza.zzf(billingClientImpl.zzn, billingClientImpl.zzt, billingClientImpl.zzb);
        String string = null;
        do {
            try {
                Bundle bundleZzj = billingClientImpl.zzn ? billingClientImpl.zzg.zzj(9, billingClientImpl.zzf.getPackageName(), str, string, bundleZzf) : billingClientImpl.zzg.zzi(3, billingClientImpl.zzf.getPackageName(), str, string);
                BillingResult billingResultZza = zzam.zza(bundleZzj, "BillingClient", "getPurchase()");
                if (billingResultZza != zzak.zzp) {
                    return new Purchase.PurchasesResult(billingResultZza, null);
                }
                ArrayList<String> stringArrayList = bundleZzj.getStringArrayList("INAPP_PURCHASE_ITEM_LIST");
                ArrayList<String> stringArrayList2 = bundleZzj.getStringArrayList("INAPP_PURCHASE_DATA_LIST");
                ArrayList<String> stringArrayList3 = bundleZzj.getStringArrayList("INAPP_DATA_SIGNATURE_LIST");
                for (int i = 0; i < stringArrayList2.size(); i++) {
                    String str2 = stringArrayList2.get(i);
                    String str3 = stringArrayList3.get(i);
                    String strValueOf2 = String.valueOf(stringArrayList.get(i));
                    com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", strValueOf2.length() != 0 ? "Sku is owned: ".concat(strValueOf2) : new String("Sku is owned: "));
                    try {
                        Purchase purchase = new Purchase(str2, str3);
                        if (TextUtils.isEmpty(purchase.getPurchaseToken())) {
                            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "BUG: empty/null token!");
                        }
                        arrayList.add(purchase);
                    } catch (JSONException e) {
                        String strValueOf3 = String.valueOf(e);
                        StringBuilder sb = new StringBuilder(String.valueOf(strValueOf3).length() + 48);
                        sb.append("Got an exception trying to decode the purchase: ");
                        sb.append(strValueOf3);
                        com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", sb.toString());
                        return new Purchase.PurchasesResult(zzak.zzl, null);
                    }
                }
                string = bundleZzj.getString("INAPP_CONTINUATION_TOKEN");
                String strValueOf4 = String.valueOf(string);
                com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", strValueOf4.length() != 0 ? "Continuation token: ".concat(strValueOf4) : new String("Continuation token: "));
            } catch (Exception e2) {
                String strValueOf5 = String.valueOf(e2);
                StringBuilder sb2 = new StringBuilder(String.valueOf(strValueOf5).length() + 57);
                sb2.append("Got exception trying to get purchases: ");
                sb2.append(strValueOf5);
                sb2.append("; try to reconnect");
                com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", sb2.toString());
                return new Purchase.PurchasesResult(zzak.zzq, null);
            }
        } while (!TextUtils.isEmpty(string));
        return new Purchase.PurchasesResult(zzak.zzp, arrayList);
    }

    @Override // com.android.billingclient.api.BillingClient
    public final void acknowledgePurchase(final AcknowledgePurchaseParams acknowledgePurchaseParams, final AcknowledgePurchaseResponseListener acknowledgePurchaseResponseListener) {
        if (!isReady()) {
            acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse(zzak.zzq);
            return;
        }
        if (TextUtils.isEmpty(acknowledgePurchaseParams.getPurchaseToken())) {
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Please provide a valid purchase token.");
            acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse(zzak.zzk);
        } else if (!this.zzn) {
            acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse(zzak.zzb);
        } else if (zzH(new Callable() { // from class: com.android.billingclient.api.zzk
            @Override // java.util.concurrent.Callable
            public final Object call() throws Exception {
                this.zza.zzo(acknowledgePurchaseParams, acknowledgePurchaseResponseListener);
                return null;
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzj
            @Override // java.lang.Runnable
            public final void run() {
                acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse(zzak.zzr);
            }
        }, zzD()) == null) {
            acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse(zzF());
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final void consumeAsync(final ConsumeParams consumeParams, final ConsumeResponseListener consumeResponseListener) {
        if (!isReady()) {
            consumeResponseListener.onConsumeResponse(zzak.zzq, consumeParams.getPurchaseToken());
        } else if (zzH(new Callable() { // from class: com.android.billingclient.api.zzl
            @Override // java.util.concurrent.Callable
            public final Object call() throws Exception {
                this.zza.zzp(consumeParams, consumeResponseListener);
                return null;
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzr
            @Override // java.lang.Runnable
            public final void run() {
                consumeResponseListener.onConsumeResponse(zzak.zzr, consumeParams.getPurchaseToken());
            }
        }, zzD()) == null) {
            consumeResponseListener.onConsumeResponse(zzF(), consumeParams.getPurchaseToken());
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final void endConnection() {
        try {
            this.zze = null;
            this.zzd.zzc();
            if (this.zzh != null) {
                this.zzh.zzc();
            }
            if (this.zzh != null && this.zzg != null) {
                com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", "Unbinding from service.");
                this.zzf.unbindService(this.zzh);
                this.zzh = null;
            }
            this.zzg = null;
            ExecutorService executorService = this.zzu;
            if (executorService != null) {
                executorService.shutdownNow();
                this.zzu = null;
            }
        } catch (Exception e) {
            String strValueOf = String.valueOf(e);
            StringBuilder sb = new StringBuilder(String.valueOf(strValueOf).length() + 48);
            sb.append("There was an exception while ending connection: ");
            sb.append(strValueOf);
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", sb.toString());
        } finally {
            this.zza = 3;
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final int getConnectionState() {
        return this.zza;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:39:0x007b  */
    @Override // com.android.billingclient.api.BillingClient
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final com.android.billingclient.api.BillingResult isFeatureSupported(java.lang.String r3) {
        /*
            Method dump skipped, instruction units count: 308
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.billingclient.api.BillingClientImpl.isFeatureSupported(java.lang.String):com.android.billingclient.api.BillingResult");
    }

    @Override // com.android.billingclient.api.BillingClient
    public final boolean isReady() {
        return (this.zza != 2 || this.zzg == null || this.zzh == null) ? false : true;
    }

    @Override // com.android.billingclient.api.BillingClient
    public final BillingResult launchBillingFlow(Activity activity, final BillingFlowParams billingFlowParams) {
        String str;
        String str2;
        String str3;
        Future futureZzH;
        boolean z;
        int i;
        String strOptString;
        String str4 = "BUY_INTENT";
        if (!isReady()) {
            BillingResult billingResult = zzak.zzq;
            zzE(billingResult);
            return billingResult;
        }
        ArrayList<SkuDetails> arrayListZzj = billingFlowParams.zzj();
        final SkuDetails skuDetails = arrayListZzj.get(0);
        final String type = skuDetails.getType();
        if (type.equals(BillingClient.SkuType.SUBS) && !this.zzi) {
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Current client doesn't support subscriptions.");
            BillingResult billingResult2 = zzak.zzs;
            zzE(billingResult2);
            return billingResult2;
        }
        if (billingFlowParams.zzm() && !this.zzl) {
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Current client doesn't support extra params for buy intent.");
            BillingResult billingResult3 = zzak.zzh;
            zzE(billingResult3);
            return billingResult3;
        }
        if (arrayListZzj.size() > 1 && !this.zzs) {
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Current client doesn't support multi-item purchases.");
            BillingResult billingResult4 = zzak.zzu;
            zzE(billingResult4);
            return billingResult4;
        }
        String str5 = "";
        for (int i2 = 0; i2 < arrayListZzj.size(); i2++) {
            String strValueOf = String.valueOf(str5);
            String strValueOf2 = String.valueOf(arrayListZzj.get(i2));
            StringBuilder sb = new StringBuilder(String.valueOf(strValueOf).length() + String.valueOf(strValueOf2).length());
            sb.append(strValueOf);
            sb.append(strValueOf2);
            String string = sb.toString();
            if (i2 < arrayListZzj.size() - 1) {
                string = String.valueOf(string).concat(", ");
            }
            str5 = string;
        }
        StringBuilder sb2 = new StringBuilder(String.valueOf(str5).length() + 41 + String.valueOf(type).length());
        sb2.append("Constructing buy intent for ");
        sb2.append(str5);
        sb2.append(", item type: ");
        sb2.append(type);
        com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", sb2.toString());
        if (this.zzl) {
            final Bundle bundleZze = com.google.android.gms.internal.play_billing.zza.zze(billingFlowParams, this.zzn, this.zzt, this.zzb);
            ArrayList<String> arrayList = new ArrayList<>();
            ArrayList<String> arrayList2 = new ArrayList<>();
            ArrayList<String> arrayList3 = new ArrayList<>();
            ArrayList<Integer> arrayList4 = new ArrayList<>();
            ArrayList<String> arrayList5 = new ArrayList<>();
            str2 = "; try to reconnect";
            int size = arrayListZzj.size();
            str3 = str5;
            int i3 = 0;
            boolean z2 = false;
            boolean z3 = false;
            boolean z4 = false;
            boolean z5 = false;
            while (i3 < size) {
                SkuDetails skuDetails2 = arrayListZzj.get(i3);
                if (skuDetails2.zze().isEmpty()) {
                    i = size;
                } else {
                    i = size;
                    arrayList.add(skuDetails2.zze());
                }
                String str6 = str4;
                try {
                    strOptString = new JSONObject(skuDetails2.getOriginalJson()).optString("offer_id_token");
                } catch (JSONException unused) {
                    strOptString = "";
                }
                String strZzb = skuDetails2.zzb();
                int iZza = skuDetails2.zza();
                String strZzd = skuDetails2.zzd();
                arrayList2.add(strOptString);
                z2 |= !TextUtils.isEmpty(strOptString);
                arrayList3.add(strZzb);
                z3 |= !TextUtils.isEmpty(strZzb);
                arrayList4.add(Integer.valueOf(iZza));
                z4 |= iZza != 0;
                z5 |= !TextUtils.isEmpty(strZzd);
                arrayList5.add(strZzd);
                i3++;
                size = i;
                str4 = str6;
            }
            str = str4;
            if (!arrayList.isEmpty()) {
                bundleZze.putStringArrayList("skuDetailsTokens", arrayList);
            }
            if (z2) {
                if (!this.zzq) {
                    BillingResult billingResult5 = zzak.zzi;
                    zzE(billingResult5);
                    return billingResult5;
                }
                bundleZze.putStringArrayList("SKU_OFFER_ID_TOKEN_LIST", arrayList2);
            }
            if (z3) {
                bundleZze.putStringArrayList("SKU_OFFER_ID_LIST", arrayList3);
            }
            if (z4) {
                bundleZze.putIntegerArrayList("SKU_OFFER_TYPE_LIST", arrayList4);
            }
            if (z5) {
                bundleZze.putStringArrayList("SKU_SERIALIZED_DOCID_LIST", arrayList5);
            }
            if (TextUtils.isEmpty(skuDetails.zzc())) {
                z = false;
            } else {
                bundleZze.putString("skuPackageName", skuDetails.zzc());
                z = true;
            }
            if (!TextUtils.isEmpty(null)) {
                bundleZze.putString("accountName", null);
            }
            if (arrayListZzj.size() > 1) {
                ArrayList<String> arrayList6 = new ArrayList<>(arrayListZzj.size() - 1);
                ArrayList<String> arrayList7 = new ArrayList<>(arrayListZzj.size() - 1);
                for (int i4 = 1; i4 < arrayListZzj.size(); i4++) {
                    arrayList6.add(arrayListZzj.get(i4).getSku());
                    arrayList7.add(arrayListZzj.get(i4).getType());
                }
                bundleZze.putStringArrayList("additionalSkus", arrayList6);
                bundleZze.putStringArrayList("additionalSkuTypes", arrayList7);
            }
            if (!TextUtils.isEmpty(activity.getIntent().getStringExtra("PROXY_PACKAGE"))) {
                String stringExtra = activity.getIntent().getStringExtra("PROXY_PACKAGE");
                bundleZze.putString("proxyPackage", stringExtra);
                try {
                    bundleZze.putString("proxyPackageVersion", this.zzf.getPackageManager().getPackageInfo(stringExtra, 0).versionName);
                } catch (PackageManager.NameNotFoundException unused2) {
                    bundleZze.putString("proxyPackageVersion", "package not found");
                }
            }
            final int i5 = (this.zzr && z) ? 15 : this.zzn ? 9 : billingFlowParams.getVrPurchaseFlow() ? 7 : 6;
            futureZzH = zzH(new Callable() { // from class: com.android.billingclient.api.zzx
                @Override // java.util.concurrent.Callable
                public final Object call() {
                    return this.zza.zze(i5, skuDetails, type, billingFlowParams, bundleZze);
                }
            }, 5000L, null, this.zzc);
        } else {
            str = "BUY_INTENT";
            str2 = "; try to reconnect";
            str3 = str5;
            futureZzH = zzH(new Callable() { // from class: com.android.billingclient.api.zzm
                @Override // java.util.concurrent.Callable
                public final Object call() {
                    return this.zza.zzf(skuDetails, type);
                }
            }, 5000L, null, this.zzc);
        }
        try {
            Bundle bundle = (Bundle) futureZzH.get(5000L, TimeUnit.MILLISECONDS);
            int iZza2 = com.google.android.gms.internal.play_billing.zza.zza(bundle, "BillingClient");
            String strZzh = com.google.android.gms.internal.play_billing.zza.zzh(bundle, "BillingClient");
            if (iZza2 == 0) {
                Intent intent = new Intent(activity, (Class<?>) ProxyBillingActivity.class);
                String str7 = str;
                intent.putExtra(str7, (PendingIntent) bundle.getParcelable(str7));
                activity.startActivity(intent);
                return zzak.zzp;
            }
            StringBuilder sb3 = new StringBuilder(52);
            sb3.append("Unable to buy item, Error response code: ");
            sb3.append(iZza2);
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", sb3.toString());
            BillingResult.Builder builderNewBuilder = BillingResult.newBuilder();
            builderNewBuilder.setResponseCode(iZza2);
            builderNewBuilder.setDebugMessage(strZzh);
            BillingResult billingResultBuild = builderNewBuilder.build();
            zzE(billingResultBuild);
            return billingResultBuild;
        } catch (CancellationException | TimeoutException unused3) {
            String str8 = str3;
            StringBuilder sb4 = new StringBuilder(String.valueOf(str8).length() + 68);
            sb4.append("Time out while launching billing flow: ; for sku: ");
            sb4.append(str8);
            sb4.append(str2);
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", sb4.toString());
            BillingResult billingResult6 = zzak.zzr;
            zzE(billingResult6);
            return billingResult6;
        } catch (Exception unused4) {
            StringBuilder sb5 = new StringBuilder(String.valueOf(str3).length() + 69);
            sb5.append("Exception while launching billing flow: ; for sku: ");
            sb5.append(str3);
            sb5.append(str2);
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", sb5.toString());
            BillingResult billingResult7 = zzak.zzq;
            zzE(billingResult7);
            return billingResult7;
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final void queryPurchaseHistoryAsync(String str, final PurchaseHistoryResponseListener purchaseHistoryResponseListener) {
        if (!isReady()) {
            purchaseHistoryResponseListener.onPurchaseHistoryResponse(zzak.zzq, null);
        } else if (zzH(new zzab(this, str, purchaseHistoryResponseListener), 30000L, new Runnable() { // from class: com.android.billingclient.api.zzt
            @Override // java.lang.Runnable
            public final void run() {
                purchaseHistoryResponseListener.onPurchaseHistoryResponse(zzak.zzr, null);
            }
        }, zzD()) == null) {
            purchaseHistoryResponseListener.onPurchaseHistoryResponse(zzF(), null);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final Purchase.PurchasesResult queryPurchases(String str) {
        if (!isReady()) {
            return new Purchase.PurchasesResult(zzak.zzq, null);
        }
        if (TextUtils.isEmpty(str)) {
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Please provide a valid SKU type.");
            return new Purchase.PurchasesResult(zzak.zzg, null);
        }
        try {
            return (Purchase.PurchasesResult) zzH(new zzz(this, str), 5000L, null, this.zzc).get(5000L, TimeUnit.MILLISECONDS);
        } catch (CancellationException | TimeoutException unused) {
            return new Purchase.PurchasesResult(zzak.zzr, null);
        } catch (Exception unused2) {
            return new Purchase.PurchasesResult(zzak.zzl, null);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public void queryPurchasesAsync(String str, final PurchasesResponseListener purchasesResponseListener) {
        if (!isReady()) {
            purchasesResponseListener.onQueryPurchasesResponse(zzak.zzq, com.google.android.gms.internal.play_billing.zzp.zzg());
            return;
        }
        if (TextUtils.isEmpty(str)) {
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Please provide a valid SKU type.");
            purchasesResponseListener.onQueryPurchasesResponse(zzak.zzg, com.google.android.gms.internal.play_billing.zzp.zzg());
        } else if (zzH(new zzaa(this, str, purchasesResponseListener), 30000L, new Runnable() { // from class: com.android.billingclient.api.zzu
            @Override // java.lang.Runnable
            public final void run() {
                purchasesResponseListener.onQueryPurchasesResponse(zzak.zzr, com.google.android.gms.internal.play_billing.zzp.zzg());
            }
        }, zzD()) == null) {
            purchasesResponseListener.onQueryPurchasesResponse(zzF(), com.google.android.gms.internal.play_billing.zzp.zzg());
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final void querySkuDetailsAsync(SkuDetailsParams skuDetailsParams, final SkuDetailsResponseListener skuDetailsResponseListener) {
        if (!isReady()) {
            skuDetailsResponseListener.onSkuDetailsResponse(zzak.zzq, null);
            return;
        }
        final String skuType = skuDetailsParams.getSkuType();
        List<String> skusList = skuDetailsParams.getSkusList();
        if (TextUtils.isEmpty(skuType)) {
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Please fix the input params. SKU type can't be empty.");
            skuDetailsResponseListener.onSkuDetailsResponse(zzak.zzg, null);
            return;
        }
        if (skusList == null) {
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Please fix the input params. The list of SKUs can't be empty - set SKU list or SkuWithOffer list.");
            skuDetailsResponseListener.onSkuDetailsResponse(zzak.zzf, null);
            return;
        }
        final ArrayList arrayList = new ArrayList();
        for (String str : skusList) {
            zzap zzapVar = new zzap(null);
            zzapVar.zza(str);
            arrayList.add(zzapVar.zzb());
        }
        final String str2 = null;
        if (zzH(new Callable(skuType, arrayList, str2, skuDetailsResponseListener) { // from class: com.android.billingclient.api.zzp
            public final /* synthetic */ String zzb;
            public final /* synthetic */ List zzc;
            public final /* synthetic */ SkuDetailsResponseListener zzd;

            {
                this.zzd = skuDetailsResponseListener;
            }

            @Override // java.util.concurrent.Callable
            public final Object call() throws Exception {
                this.zza.zzq(this.zzb, this.zzc, null, this.zzd);
                return null;
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzv
            @Override // java.lang.Runnable
            public final void run() {
                skuDetailsResponseListener.onSkuDetailsResponse(zzak.zzr, null);
            }
        }, zzD()) == null) {
            skuDetailsResponseListener.onSkuDetailsResponse(zzF(), null);
        }
    }

    public final /* synthetic */ Bundle zze(int i, SkuDetails skuDetails, String str, BillingFlowParams billingFlowParams, Bundle bundle) throws Exception {
        return this.zzg.zzg(i, this.zzf.getPackageName(), skuDetails.getSku(), str, null, bundle);
    }

    public final /* synthetic */ Bundle zzf(SkuDetails skuDetails, String str) throws Exception {
        return this.zzg.zzf(3, this.zzf.getPackageName(), skuDetails.getSku(), str, null);
    }

    public final /* synthetic */ Bundle zzg(String str, Bundle bundle) throws Exception {
        return this.zzg.zzm(8, this.zzf.getPackageName(), str, BillingClient.SkuType.SUBS, bundle);
    }

    public final /* synthetic */ Integer zzn(String str) throws Exception {
        com.google.android.gms.internal.play_billing.zzd zzdVar = this.zzg;
        String packageName = this.zzf.getPackageName();
        Bundle bundle = new Bundle();
        bundle.putBoolean(BillingFlowParams.EXTRA_PARAM_KEY_VR, true);
        return Integer.valueOf(zzdVar.zzc(7, packageName, str, bundle));
    }

    public final /* synthetic */ Object zzo(AcknowledgePurchaseParams acknowledgePurchaseParams, AcknowledgePurchaseResponseListener acknowledgePurchaseResponseListener) throws Exception {
        try {
            Bundle bundleZzd = this.zzg.zzd(9, this.zzf.getPackageName(), acknowledgePurchaseParams.getPurchaseToken(), com.google.android.gms.internal.play_billing.zza.zzb(acknowledgePurchaseParams, this.zzb));
            int iZza = com.google.android.gms.internal.play_billing.zza.zza(bundleZzd, "BillingClient");
            String strZzh = com.google.android.gms.internal.play_billing.zza.zzh(bundleZzd, "BillingClient");
            BillingResult.Builder builderNewBuilder = BillingResult.newBuilder();
            builderNewBuilder.setResponseCode(iZza);
            builderNewBuilder.setDebugMessage(strZzh);
            acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse(builderNewBuilder.build());
            return null;
        } catch (Exception e) {
            String strValueOf = String.valueOf(e);
            StringBuilder sb = new StringBuilder(String.valueOf(strValueOf).length() + 32);
            sb.append("Error acknowledge purchase; ex: ");
            sb.append(strValueOf);
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", sb.toString());
            acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse(zzak.zzq);
            return null;
        }
    }

    public final /* synthetic */ Object zzp(ConsumeParams consumeParams, ConsumeResponseListener consumeResponseListener) throws Exception {
        int iZza;
        String strZzh;
        String purchaseToken = consumeParams.getPurchaseToken();
        try {
            String strValueOf = String.valueOf(purchaseToken);
            com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", strValueOf.length() != 0 ? "Consuming purchase with token: ".concat(strValueOf) : new String("Consuming purchase with token: "));
            if (this.zzn) {
                Bundle bundleZze = this.zzg.zze(9, this.zzf.getPackageName(), purchaseToken, com.google.android.gms.internal.play_billing.zza.zzc(consumeParams, this.zzn, this.zzb));
                iZza = bundleZze.getInt("RESPONSE_CODE");
                strZzh = com.google.android.gms.internal.play_billing.zza.zzh(bundleZze, "BillingClient");
            } else {
                iZza = this.zzg.zza(3, this.zzf.getPackageName(), purchaseToken);
                strZzh = "";
            }
            BillingResult.Builder builderNewBuilder = BillingResult.newBuilder();
            builderNewBuilder.setResponseCode(iZza);
            builderNewBuilder.setDebugMessage(strZzh);
            BillingResult billingResultBuild = builderNewBuilder.build();
            if (iZza == 0) {
                com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", "Successfully consumed purchase.");
                consumeResponseListener.onConsumeResponse(billingResultBuild, purchaseToken);
                return null;
            }
            StringBuilder sb = new StringBuilder(63);
            sb.append("Error consuming purchase with token. Response code: ");
            sb.append(iZza);
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", sb.toString());
            consumeResponseListener.onConsumeResponse(billingResultBuild, purchaseToken);
            return null;
        } catch (Exception e) {
            String strValueOf2 = String.valueOf(e);
            StringBuilder sb2 = new StringBuilder(String.valueOf(strValueOf2).length() + 30);
            sb2.append("Error consuming purchase; ex: ");
            sb2.append(strValueOf2);
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", sb2.toString());
            consumeResponseListener.onConsumeResponse(zzak.zzq, purchaseToken);
            return null;
        }
    }

    public final /* synthetic */ Object zzq(String str, List list, String str2, SkuDetailsResponseListener skuDetailsResponseListener) throws Exception {
        String strZzh;
        int i;
        ArrayList arrayList = new ArrayList();
        int size = list.size();
        int i2 = 0;
        while (true) {
            strZzh = "Item is unavailable for purchase.";
            if (i2 >= size) {
                strZzh = "";
                i = 0;
                break;
            }
            int i3 = i2 + 20;
            ArrayList arrayList2 = new ArrayList(list.subList(i2, i3 > size ? size : i3));
            ArrayList<String> arrayList3 = new ArrayList<>();
            int size2 = arrayList2.size();
            for (int i4 = 0; i4 < size2; i4++) {
                arrayList3.add(((zzaq) arrayList2.get(i4)).zza());
            }
            Bundle bundle = new Bundle();
            bundle.putStringArrayList("ITEM_ID_LIST", arrayList3);
            bundle.putString("playBillingLibraryVersion", this.zzb);
            try {
                Bundle bundleZzl = this.zzo ? this.zzg.zzl(10, this.zzf.getPackageName(), str, bundle, com.google.android.gms.internal.play_billing.zza.zzd(this.zzk, this.zzt, this.zzb, null, arrayList2)) : this.zzg.zzk(3, this.zzf.getPackageName(), str, bundle);
                if (bundleZzl == null) {
                    com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "querySkuDetailsAsync got null sku details list");
                    break;
                }
                if (bundleZzl.containsKey("DETAILS_LIST")) {
                    ArrayList<String> stringArrayList = bundleZzl.getStringArrayList("DETAILS_LIST");
                    if (stringArrayList == null) {
                        com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "querySkuDetailsAsync got null response list");
                        break;
                    }
                    for (int i5 = 0; i5 < stringArrayList.size(); i5++) {
                        try {
                            SkuDetails skuDetails = new SkuDetails(stringArrayList.get(i5));
                            String strValueOf = String.valueOf(skuDetails);
                            StringBuilder sb = new StringBuilder(String.valueOf(strValueOf).length() + 17);
                            sb.append("Got sku details: ");
                            sb.append(strValueOf);
                            com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", sb.toString());
                            arrayList.add(skuDetails);
                        } catch (JSONException unused) {
                            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Got a JSON exception trying to decode SkuDetails.");
                            strZzh = "Error trying to decode SkuDetails.";
                            arrayList = null;
                            i = 6;
                            BillingResult.Builder builderNewBuilder = BillingResult.newBuilder();
                            builderNewBuilder.setResponseCode(i);
                            builderNewBuilder.setDebugMessage(strZzh);
                            skuDetailsResponseListener.onSkuDetailsResponse(builderNewBuilder.build(), arrayList);
                            return null;
                        }
                    }
                    i2 = i3;
                } else {
                    int iZza = com.google.android.gms.internal.play_billing.zza.zza(bundleZzl, "BillingClient");
                    strZzh = com.google.android.gms.internal.play_billing.zza.zzh(bundleZzl, "BillingClient");
                    if (iZza != 0) {
                        StringBuilder sb2 = new StringBuilder(50);
                        sb2.append("getSkuDetails() failed. Response code: ");
                        sb2.append(iZza);
                        com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", sb2.toString());
                        i = iZza;
                    } else {
                        com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "getSkuDetails() returned a bundle with neither an error nor a detail list.");
                    }
                }
            } catch (Exception e) {
                String strValueOf2 = String.valueOf(e);
                StringBuilder sb3 = new StringBuilder(String.valueOf(strValueOf2).length() + 63);
                sb3.append("querySkuDetailsAsync got a remote exception (try to reconnect).");
                sb3.append(strValueOf2);
                com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", sb3.toString());
                i = -1;
                strZzh = "Service connection is disconnected.";
                arrayList = null;
            }
        }
        arrayList = null;
        i = 4;
        BillingResult.Builder builderNewBuilder2 = BillingResult.newBuilder();
        builderNewBuilder2.setResponseCode(i);
        builderNewBuilder2.setDebugMessage(strZzh);
        skuDetailsResponseListener.onSkuDetailsResponse(builderNewBuilder2.build(), arrayList);
        return null;
    }

    public final /* synthetic */ void zzs(BillingResult billingResult) {
        this.zzd.zzb().onPurchasesUpdated(billingResult, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final BillingResult zzF() {
        return (this.zza == 0 || this.zza == 3) ? zzak.zzq : zzak.zzl;
    }

    @Override // com.android.billingclient.api.BillingClient
    public final void launchPriceChangeConfirmationFlow(Activity activity, PriceChangeFlowParams priceChangeFlowParams, PriceChangeConfirmationListener priceChangeConfirmationListener) {
        if (!isReady()) {
            zzI(zzak.zzq, priceChangeConfirmationListener);
            return;
        }
        if (priceChangeFlowParams == null || priceChangeFlowParams.getSkuDetails() == null) {
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Please fix the input params. priceChangeFlowParams must contain valid sku.");
            zzI(zzak.zzn, priceChangeConfirmationListener);
            return;
        }
        final String sku = priceChangeFlowParams.getSkuDetails().getSku();
        if (sku == null) {
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Please fix the input params. priceChangeFlowParams must contain valid sku.");
            zzI(zzak.zzn, priceChangeConfirmationListener);
            return;
        }
        if (!this.zzm) {
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Current client doesn't support price change confirmation flow.");
            zzI(zzak.zzi, priceChangeConfirmationListener);
            return;
        }
        final Bundle bundle = new Bundle();
        bundle.putString("playBillingLibraryVersion", this.zzb);
        bundle.putBoolean("subs_price_change", true);
        try {
            Bundle bundle2 = (Bundle) zzH(new Callable() { // from class: com.android.billingclient.api.zzo
                @Override // java.util.concurrent.Callable
                public final Object call() {
                    return this.zza.zzg(sku, bundle);
                }
            }, 5000L, null, this.zzc).get(5000L, TimeUnit.MILLISECONDS);
            int iZza = com.google.android.gms.internal.play_billing.zza.zza(bundle2, "BillingClient");
            String strZzh = com.google.android.gms.internal.play_billing.zza.zzh(bundle2, "BillingClient");
            BillingResult.Builder builderNewBuilder = BillingResult.newBuilder();
            builderNewBuilder.setResponseCode(iZza);
            builderNewBuilder.setDebugMessage(strZzh);
            BillingResult billingResultBuild = builderNewBuilder.build();
            if (iZza != 0) {
                StringBuilder sb = new StringBuilder(68);
                sb.append("Unable to launch price change flow, error response code: ");
                sb.append(iZza);
                com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", sb.toString());
                zzI(billingResultBuild, priceChangeConfirmationListener);
                return;
            }
            zzy zzyVar = new zzy(this, this.zzc, priceChangeConfirmationListener);
            Intent intent = new Intent(activity, (Class<?>) ProxyBillingActivity.class);
            intent.putExtra("SUBS_MANAGEMENT_INTENT", (PendingIntent) bundle2.getParcelable("SUBS_MANAGEMENT_INTENT"));
            intent.putExtra("result_receiver", zzyVar);
            activity.startActivity(intent);
        } catch (CancellationException | TimeoutException unused) {
            StringBuilder sb2 = new StringBuilder(sku.length() + 70);
            sb2.append("Time out while launching Price Change Flow for sku: ");
            sb2.append(sku);
            sb2.append("; try to reconnect");
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", sb2.toString());
            zzI(zzak.zzr, priceChangeConfirmationListener);
        } catch (Exception unused2) {
            StringBuilder sb3 = new StringBuilder(sku.length() + 78);
            sb3.append("Exception caught while launching Price Change Flow for sku: ");
            sb3.append(sku);
            sb3.append("; try to reconnect");
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", sb3.toString());
            zzI(zzak.zzq, priceChangeConfirmationListener);
        }
    }

    private BillingClientImpl(Context context, boolean z, PurchasesUpdatedListener purchasesUpdatedListener, String str, String str2) {
        this.zza = 0;
        this.zzc = new Handler(Looper.getMainLooper());
        this.zzk = 0;
        this.zzb = str;
        initialize(context, purchasesUpdatedListener, z);
    }

    private BillingClientImpl(String str) {
        this.zza = 0;
        this.zzc = new Handler(Looper.getMainLooper());
        this.zzk = 0;
        this.zzb = str;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    BillingClientImpl(String str, boolean z, Context context, PurchasesUpdatedListener purchasesUpdatedListener) {
        String str2;
        try {
            str2 = (String) Class.forName("com.android.billingclient.ktx.BuildConfig").getField("VERSION_NAME").get(null);
        } catch (Exception unused) {
            str2 = BuildConfig.VERSION_NAME;
        }
        this(context, z, purchasesUpdatedListener, str2, null);
    }

    @Override // com.android.billingclient.api.BillingClient
    public final void startConnection(BillingClientStateListener billingClientStateListener) {
        if (isReady()) {
            com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", "Service connection is valid. No need to re-initialize.");
            billingClientStateListener.onBillingSetupFinished(zzak.zzp);
            return;
        }
        if (this.zza == 1) {
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Client is already in the process of connecting to billing service.");
            billingClientStateListener.onBillingSetupFinished(zzak.zzd);
            return;
        }
        if (this.zza == 3) {
            com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Client was already closed and can't be reused. Please create another instance.");
            billingClientStateListener.onBillingSetupFinished(zzak.zzq);
            return;
        }
        this.zza = 1;
        this.zzd.zzd();
        com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", "Starting in-app billing setup.");
        this.zzh = new zzaf(this, billingClientStateListener, null);
        Intent intent = new Intent("com.android.vending.billing.InAppBillingService.BIND");
        intent.setPackage("com.android.vending");
        List<ResolveInfo> listQueryIntentServices = this.zzf.getPackageManager().queryIntentServices(intent, 0);
        if (listQueryIntentServices != null && !listQueryIntentServices.isEmpty()) {
            ResolveInfo resolveInfo = listQueryIntentServices.get(0);
            if (resolveInfo.serviceInfo != null) {
                String str = resolveInfo.serviceInfo.packageName;
                String str2 = resolveInfo.serviceInfo.name;
                if (!"com.android.vending".equals(str) || str2 == null) {
                    com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "The device doesn't have valid Play Store.");
                } else {
                    ComponentName componentName = new ComponentName(str, str2);
                    Intent intent2 = new Intent(intent);
                    intent2.setComponent(componentName);
                    intent2.putExtra("playBillingLibraryVersion", this.zzb);
                    if (this.zzf.bindService(intent2, this.zzh, 1)) {
                        com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", "Service was bonded successfully.");
                        return;
                    }
                    com.google.android.gms.internal.play_billing.zza.zzk("BillingClient", "Connection to Billing service is blocked.");
                }
            }
        }
        this.zza = 0;
        com.google.android.gms.internal.play_billing.zza.zzj("BillingClient", "Billing service unavailable on device.");
        billingClientStateListener.onBillingSetupFinished(zzak.zzc);
    }
}
