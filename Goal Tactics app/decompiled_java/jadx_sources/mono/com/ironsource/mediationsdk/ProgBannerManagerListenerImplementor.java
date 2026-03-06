package mono.com.ironsource.mediationsdk;

import android.view.View;
import android.widget.FrameLayout;
import com.ironsource.mediationsdk.ProgBannerManagerListener;
import com.ironsource.mediationsdk.ProgBannerSmash;
import com.ironsource.mediationsdk.logger.IronSourceError;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class ProgBannerManagerListenerImplementor implements IGCUserPeer, ProgBannerManagerListener {
    public static final String __md_methods = "n_onBannerClicked:(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V:GetOnBannerClicked_Lcom_ironsource_mediationsdk_ProgBannerSmash_Handler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerLeftApplication:(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V:GetOnBannerLeftApplication_Lcom_ironsource_mediationsdk_ProgBannerSmash_Handler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerLoadFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgBannerSmash;Z)V:GetOnBannerLoadFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Lcom_ironsource_mediationsdk_ProgBannerSmash_ZHandler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerLoadSuccess:(Lcom/ironsource/mediationsdk/ProgBannerSmash;Landroid/view/View;Landroid/widget/FrameLayout$LayoutParams;)V:GetOnBannerLoadSuccess_Lcom_ironsource_mediationsdk_ProgBannerSmash_Landroid_view_View_Landroid_widget_FrameLayout_LayoutParams_Handler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerScreenDismissed:(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V:GetOnBannerScreenDismissed_Lcom_ironsource_mediationsdk_ProgBannerSmash_Handler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerScreenPresented:(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V:GetOnBannerScreenPresented_Lcom_ironsource_mediationsdk_ProgBannerSmash_Handler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\n";
    private ArrayList refList;

    private native void n_onBannerClicked(ProgBannerSmash progBannerSmash);

    private native void n_onBannerLeftApplication(ProgBannerSmash progBannerSmash);

    private native void n_onBannerLoadFailed(IronSourceError ironSourceError, ProgBannerSmash progBannerSmash, boolean z);

    private native void n_onBannerLoadSuccess(ProgBannerSmash progBannerSmash, View view, FrameLayout.LayoutParams layoutParams);

    private native void n_onBannerScreenDismissed(ProgBannerSmash progBannerSmash);

    private native void n_onBannerScreenPresented(ProgBannerSmash progBannerSmash);

    static {
        Runtime.register("Com.Ironsource.Mediationsdk.IProgBannerManagerListenerImplementor, IronSource-Android_v7.0.3.1", ProgBannerManagerListenerImplementor.class, __md_methods);
    }

    public ProgBannerManagerListenerImplementor() {
        if (getClass() == ProgBannerManagerListenerImplementor.class) {
            TypeManager.Activate("Com.Ironsource.Mediationsdk.IProgBannerManagerListenerImplementor, IronSource-Android_v7.0.3.1", "", this, new Object[0]);
        }
    }

    @Override // com.ironsource.mediationsdk.ProgBannerManagerListener
    public void onBannerClicked(ProgBannerSmash progBannerSmash) {
        n_onBannerClicked(progBannerSmash);
    }

    @Override // com.ironsource.mediationsdk.ProgBannerManagerListener
    public void onBannerLeftApplication(ProgBannerSmash progBannerSmash) {
        n_onBannerLeftApplication(progBannerSmash);
    }

    @Override // com.ironsource.mediationsdk.ProgBannerManagerListener
    public void onBannerLoadFailed(IronSourceError ironSourceError, ProgBannerSmash progBannerSmash, boolean z) {
        n_onBannerLoadFailed(ironSourceError, progBannerSmash, z);
    }

    @Override // com.ironsource.mediationsdk.ProgBannerManagerListener
    public void onBannerLoadSuccess(ProgBannerSmash progBannerSmash, View view, FrameLayout.LayoutParams layoutParams) {
        n_onBannerLoadSuccess(progBannerSmash, view, layoutParams);
    }

    @Override // com.ironsource.mediationsdk.ProgBannerManagerListener
    public void onBannerScreenDismissed(ProgBannerSmash progBannerSmash) {
        n_onBannerScreenDismissed(progBannerSmash);
    }

    @Override // com.ironsource.mediationsdk.ProgBannerManagerListener
    public void onBannerScreenPresented(ProgBannerSmash progBannerSmash) {
        n_onBannerScreenPresented(progBannerSmash);
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
