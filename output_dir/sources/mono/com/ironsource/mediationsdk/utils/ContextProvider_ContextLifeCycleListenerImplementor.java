package mono.com.ironsource.mediationsdk.utils;

import android.app.Activity;
import com.ironsource.mediationsdk.utils.ContextProvider;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class ContextProvider_ContextLifeCycleListenerImplementor implements IGCUserPeer, ContextProvider.ContextLifeCycleListener {
    public static final String __md_methods = "n_onPause:(Landroid/app/Activity;)V:GetOnPause_Landroid_app_Activity_Handler:Com.Ironsource.Mediationsdk.Utils.ContextProvider/IContextLifeCycleListenerInvoker, IronSource-Android_v7.0.3.1\nn_onResume:(Landroid/app/Activity;)V:GetOnResume_Landroid_app_Activity_Handler:Com.Ironsource.Mediationsdk.Utils.ContextProvider/IContextLifeCycleListenerInvoker, IronSource-Android_v7.0.3.1\n";
    private ArrayList refList;

    private native void n_onPause(Activity activity);

    private native void n_onResume(Activity activity);

    static {
        Runtime.register("Com.Ironsource.Mediationsdk.Utils.ContextProvider+IContextLifeCycleListenerImplementor, IronSource-Android_v7.0.3.1", ContextProvider_ContextLifeCycleListenerImplementor.class, __md_methods);
    }

    public ContextProvider_ContextLifeCycleListenerImplementor() {
        if (getClass() == ContextProvider_ContextLifeCycleListenerImplementor.class) {
            TypeManager.Activate("Com.Ironsource.Mediationsdk.Utils.ContextProvider+IContextLifeCycleListenerImplementor, IronSource-Android_v7.0.3.1", "", this, new Object[0]);
        }
    }

    @Override // com.ironsource.mediationsdk.utils.ContextProvider.ContextLifeCycleListener
    public void onPause(Activity activity) {
        n_onPause(activity);
    }

    @Override // com.ironsource.mediationsdk.utils.ContextProvider.ContextLifeCycleListener
    public void onResume(Activity activity) {
        n_onResume(activity);
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
