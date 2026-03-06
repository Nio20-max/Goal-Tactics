package mono.com.facebook.internal;

import android.os.Bundle;
import com.facebook.internal.PlatformServiceClient;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class PlatformServiceClient_CompletedListenerImplementor implements IGCUserPeer, PlatformServiceClient.CompletedListener {
    public static final String __md_methods = "n_completed:(Landroid/os/Bundle;)V:GetCompleted_Landroid_os_Bundle_Handler:Xamarin.Facebook.Internal.PlatformServiceClient/ICompletedListenerInvoker, Xamarin.Facebook.Common.Android\n";
    private ArrayList refList;

    private native void n_completed(Bundle bundle);

    static {
        Runtime.register("Xamarin.Facebook.Internal.PlatformServiceClient+ICompletedListenerImplementor, Xamarin.Facebook.Common.Android", PlatformServiceClient_CompletedListenerImplementor.class, __md_methods);
    }

    public PlatformServiceClient_CompletedListenerImplementor() {
        if (getClass() == PlatformServiceClient_CompletedListenerImplementor.class) {
            TypeManager.Activate("Xamarin.Facebook.Internal.PlatformServiceClient+ICompletedListenerImplementor, Xamarin.Facebook.Common.Android", "", this, new Object[0]);
        }
    }

    @Override // com.facebook.internal.PlatformServiceClient.CompletedListener
    public void completed(Bundle bundle) {
        n_completed(bundle);
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
