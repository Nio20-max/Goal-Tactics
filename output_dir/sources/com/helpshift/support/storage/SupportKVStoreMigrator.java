package com.helpshift.support.storage;

import com.helpshift.common.platform.AndroidDevice;
import com.helpshift.common.platform.KVStore;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.platform.network.NetworkRequestDAO;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.configuration.dto.RootApiConfig;
import com.helpshift.meta.dao.MetaDataDAO;
import com.helpshift.support.HSStorage;
import com.helpshift.support.util.ConfigUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.StringUtils;
import com.helpshift.util.VersionName;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class SupportKVStoreMigrator implements SDKMigrator {
    private static final String TAG = "Helpshift_KVStoreMigratorr";
    private HashMap<String, Serializable> customMetaData;
    private String deviceId;
    private Boolean enableTypingIndicator;
    private Boolean fullPrivacy;
    private Boolean gotoConversationAfterContactUs;
    private Boolean hideNameEmail;
    private HSStorage hsStorage;
    private KVStore kvStore;
    private MetaDataDAO metaDataDAO;
    private NetworkRequestDAO networkRequestDAO;
    private Boolean requireEmail;
    private SDKConfigurationDM sdkConfigurationDM = HelpshiftContext.getCoreApi().getSDKConfigurationDM();
    private float serverTimeDelta;
    private Boolean showConversationInfoScreen;
    private Boolean showConversationResolutionQuestion;
    private Boolean showSearchOnNewConversation;

    public SupportKVStoreMigrator(HSStorage hSStorage) {
        this.hsStorage = hSStorage;
        Platform platform = HelpshiftContext.getPlatform();
        this.networkRequestDAO = platform.getNetworkRequestDAO();
        this.metaDataDAO = platform.getMetaDataDAO();
        this.kvStore = HelpshiftContext.getPlatform().getKVStore();
    }

    @Override // com.helpshift.support.storage.SDKMigrator
    public void backup(VersionName versionName) {
        if (this.hsStorage.contains(SDKConfigurationDM.REQUIRE_EMAIL)) {
            this.requireEmail = this.hsStorage.storageGetBoolean(SDKConfigurationDM.REQUIRE_EMAIL);
        } else {
            this.requireEmail = Boolean.valueOf(this.sdkConfigurationDM.getBoolean(SDKConfigurationDM.REQUIRE_EMAIL));
        }
        if (this.hsStorage.contains(SDKConfigurationDM.ENABLE_FULL_PRIVACY)) {
            this.fullPrivacy = this.hsStorage.storageGetBoolean(SDKConfigurationDM.ENABLE_FULL_PRIVACY);
        } else {
            this.fullPrivacy = Boolean.valueOf(this.sdkConfigurationDM.getBoolean(SDKConfigurationDM.ENABLE_FULL_PRIVACY));
        }
        if (this.hsStorage.contains(SDKConfigurationDM.HIDE_NAME_AND_EMAIL)) {
            this.hideNameEmail = this.hsStorage.storageGetBoolean(SDKConfigurationDM.HIDE_NAME_AND_EMAIL);
        } else {
            this.hideNameEmail = Boolean.valueOf(this.sdkConfigurationDM.getBoolean(SDKConfigurationDM.HIDE_NAME_AND_EMAIL));
        }
        if (this.hsStorage.contains(SDKConfigurationDM.SHOW_SEARCH_ON_NEW_CONVERSATION)) {
            this.showSearchOnNewConversation = this.hsStorage.storageGetBoolean(SDKConfigurationDM.SHOW_SEARCH_ON_NEW_CONVERSATION);
        } else {
            this.showSearchOnNewConversation = Boolean.valueOf(this.sdkConfigurationDM.getBoolean(SDKConfigurationDM.SHOW_SEARCH_ON_NEW_CONVERSATION));
        }
        if (this.hsStorage.contains(SDKConfigurationDM.GOTO_CONVERSATION_AFTER_CONTACT_US)) {
            this.gotoConversationAfterContactUs = this.hsStorage.storageGetBoolean(SDKConfigurationDM.GOTO_CONVERSATION_AFTER_CONTACT_US);
        } else {
            this.gotoConversationAfterContactUs = Boolean.valueOf(this.sdkConfigurationDM.getBoolean(SDKConfigurationDM.GOTO_CONVERSATION_AFTER_CONTACT_US));
        }
        if (this.hsStorage.contains(SDKConfigurationDM.SHOW_CONVERSATION_RESOLUTION_QUESTION_API)) {
            this.showConversationResolutionQuestion = this.hsStorage.storageGetBoolean(SDKConfigurationDM.SHOW_CONVERSATION_RESOLUTION_QUESTION_API);
        } else {
            this.showConversationResolutionQuestion = Boolean.valueOf(this.sdkConfigurationDM.getBoolean(SDKConfigurationDM.SHOW_CONVERSATION_RESOLUTION_QUESTION_API));
        }
        if (this.hsStorage.contains(SDKConfigurationDM.SHOW_CONVERSATION_INFO_SCREEN)) {
            this.showConversationInfoScreen = this.hsStorage.storageGetBoolean(SDKConfigurationDM.SHOW_CONVERSATION_INFO_SCREEN);
        } else {
            this.showConversationInfoScreen = Boolean.valueOf(this.sdkConfigurationDM.getBoolean(SDKConfigurationDM.SHOW_CONVERSATION_INFO_SCREEN));
        }
        if (this.hsStorage.contains(SDKConfigurationDM.ENABLE_TYPING_INDICATOR)) {
            this.enableTypingIndicator = this.hsStorage.storageGetBoolean(SDKConfigurationDM.ENABLE_TYPING_INDICATOR);
        } else {
            this.enableTypingIndicator = Boolean.valueOf(this.sdkConfigurationDM.getBoolean(SDKConfigurationDM.ENABLE_TYPING_INDICATOR));
        }
        this.deviceId = this.kvStore.getString(AndroidDevice.KEY_DEVICE_ID);
        if (this.hsStorage.contains("serverTimeDelta")) {
            this.serverTimeDelta = this.hsStorage.storageGetFloat("serverTimeDelta").floatValue();
        } else {
            this.serverTimeDelta = this.networkRequestDAO.getServerTimeDelta();
        }
        if (this.hsStorage.contains("customMetaData")) {
            String string = this.hsStorage.getString("customMetaData");
            try {
                if (StringUtils.isEmpty(string)) {
                    return;
                }
                JSONObject jSONObject = new JSONObject(string);
                Iterator<String> itKeys = jSONObject.keys();
                this.customMetaData = new HashMap<>();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    Object obj = jSONObject.get(next);
                    if (obj instanceof Serializable) {
                        this.customMetaData.put(next, (Serializable) obj);
                    }
                }
                return;
            } catch (Exception e) {
                HSLogger.d(TAG, "Exception converting meta from storage", e);
                return;
            }
        }
        this.customMetaData = this.metaDataDAO.getCustomMetaData();
    }

    @Override // com.helpshift.support.storage.SDKMigrator
    public void restore() {
        HashMap map = new HashMap();
        map.put(SDKConfigurationDM.REQUIRE_EMAIL, this.requireEmail);
        map.put(SDKConfigurationDM.ENABLE_FULL_PRIVACY, this.fullPrivacy);
        map.put(SDKConfigurationDM.HIDE_NAME_AND_EMAIL, this.hideNameEmail);
        map.put(SDKConfigurationDM.SHOW_SEARCH_ON_NEW_CONVERSATION, this.showSearchOnNewConversation);
        map.put(SDKConfigurationDM.GOTO_CONVERSATION_AFTER_CONTACT_US, this.gotoConversationAfterContactUs);
        map.put(SDKConfigurationDM.SHOW_CONVERSATION_RESOLUTION_QUESTION_API, this.showConversationResolutionQuestion);
        map.put(SDKConfigurationDM.SHOW_CONVERSATION_INFO_SCREEN, this.showConversationInfoScreen);
        map.put(SDKConfigurationDM.ENABLE_TYPING_INDICATOR, this.enableTypingIndicator);
        HashMap map2 = new HashMap(ConfigUtil.getDefaultApiConfig());
        map2.putAll(map);
        HelpshiftContext.getCoreApi().updateApiConfig(new RootApiConfig.RootApiConfigBuilder().applyMap(map2).build());
        this.networkRequestDAO.storeServerTimeDelta(this.serverTimeDelta);
        this.metaDataDAO.saveCustomMetaData(this.customMetaData);
        if (StringUtils.isEmpty(this.deviceId)) {
            return;
        }
        this.kvStore.setString(AndroidDevice.KEY_DEVICE_ID, this.deviceId);
    }
}
