package crc643b6637ff49d1db2a;

import com.helpshift.xamarin.campaigns.HelpshiftInboxNotificationDelegate;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class WrapperInboxNotificationDelegate implements IGCUserPeer, HelpshiftInboxNotificationDelegate {
    public static final String __md_methods = "n_onInboxMessagePushNotificationClicked:(Ljava/lang/String;)V:GetOnInboxMessagePushNotificationClicked_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxNotificationDelegateInvoker, HelpshiftApi\n";
    private ArrayList refList;

    private native void n_onInboxMessagePushNotificationClicked(String str);

    static {
        Runtime.register("HelpshiftApi.WrapperInboxNotificationDelegate, HelpshiftApi", WrapperInboxNotificationDelegate.class, __md_methods);
    }

    public WrapperInboxNotificationDelegate() {
        if (getClass() == WrapperInboxNotificationDelegate.class) {
            TypeManager.Activate("HelpshiftApi.WrapperInboxNotificationDelegate, HelpshiftApi", "", this, new Object[0]);
        }
    }

    @Override // com.helpshift.xamarin.campaigns.HelpshiftInboxNotificationDelegate
    public void onInboxMessagePushNotificationClicked(String str) {
        n_onInboxMessagePushNotificationClicked(str);
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
