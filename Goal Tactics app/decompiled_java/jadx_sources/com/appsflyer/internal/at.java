package com.appsflyer.internal;

import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.Purchase;
import com.android.billingclient.api.PurchasesUpdatedListener;
import com.android.billingclient.api.SkuDetails;
import com.android.billingclient.api.SkuDetailsParams;
import com.android.billingclient.api.SkuDetailsResponseListener;
import com.appsflyer.AFLogger;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
final class at implements PurchasesUpdatedListener {
    private /* synthetic */ av values;

    at(av avVar) {
        this.values = avVar;
    }

    @Override // com.android.billingclient.api.PurchasesUpdatedListener
    public final void onPurchasesUpdated(BillingResult billingResult, final List<Purchase> list) {
        final av avVar = this.values;
        try {
            if (billingResult.getResponseCode() == 0 && list != null) {
                if (avVar.values == null) {
                    AFLogger.AppsFlyer2dXConversionCallback("Got Ars billing callback but billing client is missing!");
                    return;
                }
                ArrayList arrayList = new ArrayList();
                Iterator<Purchase> it = list.iterator();
                while (it.hasNext()) {
                    arrayList.add(it.next().getSku());
                }
                avVar.values.querySkuDetailsAsync(SkuDetailsParams.newBuilder().setType(BillingClient.SkuType.SUBS).setSkusList(arrayList).build(), new SkuDetailsResponseListener() { // from class: com.appsflyer.internal.av.5
                    private /* synthetic */ List AFInAppEventParameterName;

                    AnonymousClass5(final List list2) {
                        list = list2;
                    }

                    @Override // com.android.billingclient.api.SkuDetailsResponseListener
                    public final void onSkuDetailsResponse(BillingResult billingResult2, List<SkuDetails> list2) {
                        try {
                            if (billingResult2.getResponseCode() == 0 && list2 != null) {
                                ArrayList arrayList2 = new ArrayList();
                                Iterator<SkuDetails> it2 = list2.iterator();
                                while (it2.hasNext()) {
                                    arrayList2.add(it2.next().getSku());
                                }
                                ArrayList arrayList3 = new ArrayList();
                                for (Purchase purchase : list) {
                                    if (arrayList2.contains(purchase.getSku())) {
                                        arrayList3.add(purchase);
                                    }
                                }
                                if (arrayList3.isEmpty()) {
                                    return;
                                }
                                av.AFInAppEventType(av.this, false, arrayList3);
                            }
                        } catch (Throwable th) {
                            if ((th instanceof NoSuchMethodError) || (th instanceof NoClassDefFoundError)) {
                                AFLogger.AppsFlyer2dXConversionCallback("It seems your app uses different Play Billing library version than the SDK. Please use v.3.0.3");
                            }
                            AFLogger.AFInAppEventParameterName("Failed to log new purchase", th);
                        }
                    }
                });
                return;
            }
            StringBuilder sb = new StringBuilder("Failed to setup Ars Play billing service: ");
            sb.append(billingResult.getResponseCode());
            sb.append(" ");
            sb.append(billingResult.getDebugMessage());
            AFLogger.AppsFlyer2dXConversionCallback(sb.toString());
        } catch (Throwable th) {
            if ((th instanceof NoSuchMethodError) || (th instanceof NoClassDefFoundError)) {
                AFLogger.AppsFlyer2dXConversionCallback("It seems your app uses different Play Billing library version than the SDK. Please use v.3.0.3");
            }
            AFLogger.AFInAppEventParameterName("Failed to query new purchase details", th);
        }
    }
}
