package com.helpshift.common.platform;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import androidx.core.app.NotificationCompat;
import com.helpshift.PluginEventBridge;
import com.helpshift.R;
import com.helpshift.account.dao.AndroidClearedUserDAO;
import com.helpshift.account.dao.AndroidLegacyAnalyticsEventIDDAO;
import com.helpshift.account.dao.AndroidLegacyProfileMigrationDAO;
import com.helpshift.account.dao.AndroidRedactionDAO;
import com.helpshift.account.dao.AndroidUserDAO;
import com.helpshift.account.dao.AndroidUserManagerDAO;
import com.helpshift.account.dao.ClearedUserDAO;
import com.helpshift.account.dao.UserDAO;
import com.helpshift.account.dao.UserDB;
import com.helpshift.account.dao.UserManagerDAO;
import com.helpshift.analytics.AnalyticsEventDAO;
import com.helpshift.android.commons.downloader.HsUriUtils;
import com.helpshift.cif.dao.CustomIssueFieldDAO;
import com.helpshift.common.dao.BackupDAO;
import com.helpshift.common.domain.F;
import com.helpshift.common.domain.Threader;
import com.helpshift.common.domain.network.dao.HSNetworkMetadataDAO;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.network.HTTPTransport;
import com.helpshift.common.platform.network.NetworkRequestDAO;
import com.helpshift.common.platform.network.ResponseParser;
import com.helpshift.conversation.dao.ConversationDAO;
import com.helpshift.conversation.dao.ConversationInboxDAO;
import com.helpshift.conversation.dao.FAQSuggestionsDAO;
import com.helpshift.conversation.dto.AttachmentPickerFile;
import com.helpshift.conversation.smartintent.dao.SmartIntentDAO;
import com.helpshift.downloader.SupportDownloader;
import com.helpshift.faq.dao.FaqEventDAO;
import com.helpshift.faq.domainmodel.FAQSearchDM;
import com.helpshift.meta.dao.MetaDataDAO;
import com.helpshift.migration.LegacyAnalyticsEventIDDAO;
import com.helpshift.migration.LegacyProfileMigrationDAO;
import com.helpshift.notifications.NotificationChannelsManager;
import com.helpshift.providers.CrossModuleDataProvider;
import com.helpshift.providers.ICampaignsModuleAPIs;
import com.helpshift.redaction.RedactionDAO;
import com.helpshift.support.HSApiData;
import com.helpshift.support.storage.AndroidAnalyticsEventDAO;
import com.helpshift.support.storage.SupportKeyValueDBStorage;
import com.helpshift.support.util.AttachmentUtil;
import com.helpshift.support.util.SupportNotification;
import com.helpshift.util.AndroidFileUtil;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftConnectionUtil;
import com.helpshift.util.LocaleContextUtil;
import java.io.IOException;

/* JADX INFO: loaded from: classes2.dex */
public class AndroidPlatform implements Platform {
    private static final String TAG = "AndroidPlatform";
    private AnalyticsEventDAO analyticsEventDAO;
    private String apiKey;
    private String appId;
    private BackupDAO backupDAO;
    private ClearedUserDAO clearedUserDAO;
    private final Context context;
    private ConversationDAO conversationDAO;
    private ConversationInboxDAO conversationInboxDAO;
    private CustomIssueFieldDAO customIssueFieldDAO;
    private HSApiData data;
    private Device device;
    private String domain;
    private SupportDownloader downloader;
    private FaqEventDAO faqEventDAO;
    private FAQSearchDM faqSearchDM;
    private HSNetworkMetadataDAO hsNetworkMetadataDAO;
    private Jsonifier jsonifier;
    private LegacyAnalyticsEventIDDAO legacyAnalyticsEventIDDAO;
    private LegacyProfileMigrationDAO legacyProfileMigrationDAO;
    private MetaDataDAO metaDataDAO;
    private NetworkRequestDAO networkRequestDAO;
    private RedactionDAO redactionDAO;
    private SmartIntentDAO smartIntentDAO;
    private KVStore storage;
    private Context uiContext;
    private Threader uiThreader;
    private UserDAO userDAO;
    private AndroidUserManagerDAO userManagerDAO;

