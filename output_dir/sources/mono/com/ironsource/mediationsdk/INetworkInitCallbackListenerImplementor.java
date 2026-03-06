package mono.com.ironsource.mediationsdk;

import com.ironsource.mediationsdk.INetworkInitCallbackListener;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class INetworkInitCallbackListenerImplementor implements IGCUserPeer, INetworkInitCallbackListener {
    public static final String __md_methods = "n_onNetworkInitCallbackFailed:(Ljava/lang/String;)V:GetOnNetworkInitCallbackFailed_Ljava_lang_String_Handler:Com.Ironsource.Mediationsdk.INetworkInitCallbackListenerInvoker, IronSource-Android_v7.0.3.1\nn_onNetworkInitCallbackLoadSuccess:(Ljava/lang/String;)V:GetOnNetworkInitCallbackLoadSuccess_Ljava_lang_String_Handler:Com.Ironsource.Mediationsdk.INetworkInitCallbackListenerInvoker, IronSource-Android_v7.0.3.1\nn_onNetworkInitCallbackSuccess:()V:GetOnNetworkInitCallbackSuccessHandler:Com.Ironsource.Mediationsdk.INetworkInitCallbackListenerInvoker, IronSource-Android_v7.0.3.1\n";
    private ArrayList refList;

    private native void n_onNetworkInitCallbackFailed(String str);

    private native void n_onNetworkInitCallbackLoadSuccess(String str);

    private native void n_onNetworkInitCallbackSuccess();

    static {
        Runtime.register("Com.Ironsource.Mediationsdk.INetworkInitCallbackListenerImplementor, IronSource-Android_v7.0.3.1", INetworkInitCallbackListenerImplementor.class, __md_methods);
    }

    public INetworkInitCallbackListenerImplementor() {
        if (getClass() == INetworkInitCallbackListenerImplementor.class) {
            TypeManager.Activate("Com.Ironsource.Mediationsdk.INetworkInitCallbackListenerImplementor, IronSource-Android_v7.0.3.1", "", this, new Object[0]);
        }
    }

    @Override // com.ironsource.mediationsdk.INetworkInitCallbackListener
    public void onNetworkInitCallbackFailed(String str) {
        n_onNetworkInitCallbackFailed(str);
    }

    @Override // com.ironsource.mediationsdk.INetworkInitCallbackListener
    public void onNetworkInitCallbackLoadSuccess(String str) {
        n_onNetworkInitCallbackLoadSuccess(str);
    }

    @Override // com.ironsource.mediationsdk.INetworkInitCallbackListener
    public void onNetworkInitCallbackSuccess() {
        n_onNetworkInitCallbackSuccess();
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
