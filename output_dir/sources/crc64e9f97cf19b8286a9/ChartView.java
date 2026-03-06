package crc64e9f97cf19b8286a9;

import android.content.Context;
import android.util.AttributeSet;
import crc648e35430423bd4943.SKCanvasView;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class ChartView extends SKCanvasView implements IGCUserPeer {
    public static final String __md_methods = "";
    private ArrayList refList;

    static {
        Runtime.register("Microcharts.Droid.ChartView, Microcharts.Droid", ChartView.class, "");
    }

    public ChartView(Context context) {
        super(context);
        if (getClass() == ChartView.class) {
            TypeManager.Activate("Microcharts.Droid.ChartView, Microcharts.Droid", "Android.Content.Context, Mono.Android", this, new Object[]{context});
        }
    }

    public ChartView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        if (getClass() == ChartView.class) {
            TypeManager.Activate("Microcharts.Droid.ChartView, Microcharts.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android", this, new Object[]{context, attributeSet});
        }
    }

    public ChartView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        if (getClass() == ChartView.class) {
            TypeManager.Activate("Microcharts.Droid.ChartView, Microcharts.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, mscorlib", this, new Object[]{context, attributeSet, Integer.valueOf(i)});
        }
    }

    @Override // crc648e35430423bd4943.SKCanvasView, mono.android.IGCUserPeer
    public void monodroidAddReference(Object obj) {
        if (this.refList == null) {
            this.refList = new ArrayList();
        }
        this.refList.add(obj);
    }

    @Override // crc648e35430423bd4943.SKCanvasView, mono.android.IGCUserPeer
    public void monodroidClearReferences() {
        ArrayList arrayList = this.refList;
        if (arrayList != null) {
            arrayList.clear();
        }
    }
}
