package crc645877ad3d44b9b81b;

import android.content.Context;
import android.util.AttributeSet;
import androidx.recyclerview.widget.LinearLayoutManager;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class GTListViewLayoutManager extends LinearLayoutManager implements IGCUserPeer {
    public static final String __md_methods = "n_canScrollVertically:()Z:GetCanScrollVerticallyHandler\n";
    private ArrayList refList;

    private native boolean n_canScrollVertically();

    static {
        Runtime.register("GT.Droid.GTListViewLayoutManager, GT.Droid", GTListViewLayoutManager.class, __md_methods);
    }

    public GTListViewLayoutManager(Context context) {
        super(context);
        if (getClass() == GTListViewLayoutManager.class) {
            TypeManager.Activate("GT.Droid.GTListViewLayoutManager, GT.Droid", "Android.Content.Context, Mono.Android", this, new Object[]{context});
        }
    }

    public GTListViewLayoutManager(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        if (getClass() == GTListViewLayoutManager.class) {
            TypeManager.Activate("GT.Droid.GTListViewLayoutManager, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, mscorlib:System.Int32, mscorlib", this, new Object[]{context, attributeSet, Integer.valueOf(i), Integer.valueOf(i2)});
        }
    }

    public GTListViewLayoutManager(Context context, int i, boolean z) {
        super(context, i, z);
        if (getClass() == GTListViewLayoutManager.class) {
            TypeManager.Activate("GT.Droid.GTListViewLayoutManager, GT.Droid", "Android.Content.Context, Mono.Android:System.Int32, mscorlib:System.Boolean, mscorlib", this, new Object[]{context, Integer.valueOf(i), Boolean.valueOf(z)});
        }
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, androidx.recyclerview.widget.RecyclerView.LayoutManager
    public boolean canScrollVertically() {
        return n_canScrollVertically();
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
