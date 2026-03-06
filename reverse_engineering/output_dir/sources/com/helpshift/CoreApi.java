package com.helpshift;

import com.helpshift.account.domainmodel.UserManagerDM;
import com.helpshift.analytics.domainmodel.AnalyticsEventDM;
import com.helpshift.cif.CustomIssueFieldDM;
import com.helpshift.common.AutoRetryFailedEventDM;
import com.helpshift.common.domain.AttachmentFileManagerDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.configuration.domainmodel.ConfigFetchDM;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.configuration.dto.RootApiConfig;
import com.helpshift.configuration.dto.RootInstallConfig;
import com.helpshift.conversation.ConversationInboxPoller;
import com.helpshift.conversation.activeconversation.AttachmentPreviewRenderer;
import com.helpshift.conversation.activeconversation.ConversationInfoRenderer;
import com.helpshift.conversation.activeconversation.ConversationalRenderer;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.activeconversation.usersetup.ConversationSetupRenderer;
import com.helpshift.conversation.domainmodel.ConversationController;
import com.helpshift.conversation.viewmodel.AttachmentPreviewVM;
import com.helpshift.conversation.viewmodel.ConversationInfoVM;
import com.helpshift.conversation.viewmodel.ConversationSetupVM;
import com.helpshift.conversation.viewmodel.ConversationalVM;
import com.helpshift.conversation.viewmodel.NewConversationRenderer;
import com.helpshift.conversation.viewmodel.NewConversationVM;
import com.helpshift.crypto.CryptoDM;
import com.helpshift.delegate.RootDelegate;
import com.helpshift.delegate.UIThreadDelegateDecorator;
import com.helpshift.faq.FaqsDM;
import com.helpshift.localeprovider.domainmodel.LocaleProviderDM;
import com.helpshift.logger.ErrorReportsDM;
import com.helpshift.meta.MetaDataDM;
import com.helpshift.util.FetchDataFromThread;
import com.helpshift.util.ValuePair;

/* JADX INFO: loaded from: classes.dex */
public interface CoreApi {
    boolean clearAnonymousUser();

    Conversation getActiveConversation();

    Conversation getActiveConversationOrPreIssue();

    AnalyticsEventDM getAnalyticsEventDM();

    AttachmentFileManagerDM getAttachmentFileManagerDM();

    AttachmentPreviewVM getAttachmentPreviewModel(AttachmentPreviewRenderer attachmentPreviewRenderer);

    AutoRetryFailedEventDM getAutoRetryFailedEventDM();

    ConfigFetchDM getConfigFetchDM();

    ConversationController getConversationController();

    ConversationInboxPoller getConversationInboxPoller();

    ConversationInfoVM getConversationInfoViewModel(ConversationInfoRenderer conversationInfoRenderer);

    ConversationSetupVM getConversationSetupVM(ConversationSetupRenderer conversationSetupRenderer);

    ConversationalVM getConversationalViewModel(boolean z, Long l, ConversationalRenderer conversationalRenderer, boolean z2);

    CryptoDM getCryptoDM();

    CustomIssueFieldDM getCustomIssueFieldDM();

    UIThreadDelegateDecorator getDelegate();

    Domain getDomain();

    ErrorReportsDM getErrorReportsDM();

    FaqsDM getFaqDM();

    LocaleProviderDM getLocaleProviderDM();

    MetaDataDM getMetaDataDM();

    NewConversationVM getNewConversationViewModel(NewConversationRenderer newConversationRenderer);

    void getNotificationCountAsync(FetchDataFromThread<ValuePair<Integer, Boolean>, Object> fetchDataFromThread);

    int getNotificationCountSync();

    SDKConfigurationDM getSDKConfigurationDM();

    UserManagerDM getUserManagerDM();

    void handlePushNotification(String str, String str2, String str3);

    boolean isActiveConversationActionable();

    boolean isSDKSessionActive();

    boolean login(HelpshiftUser helpshiftUser);

    boolean logout();

    void onSDKSessionEnded();

    void onSDKSessionStarted();

    void refreshPoller();

    void resetPreIssueConversations();

    void resetUsersSyncStatusAndStartSetupForActiveUser();

    void sendAnalyticsEvent();

    void sendAppStartEvent();

    void sendFailedApiCalls();

    void sendRequestIdsForSuccessfulApiCalls();

    void setDelegateListener(RootDelegate rootDelegate);

    void setNameAndEmail(String str, String str2);

    void setPushToken(String str);

    void updateApiConfig(RootApiConfig rootApiConfig);

    void updateConversationExpiryProperties();

    void updateInstallConfig(RootInstallConfig rootInstallConfig);
}
