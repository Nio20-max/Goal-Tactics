package com.helpshift.campaigns.models;

import android.text.TextUtils;
import com.helpshift.campaigns.storage.PropertyStorage;
import com.helpshift.campaigns.util.constants.DeviceProperties;
import com.helpshift.campaigns.util.constants.SyncStatus;
import com.helpshift.model.InfoModelFactory;
import com.helpshift.util.concurrent.DispatchQueue;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

/* JADX INFO: loaded from: classes.dex */
public class DeviceModel {
    private static final String TAG = "Helpshift_DeviceModel";
    Device device;
    String identifier;
    private Map<String, PropertyValue> properties = new ConcurrentHashMap();
    PropertyStorage storage;
    DispatchQueue workerQueue;

    public DeviceModel(Device device, PropertyStorage propertyStorage, DispatchQueue dispatchQueue) {
        String deviceId = InfoModelFactory.getInstance().sdkInfoModel.getDeviceId();
        if (TextUtils.isEmpty(deviceId)) {
            deviceId = UUID.randomUUID().toString();
            InfoModelFactory.getInstance().sdkInfoModel.addDeviceId(deviceId);
        }
        this.identifier = deviceId;
        this.storage = propertyStorage;
        propertyStorage.initSecondaryStorage(deviceId);
        this.device = device;
        this.workerQueue = dispatchQueue;
    }

    public void init() {
        HashMap<String, PropertyValue> allSecondaryProperties = this.storage.getAllSecondaryProperties(this.identifier);
        if (allSecondaryProperties != null) {
            this.properties.putAll(allSecondaryProperties);
        }
        if (this.properties.get(DeviceProperties.DeviceKeys.LAST_LOCATION) != null) {
            this.properties.remove(DeviceProperties.DeviceKeys.LAST_LOCATION);
            this.storage.removePropertySecondaryStorage(DeviceProperties.DeviceKeys.LAST_LOCATION, this.identifier);
        }
        if (this.properties.get(DeviceProperties.DeviceKeys.PLATFORM) == null) {
            this.properties.put(DeviceProperties.DeviceKeys.PLATFORM, new PropertyValue("android"));
            this.storage.setSecondaryProperty(DeviceProperties.DeviceKeys.PLATFORM, this.properties.get(DeviceProperties.DeviceKeys.PLATFORM), this.identifier);
        }
        rescanDevice();
    }

    public String getIdentifier() {
        return this.identifier;
    }

    <T> void setProperty(String str, T t) {
        if (t != null) {
            PropertyValue propertyValue = this.properties.get(str);
            boolean z = false;
            if (propertyValue != null && propertyValue.setValue(t)) {
                z = true;
            } else if (propertyValue == null) {
                propertyValue = new PropertyValue(t);
                z = !propertyValue.getType().equals("u");
            }
            if (z) {
                this.properties.put(str, propertyValue);
                this.storage.setSecondaryProperty(str, propertyValue, this.identifier);
                if (shouldDevicePropertySyncImmediately(str)) {
                    InfoModelFactory.getInstance().sdkInfoModel.setDevicePropertiesSyncImmediately(true);
                }
            }
        }
    }

    public Object getPropertyValue(final String str) {
        final Object[] objArr = {null};
        this.workerQueue.dispatchSync(new Runnable() { // from class: com.helpshift.campaigns.models.DeviceModel.1
            @Override // java.lang.Runnable
            public void run() {
                PropertyValue secondaryProperty = DeviceModel.this.storage.getSecondaryProperty(str, DeviceModel.this.identifier);
                if (secondaryProperty != null) {
                    objArr[0] = secondaryProperty.getValue();
                }
            }
        });
        return objArr[0];
    }

