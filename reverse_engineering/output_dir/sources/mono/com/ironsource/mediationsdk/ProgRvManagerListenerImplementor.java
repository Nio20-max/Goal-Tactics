package mono.com.ironsource.mediationsdk;

import com.ironsource.mediationsdk.ProgRvManagerListener;
import com.ironsource.mediationsdk.ProgRvSmash;
import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.model.Placement;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class ProgRvManagerListenerImplementor implements IGCUserPeer, ProgRvManagerListener {
    public static final String __md_methods = "n_onLoadError:(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V:GetOnLoadError_Lcom_ironsource_mediationsdk_ProgRvSmash_Ljava_lang_String_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onLoadSuccess:(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V:GetOnLoadSuccess_Lcom_ironsource_mediationsdk_ProgRvSmash_Ljava_lang_String_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdClicked:(Lcom/ironsource/mediationsdk/ProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V:GetOnRewardedVideoAdClicked_Lcom_ironsource_mediationsdk_ProgRvSmash_Lcom_ironsource_mediationsdk_model_Placement_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdClosed:(Lcom/ironsource/mediationsdk/ProgRvSmash;)V:GetOnRewardedVideoAdClosed_Lcom_ironsource_mediationsdk_ProgRvSmash_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdEnded:(Lcom/ironsource/mediationsdk/ProgRvSmash;)V:GetOnRewardedVideoAdEnded_Lcom_ironsource_mediationsdk_ProgRvSmash_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdOpened:(Lcom/ironsource/mediationsdk/ProgRvSmash;)V:GetOnRewardedVideoAdOpened_Lcom_ironsource_mediationsdk_ProgRvSmash_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdRewarded:(Lcom/ironsource/mediationsdk/ProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V:GetOnRewardedVideoAdRewarded_Lcom_ironsource_mediationsdk_ProgRvSmash_Lcom_ironsource_mediationsdk_model_Placement_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdShowFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgRvSmash;)V:GetOnRewardedVideoAdShowFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Lcom_ironsource_mediationsdk_ProgRvSmash_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdStarted:(Lcom/ironsource/mediationsdk/ProgRvSmash;)V:GetOnRewardedVideoAdStarted_Lcom_ironsource_mediationsdk_ProgRvSmash_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\n";
    private ArrayList refList;

    private native void n_onLoadError(ProgRvSmash progRvSmash, String str);

    private native void n_onLoadSuccess(ProgRvSmash progRvSmash, String str);

    private native void n_onRewardedVideoAdClicked(ProgRvSmash progRvSmash, Placement placement);

    private native void n_onRewardedVideoAdClosed(ProgRvSmash progRvSmash);

    private native void n_onRewardedVideoAdEnded(ProgRvSmash progRvSmash);

    private native void n_onRewardedVideoAdOpened(ProgRvSmash progRvSmash);

    private native void n_onRewardedVideoAdRewarded(ProgRvSmash progRvSmash, Placement placement);

    private native void n_onRewardedVideoAdShowFailed(IronSourceError ironSourceError, ProgRvSmash progRvSmash);

    private native void n_onRewardedVideoAdStarted(ProgRvSmash progRvSmash);

    static {
        Runtime.register("Com.Ironsource.Mediationsdk.IProgRvManagerListenerImplementor, IronSource-Android_v7.0.3.1", ProgRvManagerListenerImplementor.class, __md_methods);
    }

    public ProgRvManagerListenerImplementor() {
        if (getClass() == ProgRvManagerListenerImplementor.class) {
            TypeManager.Activate("Com.Ironsource.Mediationsdk.IProgRvManagerListenerImplementor, IronSource-Android_v7.0.3.1", "", this, new Object[0]);
        }
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public void onLoadError(ProgRvSmash progRvSmash, String str) {
        n_onLoadError(progRvSmash, str);
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public void onLoadSuccess(ProgRvSmash progRvSmash, String str) {
        n_onLoadSuccess(progRvSmash, str);
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public void onRewardedVideoAdClicked(ProgRvSmash progRvSmash, Placement placement) {
        n_onRewardedVideoAdClicked(progRvSmash, placement);
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public void onRewardedVideoAdClosed(ProgRvSmash progRvSmash) {
        n_onRewardedVideoAdClosed(progRvSmash);
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public void onRewardedVideoAdEnded(ProgRvSmash progRvSmash) {
        n_onRewardedVideoAdEnded(progRvSmash);
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public void onRewardedVideoAdOpened(ProgRvSmash progRvSmash) {
        n_onRewardedVideoAdOpened(progRvSmash);
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public void onRewardedVideoAdRewarded(ProgRvSmash progRvSmash, Placement placement) {
        n_onRewardedVideoAdRewarded(progRvSmash, placement);
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public void onRewardedVideoAdShowFailed(IronSourceError ironSourceError, ProgRvSmash progRvSmash) {
        n_onRewardedVideoAdShowFailed(ironSourceError, progRvSmash);
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public void onRewardedVideoAdStarted(ProgRvSmash progRvSmash) {
        n_onRewardedVideoAdStarted(progRvSmash);
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
