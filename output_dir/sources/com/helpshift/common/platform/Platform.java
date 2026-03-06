package com.helpshift.common.platform;

import com.helpshift.account.dao.ClearedUserDAO;
import com.helpshift.account.dao.UserDAO;
import com.helpshift.account.dao.UserManagerDAO;
import com.helpshift.analytics.AnalyticsEventDAO;
import com.helpshift.cif.dao.CustomIssueFieldDAO;
import com.helpshift.common.dao.BackupDAO;
import com.helpshift.common.domain.Threader;
import com.helpshift.common.domain.network.dao.HSNetworkMetadataDAO;
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
import com.helpshift.providers.ICampaignsModuleAPIs;
import com.helpshift.redaction.RedactionDAO;

/* JADX INFO: loaded from: classes2.dex */
public interface Platform {
    boolean canReadFileAtUri(String str);

    void clearNotifications(String str);

    void compressAndCopyAttachment(AttachmentPickerFile attachmentPickerFile);

    String compressAndStoreScreenshot(String str);

    String getAPIKey();

    AnalyticsEventDAO getAnalyticsEventDAO();

    String getAppId();

    BackupDAO getBackupDAO();

    ICampaignsModuleAPIs getCampaignModuleAPIs();

    ClearedUserDAO getClearedUserDAO();

    ConversationDAO getConversationDAO();

    ConversationInboxDAO getConversationInboxDAO();

    CustomIssueFieldDAO getCustomIssueFieldDAO();

    Device getDevice();

    String getDomain();

    SupportDownloader getDownloader();

    FAQSearchDM getFAQSearchDM();

    FAQSuggestionsDAO getFAQSuggestionsDAO();

    FaqEventDAO getFaqEventDAO();

    HSNetworkMetadataDAO getHSNetworkMetadataDAO();

    HTTPTransport getHTTPTransport();

    Jsonifier getJsonifier();

    KVStore getKVStore();

    LegacyAnalyticsEventIDDAO getLegacyAnalyticsEventIDDAO();

    LegacyProfileMigrationDAO getLegacyUserMigrationDataSource();

    MetaDataDAO getMetaDataDAO();

    String getMimeTypeForFile(String str);

    int getMinimumConversationDescriptionLength();

    NetworkRequestDAO getNetworkRequestDAO();

    RedactionDAO getRedactionDAO();

    ResponseParser getResponseParser();

    SmartIntentDAO getSmartIntentDAO();

    Threader getUIThreader();

    UserDAO getUserDAO();

    UserManagerDAO getUserManagerDAO();

    boolean isCurrentThreadUIThread();

    boolean isOnline();

    boolean isSupportedMimeType(String str);

    void setUIContext(Object obj);

    void showNotification(Long l, String str, int i, String str2, boolean z);
}