    public AndroidPlatform(Context context, String str, String str2, String str3) {
        this.context = context;
        this.apiKey = str;
        this.domain = str2;
        this.appId = str3;
        this.storage = new SupportKeyValueDBStorage(context);
        AndroidBackupDAO androidBackupDAO = new AndroidBackupDAO();
        this.backupDAO = androidBackupDAO;
        AndroidDevice androidDevice = new AndroidDevice(context, this.storage, androidBackupDAO);
        androidDevice.updateDeviceIdInBackupDAO();
        this.device = androidDevice;
        this.userDAO = new AndroidUserDAO(UserDB.getInstance(context));
        this.userManagerDAO = new AndroidUserManagerDAO(this.storage);
        this.clearedUserDAO = new AndroidClearedUserDAO(UserDB.getInstance(context));
        this.jsonifier = new AndroidJsonifier();
        this.analyticsEventDAO = new AndroidAnalyticsEventDAO(this.storage);
        this.metaDataDAO = new AndroidMetadataDAO(this.storage);
    }

    @Override // com.helpshift.common.platform.Platform
    public String getAPIKey() {
        return this.apiKey;
    }

    @Override // com.helpshift.common.platform.Platform
    public String getDomain() {
        return this.domain;
    }

    @Override // com.helpshift.common.platform.Platform
    public String getAppId() {
        return this.appId;
    }

    @Override // com.helpshift.common.platform.Platform
    public Device getDevice() {
        return this.device;
    }

    @Override // com.helpshift.common.platform.Platform
    public synchronized ConversationInboxDAO getConversationInboxDAO() {
        if (this.conversationInboxDAO == null) {
            this.conversationInboxDAO = new AndroidConversationInboxDAO(this.context, getKVStore());
        }
        return this.conversationInboxDAO;
    }

    @Override // com.helpshift.common.platform.Platform
    public synchronized ConversationDAO getConversationDAO() {
        if (this.conversationDAO == null) {
            this.conversationDAO = new AndroidConversationDAO(this.context);
        }
        return this.conversationDAO;
    }

    @Override // com.helpshift.common.platform.Platform
    public synchronized FAQSuggestionsDAO getFAQSuggestionsDAO() {
        if (this.conversationDAO == null) {
            this.conversationDAO = new AndroidConversationDAO(this.context);
        }
        return (FAQSuggestionsDAO) this.conversationDAO;
    }

    @Override // com.helpshift.common.platform.Platform
    public MetaDataDAO getMetaDataDAO() {
        return this.metaDataDAO;
    }

    @Override // com.helpshift.common.platform.Platform
    public AnalyticsEventDAO getAnalyticsEventDAO() {
        return this.analyticsEventDAO;
    }

    @Override // com.helpshift.common.platform.Platform
    public synchronized CustomIssueFieldDAO getCustomIssueFieldDAO() {
        if (this.customIssueFieldDAO == null) {
            this.customIssueFieldDAO = new AndroidCustomIssueFieldDAO(getKVStore());
        }
        return this.customIssueFieldDAO;
    }

    @Override // com.helpshift.common.platform.Platform
    public BackupDAO getBackupDAO() {
        return this.backupDAO;
    }

    @Override // com.helpshift.common.platform.Platform
    public ResponseParser getResponseParser() {
        return new AndroidResponseParser();
    }

    @Override // com.helpshift.common.platform.Platform
    public HTTPTransport getHTTPTransport() {
        return new AndroidHTTPTransport();
    }

