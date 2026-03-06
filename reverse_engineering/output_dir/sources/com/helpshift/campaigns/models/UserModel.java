package com.helpshift.campaigns.models;

import com.helpshift.campaigns.storage.PropertyStorage;
import com.helpshift.campaigns.util.constants.SyncStatus;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* JADX INFO: loaded from: classes.dex */
public class UserModel {
    public String email;
    public final String identifier;
    public String name;
    Map<String, PropertyValue> properties = new ConcurrentHashMap();
    PropertyStorage storage;

    public UserModel(String str, PropertyStorage propertyStorage) {
        this.identifier = str;
        this.storage = propertyStorage;
        HashMap<String, PropertyValue> allProperties = propertyStorage.getAllProperties(str);
        if (allProperties != null) {
            this.properties.putAll(allProperties);
        }
        PropertyValue property = propertyStorage.getProperty("name", str);
        if (property != null) {
            this.name = property.toString();
        }
        PropertyValue property2 = propertyStorage.getProperty("email", str);
        if (property2 != null) {
            this.email = property2.toString();
        }
    }

    public boolean addProperty(String str, PropertyValue propertyValue) {
        if (this.properties == null) {
            this.properties = new HashMap();
        }
        PropertyValue propertyValue2 = this.properties.get(str);
        boolean z = propertyValue2 == null || propertyValue2.setValue(propertyValue);
        if (z) {
            this.properties.put(str, propertyValue);
            this.storage.setProperty(str, propertyValue, this.identifier);
        }
        return z;
    }

    public ArrayList<String> addProperties(HashMap<String, PropertyValue> map) {
        ArrayList<String> arrayList = new ArrayList<>();
        for (Map.Entry<String, PropertyValue> entry : map.entrySet()) {
            if (addProperty(entry.getKey(), entry.getValue())) {
                arrayList.add(entry.getKey());
            }
        }
        return arrayList;
    }

    public HashMap<String, PropertyValue> getUnsyncedProperties() {
        HashMap<String, PropertyValue> map = new HashMap<>();
        Map<String, PropertyValue> map2 = this.properties;
        if (map2 != null) {
            for (Map.Entry<String, PropertyValue> entry : map2.entrySet()) {
                String key = entry.getKey();
                PropertyValue value = entry.getValue();
                if (value.getIsSynced().equals(SyncStatus.UNSYNCED)) {
                    map.put(key, value);
                }
            }
        }
        return map;
    }

    public HashMap<String, PropertyValue> getSyncedAndUnSyncedProperties() {
        HashMap<String, PropertyValue> map = new HashMap<>();
        Map<String, PropertyValue> map2 = this.properties;
        if (map2 != null) {
            for (Map.Entry<String, PropertyValue> entry : map2.entrySet()) {
                String key = entry.getKey();
                PropertyValue value = entry.getValue();
                if (value != null && (SyncStatus.UNSYNCED == value.getIsSynced() || SyncStatus.SYNCED == value.getIsSynced())) {
                    map.put(key, value);
                }
            }
        }
        return map;
    }

    public HashMap<String, PropertyValue> getSyncingProperties() {
        HashMap<String, PropertyValue> map = new HashMap<>();
        Map<String, PropertyValue> map2 = this.properties;
        if (map2 != null) {
            for (Map.Entry<String, PropertyValue> entry : map2.entrySet()) {
                String key = entry.getKey();
                PropertyValue value = entry.getValue();
                if (value.getIsSynced().equals(SyncStatus.SYNCING)) {
                    map.put(key, value);
                }
            }
        }
        return map;
    }

    public Map<String, PropertyValue> getAllProperties() {
        return this.properties;
    }

    public void checkAndMarkPropertiesAsSynced(List<String> list) {
        if (this.properties == null || list == null) {
            return;
        }
        ArrayList arrayList = new ArrayList();
        for (String str : list) {
            PropertyValue propertyValue = this.properties.get(str);
            if (propertyValue != null && propertyValue.getIsSynced().equals(SyncStatus.SYNCING)) {
                propertyValue.setIsSynced(SyncStatus.SYNCED);
                arrayList.add(str);
            }
        }
        this.storage.setSyncStatus(SyncStatus.SYNCED, (String[]) arrayList.toArray(new String[arrayList.size()]), this.identifier);
    }

    public void setSyncStatus(Integer num, ArrayList<String> arrayList) {
        if (this.properties == null || arrayList == null) {
            return;
        }
        Iterator<String> it = arrayList.iterator();
        while (it.hasNext()) {
            PropertyValue propertyValue = this.properties.get(it.next());
            if (propertyValue != null) {
                propertyValue.setIsSynced(num);
            }
        }
        this.storage.setSyncStatus(num, (String[]) arrayList.toArray(new String[arrayList.size()]), this.identifier);
    }

    public void setNameAndEmail(String str, String str2) {
        this.name = str;
        this.email = str2;
    }
}
