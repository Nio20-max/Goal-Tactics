package crc643b6637ff49d1db2a;

import com.helpshift.xamarin.WrappedHelpshiftUser;
import com.helpshift.xamarin.support.HelpshiftSupport;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class WrapperSupportDelegate implements IGCUserPeer, HelpshiftSupport.Delegate {
    public static final String __md_methods = "n_authenticationFailed:(Lcom/helpshift/xamarin/WrappedHelpshiftUser;I)V:GetAuthenticationFailed_Lcom_helpshift_xamarin_WrappedHelpshiftUser_IHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_conversationEnded:()V:GetConversationEndedHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_didCheckIfConversationActive:(Z)V:GetDidCheckIfConversationActive_ZHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_didReceiveNotification:(I)V:GetDidReceiveNotification_IHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_didReceiveUnreadMessagesCount:(I)V:GetDidReceiveUnreadMessagesCount_IHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_handleTapOnAttachmentFile:(Ljava/lang/String;)V:GetHandleTapOnAttachmentFile_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_newConversationStarted:(Ljava/lang/String;)V:GetNewConversationStarted_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_sessionBegan:()V:GetSessionBeganHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_sessionEnded:()V:GetSessionEndedHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_userClickOnAction:(Ljava/lang/String;Ljava/lang/String;)V:GetUserClickOnAction_Ljava_lang_String_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_userCompletedCustomerSatisfactionSurvey:(ILjava/lang/String;)V:GetUserCompletedCustomerSatisfactionSurvey_ILjava_lang_String_Handler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_userRepliedToConversation:(Ljava/lang/String;)V:GetUserRepliedToConversation_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\n";
    private ArrayList refList;

    private native void n_authenticationFailed(WrappedHelpshiftUser wrappedHelpshiftUser, int i);

    private native void n_conversationEnded();

    private native void n_didCheckIfConversationActive(boolean z);

    private native void n_didReceiveNotification(int i);

    private native void n_didReceiveUnreadMessagesCount(int i);

    private native void n_handleTapOnAttachmentFile(String str);

    private native void n_newConversationStarted(String str);

    private native void n_sessionBegan();

    private native void n_sessionEnded();

    private native void n_userClickOnAction(String str, String str2);

    private native void n_userCompletedCustomerSatisfactionSurvey(int i, String str);

    private native void n_userRepliedToConversation(String str);

    static {
        Runtime.register("HelpshiftApi.WrapperSupportDelegate, HelpshiftApi", WrapperSupportDelegate.class, __md_methods);
    }

    public WrapperSupportDelegate() {
        if (getClass() == WrapperSupportDelegate.class) {
            TypeManager.Activate("HelpshiftApi.WrapperSupportDelegate, HelpshiftApi", "", this, new Object[0]);
        }
    }

    @Override // com.helpshift.xamarin.support.HelpshiftSupport.Delegate
    public void authenticationFailed(WrappedHelpshiftUser wrappedHelpshiftUser, int i) {
        n_authenticationFailed(wrappedHelpshiftUser, i);
    }

    @Override // com.helpshift.xamarin.support.HelpshiftSupport.Delegate
    public void conversationEnded() {
        n_conversationEnded();
    }

    @Override // com.helpshift.xamarin.support.HelpshiftSupport.Delegate
    public void didCheckIfConversationActive(boolean z) {
        n_didCheckIfConversationActive(z);
    }

    @Override // com.helpshift.xamarin.support.HelpshiftSupport.Delegate
    public void didReceiveNotification(int i) {
        n_didReceiveNotification(i);
    }

    @Override // com.helpshift.xamarin.support.HelpshiftSupport.Delegate
    public void didReceiveUnreadMessagesCount(int i) {
        n_didReceiveUnreadMessagesCount(i);
    }

    @Override // com.helpshift.xamarin.support.HelpshiftSupport.Delegate
    public void handleTapOnAttachmentFile(String str) {
        n_handleTapOnAttachmentFile(str);
    }

    @Override // com.helpshift.xamarin.support.HelpshiftSupport.Delegate
    public void newConversationStarted(String str) {
        n_newConversationStarted(str);
    }

    @Override // com.helpshift.xamarin.support.HelpshiftSupport.Delegate
    public void sessionBegan() {
        n_sessionBegan();
    }

    @Override // com.helpshift.xamarin.support.HelpshiftSupport.Delegate
    public void sessionEnded() {
        n_sessionEnded();
    }

    @Override // com.helpshift.xamarin.support.HelpshiftSupport.Delegate
    public void userClickOnAction(String str, String str2) {
        n_userClickOnAction(str, str2);
    }

    @Override // com.helpshift.xamarin.support.HelpshiftSupport.Delegate
    public void userCompletedCustomerSatisfactionSurvey(int i, String str) {
        n_userCompletedCustomerSatisfactionSurvey(i, str);
    }

    @Override // com.helpshift.xamarin.support.HelpshiftSupport.Delegate
    public void userRepliedToConversation(String str) {
        n_userRepliedToConversation(str);
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
