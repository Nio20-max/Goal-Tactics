package com.helpshift.meta;

import com.facebook.devicerequests.internal.DeviceRequestsHelper;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Device;
import com.helpshift.common.platform.Jsonifier;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.meta.dao.MetaDataDAO;
import com.helpshift.meta.dto.BreadCrumbDTO;
import com.helpshift.meta.dto.DebugLogDTO;
import com.helpshift.meta.dto.DeviceDiskSpaceDTO;
import com.helpshift.support.Support;
import com.helpshift.util.StringUtils;
import com.ironsource.eventsmodule.DataBaseEventsStorage;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Locale;
import java.util.Map;
import java.util.MissingResourceException;
import java.util.NoSuchElementException;

/* JADX INFO: loaded from: classes2.dex */
public class MetaDataDM {
    private RootMetaDataCallable customMetaDataCallable;
    private LinkedList<DebugLogDTO> debugLogDTOs = new LinkedList<>();
    private final Device device;
    private Domain domain;
    private final Jsonifier jsonifier;
    private MetaDataDAO metaDataDAO;
    private final SDKConfigurationDM sdkConfigurationDM;

    public MetaDataDM(Domain domain, Platform platform, SDKConfigurationDM sDKConfigurationDM) {
        this.domain = domain;
        this.sdkConfigurationDM = sDKConfigurationDM;
        this.metaDataDAO = platform.getMetaDataDAO();
        this.jsonifier = platform.getJsonifier();
        this.device = platform.getDevice();
    }

    private static String[] cleanTags(String[] strArr) {
        HashSet hashSet = new HashSet();
        if (strArr != null) {
            for (String str : strArr) {
                if (!StringUtils.isEmpty(str) && str.trim().length() > 0) {
                    hashSet.add(str.trim());
                }
            }
        }
        return (String[]) hashSet.toArray(new String[0]);
    }

    public synchronized void pushBreadCrumb(String str) {
        String str2 = new SimpleDateFormat(HSDateFormatSpec.STORAGE_TIME_PATTERN, Locale.ENGLISH).format(new Date());
        ArrayList<BreadCrumbDTO> breadCrumbs = this.metaDataDAO.getBreadCrumbs();
        if (breadCrumbs == null) {
            breadCrumbs = new ArrayList<>();
        }
        breadCrumbs.add(new BreadCrumbDTO(str, str2));
        int iIntValue = this.sdkConfigurationDM.getInt(SDKConfigurationDM.BREADCRUMB_LIMIT).intValue();
        int size = breadCrumbs.size();
        if (iIntValue > 0) {
            if (size > iIntValue) {
                breadCrumbs = new ArrayList<>(breadCrumbs.subList(size - iIntValue, size));
            }
            this.metaDataDAO.setBreadCrumbs(breadCrumbs);
        }
    }

    public synchronized void clearBreadCrumbs() {
        this.metaDataDAO.setBreadCrumbs(null);
    }

    private Object getBreadCrumbs() {
        return this.jsonifier.jsonifyBreadCrumbDTOList(this.metaDataDAO.getBreadCrumbs());
    }

    private Object getDiskSpace() {
        DeviceDiskSpaceDTO diskSpace = this.device.getDiskSpace();
        HashMap map = new HashMap();
        if (diskSpace != null) {
            map.put("total-space-phone", diskSpace.phoneTotalSpace);
            map.put("free-space-phone", diskSpace.phoneFreeSpace);
        }
        return this.jsonifier.jsonifyToObject(map);
    }

    private Object getDeviceInfo() {
        HashMap map = new HashMap();
        map.put("platform", this.device.getPlatformName());
        map.put("library-version", this.device.getSDKVersion());
        map.put("device-model", this.device.getDeviceModel());
        map.put("os-version", this.device.getOSVersion());
        try {
            String string = this.sdkConfigurationDM.getString(SDKConfigurationDM.SDK_LANGUAGE);
            if (StringUtils.isEmpty(string)) {
                string = this.device.getLanguage();
            }
            if (!StringUtils.isEmpty(string)) {
                map.put("language-code", string);
            }
        } catch (MissingResourceException unused) {
        }
        map.put(DataBaseEventsStorage.EventEntry.COLUMN_NAME_TIMESTAMP, this.device.getTimeStamp());
        map.put("application-identifier", this.device.getAppIdentifier());
        String appName = this.device.getAppName();
        if (StringUtils.isEmpty(appName)) {
            appName = "(unknown)";
        }
        map.put("application-name", appName);
        map.put("application-version", this.device.getAppVersion());
        map.put("disk-space", getDiskSpace());
        if (!this.sdkConfigurationDM.getBoolean(SDKConfigurationDM.ENABLE_FULL_PRIVACY)) {
            map.put("country-code", this.device.getSimCountryIso());
            map.put("carrier-name", this.device.getCarrierName());
        }
        map.put("network-type", this.device.getNetworkType());
        map.put("battery-level", this.device.getBatteryLevel());
        map.put("battery-status", this.device.getBatteryStatus());
        return this.jsonifier.jsonifyToObject(map);
    }

