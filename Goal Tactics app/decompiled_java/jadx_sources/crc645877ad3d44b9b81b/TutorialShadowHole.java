package crc645877ad3d44b9b81b;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class TutorialShadowHole extends View implements IGCUserPeer {
    public static final String __md_methods = "";
    private ArrayList refList;

    static {
        Runtime.register("GT.Droid.TutorialShadowHole, GT.Droid", TutorialShadowHole.class, "");
    }

    public TutorialShadowHole(Context context) {
        super(context);
        if (getClass() == TutorialShadowHole.class) {
            TypeManager.Activate("GT.Droid.TutorialShadowHole, GT.Droid", "Android.Content.Context, Mono.Android", this, new Object[]{context});
        }
    }

    public TutorialShadowHole(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        if (getClass() == TutorialShadowHole.class) {
            TypeManager.Activate("GT.Droid.TutorialShadowHole, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android", this, new Object[]{context, attributeSet});
        }
    }

    public TutorialShadowHole(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        if (getClass() == TutorialShadowHole.class) {
            TypeManager.Activate("GT.Droid.TutorialShadowHole, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, mscorlib", this, new Object[]{context, attributeSet, Integer.valueOf(i)});
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
