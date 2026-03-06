package mono.com.ironsource.mediationsdk;

import com.ironsource.mediationsdk.ProgIsManagerListener;
import com.ironsource.mediationsdk.ProgIsSmash;
import com.ironsource.mediationsdk.logger.IronSourceError;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class ProgIsManagerListenerImplementor implements IGCUserPeer, ProgIsManagerListener {
    public static final String __md_methods = "n_onInterstitialAdClicked:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdClicked_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdClosed:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdClosed_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdLoadFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;J)V:GetOnInterstitialAdLoadFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Lcom_ironsource_mediationsdk_ProgIsSmash_JHandler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdOpened:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdOpened_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdReady:(Lcom/ironsource/mediationsdk/ProgIsSmash;J)V:GetOnInterstitialAdReady_Lcom_ironsource_mediationsdk_ProgIsSmash_JHandler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdShowFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdShowFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdShowSucceeded:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdShowSucceeded_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdVisible:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdVisible_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialInitFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialInitFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialInitSuccess:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialInitSuccess_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\n";
    private ArrayList refList;

    private native void n_onInterstitialAdClicked(ProgIsSmash progIsSmash);

    private native void n_onInterstitialAdClosed(ProgIsSmash progIsSmash);

    private native void n_onInterstitialAdLoadFailed(IronSourceError ironSourceError, ProgIsSmash progIsSmash, long j);

    private native void n_onInterstitialAdOpened(ProgIsSmash progIsSmash);

    private native void n_onInterstitialAdReady(ProgIsSmash progIsSmash, long j);

    private native void n_onInterstitialAdShowFailed(IronSourceError ironSourceError, ProgIsSmash progIsSmash);

    private native void n_onInterstitialAdShowSucceeded(ProgIsSmash progIsSmash);

    private native void n_onInterstitialAdVisible(ProgIsSmash progIsSmash);

    private native void n_onInterstitialInitFailed(IronSourceError ironSourceError, ProgIsSmash progIsSmash);

    private native void n_onInterstitialInitSuccess(ProgIsSmash progIsSmash);

    static {
        Runtime.register("Com.Ironsource.Mediationsdk.IProgIsManagerListenerImplementor, IronSource-Android_v7.0.3.1", ProgIsManagerListenerImplementor.class, __md_methods);
    }

    public ProgIsManagerListenerImplementor() {
        if (getClass() == ProgIsManagerListenerImplementor.class) {
            TypeManager.Activate("Com.Ironsource.Mediationsdk.IProgIsManagerListenerImplementor, IronSource-Android_v7.0.3.1", "", this, new Object[0]);
        }
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialAdClicked(ProgIsSmash progIsSmash) {
        n_onInterstitialAdClicked(progIsSmash);
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialAdClosed(ProgIsSmash progIsSmash) {
        n_onInterstitialAdClosed(progIsSmash);
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialAdLoadFailed(IronSourceError ironSourceError, ProgIsSmash progIsSmash, long j) {
        n_onInterstitialAdLoadFailed(ironSourceError, progIsSmash, j);
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialAdOpened(ProgIsSmash progIsSmash) {
        n_onInterstitialAdOpened(progIsSmash);
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialAdReady(ProgIsSmash progIsSmash, long j) {
        n_onInterstitialAdReady(progIsSmash, j);
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialAdShowFailed(IronSourceError ironSourceError, ProgIsSmash progIsSmash) {
        n_onInterstitialAdShowFailed(ironSourceError, progIsSmash);
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialAdShowSucceeded(ProgIsSmash progIsSmash) {
        n_onInterstitialAdShowSucceeded(progIsSmash);
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialAdVisible(ProgIsSmash progIsSmash) {
        n_onInterstitialAdVisible(progIsSmash);
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialInitFailed(IronSourceError ironSourceError, ProgIsSmash progIsSmash) {
        n_onInterstitialInitFailed(ironSourceError, progIsSmash);
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialInitSuccess(ProgIsSmash progIsSmash) {
        n_onInterstitialInitSuccess(progIsSmash);
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
