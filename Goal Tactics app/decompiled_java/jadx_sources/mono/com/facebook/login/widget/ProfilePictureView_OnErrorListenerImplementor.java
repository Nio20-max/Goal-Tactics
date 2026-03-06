package mono.com.facebook.login.widget;

import com.facebook.FacebookException;
import com.facebook.login.widget.ProfilePictureView;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class ProfilePictureView_OnErrorListenerImplementor implements IGCUserPeer, ProfilePictureView.OnErrorListener {
    public static final String __md_methods = "n_onError:(Lcom/facebook/FacebookException;)V:GetOnError_Lcom_facebook_FacebookException_Handler:Xamarin.Facebook.Login.Widget.ProfilePictureView/IOnErrorListenerInvoker, Xamarin.Facebook.Login.Android\n";
    private ArrayList refList;

    private native void n_onError(FacebookException facebookException);

    static {
        Runtime.register("Xamarin.Facebook.Login.Widget.ProfilePictureView+IOnErrorListenerImplementor, Xamarin.Facebook.Login.Android", ProfilePictureView_OnErrorListenerImplementor.class, __md_methods);
    }

    public ProfilePictureView_OnErrorListenerImplementor() {
        if (getClass() == ProfilePictureView_OnErrorListenerImplementor.class) {
            TypeManager.Activate("Xamarin.Facebook.Login.Widget.ProfilePictureView+IOnErrorListenerImplementor, Xamarin.Facebook.Login.Android", "", this, new Object[0]);
        }
    }

    @Override // com.facebook.login.widget.ProfilePictureView.OnErrorListener
    public void onError(FacebookException facebookException) {
        n_onError(facebookException);
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
