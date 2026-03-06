package mono.com.android.billingclient.api;

import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.PriceChangeConfirmationListener;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class PriceChangeConfirmationListenerImplementor implements IGCUserPeer, PriceChangeConfirmationListener {
    public static final String __md_methods = "n_onPriceChangeConfirmationResult:(Lcom/android/billingclient/api/BillingResult;)V:GetOnPriceChangeConfirmationResult_Lcom_android_billingclient_api_BillingResult_Handler:Android.BillingClient.Api.IPriceChangeConfirmationListenerInvoker, Xamarin.Android.Google.BillingClient\n";
    private ArrayList refList;

    private native void n_onPriceChangeConfirmationResult(BillingResult billingResult);

    static {
        Runtime.register("Android.BillingClient.Api.IPriceChangeConfirmationListenerImplementor, Xamarin.Android.Google.BillingClient", PriceChangeConfirmationListenerImplementor.class, "n_onPriceChangeConfirmationResult:(Lcom/android/billingclient/api/BillingResult;)V:GetOnPriceChangeConfirmationResult_Lcom_android_billingclient_api_BillingResult_Handler:Android.BillingClient.Api.IPriceChangeConfirmationListenerInvoker, Xamarin.Android.Google.BillingClient\n");
    }

    public PriceChangeConfirmationListenerImplementor() {
        if (getClass() == PriceChangeConfirmationListenerImplementor.class) {
            TypeManager.Activate("Android.BillingClient.Api.IPriceChangeConfirmationListenerImplementor, Xamarin.Android.Google.BillingClient", "", this, new Object[0]);
        }
    }

    @Override // com.android.billingclient.api.PriceChangeConfirmationListener
    public void onPriceChangeConfirmationResult(BillingResult billingResult) {
        n_onPriceChangeConfirmationResult(billingResult);
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
