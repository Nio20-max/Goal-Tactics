package mono.com.appsflyer;

import com.appsflyer.AppsFlyerInAppPurchaseValidatorListener;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class AppsFlyerInAppPurchaseValidatorListenerImplementor implements IGCUserPeer, AppsFlyerInAppPurchaseValidatorListener {
    public static final String __md_methods = "n_onValidateInApp:()V:GetOnValidateInAppHandler:Com.Appsflyer.IAppsFlyerInAppPurchaseValidatorListenerInvoker, AppsFlyerXamarinBindingAndroid\nn_onValidateInAppFailure:(Ljava/lang/String;)V:GetOnValidateInAppFailure_Ljava_lang_String_Handler:Com.Appsflyer.IAppsFlyerInAppPurchaseValidatorListenerInvoker, AppsFlyerXamarinBindingAndroid\n";
    private ArrayList refList;

    private native void n_onValidateInApp();

    private native void n_onValidateInAppFailure(String str);

    static {
        Runtime.register("Com.Appsflyer.IAppsFlyerInAppPurchaseValidatorListenerImplementor, AppsFlyerXamarinBindingAndroid", AppsFlyerInAppPurchaseValidatorListenerImplementor.class, __md_methods);
    }

    public AppsFlyerInAppPurchaseValidatorListenerImplementor() {
        if (getClass() == AppsFlyerInAppPurchaseValidatorListenerImplementor.class) {
            TypeManager.Activate("Com.Appsflyer.IAppsFlyerInAppPurchaseValidatorListenerImplementor, AppsFlyerXamarinBindingAndroid", "", this, new Object[0]);
        }
    }

    @Override // com.appsflyer.AppsFlyerInAppPurchaseValidatorListener
    public void onValidateInApp() {
        n_onValidateInApp();
    }

    @Override // com.appsflyer.AppsFlyerInAppPurchaseValidatorListener
    public void onValidateInAppFailure(String str) {
        n_onValidateInAppFailure(str);
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
