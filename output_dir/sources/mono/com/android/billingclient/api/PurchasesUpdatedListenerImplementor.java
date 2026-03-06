package mono.com.android.billingclient.api;

import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.PurchasesUpdatedListener;
import java.util.ArrayList;
import java.util.List;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class PurchasesUpdatedListenerImplementor implements IGCUserPeer, PurchasesUpdatedListener {
    public static final String __md_methods = "n_onPurchasesUpdated:(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V:GetOnPurchasesUpdated_Lcom_android_billingclient_api_BillingResult_Ljava_util_List_Handler:Android.BillingClient.Api.IPurchasesUpdatedListenerInvoker, Xamarin.Android.Google.BillingClient\n";
    private ArrayList refList;

    private native void n_onPurchasesUpdated(BillingResult billingResult, List list);

    static {
        Runtime.register("Android.BillingClient.Api.IPurchasesUpdatedListenerImplementor, Xamarin.Android.Google.BillingClient", PurchasesUpdatedListenerImplementor.class, "n_onPurchasesUpdated:(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V:GetOnPurchasesUpdated_Lcom_android_billingclient_api_BillingResult_Ljava_util_List_Handler:Android.BillingClient.Api.IPurchasesUpdatedListenerInvoker, Xamarin.Android.Google.BillingClient\n");
    }

    public PurchasesUpdatedListenerImplementor() {
        if (getClass() == PurchasesUpdatedListenerImplementor.class) {
            TypeManager.Activate("Android.BillingClient.Api.IPurchasesUpdatedListenerImplementor, Xamarin.Android.Google.BillingClient", "", this, new Object[0]);
        }
    }

    @Override // com.android.billingclient.api.PurchasesUpdatedListener
    public void onPurchasesUpdated(BillingResult billingResult, List list) {
        n_onPurchasesUpdated(billingResult, list);
    }

    @Override // mono.android.IGCUserPeer
    public void monodroidAddReference(Object obj) {
        if (this.refList == null) {
            this.refList = new ArrayList();
        }
        this.refList.add(obj);
    }

    @Override // mono.android.IGCUserPeer
    public void monodroidClearReferences() {
        ArrayList arrayList = this.refList;
        if (arrayList != null) {
            arrayList.clear();
        }
    }
}
