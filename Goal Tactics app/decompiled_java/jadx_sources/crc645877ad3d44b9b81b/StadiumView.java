package crc645877ad3d44b9b81b;

import android.content.Context;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.MotionEvent;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class StadiumView extends BaseView_1 implements IGCUserPeer, GestureDetector.OnGestureListener {
    public static final String __md_methods = "n_onLayout:(ZIIII)V:GetOnLayout_ZIIIIHandler\nn_onTouchEvent:(Landroid/view/MotionEvent;)Z:GetOnTouchEvent_Landroid_view_MotionEvent_Handler\nn_onDown:(Landroid/view/MotionEvent;)Z:GetOnDown_Landroid_view_MotionEvent_Handler:Android.Views.GestureDetector/IOnGestureListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\nn_onFling:(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z:GetOnFling_Landroid_view_MotionEvent_Landroid_view_MotionEvent_FFHandler:Android.Views.GestureDetector/IOnGestureListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\nn_onLongPress:(Landroid/view/MotionEvent;)V:GetOnLongPress_Landroid_view_MotionEvent_Handler:Android.Views.GestureDetector/IOnGestureListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\nn_onScroll:(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z:GetOnScroll_Landroid_view_MotionEvent_Landroid_view_MotionEvent_FFHandler:Android.Views.GestureDetector/IOnGestureListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\nn_onShowPress:(Landroid/view/MotionEvent;)V:GetOnShowPress_Landroid_view_MotionEvent_Handler:Android.Views.GestureDetector/IOnGestureListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\nn_onSingleTapUp:(Landroid/view/MotionEvent;)Z:GetOnSingleTapUp_Landroid_view_MotionEvent_Handler:Android.Views.GestureDetector/IOnGestureListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n";
    private ArrayList refList;

    private native boolean n_onDown(MotionEvent motionEvent);

    private native boolean n_onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2);

    private native void n_onLayout(boolean z, int i, int i2, int i3, int i4);

    private native void n_onLongPress(MotionEvent motionEvent);

    private native boolean n_onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2);

    private native void n_onShowPress(MotionEvent motionEvent);

    private native boolean n_onSingleTapUp(MotionEvent motionEvent);

    private native boolean n_onTouchEvent(MotionEvent motionEvent);

    static {
        Runtime.register("GT.Droid.StadiumView, GT.Droid", StadiumView.class, __md_methods);
    }

    public StadiumView(Context context) {
        super(context);
        if (getClass() == StadiumView.class) {
            TypeManager.Activate("GT.Droid.StadiumView, GT.Droid", "Android.Content.Context, Mono.Android", this, new Object[]{context});
        }
    }

    public StadiumView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        if (getClass() == StadiumView.class) {
            TypeManager.Activate("GT.Droid.StadiumView, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android", this, new Object[]{context, attributeSet});
        }
    }

    public StadiumView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        if (getClass() == StadiumView.class) {
            TypeManager.Activate("GT.Droid.StadiumView, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, mscorlib", this, new Object[]{context, attributeSet, Integer.valueOf(i)});
        }
    }

    public StadiumView(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        if (getClass() == StadiumView.class) {
            TypeManager.Activate("GT.Droid.StadiumView, GT.Droid", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, mscorlib:System.Int32, mscorlib", this, new Object[]{context, attributeSet, Integer.valueOf(i), Integer.valueOf(i2)});
        }
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        n_onLayout(z, i, i2, i3, i4);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        return n_onTouchEvent(motionEvent);
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onDown(MotionEvent motionEvent) {
        return n_onDown(motionEvent);
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
        return n_onFling(motionEvent, motionEvent2, f, f2);
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public void onLongPress(MotionEvent motionEvent) {
        n_onLongPress(motionEvent);
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
        return n_onScroll(motionEvent, motionEvent2, f, f2);
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public void onShowPress(MotionEvent motionEvent) {
        n_onShowPress(motionEvent);
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onSingleTapUp(MotionEvent motionEvent) {
        return n_onSingleTapUp(motionEvent);
    }

    @Override // crc645877ad3d44b9b81b.BaseView_1, crc645877ad3d44b9b81b.BaseUIElement_1, mono.android.IGCUserPeer
    public void monodroidAddReference(Object obj) {
        if (this.refList == null) {
            this.refList = new ArrayList();
        }
        this.refList.add(obj);
    }

    @Override // crc645877ad3d44b9b81b.BaseView_1, crc645877ad3d44b9b81b.BaseUIElement_1, mono.android.IGCUserPeer
    public void monodroidClearReferences() {
        ArrayList arrayList = this.refList;
        if (arrayList != null) {
            arrayList.clear();
        }
    }
}
