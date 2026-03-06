package crc645877ad3d44b9b81b;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class ComboBox extends FrameLayout implements IGCUserPeer {
    public static final String __md_methods = "n_isEnabled:()Z:GetIsEnabledHandler\nn_setEnabled:(Z)V:GetSetEnabled_ZHandler\n";
    private ArrayList refList;

    private native boolean n_isEnabled();

    private native void n_setEnabled(boolean z);

    static {
        Runtime.register("GT.Droid.ComboBox, GT.Droid", ComboBox.class, __md_methods);
    }

    public ComboBox(Context context) {
        super(context);
        if (getClass() == ComboBox.class) {
            TypeManager.Activate("GT.Droid.ComboBox, GT.Droid", "Android.Content.Context, Mono.Android", this, new Object[]{context});
        }
    }

    public ComboBox(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        if (getClass() == ComboBox.class) {
            TypeManager.Activate("GT.Droid.ComboBox, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android", this, new Object[]{context, attributeSet});
        }
    }

    public ComboBox(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        if (getClass() == ComboBox.class) {
            TypeManager.Activate("GT.Droid.ComboBox, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, mscorlib", this, new Object[]{context, attributeSet, Integer.valueOf(i)});
        }
    }

    public ComboBox(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        if (getClass() == ComboBox.class) {
            TypeManager.Activate("GT.Droid.ComboBox, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, mscorlib:System.Int32, mscorlib", this, new Object[]{context, attributeSet, Integer.valueOf(i), Integer.valueOf(i2)});
        }
    }

    @Override // android.view.View
    public boolean isEnabled() {
        return n_isEnabled();
    }

    @Override // android.view.View
    public void setEnabled(boolean z) {
        n_setEnabled(z);
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
