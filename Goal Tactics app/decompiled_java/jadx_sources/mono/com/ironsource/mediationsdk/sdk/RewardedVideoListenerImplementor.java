package mono.com.ironsource.mediationsdk.sdk;

import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.model.Placement;
import com.ironsource.mediationsdk.sdk.RewardedVideoListener;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class RewardedVideoListenerImplementor implements IGCUserPeer, RewardedVideoListener {
    public static final String __md_methods = "n_onRewardedVideoAdClicked:(Lcom/ironsource/mediationsdk/model/Placement;)V:GetOnRewardedVideoAdClicked_Lcom_ironsource_mediationsdk_model_Placement_Handler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdClosed:()V:GetOnRewardedVideoAdClosedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdEnded:()V:GetOnRewardedVideoAdEndedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdOpened:()V:GetOnRewardedVideoAdOpenedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdRewarded:(Lcom/ironsource/mediationsdk/model/Placement;)V:GetOnRewardedVideoAdRewarded_Lcom_ironsource_mediationsdk_model_Placement_Handler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdShowFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V:GetOnRewardedVideoAdShowFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Handler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdStarted:()V:GetOnRewardedVideoAdStartedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAvailabilityChanged:(Z)V:GetOnRewardedVideoAvailabilityChanged_ZHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\n";
    private ArrayList refList;

    private native void n_onRewardedVideoAdClicked(Placement placement);

    private native void n_onRewardedVideoAdClosed();

    private native void n_onRewardedVideoAdEnded();

    private native void n_onRewardedVideoAdOpened();

    private native void n_onRewardedVideoAdRewarded(Placement placement);

    private native void n_onRewardedVideoAdShowFailed(IronSourceError ironSourceError);

    private native void n_onRewardedVideoAdStarted();

    private native void n_onRewardedVideoAvailabilityChanged(boolean z);

    static {
        Runtime.register("Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerImplementor, IronSource-Android_v7.0.3.1", RewardedVideoListenerImplementor.class, __md_methods);
    }

    public RewardedVideoListenerImplementor() {
        if (getClass() == RewardedVideoListenerImplementor.class) {
            TypeManager.Activate("Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerImplementor, IronSource-Android_v7.0.3.1", "", this, new Object[0]);
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoListener
    public void onRewardedVideoAdClicked(Placement placement) {
        n_onRewardedVideoAdClicked(placement);
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoListener
    public void onRewardedVideoAdClosed() {
        n_onRewardedVideoAdClosed();
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoListener
    public void onRewardedVideoAdEnded() {
        n_onRewardedVideoAdEnded();
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoListener
    public void onRewardedVideoAdOpened() {
        n_onRewardedVideoAdOpened();
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoListener
    public void onRewardedVideoAdRewarded(Placement placement) {
        n_onRewardedVideoAdRewarded(placement);
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoListener
    public void onRewardedVideoAdShowFailed(IronSourceError ironSourceError) {
        n_onRewardedVideoAdShowFailed(ironSourceError);
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoListener
    public void onRewardedVideoAdStarted() {
        n_onRewardedVideoAdStarted();
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoListener
    public void onRewardedVideoAvailabilityChanged(boolean z) {
        n_onRewardedVideoAvailabilityChanged(z);
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
