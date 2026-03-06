package com.helpshift.common.domain;

import com.helpshift.account.AuthenticationFailureDM;
import com.helpshift.account.domainmodel.UserManagerDM;
import com.helpshift.analytics.domainmodel.AnalyticsEventDM;
import com.helpshift.auth.domainmodel.WebSocketAuthDM;
import com.helpshift.cif.CustomIssueFieldDM;
import com.helpshift.common.AutoRetryFailedEventDM;
import com.helpshift.common.HSBlockReason;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.poller.Delay;
import com.helpshift.common.poller.HttpBackoff;
import com.helpshift.configuration.domainmodel.ConfigFetchDM;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.conversation.domainmodel.ConversationInboxManagerDM;
import com.helpshift.conversation.smartintent.SmartIntentDM;
import com.helpshift.crypto.CryptoDM;
import com.helpshift.delegate.RootDelegate;
import com.helpshift.delegate.UIThreadDelegateDecorator;
import com.helpshift.faq.FaqsDM;
import com.helpshift.localeprovider.domainmodel.LocaleProviderDM;
import com.helpshift.logger.ErrorReportsDM;
import com.helpshift.meta.MetaDataDM;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes2.dex */
public class Domain {
    private AnalyticsEventDM analyticsEventDM;
    private AttachmentFileManagerDM attachmentFileManagerDM;
    private Threader attachmentUploadThreader;
    private AuthenticationFailureDM authenticationFailureDM;
    private AutoRetryFailedEventDM autoRetryFailedEventDM;
    private ConfigFetchDM configFetchDM;
    private ConversationInboxManagerDM conversationInboxManagerDM;
    private CryptoDM cryptoDM;
    private CustomIssueFieldDM customIssueFieldDM;
    private DelayedThreader delayedThreader;
    private ErrorReportsDM errorReportsDM;
    private FaqsDM faqsDM;
    private HSBlockReason hsBlockReason;
    private LocaleProviderDM localeProviderDM;
    private MetaDataDM metaDataDM;
    private Threader parallelThreader;
    private final Platform platform;
    private SDKConfigurationDM sdkConfigurationDM;
    private Threader serialThreader;
    private SmartIntentDM smartIntentDM;
    private UIThreadDelegateDecorator uiThreadDelegateDecorator = new UIThreadDelegateDecorator(this);
    private UserManagerDM userManagerDM;
    private WebSocketAuthDM webSocketAuthDM;

    public Domain(Platform platform) {
        this.platform = platform;
        this.autoRetryFailedEventDM = new AutoRetryFailedEventDM(this, platform, new HttpBackoff.Builder().setBaseInterval(Delay.of(5L, TimeUnit.SECONDS)).setMaxInterval(Delay.of(60L, TimeUnit.SECONDS)).setMaxAttempts(10).setRandomness(0.1f).setMultiplier(2.0f).setRetryPolicy(HttpBackoff.RetryPolicy.FAILURE).build());
        UserManagerDM userManagerDM = new UserManagerDM(platform, this);
        this.userManagerDM = userManagerDM;
        userManagerDM.init();
        this.serialThreader = new BackgroundThreader(Executors.newSingleThreadExecutor(new HSThreadFactory("core-s")));
        this.attachmentUploadThreader = new BackgroundThreader(Executors.newSingleThreadExecutor(new HSThreadFactory("core-at")));
        this.parallelThreader = new BackgroundThreader(Executors.newCachedThreadPool(new HSThreadFactory("core-p")));
        this.sdkConfigurationDM = new SDKConfigurationDM(this, platform);
        this.configFetchDM = new ConfigFetchDM(platform, this);
        this.metaDataDM = new MetaDataDM(this, platform, this.sdkConfigurationDM);
        this.analyticsEventDM = new AnalyticsEventDM(this, platform);
        this.conversationInboxManagerDM = new ConversationInboxManagerDM(platform, this, this.userManagerDM);
        this.localeProviderDM = new LocaleProviderDM(this.sdkConfigurationDM, platform);
        this.authenticationFailureDM = new AuthenticationFailureDM(this);
    }

    public Threader getSerialThreader() {
        return this.serialThreader;
    }

    public Threader getParallelThreader() {
        return this.parallelThreader;
    }

