package crc645877ad3d44b9b81b;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.widget.EditText;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class TextField extends EditText implements IGCUserPeer {
    public static final String __md_methods = "n_onEditorAction:(I)V:GetOnEditorAction_IHandler\nn_onFocusChanged:(ZILandroid/graphics/Rect;)V:GetOnFocusChanged_ZILandroid_graphics_Rect_Handler\n";
    private ArrayList refList;

    private native void n_onEditorAction(int i);

    private native void n_onFocusChanged(boolean z, int i, Rect rect);

    static {
        Runtime.register("GT.Droid.TextField, GT.Droid", TextField.class, __md_methods);
    }

    public TextField(Context context) {
        super(context);
        if (getClass() == TextField.class) {
            TypeManager.Activate("GT.Droid.TextField, GT.Droid", "Android.Content.Context, Mono.Android", this, new Object[]{context});
        }
    }

    public TextField(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        if (getClass() == TextField.class) {
            TypeManager.Activate("GT.Droid.TextField, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android", this, new Object[]{context, attributeSet});
        }
    }

    public TextField(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        if (getClass() == TextField.class) {
            TypeManager.Activate("GT.Droid.TextField, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, mscorlib", this, new Object[]{context, attributeSet, Integer.valueOf(i)});
        }
    }

    @Override // android.widget.TextView
    public void onEditorAction(int i) {
        n_onEditorAction(i);
    }

    @Override // android.widget.TextView, android.view.View
    public void onFocusChanged(boolean z, int i, Rect rect) {
        n_onFocusChanged(z, i, rect);
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
