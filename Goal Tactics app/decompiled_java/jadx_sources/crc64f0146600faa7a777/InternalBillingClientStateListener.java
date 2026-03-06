package crc64f0146600faa7a777;

import com.android.billingclient.api.BillingClientStateListener;
import com.android.billingclient.api.BillingResult;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class InternalBillingClientStateListener implements IGCUserPeer, BillingClientStateListener {
    public static final String __md_methods = "n_onBillingServiceDisconnected:()V:GetOnBillingServiceDisconnectedHandler:Android.BillingClient.Api.IBillingClientStateListenerInvoker, Xamarin.Android.Google.BillingClient\nn_onBillingSetupFinished:(Lcom/android/billingclient/api/BillingResult;)V:GetOnBillingSetupFinished_Lcom_android_billingclient_api_BillingResult_Handler:Android.BillingClient.Api.IBillingClientStateListenerInvoker, Xamarin.Android.Google.BillingClient\n";
    private ArrayList refList;

    private native void n_onBillingServiceDisconnected();

    private native void n_onBillingSetupFinished(BillingResult billingResult);

    static {
        Runtime.register("Android.BillingClient.Api.InternalBillingClientStateListener, Xamarin.Android.Google.BillingClient", InternalBillingClientStateListener.class, "n_onBillingServiceDisconnected:()V:GetOnBillingServiceDisconnectedHandler:Android.BillingClient.Api.IBillingClientStateListenerInvoker, Xamarin.Android.Google.BillingClient\nn_onBillingSetupFinished:(Lcom/android/billingclient/api/BillingResult;)V:GetOnBillingSetupFinished_Lcom_android_billingclient_api_BillingResult_Handler:Android.BillingClient.Api.IBillingClientStateListenerInvoker, Xamarin.Android.Google.BillingClient\n");
    }

    public InternalBillingClientStateListener() {
        if (getClass() == InternalBillingClientStateListener.class) {
            TypeManager.Activate("Android.BillingClient.Api.InternalBillingClientStateListener, Xamarin.Android.Google.BillingClient", "", this, new Object[0]);
        }
    }

    @Override // com.android.billingclient.api.BillingClientStateListener
    public void onBillingServiceDisconnected() {
        n_onBillingServiceDisconnected();
    }

    @Override // com.android.billingclient.api.BillingClientStateListener
    public void onBillingSetupFinished(BillingResult billingResult) {
        n_onBillingSetupFinished(billingResult);
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
