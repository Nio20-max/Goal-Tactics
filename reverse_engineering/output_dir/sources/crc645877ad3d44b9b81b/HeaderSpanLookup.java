package crc645877ad3d44b9b81b;

import androidx.recyclerview.widget.GridLayoutManager;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class HeaderSpanLookup extends GridLayoutManager.SpanSizeLookup implements IGCUserPeer {
    public static final String __md_methods = "n_getSpanSize:(I)I:GetGetSpanSize_IHandler\n";
    private ArrayList refList;

    private native int n_getSpanSize(int i);

    static {
        Runtime.register("GT.Droid.HeaderSpanLookup, GT.Droid", HeaderSpanLookup.class, __md_methods);
    }

    public HeaderSpanLookup() {
        if (getClass() == HeaderSpanLookup.class) {
            TypeManager.Activate("GT.Droid.HeaderSpanLookup, GT.Droid", "", this, new Object[0]);
        }
    }

    public HeaderSpanLookup(int i) {
        if (getClass() == HeaderSpanLookup.class) {
            TypeManager.Activate("GT.Droid.HeaderSpanLookup, GT.Droid", "System.Int32, mscorlib", this, new Object[]{Integer.valueOf(i)});
        }
    }

    @Override // androidx.recyclerview.widget.GridLayoutManager.SpanSizeLookup
    public int getSpanSize(int i) {
        return n_getSpanSize(i);
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
