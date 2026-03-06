package crc645877ad3d44b9b81b;

import android.graphics.Rect;
import android.view.View;
import androidx.recyclerview.widget.RecyclerView;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class ListPaddingDecoration extends RecyclerView.ItemDecoration implements IGCUserPeer {
    public static final String __md_methods = "n_getItemOffsets:(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V:GetGetItemOffsets_Landroid_graphics_Rect_Landroid_view_View_Landroidx_recyclerview_widget_RecyclerView_Landroidx_recyclerview_widget_RecyclerView_State_Handler\n";
    private ArrayList refList;

    private native void n_getItemOffsets(Rect rect, View view, RecyclerView recyclerView, RecyclerView.State state);

    static {
        Runtime.register("GT.Droid.ListPaddingDecoration, GT.Droid", ListPaddingDecoration.class, __md_methods);
    }

    public ListPaddingDecoration() {
        if (getClass() == ListPaddingDecoration.class) {
            TypeManager.Activate("GT.Droid.ListPaddingDecoration, GT.Droid", "", this, new Object[0]);
        }
    }

    public ListPaddingDecoration(int i, int i2) {
        if (getClass() == ListPaddingDecoration.class) {
            TypeManager.Activate("GT.Droid.ListPaddingDecoration, GT.Droid", "System.Int32, mscorlib:System.Int32, mscorlib", this, new Object[]{Integer.valueOf(i), Integer.valueOf(i2)});
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.ItemDecoration
    public void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, RecyclerView.State state) {
        n_getItemOffsets(rect, view, recyclerView, state);
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
