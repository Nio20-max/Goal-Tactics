package crc645877ad3d44b9b81b;

import android.content.Context;
import android.util.AttributeSet;
import androidx.viewpager.widget.ViewPager;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class PageScrollView extends ViewPager implements IGCUserPeer {
    public static final String __md_methods = "";
    private ArrayList refList;

    static {
        Runtime.register("GT.Droid.PageScrollView, GT.Droid", PageScrollView.class, "");
    }

    public PageScrollView(Context context) {
        super(context);
        if (getClass() == PageScrollView.class) {
            TypeManager.Activate("GT.Droid.PageScrollView, GT.Droid", "Android.Content.Context, Mono.Android", this, new Object[]{context});
        }
    }

    public PageScrollView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        if (getClass() == PageScrollView.class) {
            TypeManager.Activate("GT.Droid.PageScrollView, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android", this, new Object[]{context, attributeSet});
        }
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
