package mono.com.helpshift.xamarin.listeners;

import com.helpshift.xamarin.listeners.HelpshiftAlertToRateAppListener;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class HelpshiftAlertToRateAppListenerImplementor implements IGCUserPeer, HelpshiftAlertToRateAppListener {
    public static final String __md_methods = "n_onAction:(I)V:GetOnAction_IHandler:Com.Helpshift.Xamarin.Listeners.IHelpshiftAlertToRateAppListenerInvoker, HelpshiftApi\n";
    private ArrayList refList;

    private native void n_onAction(int i);

    static {
        Runtime.register("Com.Helpshift.Xamarin.Listeners.IHelpshiftAlertToRateAppListenerImplementor, HelpshiftApi", HelpshiftAlertToRateAppListenerImplementor.class, __md_methods);
    }

    public HelpshiftAlertToRateAppListenerImplementor() {
        if (getClass() == HelpshiftAlertToRateAppListenerImplementor.class) {
            TypeManager.Activate("Com.Helpshift.Xamarin.Listeners.IHelpshiftAlertToRateAppListenerImplementor, HelpshiftApi", "", this, new Object[0]);
        }
    }

    @Override // com.helpshift.xamarin.listeners.HelpshiftAlertToRateAppListener
    public void onAction(int i) {
        n_onAction(i);
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