    @Override // com.helpshift.common.platform.Platform
    public synchronized FAQSearchDM getFAQSearchDM() {
        if (this.faqSearchDM == null) {
            this.faqSearchDM = new AndroidFAQSearchDM(getData());
        }
        return this.faqSearchDM;
    }

    @Override // com.helpshift.common.platform.Platform
    public KVStore getKVStore() {
        return this.storage;
    }

    @Override // com.helpshift.common.platform.Platform
    public Jsonifier getJsonifier() {
        return this.jsonifier;
    }

    @Override // com.helpshift.common.platform.Platform
    public UserManagerDAO getUserManagerDAO() {
        return this.userManagerDAO;
    }

    @Override // com.helpshift.common.platform.Platform
    public UserDAO getUserDAO() {
        return this.userDAO;
    }

    @Override // com.helpshift.common.platform.Platform
    public ClearedUserDAO getClearedUserDAO() {
        return this.clearedUserDAO;
    }

    @Override // com.helpshift.common.platform.Platform
    public synchronized NetworkRequestDAO getNetworkRequestDAO() {
        if (this.networkRequestDAO == null) {
            this.networkRequestDAO = new AndroidNetworkRequestDAO(getKVStore());
        }
        return this.networkRequestDAO;
    }

    @Override // com.helpshift.common.platform.Platform
    public synchronized FaqEventDAO getFaqEventDAO() {
        if (this.faqEventDAO == null) {
            this.faqEventDAO = new AndroidFaqEventDAO(getKVStore());
        }
        return this.faqEventDAO;
    }

    @Override // com.helpshift.common.platform.Platform
    public boolean isCurrentThreadUIThread() {
        return Looper.myLooper() == Looper.getMainLooper();
    }

