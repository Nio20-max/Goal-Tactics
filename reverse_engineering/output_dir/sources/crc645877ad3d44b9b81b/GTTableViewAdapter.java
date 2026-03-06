package crc645877ad3d44b9b81b;

import android.view.ViewGroup;
import androidx.recyclerview.widget.RecyclerView;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class GTTableViewAdapter extends RecyclerView.Adapter implements IGCUserPeer {
    public static final String __md_methods = "n_getItemCount:()I:GetGetItemCountHandler\nn_onBindViewHolder:(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V:GetOnBindViewHolder_Landroidx_recyclerview_widget_RecyclerView_ViewHolder_IHandler\nn_onCreateViewHolder:(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;:GetOnCreateViewHolder_Landroid_view_ViewGroup_IHandler\nn_getItemViewType:(I)I:GetGetItemViewType_IHandler\n";
    private ArrayList refList;

    private native int n_getItemCount();

    private native int n_getItemViewType(int i);

    private native void n_onBindViewHolder(RecyclerView.ViewHolder viewHolder, int i);

    private native RecyclerView.ViewHolder n_onCreateViewHolder(ViewGroup viewGroup, int i);

    static {
        Runtime.register("GT.Droid.GTTableViewAdapter, GT.Droid", GTTableViewAdapter.class, __md_methods);
    }

    public GTTableViewAdapter() {
        if (getClass() == GTTableViewAdapter.class) {
            TypeManager.Activate("GT.Droid.GTTableViewAdapter, GT.Droid", "", this, new Object[0]);
        }
    }

    public GTTableViewAdapter(GTTableView gTTableView) {
        if (getClass() == GTTableViewAdapter.class) {
            TypeManager.Activate("GT.Droid.GTTableViewAdapter, GT.Droid", "GT.Droid.GTTableView, GT.Droid", this, new Object[]{gTTableView});
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return n_getItemCount();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int i) {
        n_onBindViewHolder(viewHolder, i);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return n_onCreateViewHolder(viewGroup, i);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemViewType(int i) {
        return n_getItemViewType(i);
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