    public void rescanDevice() {
        this.workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.models.DeviceModel.2
            @Override // java.lang.Runnable
            public void run() {
                DeviceModel deviceModel = this;
                deviceModel.setProperty(DeviceProperties.DeviceKeys.OS, deviceModel.device.getOsVersion());
                DeviceModel deviceModel2 = this;
                deviceModel2.setProperty(DeviceProperties.DeviceKeys.MODEL, deviceModel2.device.getBuildModel());
                DeviceModel deviceModel3 = this;
                deviceModel3.setProperty(DeviceProperties.DeviceKeys.APP_VERSION, deviceModel3.device.getAppVersion());
                DeviceModel deviceModel4 = this;
                deviceModel4.setProperty("ln", deviceModel4.device.getLanguageCode());
                DeviceModel deviceModel5 = this;
                deviceModel5.setProperty(DeviceProperties.DeviceKeys.CARRIER, deviceModel5.device.getCarrierName());
                DeviceModel deviceModel6 = this;
                deviceModel6.setProperty(DeviceProperties.DeviceKeys.TIMEZONE, deviceModel6.device.getTimeZone());
                this.setProperty(DeviceProperties.DeviceKeys.SDK_VERSION, "7.11.1");
                DeviceModel deviceModel7 = this;
                deviceModel7.setProperty(DeviceProperties.DeviceKeys.COUNTRY, deviceModel7.device.getCountryCode());
            }
        });
    }

    public void setPushToken(String str) {
        setProperty(DeviceProperties.DeviceKeys.PUSH_TOKEN, str);
    }

    public void setDevelopmentPlatform(String str) {
        setProperty(DeviceProperties.DeviceKeys.DEV_PLATFORM, str);
    }

    public HashMap<String, ArrayList> getUnsyncedProperties() {
        final HashMap<String, ArrayList> map = new HashMap<>();
        this.workerQueue.dispatchSync(new Runnable() { // from class: com.helpshift.campaigns.models.DeviceModel.3
            @Override // java.lang.Runnable
            public void run() {
                this.properties.keySet();
                for (String str : this.properties.keySet()) {
                    PropertyValue propertyValue = (PropertyValue) this.properties.get(str);
                    if (propertyValue != null && propertyValue.getIsSynced().equals(SyncStatus.UNSYNCED)) {
                        map.put(str, propertyValue.getValueInfo());
                    }
                }
            }
        });
        return map;
    }

    public HashMap<String, ArrayList> getSyncedAndUnSyncedProperties() {
        final HashMap<String, ArrayList> map = new HashMap<>();
        this.workerQueue.dispatchSync(new Runnable() { // from class: com.helpshift.campaigns.models.DeviceModel.4
            @Override // java.lang.Runnable
            public void run() {
                for (String str : this.properties.keySet()) {
                    PropertyValue propertyValue = (PropertyValue) this.properties.get(str);
                    if (propertyValue != null && (SyncStatus.SYNCED == propertyValue.getIsSynced() || SyncStatus.UNSYNCED == propertyValue.getIsSynced())) {
                        map.put(str, propertyValue.getValueInfo());
                    }
                }
            }
        });
        return map;
    }

    public HashMap<String, ArrayList> getSyncingPropertiesUnsafe() {
        HashMap<String, ArrayList> map = new HashMap<>();
        for (String str : this.properties.keySet()) {
            PropertyValue propertyValue = this.properties.get(str);
            if (propertyValue != null && propertyValue.getIsSynced().equals(SyncStatus.SYNCING)) {
                map.put(str, propertyValue.getValueInfo());
            }
        }
        return map;
    }

    public void checkAndMarkPropertiesAsSynced(List<String> list) {
        if (list != null) {
            this.workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.models.DeviceModel.5
                @Override // java.lang.Runnable
                public void run() {
                    ArrayList arrayList = new ArrayList();
                    for (String str : this.properties.keySet()) {
                        PropertyValue propertyValue = (PropertyValue) this.properties.get(str);
                        if (propertyValue != null) {
                            if (propertyValue.getIsSynced().equals(SyncStatus.SYNCING)) {
                                propertyValue.setIsSynced(SyncStatus.SYNCED);
                                arrayList.add(str);
                            } else if (DeviceModel.this.shouldDevicePropertySyncImmediately(str)) {
                                InfoModelFactory.getInstance().sdkInfoModel.setDevicePropertiesSyncImmediately(true);
                            }
                        }
                    }
                    DeviceModel.this.storage.setSecondaryPropertySyncStatus(SyncStatus.SYNCED, (String[]) arrayList.toArray(new String[arrayList.size()]), DeviceModel.this.identifier);
                }
            });
        }
    }

    public void setSyncStatus(final Integer num, final ArrayList<String> arrayList) {
        if (arrayList != null) {
            this.workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.models.DeviceModel.6
                @Override // java.lang.Runnable
                public void run() {
                    Iterator it = this.properties.keySet().iterator();
                    while (it.hasNext()) {
                        PropertyValue propertyValue = (PropertyValue) this.properties.get((String) it.next());
                        if (propertyValue != null) {
                            propertyValue.setIsSynced(num);
                        }
                    }
                    PropertyStorage propertyStorage = DeviceModel.this.storage;
                    Integer num2 = num;
                    ArrayList arrayList2 = arrayList;
                    propertyStorage.setSecondaryPropertySyncStatus(num2, (String[]) arrayList2.toArray(new String[arrayList2.size()]), DeviceModel.this.identifier);
                }
            });
        }
    }

    boolean shouldDevicePropertySyncImmediately(String str) {
        return str.equals(DeviceProperties.DeviceKeys.APP_VERSION) || str.equals(DeviceProperties.DeviceKeys.OS) || str.equals(DeviceProperties.DeviceKeys.PUSH_TOKEN);
    }
}
