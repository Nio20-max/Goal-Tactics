package mono.com.appsflyer;

import com.appsflyer.AppsFlyerConversionListener;
import java.util.ArrayList;
import java.util.Map;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class AppsFlyerConversionListenerImplementor implements IGCUserPeer, AppsFlyerConversionListener {
    public static final String __md_methods = "n_onAppOpenAttribution:(Ljava/util/Map;)V:GetOnAppOpenAttribution_Ljava_util_Map_Handler:Com.Appsflyer.IAppsFlyerConversionListenerInvoker, AppsFlyerXamarinBindingAndroid\nn_onAttributionFailure:(Ljava/lang/String;)V:GetOnAttributionFailure_Ljava_lang_String_Handler:Com.Appsflyer.IAppsFlyerConversionListenerInvoker, AppsFlyerXamarinBindingAndroid\nn_onConversionDataFail:(Ljava/lang/String;)V:GetOnConversionDataFail_Ljava_lang_String_Handler:Com.Appsflyer.IAppsFlyerConversionListenerInvoker, AppsFlyerXamarinBindingAndroid\nn_onConversionDataSuccess:(Ljava/util/Map;)V:GetOnConversionDataSuccess_Ljava_util_Map_Handler:Com.Appsflyer.IAppsFlyerConversionListenerInvoker, AppsFlyerXamarinBindingAndroid\n";
    private ArrayList refList;

    private native void n_onAppOpenAttribution(Map map);

    private native void n_onAttributionFailure(String str);

    private native void n_onConversionDataFail(String str);

    private native void n_onConversionDataSuccess(Map map);

    static {
        Runtime.register("Com.Appsflyer.IAppsFlyerConversionListenerImplementor, AppsFlyerXamarinBindingAndroid", AppsFlyerConversionListenerImplementor.class, __md_methods);
    }

    public AppsFlyerConversionListenerImplementor() {
        if (getClass() == AppsFlyerConversionListenerImplementor.class) {
            TypeManager.Activate("Com.Appsflyer.IAppsFlyerConversionListenerImplementor, AppsFlyerXamarinBindingAndroid", "", this, new Object[0]);
        }
    }

    @Override // com.appsflyer.AppsFlyerConversionListener
    public void onAppOpenAttribution(Map map) {
        n_onAppOpenAttribution(map);
    }

    @Override // com.appsflyer.AppsFlyerConversionListener
    public void onAttributionFailure(String str) {
        n_onAttributionFailure(str);
    }

    @Override // com.appsflyer.AppsFlyerConversionListener
    public void onConversionDataFail(String str) {
        n_onConversionDataFail(str);
    }

    @Override // com.appsflyer.AppsFlyerConversionListener
    public void onConversionDataSuccess(Map map) {
        n_onConversionDataSuccess(map);
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
