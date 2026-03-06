package crc645877ad3d44b9b81b;

import android.view.View;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class SystemUIVisibilityListener implements IGCUserPeer, View.OnSystemUiVisibilityChangeListener {
    public static final String __md_methods = "n_onSystemUiVisibilityChange:(I)V:GetOnSystemUiVisibilityChange_IHandler:Android.Views.View/IOnSystemUiVisibilityChangeListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n";
    private ArrayList refList;

    private native void n_onSystemUiVisibilityChange(int i);

    static {
        Runtime.register("GT.Droid.SystemUIVisibilityListener, GT.Droid", SystemUIVisibilityListener.class, "n_onSystemUiVisibilityChange:(I)V:GetOnSystemUiVisibilityChange_IHandler:Android.Views.View/IOnSystemUiVisibilityChangeListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n");
    }

    public SystemUIVisibilityListener() {
        if (getClass() == SystemUIVisibilityListener.class) {
            TypeManager.Activate("GT.Droid.SystemUIVisibilityListener, GT.Droid", "", this, new Object[0]);
        }
    }

    public SystemUIVisibilityListener(MainActivity mainActivity) {
        if (getClass() == SystemUIVisibilityListener.class) {
            TypeManager.Activate("GT.Droid.SystemUIVisibilityListener, GT.Droid", "GT.Droid.MainActivity, GT.Droid", this, new Object[]{mainActivity});
        }
    }

    @Override // android.view.View.OnSystemUiVisibilityChangeListener
    public void onSystemUiVisibilityChange(int i) {
        n_onSystemUiVisibilityChange(i);
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
