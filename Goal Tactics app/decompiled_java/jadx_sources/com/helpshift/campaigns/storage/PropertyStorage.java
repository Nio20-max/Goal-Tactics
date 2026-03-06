package com.helpshift.campaigns.storage;

import com.helpshift.campaigns.models.PropertyValue;
import java.util.HashMap;

/* JADX INFO: loaded from: classes.dex */
public interface PropertyStorage {
    HashMap<String, PropertyValue> getAllProperties(String str);

    HashMap<String, PropertyValue> getAllSecondaryProperties(String str);

    PropertyValue getProperty(String str, String str2);

    PropertyValue getSecondaryProperty(String str, String str2);

    HashMap<String, PropertyValue> getUnsyncedProperties(String str);

    void initSecondaryStorage(String str);

    void initStorage(String str);

    void reinitSecondaryStorage(String str);

    void reinitStorage(String str);

    void removeProperty(String str, String str2);

    void removePropertySecondaryStorage(String str, String str2);

    void setProperty(String str, PropertyValue propertyValue, String str2);

    void setSecondaryProperty(String str, PropertyValue propertyValue, String str2);

    void setSecondaryPropertySyncStatus(Integer num, String[] strArr, String str);

    void setSyncStatus(Integer num, String str, String str2);

    void setSyncStatus(Integer num, String[] strArr, String str);
}
