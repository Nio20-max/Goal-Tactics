package mono.com.ironsource.mediationsdk.sdk;

import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.sdk.InterstitialListener;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class InterstitialListenerImplementor implements IGCUserPeer, InterstitialListener {
    public static final String __md_methods = "n_onInterstitialAdClicked:()V:GetOnInterstitialAdClickedHandler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdClosed:()V:GetOnInterstitialAdClosedHandler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdLoadFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V:GetOnInterstitialAdLoadFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Handler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdOpened:()V:GetOnInterstitialAdOpenedHandler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdReady:()V:GetOnInterstitialAdReadyHandler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdShowFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V:GetOnInterstitialAdShowFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Handler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdShowSucceeded:()V:GetOnInterstitialAdShowSucceededHandler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\n";
    private ArrayList refList;

    private native void n_onInterstitialAdClicked();

    private native void n_onInterstitialAdClosed();

    private native void n_onInterstitialAdLoadFailed(IronSourceError ironSourceError);

    private native void n_onInterstitialAdOpened();

    private native void n_onInterstitialAdReady();

    private native void n_onInterstitialAdShowFailed(IronSourceError ironSourceError);

    private native void n_onInterstitialAdShowSucceeded();

    static {
        Runtime.register("Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerImplementor, IronSource-Android_v7.0.3.1", InterstitialListenerImplementor.class, __md_methods);
    }

    public InterstitialListenerImplementor() {
        if (getClass() == InterstitialListenerImplementor.class) {
            TypeManager.Activate("Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerImplementor, IronSource-Android_v7.0.3.1", "", this, new Object[0]);
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialListener
    public void onInterstitialAdClicked() {
        n_onInterstitialAdClicked();
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialListener
    public void onInterstitialAdClosed() {
        n_onInterstitialAdClosed();
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialListener
    public void onInterstitialAdLoadFailed(IronSourceError ironSourceError) {
        n_onInterstitialAdLoadFailed(ironSourceError);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialListener
    public void onInterstitialAdOpened() {
        n_onInterstitialAdOpened();
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialListener
    public void onInterstitialAdReady() {
        n_onInterstitialAdReady();
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialListener
    public void onInterstitialAdShowFailed(IronSourceError ironSourceError) {
        n_onInterstitialAdShowFailed(ironSourceError);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialListener
    public void onInterstitialAdShowSucceeded() {
        n_onInterstitialAdShowSucceeded();
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
