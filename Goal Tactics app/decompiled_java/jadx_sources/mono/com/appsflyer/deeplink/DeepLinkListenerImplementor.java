package mono.com.appsflyer.deeplink;

import com.appsflyer.deeplink.DeepLinkListener;
import com.appsflyer.deeplink.DeepLinkResult;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class DeepLinkListenerImplementor implements IGCUserPeer, DeepLinkListener {
    public static final String __md_methods = "n_onDeepLinking:(Lcom/appsflyer/deeplink/DeepLinkResult;)V:GetOnDeepLinking_Lcom_appsflyer_deeplink_DeepLinkResult_Handler:Com.Appsflyer.Deeplink.IDeepLinkListenerInvoker, AppsFlyerXamarinBindingAndroid\n";
    private ArrayList refList;

    private native void n_onDeepLinking(DeepLinkResult deepLinkResult);

    static {
        Runtime.register("Com.Appsflyer.Deeplink.IDeepLinkListenerImplementor, AppsFlyerXamarinBindingAndroid", DeepLinkListenerImplementor.class, __md_methods);
    }

    public DeepLinkListenerImplementor() {
        if (getClass() == DeepLinkListenerImplementor.class) {
            TypeManager.Activate("Com.Appsflyer.Deeplink.IDeepLinkListenerImplementor, AppsFlyerXamarinBindingAndroid", "", this, new Object[0]);
        }
    }

    @Override // com.appsflyer.deeplink.DeepLinkListener
    public void onDeepLinking(DeepLinkResult deepLinkResult) {
        n_onDeepLinking(deepLinkResult);
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
