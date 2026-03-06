package crc645877ad3d44b9b81b;

import android.content.Context;
import android.util.AttributeSet;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class SkillCardsCollection extends GTRecyclerView implements IGCUserPeer {
    public static final String __md_methods = "";
    private ArrayList refList;

    static {
        Runtime.register("GT.Droid.SkillCardsCollection, GT.Droid", SkillCardsCollection.class, "");
    }

    public SkillCardsCollection(Context context) {
        super(context);
        if (getClass() == SkillCardsCollection.class) {
            TypeManager.Activate("GT.Droid.SkillCardsCollection, GT.Droid", "Android.Content.Context, Mono.Android", this, new Object[]{context});
        }
    }

    public SkillCardsCollection(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        if (getClass() == SkillCardsCollection.class) {
            TypeManager.Activate("GT.Droid.SkillCardsCollection, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android", this, new Object[]{context, attributeSet});
        }
    }

    public SkillCardsCollection(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        if (getClass() == SkillCardsCollection.class) {
            TypeManager.Activate("GT.Droid.SkillCardsCollection, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, mscorlib", this, new Object[]{context, attributeSet, Integer.valueOf(i)});
        }
    }

    @Override // crc645877ad3d44b9b81b.GTRecyclerView, mono.android.IGCUserPeer
    public void monodroidAddReference(Object obj) {
        if (this.refList == null) {
            this.refList = new ArrayList();
        }
        this.refList.add(obj);
    }

    @Override // crc645877ad3d44b9b81b.GTRecyclerView, mono.android.IGCUserPeer
    public void monodroidClearReferences() {
        ArrayList arrayList = this.refList;
        if (arrayList != null) {
            arrayList.clear();
        }
    }
}