    private Object getExtra(String str) {
        HashMap map = new HashMap();
        map.put("api-version", this.device.getApiVersion());
        map.put("library-version", this.device.getSDKVersion());
        if (!StringUtils.isEmpty(str)) {
            map.put("user-id", str);
        }
        return this.jsonifier.jsonifyToObject(map);
    }

    public synchronized void addDebugLog(DebugLogDTO debugLogDTO) {
        if (debugLogDTO.msg != null && debugLogDTO.msg.length() > 5000) {
            debugLogDTO = new DebugLogDTO(debugLogDTO.level, debugLogDTO.tag, debugLogDTO.msg.substring(0, 5000), debugLogDTO.throwable);
        }
        if (this.debugLogDTOs.size() > 100) {
            try {
                this.debugLogDTOs.removeLast();
            } catch (NoSuchElementException e) {
                throw RootAPIException.wrap(e);
            }
        }
        if (this.sdkConfigurationDM.getInt(SDKConfigurationDM.DEBUG_LOG_LIMIT).intValue() != 0) {
            this.debugLogDTOs.addFirst(debugLogDTO);
        }
    }

    private synchronized Object getDebugLogs() {
        ArrayList arrayList;
        arrayList = new ArrayList();
        int size = this.debugLogDTOs.size();
        int iIntValue = this.sdkConfigurationDM.getInt(SDKConfigurationDM.DEBUG_LOG_LIMIT).intValue();
        for (int i = 0; i < size && i < iIntValue; i++) {
            try {
                arrayList.add(this.debugLogDTOs.removeFirst());
            } catch (NoSuchElementException e) {
                throw RootAPIException.wrap(e);
            }
        }
        this.debugLogDTOs.clear();
        return this.jsonifier.jsonifyDebugLogDTOList(arrayList);
    }

    public void setCustomMetaDataCallable(RootMetaDataCallable rootMetaDataCallable) {
        this.customMetaDataCallable = rootMetaDataCallable;
    }

    private void saveCustomMetaData(Map<String, Serializable> map) {
        this.metaDataDAO.saveCustomMetaData(map != null ? new HashMap<>(map) : null);
    }

    public Object getCustomMetaData() {
        Map<String, Serializable> customMetaData;
        if (this.customMetaDataCallable != null) {
            customMetaData = getCustomMetaDataFromCallable();
            saveCustomMetaData(customMetaData);
        } else {
            customMetaData = this.metaDataDAO.getCustomMetaData();
        }
        if (customMetaData == null) {
            return null;
        }
        if (this.sdkConfigurationDM.getBoolean(SDKConfigurationDM.ENABLE_FULL_PRIVACY)) {
            customMetaData.remove("private-data");
        }
        return this.jsonifier.jsonifyCustomMetaMap(customMetaData);
    }

    public void clearCustomMetaData() {
        this.metaDataDAO.saveCustomMetaData(null);
    }

    public Object getMetaInfo() {
        HashMap map = new HashMap();
        map.put("breadcrumbs", getBreadCrumbs());
        map.put(DeviceRequestsHelper.DEVICE_INFO_PARAM, getDeviceInfo());
        map.put("logs", getDebugLogs());
        Object customMetaData = getCustomMetaData();
        if (customMetaData != null) {
            map.put("custom_meta", customMetaData);
        }
        map.put("extra", getExtra(this.domain.getUserManagerDM().getUserMetaIdentifier()));
        HashMap map2 = new HashMap();
        map2.put("fp_status", Boolean.valueOf(this.sdkConfigurationDM.getBoolean(SDKConfigurationDM.ENABLE_FULL_PRIVACY)));
        map.put("user_info", this.jsonifier.jsonifyToObject(map2));
        return this.jsonifier.jsonifyToObject(map);
    }

    private Map<String, Serializable> getCustomMetaDataFromCallable() {
        RootMetaDataCallable rootMetaDataCallable = this.customMetaDataCallable;
        if (rootMetaDataCallable == null) {
            return null;
        }
        Map<String, Serializable> mapCall = rootMetaDataCallable.call();
        return mapCall != null ? cleanMetaTags(removeEmptyKeyOrValue(mapCall), Support.TagsKey) : mapCall;
    }

    private Map<String, Serializable> removeEmptyKeyOrValue(Map<String, Serializable> map) {
        HashMap map2 = new HashMap(map);
        for (Map.Entry<String, Serializable> entry : map.entrySet()) {
            String key = entry.getKey();
            Serializable value = entry.getValue();
            if (StringUtils.isEmpty(key) || ((value instanceof String) && StringUtils.isEmpty((String) value))) {
                map2.remove(key);
            }
        }
        return map2;
    }

    private Map<String, Serializable> cleanMetaTags(Map<String, Serializable> map, String str) {
        String[] strArrCleanTags = new String[0];
        Object objRemove = map.remove(str);
        if (objRemove instanceof String[]) {
            strArrCleanTags = cleanTags((String[]) objRemove);
        }
        if (strArrCleanTags.length > 0) {
            map.put(str, strArrCleanTags);
        }
        return map;
    }
}
