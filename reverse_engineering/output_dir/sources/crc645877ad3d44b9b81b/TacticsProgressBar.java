package crc645877ad3d44b9b81b;

import android.content.Context;
import android.util.AttributeSet;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class TacticsProgressBar extends GTProgressBar implements IGCUserPeer {
    public static final String __md_methods = "";
    private ArrayList refList;

    static {
        Runtime.register("GT.Droid.TacticsProgressBar, GT.Droid", TacticsProgressBar.class, "");
    }

    public TacticsProgressBar(Context context) {
        super(context);
        if (getClass() == TacticsProgressBar.class) {
            TypeManager.Activate("GT.Droid.TacticsProgressBar, GT.Droid", "Android.Content.Context, Mono.Android", this, new Object[]{context});
        }
    }

    public TacticsProgressBar(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        if (getClass() == TacticsProgressBar.class) {
            TypeManager.Activate("GT.Droid.TacticsProgressBar, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android", this, new Object[]{context, attributeSet});
        }
    }

    public TacticsProgressBar(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        if (getClass() == TacticsProgressBar.class) {
            TypeManager.Activate("GT.Droid.TacticsProgressBar, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, mscorlib", this, new Object[]{context, attributeSet, Integer.valueOf(i)});
        }
    }

    public TacticsProgressBar(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        if (getClass() == TacticsProgressBar.class) {
            TypeManager.Activate("GT.Droid.TacticsProgressBar, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, mscorlib:System.Int32, mscorlib", this, new Object[]{context, attributeSet, Integer.valueOf(i), Integer.valueOf(i2)});
        }
    }

    @Override // crc645877ad3d44b9b81b.GTProgressBar, mono.android.IGCUserPeer
    public void monodroidAddReference(Object obj) {
        if (this.refList == null) {
            this.refList = new ArrayList();
        }
        this.refList.add(obj);
    }

    @Override // crc645877ad3d44b9b81b.GTProgressBar, mono.android.IGCUserPeer
    public void monodroidClearReferences() {
        ArrayList arrayList = this.refList;
        if (arrayList != null) {
            arrayList.clear();
        }
    }
}
