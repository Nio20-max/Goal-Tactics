package crc643b6637ff49d1db2a;

import com.helpshift.xamarin.campaigns.HelpshiftCampaignsDelegate;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class WrapperCampaignsDelegate implements IGCUserPeer, HelpshiftCampaignsDelegate {
    public static final String __md_methods = "n_didReceiveUnreadMessagesCount:(I)V:GetDidReceiveUnreadMessagesCount_IHandler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftCampaignsDelegateInvoker, HelpshiftApi\nn_sessionBegan:()V:GetSessionBeganHandler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftCampaignsDelegateInvoker, HelpshiftApi\nn_sessionEnded:()V:GetSessionEndedHandler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftCampaignsDelegateInvoker, HelpshiftApi\n";
    private ArrayList refList;

    private native void n_didReceiveUnreadMessagesCount(int i);

    private native void n_sessionBegan();

    private native void n_sessionEnded();

    static {
        Runtime.register("HelpshiftApi.WrapperCampaignsDelegate, HelpshiftApi", WrapperCampaignsDelegate.class, __md_methods);
    }

    public WrapperCampaignsDelegate() {
        if (getClass() == WrapperCampaignsDelegate.class) {
            TypeManager.Activate("HelpshiftApi.WrapperCampaignsDelegate, HelpshiftApi", "", this, new Object[0]);
        }
    }

    @Override // com.helpshift.xamarin.campaigns.HelpshiftCampaignsDelegate
    public void didReceiveUnreadMessagesCount(int i) {
        n_didReceiveUnreadMessagesCount(i);
    }

    @Override // com.helpshift.xamarin.campaigns.HelpshiftCampaignsDelegate
    public void sessionBegan() {
        n_sessionBegan();
    }

    @Override // com.helpshift.xamarin.campaigns.HelpshiftCampaignsDelegate
    public void sessionEnded() {
        n_sessionEnded();
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
