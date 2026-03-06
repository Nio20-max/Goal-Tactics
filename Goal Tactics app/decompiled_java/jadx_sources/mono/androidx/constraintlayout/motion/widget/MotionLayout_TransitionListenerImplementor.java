package mono.androidx.constraintlayout.motion.widget;

import androidx.constraintlayout.motion.widget.MotionLayout;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class MotionLayout_TransitionListenerImplementor implements IGCUserPeer, MotionLayout.TransitionListener {
    public static final String __md_methods = "n_onTransitionChange:(Landroidx/constraintlayout/motion/widget/MotionLayout;IIF)V:GetOnTransitionChange_Landroidx_constraintlayout_motion_widget_MotionLayout_IIFHandler:AndroidX.ConstraintLayout.Motion.Widget.MotionLayout/ITransitionListenerInvoker, Xamarin.AndroidX.ConstraintLayout\nn_onTransitionCompleted:(Landroidx/constraintlayout/motion/widget/MotionLayout;I)V:GetOnTransitionCompleted_Landroidx_constraintlayout_motion_widget_MotionLayout_IHandler:AndroidX.ConstraintLayout.Motion.Widget.MotionLayout/ITransitionListenerInvoker, Xamarin.AndroidX.ConstraintLayout\nn_onTransitionStarted:(Landroidx/constraintlayout/motion/widget/MotionLayout;II)V:GetOnTransitionStarted_Landroidx_constraintlayout_motion_widget_MotionLayout_IIHandler:AndroidX.ConstraintLayout.Motion.Widget.MotionLayout/ITransitionListenerInvoker, Xamarin.AndroidX.ConstraintLayout\nn_onTransitionTrigger:(Landroidx/constraintlayout/motion/widget/MotionLayout;IZF)V:GetOnTransitionTrigger_Landroidx_constraintlayout_motion_widget_MotionLayout_IZFHandler:AndroidX.ConstraintLayout.Motion.Widget.MotionLayout/ITransitionListenerInvoker, Xamarin.AndroidX.ConstraintLayout\n";
    private ArrayList refList;

    private native void n_onTransitionChange(MotionLayout motionLayout, int i, int i2, float f);

    private native void n_onTransitionCompleted(MotionLayout motionLayout, int i);

    private native void n_onTransitionStarted(MotionLayout motionLayout, int i, int i2);

    private native void n_onTransitionTrigger(MotionLayout motionLayout, int i, boolean z, float f);

    static {
        Runtime.register("AndroidX.ConstraintLayout.Motion.Widget.MotionLayout+ITransitionListenerImplementor, Xamarin.AndroidX.ConstraintLayout", MotionLayout_TransitionListenerImplementor.class, __md_methods);
    }

    public MotionLayout_TransitionListenerImplementor() {
        if (getClass() == MotionLayout_TransitionListenerImplementor.class) {
            TypeManager.Activate("AndroidX.ConstraintLayout.Motion.Widget.MotionLayout+ITransitionListenerImplementor, Xamarin.AndroidX.ConstraintLayout", "", this, new Object[0]);
        }
    }

    @Override // androidx.constraintlayout.motion.widget.MotionLayout.TransitionListener
    public void onTransitionChange(MotionLayout motionLayout, int i, int i2, float f) {
        n_onTransitionChange(motionLayout, i, i2, f);
    }

    @Override // androidx.constraintlayout.motion.widget.MotionLayout.TransitionListener
    public void onTransitionCompleted(MotionLayout motionLayout, int i) {
        n_onTransitionCompleted(motionLayout, i);
    }

    @Override // androidx.constraintlayout.motion.widget.MotionLayout.TransitionListener
    public void onTransitionStarted(MotionLayout motionLayout, int i, int i2) {
        n_onTransitionStarted(motionLayout, i, i2);
    }

    @Override // androidx.constraintlayout.motion.widget.MotionLayout.TransitionListener
    public void onTransitionTrigger(MotionLayout motionLayout, int i, boolean z, float f) {
        n_onTransitionTrigger(motionLayout, i, z, f);
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
