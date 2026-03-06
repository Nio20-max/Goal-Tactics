package mono.com.android.billingclient.api;

import com.android.billingclient.api.AcknowledgePurchaseResponseListener;
import com.android.billingclient.api.BillingResult;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class AcknowledgePurchaseResponseListenerImplementor implements IGCUserPeer, AcknowledgePurchaseResponseListener {
    public static final String __md_methods = "n_onAcknowledgePurchaseResponse:(Lcom/android/billingclient/api/BillingResult;)V:GetOnAcknowledgePurchaseResponse_Lcom_android_billingclient_api_BillingResult_Handler:Android.BillingClient.Api.IAcknowledgePurchaseResponseListenerInvoker, Xamarin.Android.Google.BillingClient\n";
    private ArrayList refList;

    private native void n_onAcknowledgePurchaseResponse(BillingResult billingResult);

    static {
        Runtime.register("Android.BillingClient.Api.IAcknowledgePurchaseResponseListenerImplementor, Xamarin.Android.Google.BillingClient", AcknowledgePurchaseResponseListenerImplementor.class, "n_onAcknowledgePurchaseResponse:(Lcom/android/billingclient/api/BillingResult;)V:GetOnAcknowledgePurchaseResponse_Lcom_android_billingclient_api_BillingResult_Handler:Android.BillingClient.Api.IAcknowledgePurchaseResponseListenerInvoker, Xamarin.Android.Google.BillingClient\n");
    }

    public AcknowledgePurchaseResponseListenerImplementor() {
        if (getClass() == AcknowledgePurchaseResponseListenerImplementor.class) {
            TypeManager.Activate("Android.BillingClient.Api.IAcknowledgePurchaseResponseListenerImplementor, Xamarin.Android.Google.BillingClient", "", this, new Object[0]);
        }
    }

    @Override // com.android.billingclient.api.AcknowledgePurchaseResponseListener
    public void onAcknowledgePurchaseResponse(BillingResult billingResult) {
        n_onAcknowledgePurchaseResponse(billingResult);
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
