package mono.com.appsflyer;

import com.appsflyer.CreateOneLinkHttpTask;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class CreateOneLinkHttpTask_ResponseListenerImplementor implements IGCUserPeer, CreateOneLinkHttpTask.ResponseListener {
    public static final String __md_methods = "n_onResponse:(Ljava/lang/String;)V:GetOnResponse_Ljava_lang_String_Handler:Com.Appsflyer.CreateOneLinkHttpTask/IResponseListenerInvoker, AppsFlyerXamarinBindingAndroid\nn_onResponseError:(Ljava/lang/String;)V:GetOnResponseError_Ljava_lang_String_Handler:Com.Appsflyer.CreateOneLinkHttpTask/IResponseListenerInvoker, AppsFlyerXamarinBindingAndroid\n";
    private ArrayList refList;

    private native void n_onResponse(String str);

    private native void n_onResponseError(String str);

    static {
        Runtime.register("Com.Appsflyer.CreateOneLinkHttpTask+IResponseListenerImplementor, AppsFlyerXamarinBindingAndroid", CreateOneLinkHttpTask_ResponseListenerImplementor.class, __md_methods);
    }

    public CreateOneLinkHttpTask_ResponseListenerImplementor() {
        if (getClass() == CreateOneLinkHttpTask_ResponseListenerImplementor.class) {
            TypeManager.Activate("Com.Appsflyer.CreateOneLinkHttpTask+IResponseListenerImplementor, AppsFlyerXamarinBindingAndroid", "", this, new Object[0]);
        }
    }

    @Override // com.appsflyer.CreateOneLinkHttpTask.ResponseListener
    public void onResponse(String str) {
        n_onResponse(str);
    }

    @Override // com.appsflyer.CreateOneLinkHttpTask.ResponseListener
    public void onResponseError(String str) {
        n_onResponseError(str);
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
