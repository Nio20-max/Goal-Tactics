package crc645877ad3d44b9b81b;

import android.view.MotionEvent;
import android.view.View;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class SoundTouchListener implements IGCUserPeer, View.OnTouchListener {
    public static final String __md_methods = "n_onTouch:(Landroid/view/View;Landroid/view/MotionEvent;)Z:GetOnTouch_Landroid_view_View_Landroid_view_MotionEvent_Handler:Android.Views.View/IOnTouchListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n";
    private ArrayList refList;

    private native boolean n_onTouch(View view, MotionEvent motionEvent);

    static {
        Runtime.register("GT.Droid.SoundTouchListener, GT.Droid", SoundTouchListener.class, "n_onTouch:(Landroid/view/View;Landroid/view/MotionEvent;)Z:GetOnTouch_Landroid_view_View_Landroid_view_MotionEvent_Handler:Android.Views.View/IOnTouchListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n");
    }

    public SoundTouchListener() {
        if (getClass() == SoundTouchListener.class) {
            TypeManager.Activate("GT.Droid.SoundTouchListener, GT.Droid", "", this, new Object[0]);
        }
    }

    public SoundTouchListener(int i) {
        if (getClass() == SoundTouchListener.class) {
            TypeManager.Activate("GT.Droid.SoundTouchListener, GT.Droid", "GT.Core.Sounds, GT.Core", this, new Object[]{Integer.valueOf(i)});
        }
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        return n_onTouch(view, motionEvent);
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
