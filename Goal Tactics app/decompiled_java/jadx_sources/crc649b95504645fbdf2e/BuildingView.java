package crc649b95504645fbdf2e;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ImageView;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class BuildingView extends ImageView implements IGCUserPeer {
    public static final String __md_methods = "";
    private ArrayList refList;

    static {
        Runtime.register("GT.Droid.Views.BuildingView, GT.Droid", BuildingView.class, "");
    }

    public BuildingView(Context context) {
        super(context);
        if (getClass() == BuildingView.class) {
            TypeManager.Activate("GT.Droid.Views.BuildingView, GT.Droid", "Android.Content.Context, Mono.Android", this, new Object[]{context});
        }
    }

    public BuildingView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        if (getClass() == BuildingView.class) {
            TypeManager.Activate("GT.Droid.Views.BuildingView, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android", this, new Object[]{context, attributeSet});
        }
    }

    public BuildingView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        if (getClass() == BuildingView.class) {
            TypeManager.Activate("GT.Droid.Views.BuildingView, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, mscorlib", this, new Object[]{context, attributeSet, Integer.valueOf(i)});
        }
    }

    public BuildingView(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        if (getClass() == BuildingView.class) {
            TypeManager.Activate("GT.Droid.Views.BuildingView, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, mscorlib:System.Int32, mscorlib", this, new Object[]{context, attributeSet, Integer.valueOf(i), Integer.valueOf(i2)});
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
