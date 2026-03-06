package mono.com.facebook.login;

import com.facebook.login.LoginClient;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class LoginClient_OnCompletedListenerImplementor implements IGCUserPeer, LoginClient.OnCompletedListener {
    public static final String __md_methods = "n_onCompleted:(Lcom/facebook/login/LoginClient$Result;)V:GetOnCompleted_Lcom_facebook_login_LoginClient_Result_Handler:Xamarin.Facebook.Login.LoginClient/IOnCompletedListenerInvoker, Xamarin.Facebook.Common.Android\n";
    private ArrayList refList;

    private native void n_onCompleted(LoginClient.Result result);

    static {
        Runtime.register("Xamarin.Facebook.Login.LoginClient+IOnCompletedListenerImplementor, Xamarin.Facebook.Common.Android", LoginClient_OnCompletedListenerImplementor.class, __md_methods);
    }

    public LoginClient_OnCompletedListenerImplementor() {
        if (getClass() == LoginClient_OnCompletedListenerImplementor.class) {
            TypeManager.Activate("Xamarin.Facebook.Login.LoginClient+IOnCompletedListenerImplementor, Xamarin.Facebook.Common.Android", "", this, new Object[0]);
        }
    }

    @Override // com.facebook.login.LoginClient.OnCompletedListener
    public void onCompleted(LoginClient.Result result) {
        n_onCompleted(result);
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