    @Override // com.helpshift.common.platform.Platform
    public synchronized Threader getUIThreader() {
        if (this.uiThreader == null) {
            this.uiThreader = new Threader() { // from class: com.helpshift.common.platform.AndroidPlatform.1
                @Override // com.helpshift.common.domain.Threader
                public F thread(final F f) {
                    return new F() { // from class: com.helpshift.common.platform.AndroidPlatform.1.1
                        @Override // com.helpshift.common.domain.F
                        public void f() {
                            new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.helpshift.common.platform.AndroidPlatform.1.1.1
                                @Override // java.lang.Runnable
                                public void run() {
                                    f.f();
                                }
                            });
                        }
                    };
                }
            };
        }
        return this.uiThreader;
    }

    @Override // com.helpshift.common.platform.Platform
    public synchronized SupportDownloader getDownloader() {
        if (this.downloader == null) {
            this.downloader = new AndroidSupportDownloader(this.context, getKVStore());
        }
        return this.downloader;
    }

    @Override // com.helpshift.common.platform.Platform
    public boolean isSupportedMimeType(String str) {
        return AndroidFileUtil.isSupportedMimeType(str);
    }

    @Override // com.helpshift.common.platform.Platform
    public String getMimeTypeForFile(String str) {
        return AndroidFileUtil.getMimeType(str);
    }

    @Override // com.helpshift.common.platform.Platform
    public String compressAndStoreScreenshot(String str) {
        try {
            String strCopyAttachment = AttachmentUtil.copyAttachment(str);
            if (strCopyAttachment != null) {
                str = strCopyAttachment;
            }
        } catch (IOException e) {
            HSLogger.d(TAG, "Saving attachment", e);
        }
        return str;
    }

    @Override // com.helpshift.common.platform.Platform
    public void compressAndCopyAttachment(AttachmentPickerFile attachmentPickerFile) throws RootAPIException {
        try {
            AttachmentUtil.copyAttachment(attachmentPickerFile);
        } catch (Exception e) {
            throw RootAPIException.wrap(e);
        }
    }

    @Override // com.helpshift.common.platform.Platform
    public int getMinimumConversationDescriptionLength() {
        Context context = this.uiContext;
        if (context == null) {
            context = this.context;
        }
        return context.getResources().getInteger(R.integer.hs__issue_description_min_chars);
    }

    @Override // com.helpshift.common.platform.Platform
    public void showNotification(Long l, String str, int i, String str2, boolean z) {
        Context contextWithUpdatedLocale = this.uiContext;
        if (contextWithUpdatedLocale == null) {
            contextWithUpdatedLocale = LocaleContextUtil.getContextWithUpdatedLocale(this.context);
        }
        NotificationCompat.Builder builderCreateNotification = SupportNotification.createNotification(contextWithUpdatedLocale, l, str, i, str2);
        if (builderCreateNotification != null) {
            ApplicationUtil.showNotification(this.context, str, new NotificationChannelsManager(this.context).attachChannelId(builderCreateNotification.build(), NotificationChannelsManager.NotificationChannelType.SUPPORT));
            if (z) {
                PluginEventBridge.sendMessage("didReceiveInAppNotificationCount", "" + i);
            }
        }
    }

    @Override // com.helpshift.common.platform.Platform
    public void clearNotifications(String str) {
        ApplicationUtil.cancelNotification(this.context, str, 1);
    }

    @Override // com.helpshift.common.platform.Platform
    public ICampaignsModuleAPIs getCampaignModuleAPIs() {
        return CrossModuleDataProvider.getCampaignModuleAPIs();
    }

    @Override // com.helpshift.common.platform.Platform
    public boolean isOnline() {
        return HelpshiftConnectionUtil.isOnline(this.context);
    }

    @Override // com.helpshift.common.platform.Platform
    public void setUIContext(Object obj) {
        if (obj == null) {
            this.uiContext = null;
        } else if (obj instanceof Context) {
            this.uiContext = (Context) obj;
        }
    }

    @Override // com.helpshift.common.platform.Platform
    public synchronized LegacyProfileMigrationDAO getLegacyUserMigrationDataSource() {
        if (this.legacyProfileMigrationDAO == null) {
            this.legacyProfileMigrationDAO = new AndroidLegacyProfileMigrationDAO(UserDB.getInstance(this.context));
        }
        return this.legacyProfileMigrationDAO;
    }

    @Override // com.helpshift.common.platform.Platform
    public synchronized LegacyAnalyticsEventIDDAO getLegacyAnalyticsEventIDDAO() {
        if (this.legacyAnalyticsEventIDDAO == null) {
            this.legacyAnalyticsEventIDDAO = new AndroidLegacyAnalyticsEventIDDAO(UserDB.getInstance(this.context));
        }
        return this.legacyAnalyticsEventIDDAO;
    }

    @Override // com.helpshift.common.platform.Platform
    public synchronized RedactionDAO getRedactionDAO() {
        if (this.redactionDAO == null) {
            this.redactionDAO = new AndroidRedactionDAO(UserDB.getInstance(this.context));
        }
        return this.redactionDAO;
    }

    @Override // com.helpshift.common.platform.Platform
    public boolean canReadFileAtUri(String str) {
        return HsUriUtils.canReadFileAtUri(this.context, str);
    }

    @Override // com.helpshift.common.platform.Platform
    public synchronized SmartIntentDAO getSmartIntentDAO() {
        if (this.smartIntentDAO == null) {
            this.smartIntentDAO = new AndroidSmartIntentDAO(this.context);
        }
        return this.smartIntentDAO;
    }

    @Override // com.helpshift.common.platform.Platform
    public synchronized HSNetworkMetadataDAO getHSNetworkMetadataDAO() {
        if (this.hsNetworkMetadataDAO == null) {
            this.hsNetworkMetadataDAO = new AndroidHSNetworkMetadataDAO(this.context);
        }
        return this.hsNetworkMetadataDAO;
    }

    private synchronized HSApiData getData() {
        if (this.data == null) {
            this.data = new HSApiData(this.context);
        }
        return this.data;
    }
}
