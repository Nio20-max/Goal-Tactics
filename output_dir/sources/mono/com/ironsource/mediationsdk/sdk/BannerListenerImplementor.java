package mono.com.ironsource.mediationsdk.sdk;

import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.sdk.BannerListener;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class BannerListenerImplementor implements IGCUserPeer, BannerListener {
    public static final String __md_methods = "n_onBannerAdClicked:()V:GetOnBannerAdClickedHandler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerAdLeftApplication:()V:GetOnBannerAdLeftApplicationHandler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerAdLoadFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V:GetOnBannerAdLoadFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Handler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerAdLoaded:()V:GetOnBannerAdLoadedHandler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerAdScreenDismissed:()V:GetOnBannerAdScreenDismissedHandler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerAdScreenPresented:()V:GetOnBannerAdScreenPresentedHandler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\n";
    private ArrayList refList;

    private native void n_onBannerAdClicked();

    private native void n_onBannerAdLeftApplication();

    private native void n_onBannerAdLoadFailed(IronSourceError ironSourceError);

    private native void n_onBannerAdLoaded();

    private native void n_onBannerAdScreenDismissed();

    private native void n_onBannerAdScreenPresented();

    static {
        Runtime.register("Com.Ironsource.Mediationsdk.Sdk.IBannerListenerImplementor, IronSource-Android_v7.0.3.1", BannerListenerImplementor.class, __md_methods);
    }

    public BannerListenerImplementor() {
        if (getClass() == BannerListenerImplementor.class) {
            TypeManager.Activate("Com.Ironsource.Mediationsdk.Sdk.IBannerListenerImplementor, IronSource-Android_v7.0.3.1", "", this, new Object[0]);
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.BannerListener
    public void onBannerAdClicked() {
        n_onBannerAdClicked();
    }

    @Override // com.ironsource.mediationsdk.sdk.BannerListener
    public void onBannerAdLeftApplication() {
        n_onBannerAdLeftApplication();
    }

    @Override // com.ironsource.mediationsdk.sdk.BannerListener
    public void onBannerAdLoadFailed(IronSourceError ironSourceError) {
        n_onBannerAdLoadFailed(ironSourceError);
    }

    @Override // com.ironsource.mediationsdk.sdk.BannerListener
    public void onBannerAdLoaded() {
        n_onBannerAdLoaded();
    }

    @Override // com.ironsource.mediationsdk.sdk.BannerListener
    public void onBannerAdScreenDismissed() {
        n_onBannerAdScreenDismissed();
    }

    @Override // com.ironsource.mediationsdk.sdk.BannerListener
    public void onBannerAdScreenPresented() {
        n_onBannerAdScreenPresented();
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
