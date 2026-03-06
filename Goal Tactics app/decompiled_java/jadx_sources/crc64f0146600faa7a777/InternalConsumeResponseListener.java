package crc64f0146600faa7a777;

import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.ConsumeResponseListener;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class InternalConsumeResponseListener implements IGCUserPeer, ConsumeResponseListener {
    public static final String __md_methods = "n_onConsumeResponse:(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V:GetOnConsumeResponse_Lcom_android_billingclient_api_BillingResult_Ljava_lang_String_Handler:Android.BillingClient.Api.IConsumeResponseListenerInvoker, Xamarin.Android.Google.BillingClient\n";
    private ArrayList refList;

    private native void n_onConsumeResponse(BillingResult billingResult, String str);

    static {
        Runtime.register("Android.BillingClient.Api.InternalConsumeResponseListener, Xamarin.Android.Google.BillingClient", InternalConsumeResponseListener.class, "n_onConsumeResponse:(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V:GetOnConsumeResponse_Lcom_android_billingclient_api_BillingResult_Ljava_lang_String_Handler:Android.BillingClient.Api.IConsumeResponseListenerInvoker, Xamarin.Android.Google.BillingClient\n");
    }

    public InternalConsumeResponseListener() {
        if (getClass() == InternalConsumeResponseListener.class) {
            TypeManager.Activate("Android.BillingClient.Api.InternalConsumeResponseListener, Xamarin.Android.Google.BillingClient", "", this, new Object[0]);
        }
    }

    @Override // com.android.billingclient.api.ConsumeResponseListener
    public void onConsumeResponse(BillingResult billingResult, String str) {
        n_onConsumeResponse(billingResult, str);
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
