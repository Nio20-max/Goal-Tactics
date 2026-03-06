package mono.com.android.billingclient.api;

import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.PurchasesResponseListener;
import java.util.ArrayList;
import java.util.List;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class PurchasesResponseListenerImplementor implements IGCUserPeer, PurchasesResponseListener {
    public static final String __md_methods = "n_onQueryPurchasesResponse:(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V:GetOnQueryPurchasesResponse_Lcom_android_billingclient_api_BillingResult_Ljava_util_List_Handler:Android.BillingClient.Api.IPurchasesResponseListenerInvoker, Xamarin.Android.Google.BillingClient\n";
    private ArrayList refList;

    private native void n_onQueryPurchasesResponse(BillingResult billingResult, List list);

    static {
        Runtime.register("Android.BillingClient.Api.IPurchasesResponseListenerImplementor, Xamarin.Android.Google.BillingClient", PurchasesResponseListenerImplementor.class, __md_methods);
    }

    public PurchasesResponseListenerImplementor() {
        if (getClass() == PurchasesResponseListenerImplementor.class) {
            TypeManager.Activate("Android.BillingClient.Api.IPurchasesResponseListenerImplementor, Xamarin.Android.Google.BillingClient", "", this, new Object[0]);
        }
    }

    @Override // com.android.billingclient.api.PurchasesResponseListener
    public void onQueryPurchasesResponse(BillingResult billingResult, List list) {
        n_onQueryPurchasesResponse(billingResult, list);
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
