package crc645877ad3d44b9b81b;

import com.facebook.AccessToken;
import com.facebook.AccessTokenTracker;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class FacebookAccessTokenTracker extends AccessTokenTracker implements IGCUserPeer {
    public static final String __md_methods = "n_onCurrentAccessTokenChanged:(Lcom/facebook/AccessToken;Lcom/facebook/AccessToken;)V:GetOnCurrentAccessTokenChanged_Lcom_facebook_AccessToken_Lcom_facebook_AccessToken_Handler\n";
    private ArrayList refList;

    private native void n_onCurrentAccessTokenChanged(AccessToken accessToken, AccessToken accessToken2);

    static {
        Runtime.register("GT.Droid.FacebookAccessTokenTracker, GT.Droid", FacebookAccessTokenTracker.class, __md_methods);
    }

    public FacebookAccessTokenTracker() {
        if (getClass() == FacebookAccessTokenTracker.class) {
            TypeManager.Activate("GT.Droid.FacebookAccessTokenTracker, GT.Droid", "", this, new Object[0]);
        }
    }

    @Override // com.facebook.AccessTokenTracker
    public void onCurrentAccessTokenChanged(AccessToken accessToken, AccessToken accessToken2) {
        n_onCurrentAccessTokenChanged(accessToken, accessToken2);
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