    public Threader getAttachmentUploadThreader() {
        return this.attachmentUploadThreader;
    }

    private synchronized DelayedThreader getDelayedThreader() {
        if (this.delayedThreader == null) {
            this.delayedThreader = new BackgroundDelayedThreader(Executors.newScheduledThreadPool(1, new HSThreadFactory("core-d")));
        }
        return this.delayedThreader;
    }

    public UserManagerDM getUserManagerDM() {
        return this.userManagerDM;
    }

    public ConversationInboxManagerDM getConversationInboxManagerDM() {
        return this.conversationInboxManagerDM;
    }

    public SDKConfigurationDM getSDKConfigurationDM() {
        return this.sdkConfigurationDM;
    }

    public ConfigFetchDM getConfigFetchDM() {
        return this.configFetchDM;
    }

    public AnalyticsEventDM getAnalyticsEventDM() {
        return this.analyticsEventDM;
    }

    public UIThreadDelegateDecorator getDelegate() {
        return this.uiThreadDelegateDecorator;
    }

    public void setDelegate(RootDelegate rootDelegate) {
        if (rootDelegate != null) {
            this.uiThreadDelegateDecorator.setDelegate(rootDelegate);
        }
    }

    public MetaDataDM getMetaDataDM() {
        return this.metaDataDM;
    }

    public synchronized CustomIssueFieldDM getCustomIssueFieldDM() {
        if (this.customIssueFieldDM == null) {
            this.customIssueFieldDM = new CustomIssueFieldDM(this, this.platform);
        }
        return this.customIssueFieldDM;
    }

    public synchronized CryptoDM getCryptoDM() {
        if (this.cryptoDM == null) {
            this.cryptoDM = new CryptoDM();
        }
        return this.cryptoDM;
    }

    public synchronized FaqsDM getFaqsDM() {
        if (this.faqsDM == null) {
            this.faqsDM = new FaqsDM(this, this.platform);
        }
        return this.faqsDM;
    }

    public synchronized WebSocketAuthDM getWebSocketAuthDM() {
        if (this.webSocketAuthDM == null) {
            this.webSocketAuthDM = new WebSocketAuthDM(this, this.platform);
        }
        return this.webSocketAuthDM;
    }

    public LocaleProviderDM getLocaleProviderDM() {
        return this.localeProviderDM;
    }

    public synchronized AttachmentFileManagerDM getAttachmentFileManagerDM() {
        if (this.attachmentFileManagerDM == null) {
            this.attachmentFileManagerDM = new AttachmentFileManagerDM(this, this.platform);
        }
        return this.attachmentFileManagerDM;
    }

    public void runSerial(F f) {
        getSerialThreader().thread(f).f();
    }

    public void runParallel(F f) {
        getParallelThreader().thread(f).f();
    }

    public void runOnUI(F f) {
        if (this.platform.isCurrentThreadUIThread()) {
            f.f();
        } else {
            this.platform.getUIThreader().thread(f).f();
        }
    }

    public void runDelayed(F f, long j) {
        getDelayedThreader().thread(f, j).f();
    }

    public void runDelayedInParallel(final F f, long j) {
        runDelayed(new F() { // from class: com.helpshift.common.domain.Domain.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                Domain.this.runParallel(f);
            }
        }, j);
    }

    public AutoRetryFailedEventDM getAutoRetryFailedEventDM() {
        return this.autoRetryFailedEventDM;
    }

    public AuthenticationFailureDM getAuthenticationFailureDM() {
        return this.authenticationFailureDM;
    }

    public synchronized ErrorReportsDM getErrorReportsDM() {
        if (this.errorReportsDM == null) {
            this.errorReportsDM = new ErrorReportsDM(this.platform, this);
        }
        return this.errorReportsDM;
    }

    public synchronized SmartIntentDM getSmartIntentDM() {
        if (this.smartIntentDM == null) {
            this.smartIntentDM = new SmartIntentDM(this.platform, this);
        }
        return this.smartIntentDM;
    }

    public HSBlockReason getReasonForBlockAPI() {
        return this.hsBlockReason;
    }

    public void blockPublicAPI(HSBlockReason hSBlockReason) {
        this.hsBlockReason = hSBlockReason;
    }
}
