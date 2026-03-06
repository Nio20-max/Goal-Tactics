package crc643b6637ff49d1db2a;

import com.helpshift.xamarin.campaigns.HelpshiftInboxMessageDelegate;
import com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class WrapperInboxMessageDelegate implements IGCUserPeer, HelpshiftInboxMessageDelegate {
    public static final String __md_methods = "n_coverImageDownloaded:(Ljava/lang/String;)V:GetCoverImageDownloaded_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\nn_iconImageDownloaded:(Ljava/lang/String;)V:GetIconImageDownloaded_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\nn_inboxMessageAdded:(Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;)V:GetInboxMessageAdded_Lcom_helpshift_xamarin_campaigns_models_HelpshiftInboxMessage_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\nn_inboxMessageDeleted:(Ljava/lang/String;)V:GetInboxMessageDeleted_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\nn_inboxMessageMarkedAsRead:(Ljava/lang/String;)V:GetInboxMessageMarkedAsRead_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\nn_inboxMessageMarkedAsSeen:(Ljava/lang/String;)V:GetInboxMessageMarkedAsSeen_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\n";
    private ArrayList refList;

    private native void n_coverImageDownloaded(String str);

    private native void n_iconImageDownloaded(String str);

    private native void n_inboxMessageAdded(HelpshiftInboxMessage helpshiftInboxMessage);

    private native void n_inboxMessageDeleted(String str);

    private native void n_inboxMessageMarkedAsRead(String str);

    private native void n_inboxMessageMarkedAsSeen(String str);

    static {
        Runtime.register("HelpshiftApi.WrapperInboxMessageDelegate, HelpshiftApi", WrapperInboxMessageDelegate.class, __md_methods);
    }

    public WrapperInboxMessageDelegate() {
        if (getClass() == WrapperInboxMessageDelegate.class) {
            TypeManager.Activate("HelpshiftApi.WrapperInboxMessageDelegate, HelpshiftApi", "", this, new Object[0]);
        }
    }

    @Override // com.helpshift.xamarin.campaigns.HelpshiftInboxMessageDelegate
    public void coverImageDownloaded(String str) {
        n_coverImageDownloaded(str);
    }

    @Override // com.helpshift.xamarin.campaigns.HelpshiftInboxMessageDelegate
    public void iconImageDownloaded(String str) {
        n_iconImageDownloaded(str);
    }

    @Override // com.helpshift.xamarin.campaigns.HelpshiftInboxMessageDelegate
    public void inboxMessageAdded(HelpshiftInboxMessage helpshiftInboxMessage) {
        n_inboxMessageAdded(helpshiftInboxMessage);
    }

    @Override // com.helpshift.xamarin.campaigns.HelpshiftInboxMessageDelegate
    public void inboxMessageDeleted(String str) {
        n_inboxMessageDeleted(str);
    }

    @Override // com.helpshift.xamarin.campaigns.HelpshiftInboxMessageDelegate
    public void inboxMessageMarkedAsRead(String str) {
        n_inboxMessageMarkedAsRead(str);
    }

    @Override // com.helpshift.xamarin.campaigns.HelpshiftInboxMessageDelegate
    public void inboxMessageMarkedAsSeen(String str) {
        n_inboxMessageMarkedAsSeen(str);
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
