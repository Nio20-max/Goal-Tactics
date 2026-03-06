package mono.com.appsflyer.attribution;

import com.appsflyer.attribution.AppsFlyerRequestListener;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class AppsFlyerRequestListenerImplementor implements IGCUserPeer, AppsFlyerRequestListener {
    public static final String __md_methods = "n_onError:(ILjava/lang/String;)V:GetOnError_ILjava_lang_String_Handler:Com.Appsflyer.Attribution.IAppsFlyerRequestListenerInvoker, AppsFlyerXamarinBindingAndroid\nn_onSuccess:()V:GetOnSuccessHandler:Com.Appsflyer.Attribution.IAppsFlyerRequestListenerInvoker, AppsFlyerXamarinBindingAndroid\n";
    private ArrayList refList;

    private native void n_onError(int i, String str);

    private native void n_onSuccess();

    static {
        Runtime.register("Com.Appsflyer.Attribution.IAppsFlyerRequestListenerImplementor, AppsFlyerXamarinBindingAndroid", AppsFlyerRequestListenerImplementor.class, __md_methods);
    }

    public AppsFlyerRequestListenerImplementor() {
        if (getClass() == AppsFlyerRequestListenerImplementor.class) {
            TypeManager.Activate("Com.Appsflyer.Attribution.IAppsFlyerRequestListenerImplementor, AppsFlyerXamarinBindingAndroid", "", this, new Object[0]);
        }
    }

    @Override // com.appsflyer.attribution.AppsFlyerRequestListener
    public void onError(int i, String str) {
        n_onError(i, str);
    }

    @Override // com.appsflyer.attribution.AppsFlyerRequestListener
    public void onSuccess() {
        n_onSuccess();
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
