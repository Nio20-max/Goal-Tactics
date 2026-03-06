package crc645877ad3d44b9b81b;

import android.view.View;
import androidx.recyclerview.widget.RecyclerView;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class GTTableViewHolder extends RecyclerView.ViewHolder implements IGCUserPeer {
    public static final String __md_methods = "";
    private ArrayList refList;

    static {
        Runtime.register("GT.Droid.GTTableViewHolder, GT.Droid", GTTableViewHolder.class, "");
    }

    public GTTableViewHolder(View view) {
        super(view);
        if (getClass() == GTTableViewHolder.class) {
            TypeManager.Activate("GT.Droid.GTTableViewHolder, GT.Droid", "Android.Views.View, Mono.Android", this, new Object[]{view});
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
