package mono.com.facebook.login;

import com.facebook.login.LoginClient;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class LoginClient_BackgroundProcessingListenerImplementor implements IGCUserPeer, LoginClient.BackgroundProcessingListener {
    public static final String __md_methods = "n_onBackgroundProcessingStarted:()V:GetOnBackgroundProcessingStartedHandler:Xamarin.Facebook.Login.LoginClient/IBackgroundProcessingListenerInvoker, Xamarin.Facebook.Common.Android\nn_onBackgroundProcessingStopped:()V:GetOnBackgroundProcessingStoppedHandler:Xamarin.Facebook.Login.LoginClient/IBackgroundProcessingListenerInvoker, Xamarin.Facebook.Common.Android\n";
    private ArrayList refList;

    private native void n_onBackgroundProcessingStarted();

    private native void n_onBackgroundProcessingStopped();

    static {
        Runtime.register("Xamarin.Facebook.Login.LoginClient+IBackgroundProcessingListenerImplementor, Xamarin.Facebook.Common.Android", LoginClient_BackgroundProcessingListenerImplementor.class, __md_methods);
    }

    public LoginClient_BackgroundProcessingListenerImplementor() {
        if (getClass() == LoginClient_BackgroundProcessingListenerImplementor.class) {
            TypeManager.Activate("Xamarin.Facebook.Login.LoginClient+IBackgroundProcessingListenerImplementor, Xamarin.Facebook.Common.Android", "", this, new Object[0]);
        }
    }

    @Override // com.facebook.login.LoginClient.BackgroundProcessingListener
    public void onBackgroundProcessingStarted() {
        n_onBackgroundProcessingStarted();
    }

    @Override // com.facebook.login.LoginClient.BackgroundProcessingListener
    public void onBackgroundProcessingStopped() {
        n_onBackgroundProcessingStopped();
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
