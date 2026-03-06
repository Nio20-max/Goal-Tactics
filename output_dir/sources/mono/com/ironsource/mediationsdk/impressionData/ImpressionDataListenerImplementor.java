package mono.com.ironsource.mediationsdk.impressionData;

import com.ironsource.mediationsdk.impressionData.ImpressionData;
import com.ironsource.mediationsdk.impressionData.ImpressionDataListener;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class ImpressionDataListenerImplementor implements IGCUserPeer, ImpressionDataListener {
    public static final String __md_methods = "n_onImpressionSuccess:(Lcom/ironsource/mediationsdk/impressionData/ImpressionData;)V:GetOnImpressionSuccess_Lcom_ironsource_mediationsdk_impressionData_ImpressionData_Handler:Com.Ironsource.Mediationsdk.ImpressionData.IImpressionDataListenerInvoker, IronSource-Android_v7.0.3.1\n";
    private ArrayList refList;

    private native void n_onImpressionSuccess(ImpressionData impressionData);

    static {
        Runtime.register("Com.Ironsource.Mediationsdk.ImpressionData.IImpressionDataListenerImplementor, IronSource-Android_v7.0.3.1", ImpressionDataListenerImplementor.class, __md_methods);
    }

    public ImpressionDataListenerImplementor() {
        if (getClass() == ImpressionDataListenerImplementor.class) {
            TypeManager.Activate("Com.Ironsource.Mediationsdk.ImpressionData.IImpressionDataListenerImplementor, IronSource-Android_v7.0.3.1", "", this, new Object[0]);
        }
    }

    @Override // com.ironsource.mediationsdk.impressionData.ImpressionDataListener
    public void onImpressionSuccess(ImpressionData impressionData) {
        n_onImpressionSuccess(impressionData);
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
