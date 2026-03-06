package com.helpshift;

import com.helpshift.account.domainmodel.UserLoginManager;
import com.helpshift.account.domainmodel.UserManagerDM;
import com.helpshift.analytics.domainmodel.AnalyticsEventDM;
import com.helpshift.cif.CustomIssueFieldDM;
import com.helpshift.common.AutoRetryFailedEventDM;
import com.helpshift.common.domain.AttachmentFileManagerDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.domain.Threader;
import com.helpshift.common.domain.network.POSTNetwork;
import com.helpshift.common.domain.network.TSCorrectedNetwork;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.platform.network.RequestData;
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
import com.helpshift.conversation.domainmodel.ConversationInboxManagerDM;
import com.helpshift.conversation.domainmodel.ConversationSetupDM;
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
import java.util.HashMap;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public class JavaCore implements CoreApi {
    private static final String TAG = "Helpshift_JavaCore";
    final AnalyticsEventDM analyticsEventDM;
    private Domain domain;
    private boolean isSDKSessionActive = false;
    private final MetaDataDM metaDataDM;
    private final Threader parallelThreader;
    final Platform platform;
    final SDKConfigurationDM sdkConfigurationDM;
    private UserManagerDM userManagerDM;

    public JavaCore(Platform platform) {
        this.platform = platform;
        Domain domain = new Domain(platform);
        this.domain = domain;
        this.userManagerDM = domain.getUserManagerDM();
        this.parallelThreader = this.domain.getParallelThreader();
        this.sdkConfigurationDM = this.domain.getSDKConfigurationDM();
        this.analyticsEventDM = this.domain.getAnalyticsEventDM();
        this.metaDataDM = this.domain.getMetaDataDM();
    }

    @Override // com.helpshift.CoreApi
    public Domain getDomain() {
        return this.domain;
    }

    @Override // com.helpshift.CoreApi
    public NewConversationVM getNewConversationViewModel(NewConversationRenderer newConversationRenderer) {
        return new NewConversationVM(this.platform, this.domain, getConversationController(), newConversationRenderer);
    }

    @Override // com.helpshift.CoreApi
    public ConversationalVM getConversationalViewModel(boolean z, Long l, ConversationalRenderer conversationalRenderer, boolean z2) {
        return new ConversationalVM(this.platform, this.domain, getConversationController(), getConversationController().getViewableConversation(z, l), conversationalRenderer, z, z2);
    }

    @Override // com.helpshift.CoreApi
    public ConversationInfoVM getConversationInfoViewModel(ConversationInfoRenderer conversationInfoRenderer) {
        return new ConversationInfoVM(this.domain, conversationInfoRenderer);
    }

    @Override // com.helpshift.CoreApi
    public AttachmentPreviewVM getAttachmentPreviewModel(AttachmentPreviewRenderer attachmentPreviewRenderer) {
        return new AttachmentPreviewVM(this.domain, attachmentPreviewRenderer);
    }

    @Override // com.helpshift.CoreApi
    public Conversation getActiveConversation() {
        return getConversationController().getActiveConversationFromStorage();
    }

    @Override // com.helpshift.CoreApi
    public Conversation getActiveConversationOrPreIssue() {
        return getConversationController().getActiveConversationOrPreIssue();
    }

    @Override // com.helpshift.CoreApi
    public ConversationSetupVM getConversationSetupVM(ConversationSetupRenderer conversationSetupRenderer) {
        return new ConversationSetupVM(this.platform, this.domain, new ConversationSetupDM(this.platform, this.domain.getConfigFetchDM(), this.userManagerDM.getActiveUserSetupDM()), conversationSetupRenderer);
    }

    @Override // com.helpshift.CoreApi
    public boolean isActiveConversationActionable() {
        return getConversationController().isActiveConversationActionable();
    }

    @Override // com.helpshift.CoreApi
    public boolean isSDKSessionActive() {
        return this.isSDKSessionActive;
    }

    @Override // com.helpshift.CoreApi
    public void setDelegateListener(RootDelegate rootDelegate) {
        this.domain.setDelegate(rootDelegate);
    }

    @Override // com.helpshift.CoreApi
    public synchronized boolean clearAnonymousUser() {
        return new UserLoginManager(this, this.domain, this.platform).clearAnonymousUser();
    }

    @Override // com.helpshift.CoreApi
    public synchronized boolean login(HelpshiftUser helpshiftUser) {
        return new UserLoginManager(this, this.domain, this.platform).login(helpshiftUser);
    }

    @Override // com.helpshift.CoreApi
    public void setNameAndEmail(String str, String str2) {
        getConversationController().saveName(str);
        getConversationController().saveEmail(str2);
    }

    @Override // com.helpshift.CoreApi
    public synchronized boolean logout() {
        return new UserLoginManager(this, this.domain, this.platform).logout();
    }

    @Override // com.helpshift.CoreApi
    public void setPushToken(String str) {
        if (str == null || str.equals(this.platform.getDevice().getPushToken())) {
            return;
        }
        this.platform.getDevice().setPushToken(str);
        getUserManagerDM().resetPushTokenSyncStatusForUsers();
        getUserManagerDM().sendPushToken();
    }

    @Override // com.helpshift.CoreApi
    public void onSDKSessionStarted() {
        this.isSDKSessionActive = true;
        getDelegate().sessionBegan();
    }

    @Override // com.helpshift.CoreApi
    public void onSDKSessionEnded() {
        this.isSDKSessionActive = false;
        getDelegate().sessionEnded();
    }

    @Override // com.helpshift.CoreApi
    public void refreshPoller() {
        getConversationInboxPoller().refreshPoller(false);
    }

    @Override // com.helpshift.CoreApi
    public void updateInstallConfig(RootInstallConfig rootInstallConfig) {
        this.sdkConfigurationDM.updateInstallConfig(rootInstallConfig);
    }

    @Override // com.helpshift.CoreApi
    public void updateApiConfig(RootApiConfig rootApiConfig) {
        this.sdkConfigurationDM.updateApiConfig(rootApiConfig);
        if (rootApiConfig.enableFullPrivacy == null || !rootApiConfig.enableFullPrivacy.booleanValue()) {
            return;
        }
        new UserLoginManager(this, this.domain, this.platform).clearPersonallyIdentifiableInformation();
    }

    @Override // com.helpshift.CoreApi
    public void sendAnalyticsEvent() {
        runParallel(new F() { // from class: com.helpshift.JavaCore.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (JavaCore.this.analyticsEventDM != null) {
                    JavaCore.this.analyticsEventDM.sendEventsToServer(JavaCore.this.getUserManagerDM().getActiveUser());
                }
            }
        });
    }

    @Override // com.helpshift.CoreApi
    public AnalyticsEventDM getAnalyticsEventDM() {
        return this.analyticsEventDM;
    }

    @Override // com.helpshift.CoreApi
    public void sendAppStartEvent() {
        runParallel(new F() { // from class: com.helpshift.JavaCore.2
            @Override // com.helpshift.common.domain.F
            public void f() {
                JavaCore.this.analyticsEventDM.sendAppStartEvent(JavaCore.this.getUserManagerDM().getActiveUser());
            }
        });
    }

    @Override // com.helpshift.CoreApi
    public UIThreadDelegateDecorator getDelegate() {
        return this.domain.getDelegate();
    }

    @Override // com.helpshift.CoreApi
    public void sendFailedApiCalls() {
        getFaqDM();
        UserManagerDM userManagerDM = getUserManagerDM();
        getConversationController();
        userManagerDM.getActiveUserSetupDM();
        getAnalyticsEventDM();
        this.domain.getAutoRetryFailedEventDM().sendAllEvents();
    }

    @Override // com.helpshift.CoreApi
    public UserManagerDM getUserManagerDM() {
        return this.userManagerDM;
    }

    @Override // com.helpshift.CoreApi
    public MetaDataDM getMetaDataDM() {
        return this.metaDataDM;
    }

    @Override // com.helpshift.CoreApi
    public CustomIssueFieldDM getCustomIssueFieldDM() {
        return this.domain.getCustomIssueFieldDM();
    }

    @Override // com.helpshift.CoreApi
    public ConfigFetchDM getConfigFetchDM() {
        return this.domain.getConfigFetchDM();
    }

    @Override // com.helpshift.CoreApi
    public SDKConfigurationDM getSDKConfigurationDM() {
        return this.sdkConfigurationDM;
    }

    @Override // com.helpshift.CoreApi
    public ConversationInboxPoller getConversationInboxPoller() {
        return getConversationController().getConversationInboxPoller();
    }

    @Override // com.helpshift.CoreApi
    public void handlePushNotification(String str, String str2, String str3) {
        getConversationController().handlePushNotification(str, str2, str3);
    }

    @Override // com.helpshift.CoreApi
    public int getNotificationCountSync() {
        return getConversationController().getNotificationCountSync();
    }

    @Override // com.helpshift.CoreApi
    public void getNotificationCountAsync(final FetchDataFromThread<ValuePair<Integer, Boolean>, Object> fetchDataFromThread) {
        this.domain.runParallel(new F() { // from class: com.helpshift.JavaCore.3
            @Override // com.helpshift.common.domain.F
            public void f() {
                try {
                    ValuePair<Integer, Boolean> valuePairFetchConversationsAndGetNotificationCount = JavaCore.this.getConversationController().fetchConversationsAndGetNotificationCount();
                    if (fetchDataFromThread != null) {
                        if (valuePairFetchConversationsAndGetNotificationCount != null && valuePairFetchConversationsAndGetNotificationCount.first.intValue() >= 0) {
                            fetchDataFromThread.onDataFetched(valuePairFetchConversationsAndGetNotificationCount);
                        } else {
                            fetchDataFromThread.onFailure(valuePairFetchConversationsAndGetNotificationCount);
                        }
                    }
                } catch (Throwable th) {
                    FetchDataFromThread fetchDataFromThread2 = fetchDataFromThread;
                    if (fetchDataFromThread2 != null) {
                        fetchDataFromThread2.onFailure(null);
                    }
                    throw th;
                }
            }
        });
    }

    @Override // com.helpshift.CoreApi
    public ConversationController getConversationController() {
        return getConversationInboxManagerDM().getActiveConversationInboxDM();
    }

    @Override // com.helpshift.CoreApi
    public FaqsDM getFaqDM() {
        return this.domain.getFaqsDM();
    }

    @Override // com.helpshift.CoreApi
    public CryptoDM getCryptoDM() {
        return this.domain.getCryptoDM();
    }

    @Override // com.helpshift.CoreApi
    public LocaleProviderDM getLocaleProviderDM() {
        return this.domain.getLocaleProviderDM();
    }

    @Override // com.helpshift.CoreApi
    public AttachmentFileManagerDM getAttachmentFileManagerDM() {
        return this.domain.getAttachmentFileManagerDM();
    }

    @Override // com.helpshift.CoreApi
    public AutoRetryFailedEventDM getAutoRetryFailedEventDM() {
        return this.domain.getAutoRetryFailedEventDM();
    }

    @Override // com.helpshift.CoreApi
    public void sendRequestIdsForSuccessfulApiCalls() {
        this.domain.runParallel(new F() { // from class: com.helpshift.JavaCore.4
            @Override // com.helpshift.common.domain.F
            public void f() {
                TSCorrectedNetwork tSCorrectedNetwork = new TSCorrectedNetwork(new POSTNetwork("/clear-idempotent-cache/", JavaCore.this.domain, JavaCore.this.platform), JavaCore.this.platform);
                Set<String> allSuccessfulRequestIds = JavaCore.this.platform.getNetworkRequestDAO().getAllSuccessfulRequestIds();
                if (allSuccessfulRequestIds.isEmpty()) {
                    return;
                }
                String strJsonify = JavaCore.this.platform.getJsonifier().jsonify(allSuccessfulRequestIds);
                HashMap map = new HashMap();
                map.put("request_ids", strJsonify);
                tSCorrectedNetwork.makeRequest(new RequestData(map));
                JavaCore.this.platform.getNetworkRequestDAO().clearSuccessfulRequestIds();
            }
        });
    }

    @Override // com.helpshift.CoreApi
    public void resetPreIssueConversations() {
        this.domain.getConversationInboxManagerDM().resetPreIssueConversations();
    }

    ConversationInboxManagerDM getConversationInboxManagerDM() {
        return this.domain.getConversationInboxManagerDM();
    }

    @Override // com.helpshift.CoreApi
    public ErrorReportsDM getErrorReportsDM() {
        return this.domain.getErrorReportsDM();
    }

    private void runParallel(F f) {
        this.parallelThreader.thread(f).f();
    }

    @Override // com.helpshift.CoreApi
    public void resetUsersSyncStatusAndStartSetupForActiveUser() {
        getUserManagerDM().resetSyncStateForAllUsers();
        getUserManagerDM().getActiveUserSetupDM().startSetup();
    }

    @Override // com.helpshift.CoreApi
    public void updateConversationExpiryProperties() {
        ConversationController conversationController = getConversationController();
        if (conversationController != null) {
            conversationController.updateActiveConversationExpiryProperties();
        }
    }
}
