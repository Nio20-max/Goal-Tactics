package mono.com.ironsource.mediationsdk.sdk;

import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.sdk.OfferwallListener;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class OfferwallListenerImplementor implements IGCUserPeer, OfferwallListener {
    public static final String __md_methods = "n_onGetOfferwallCreditsFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V:GetOnGetOfferwallCreditsFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Handler:Com.Ironsource.Mediationsdk.Sdk.IOfferwallListenerInvoker, IronSource-Android_v7.0.3.1\nn_onOfferwallAdCredited:(IIZ)Z:GetOnOfferwallAdCredited_IIZHandler:Com.Ironsource.Mediationsdk.Sdk.IOfferwallListenerInvoker, IronSource-Android_v7.0.3.1\nn_onOfferwallAvailable:(Z)V:GetOnOfferwallAvailable_ZHandler:Com.Ironsource.Mediationsdk.Sdk.IOfferwallListenerInvoker, IronSource-Android_v7.0.3.1\nn_onOfferwallClosed:()V:GetOnOfferwallClosedHandler:Com.Ironsource.Mediationsdk.Sdk.IOfferwallListenerInvoker, IronSource-Android_v7.0.3.1\nn_onOfferwallOpened:()V:GetOnOfferwallOpenedHandler:Com.Ironsource.Mediationsdk.Sdk.IOfferwallListenerInvoker, IronSource-Android_v7.0.3.1\nn_onOfferwallShowFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V:GetOnOfferwallShowFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Handler:Com.Ironsource.Mediationsdk.Sdk.IOfferwallListenerInvoker, IronSource-Android_v7.0.3.1\n";
    private ArrayList refList;

    private native void n_onGetOfferwallCreditsFailed(IronSourceError ironSourceError);

    private native boolean n_onOfferwallAdCredited(int i, int i2, boolean z);

    private native void n_onOfferwallAvailable(boolean z);

    private native void n_onOfferwallClosed();

    private native void n_onOfferwallOpened();

    private native void n_onOfferwallShowFailed(IronSourceError ironSourceError);

    static {
        Runtime.register("Com.Ironsource.Mediationsdk.Sdk.IOfferwallListenerImplementor, IronSource-Android_v7.0.3.1", OfferwallListenerImplementor.class, __md_methods);
    }

    public OfferwallListenerImplementor() {
        if (getClass() == OfferwallListenerImplementor.class) {
            TypeManager.Activate("Com.Ironsource.Mediationsdk.Sdk.IOfferwallListenerImplementor, IronSource-Android_v7.0.3.1", "", this, new Object[0]);
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallListener
    public void onGetOfferwallCreditsFailed(IronSourceError ironSourceError) {
        n_onGetOfferwallCreditsFailed(ironSourceError);
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallListener
    public boolean onOfferwallAdCredited(int i, int i2, boolean z) {
        return n_onOfferwallAdCredited(i, i2, z);
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallListener
    public void onOfferwallAvailable(boolean z) {
        n_onOfferwallAvailable(z);
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallListener
    public void onOfferwallClosed() {
        n_onOfferwallClosed();
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallListener
    public void onOfferwallOpened() {
        n_onOfferwallOpened();
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallListener
    public void onOfferwallShowFailed(IronSourceError ironSourceError) {
        n_onOfferwallShowFailed(ironSourceError);
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
