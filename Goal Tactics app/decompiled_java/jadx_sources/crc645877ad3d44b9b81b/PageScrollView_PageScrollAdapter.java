package crc645877ad3d44b9b81b;

import android.view.View;
import android.view.ViewGroup;
import androidx.viewpager.widget.PagerAdapter;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class PageScrollView_PageScrollAdapter extends PagerAdapter implements IGCUserPeer {
    public static final String __md_methods = "n_getCount:()I:GetGetCountHandler\nn_isViewFromObject:(Landroid/view/View;Ljava/lang/Object;)Z:GetIsViewFromObject_Landroid_view_View_Ljava_lang_Object_Handler\nn_instantiateItem:(Landroid/view/ViewGroup;I)Ljava/lang/Object;:GetInstantiateItem_Landroid_view_ViewGroup_IHandler\nn_destroyItem:(Landroid/view/ViewGroup;ILjava/lang/Object;)V:GetDestroyItem_Landroid_view_ViewGroup_ILjava_lang_Object_Handler\n";
    private ArrayList refList;

    private native void n_destroyItem(ViewGroup viewGroup, int i, Object obj);

    private native int n_getCount();

    private native Object n_instantiateItem(ViewGroup viewGroup, int i);

    private native boolean n_isViewFromObject(View view, Object obj);

    static {
        Runtime.register("GT.Droid.PageScrollView+PageScrollAdapter, GT.Droid", PageScrollView_PageScrollAdapter.class, __md_methods);
    }

    public PageScrollView_PageScrollAdapter() {
        if (getClass() == PageScrollView_PageScrollAdapter.class) {
            TypeManager.Activate("GT.Droid.PageScrollView+PageScrollAdapter, GT.Droid", "", this, new Object[0]);
        }
    }

    @Override // androidx.viewpager.widget.PagerAdapter
    public int getCount() {
        return n_getCount();
    }

    @Override // androidx.viewpager.widget.PagerAdapter
    public boolean isViewFromObject(View view, Object obj) {
        return n_isViewFromObject(view, obj);
    }

    @Override // androidx.viewpager.widget.PagerAdapter
    public Object instantiateItem(ViewGroup viewGroup, int i) {
        return n_instantiateItem(viewGroup, i);
    }

    @Override // androidx.viewpager.widget.PagerAdapter
    public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
        n_destroyItem(viewGroup, i, obj);
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
