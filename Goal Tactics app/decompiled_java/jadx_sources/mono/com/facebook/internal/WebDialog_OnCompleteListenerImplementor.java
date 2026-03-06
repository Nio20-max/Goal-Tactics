package mono.com.facebook.internal;

import android.os.Bundle;
import com.facebook.FacebookException;
import com.facebook.internal.WebDialog;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class WebDialog_OnCompleteListenerImplementor implements IGCUserPeer, WebDialog.OnCompleteListener {
    public static final String __md_methods = "n_onComplete:(Landroid/os/Bundle;Lcom/facebook/FacebookException;)V:GetOnComplete_Landroid_os_Bundle_Lcom_facebook_FacebookException_Handler:Xamarin.Facebook.Internal.WebDialog/IOnCompleteListenerInvoker, Xamarin.Facebook.Common.Android\n";
    private ArrayList refList;

    private native void n_onComplete(Bundle bundle, FacebookException facebookException);

    static {
        Runtime.register("Xamarin.Facebook.Internal.WebDialog+IOnCompleteListenerImplementor, Xamarin.Facebook.Common.Android", WebDialog_OnCompleteListenerImplementor.class, __md_methods);
    }

    public WebDialog_OnCompleteListenerImplementor() {
        if (getClass() == WebDialog_OnCompleteListenerImplementor.class) {
            TypeManager.Activate("Xamarin.Facebook.Internal.WebDialog+IOnCompleteListenerImplementor, Xamarin.Facebook.Common.Android", "", this, new Object[0]);
        }
    }

    @Override // com.facebook.internal.WebDialog.OnCompleteListener
    public void onComplete(Bundle bundle, FacebookException facebookException) {
        n_onComplete(bundle, facebookException);
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
