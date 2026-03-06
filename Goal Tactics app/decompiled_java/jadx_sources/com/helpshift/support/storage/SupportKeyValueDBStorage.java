package com.helpshift.support.storage;

import android.content.Context;
import com.helpshift.common.platform.AndroidNetworkRequestDAO;
import com.helpshift.common.platform.KVStore;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.storage.CachedKeyValueStorage;
import com.helpshift.storage.KeyValueStorage;
import java.io.Serializable;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public class SupportKeyValueDBStorage implements KVStore {
    private KeyValueStorage storage;

    public SupportKeyValueDBStorage(Context context) {
        this.storage = new CachedKeyValueStorage(new SupportRetryKeyValueDBStorage(context), getCacheWhitelistKeys());
    }

    private Set<String> getCacheWhitelistKeys() {
        return new HashSet(Arrays.asList(SDKConfigurationDM.SDK_LANGUAGE, SDKConfigurationDM.DISABLE_IN_APP_CONVERSATION, SDKConfigurationDM.DEBUG_LOG_LIMIT, SDKConfigurationDM.ENABLE_TYPING_INDICATOR_AGENT, SDKConfigurationDM.ENABLE_TYPING_INDICATOR, SDKConfigurationDM.ENABLE_FULL_PRIVACY, SDKConfigurationDM.SHOW_CONVERSATION_INFO_SCREEN, SDKConfigurationDM.RUNTIME_VERSION, SDKConfigurationDM.SDK_TYPE, SDKConfigurationDM.DISABLE_APP_LAUNCH_EVENT, SDKConfigurationDM.PLUGIN_VERSION, SDKConfigurationDM.PROFILE_FORM_ENABLE, SDKConfigurationDM.REQUIRE_NAME_AND_EMAIL, SDKConfigurationDM.REQUIRE_EMAIL, SDKConfigurationDM.HIDE_NAME_AND_EMAIL, SDKConfigurationDM.GOTO_CONVERSATION_AFTER_CONTACT_US, SDKConfigurationDM.SHOW_SEARCH_ON_NEW_CONVERSATION, SDKConfigurationDM.SUPPORT_NOTIFICATION_CHANNEL_ID, SDKConfigurationDM.NOTIFICATION_ICON_ID, SDKConfigurationDM.NOTIFICATION_LARGE_ICON_ID, SDKConfigurationDM.APP_REVIEWED, SDKConfigurationDM.DEFAULT_FALLBACK_LANGUAGE_ENABLE, SDKConfigurationDM.CONVERSATION_GREETING_MESSAGE, SDKConfigurationDM.CONVERSATIONAL_ISSUE_FILING, SDKConfigurationDM.SHOW_CONVERSATION_RESOLUTION_QUESTION_API, SDKConfigurationDM.SHOW_CONVERSATION_RESOLUTION_QUESTION_AGENT, SDKConfigurationDM.ALLOW_USER_ATTACHMENTS, AndroidNetworkRequestDAO.KEY_SERVER_TIME_DELTA, SDKConfigurationDM.HELPSHIFT_BRANDING_DISABLE_AGENT, "disableHelpshiftBranding", SDKConfigurationDM.PERIODIC_REVIEW_ENABLED, SDKConfigurationDM.PERIODIC_REVIEW_INTERVAL, SDKConfigurationDM.PERIODIC_REVIEW_TYPE, SDKConfigurationDM.CUSTOMER_SATISFACTION_SURVEY, SDKConfigurationDM.SHOULD_SHOW_CONVERSATION_HISTORY_AGENT, SDKConfigurationDM.ENABLE_DEFAULT_CONVERSATIONAL_FILING, SDKConfigurationDM.AVATAR_IMAGE_TEMPLATE_URL, SDKConfigurationDM.HEADER_IMAGE_LOCAL_PATH, SDKConfigurationDM.AGENT_FALLBACK_IMAGE_LOCAL_PATH, SDKConfigurationDM.BOT_FALLBACK_IMAGE_LOCAL_PATH, SDKConfigurationDM.HEADER_TITLE_TEXT));
    }

    @Override // com.helpshift.common.platform.KVStore
    public void setBoolean(String str, Boolean bool) {
        setOrRemoveKeyInternal(str, bool);
    }

    @Override // com.helpshift.common.platform.KVStore
    public void setInt(String str, Integer num) {
        setOrRemoveKeyInternal(str, num);
    }

    @Override // com.helpshift.common.platform.KVStore
    public void setFloat(String str, Float f) {
        setOrRemoveKeyInternal(str, f);
    }

    @Override // com.helpshift.common.platform.KVStore
    public void setLong(String str, Long l) {
        setOrRemoveKeyInternal(str, l);
    }

    @Override // com.helpshift.common.platform.KVStore
    public void setString(String str, String str2) {
        setOrRemoveKeyInternal(str, str2);
    }

    @Override // com.helpshift.common.platform.KVStore
    public Boolean getBoolean(String str) {
        Object obj = this.storage.get(str);
        if (obj == null) {
            return null;
        }
        return (Boolean) obj;
    }

    @Override // com.helpshift.common.platform.KVStore
    public Boolean getBoolean(String str, Boolean bool) {
        Object obj = this.storage.get(str);
        return obj == null ? bool : (Boolean) obj;
    }

    @Override // com.helpshift.common.platform.KVStore
    public Integer getInt(String str) {
        Object obj = this.storage.get(str);
        if (obj == null) {
            return null;
        }
        return (Integer) obj;
    }

    @Override // com.helpshift.common.platform.KVStore
    public Integer getInt(String str, Integer num) {
        Object obj = this.storage.get(str);
        return obj == null ? num : (Integer) obj;
    }

    @Override // com.helpshift.common.platform.KVStore
    public Float getFloat(String str) {
        Object obj = this.storage.get(str);
        if (obj == null) {
            return null;
        }
        return (Float) obj;
    }

    @Override // com.helpshift.common.platform.KVStore
    public Float getFloat(String str, Float f) {
        Object obj = this.storage.get(str);
        return obj == null ? f : (Float) obj;
    }

    @Override // com.helpshift.common.platform.KVStore
    public Long getLong(String str) {
        Object obj = this.storage.get(str);
        if (obj == null) {
            return null;
        }
        return (Long) obj;
    }

    @Override // com.helpshift.common.platform.KVStore
    public Long getLong(String str, Long l) {
        Object obj = this.storage.get(str);
        return obj == null ? l : (Long) obj;
    }

    @Override // com.helpshift.common.platform.KVStore
    public String getString(String str) {
        Object obj = this.storage.get(str);
        if (obj == null) {
            return null;
        }
        return (String) obj;
    }

    @Override // com.helpshift.common.platform.KVStore
    public String getString(String str, String str2) {
        Object obj = this.storage.get(str);
        return obj == null ? str2 : (String) obj;
    }

    @Override // com.helpshift.common.platform.KVStore
    public void setSerializable(String str, Serializable serializable) {
        setOrRemoveKeyInternal(str, serializable);
    }

    @Override // com.helpshift.common.platform.KVStore
    public Object getSerializable(String str) {
        return this.storage.get(str);
    }

    @Override // com.helpshift.common.platform.KVStore
    public void removeAllKeys() {
        this.storage.removeAllKeys();
    }

    @Override // com.helpshift.common.platform.KVStore
    public void setKeyValues(Map<String, Serializable> map) {
        this.storage.setKeyValues(map);
    }

    private void setOrRemoveKeyInternal(String str, Serializable serializable) {
        if (serializable == null) {
            this.storage.removeKey(str);
        } else {
            this.storage.set(str, serializable);
        }
    }
}
