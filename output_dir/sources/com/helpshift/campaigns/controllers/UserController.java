package com.helpshift.campaigns.controllers;

import android.text.TextUtils;
import com.helpshift.HelpshiftUser;
import com.helpshift.analytics.AnalyticsEventKey;
import com.helpshift.campaigns.models.PropertyValue;
import com.helpshift.campaigns.models.UserModel;
import com.helpshift.campaigns.network.NetworkManagerFactory;
import com.helpshift.campaigns.storage.PropertyStorage;
import com.helpshift.campaigns.util.constants.NetworkRoutes;
import com.helpshift.campaigns.util.constants.SyncStatus;
import com.helpshift.controllers.SyncController;
import com.helpshift.db.legacy_profile.tables.ProfileTable;
import com.helpshift.model.SdkInfoModel;
import com.helpshift.network.NetworkDataProvider;
import com.helpshift.network.errors.NetworkError;
import com.helpshift.network.request.Request;
import com.helpshift.network.response.JsonArrayResponseParser;
import com.helpshift.network.response.Response;
import com.helpshift.util.HSJSONUtils;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HSPattern;
import com.helpshift.util.SchemaUtil;
import com.helpshift.util.concurrent.DispatchQueue;
import com.ironsource.sdk.precache.DownloadManager;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class UserController implements NetworkDataProvider {
    private static final String TAG = "Helpshift_UserControl";
    private Integer batchSize;
    UserModel currentUser;
    SdkInfoModel sdkInfoModel;
    private SessionController sessionController;
    private PropertyStorage storage;
    private SwitchUserController switchUserController;
    public final SyncController syncController;
    private DispatchQueue workerQueue;

    protected UserController(SyncController syncController, SessionController sessionController, SwitchUserController switchUserController, DispatchQueue dispatchQueue, PropertyStorage propertyStorage, Integer num, SdkInfoModel sdkInfoModel) {
        this.workerQueue = dispatchQueue;
        this.batchSize = num;
        this.sdkInfoModel = sdkInfoModel;
        this.sessionController = sessionController;
        this.switchUserController = switchUserController;
        this.storage = propertyStorage;
        String currentLoggedInId = sdkInfoModel.getCurrentLoggedInId();
        currentLoggedInId = TextUtils.isEmpty(currentLoggedInId) ? this.sdkInfoModel.getDeviceId() : currentLoggedInId;
        if (TextUtils.isEmpty(currentLoggedInId)) {
            throw new IllegalArgumentException("Found no valid ID in user controller constructor.");
        }
        initializeForIdentifier(currentLoggedInId);
        this.syncController = syncController;
    }

    public UserModel getCurrentUser() {
        return this.currentUser;
    }

    private void initializeForIdentifier(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        UserModel userModel = this.currentUser;
        String str2 = userModel != null ? userModel.identifier : null;
        if (this.currentUser == null || !str.equals(str2)) {
            this.storage.initStorage(str);
            this.currentUser = new UserModel(str, this.storage);
            this.sdkInfoModel.setCurrentLoggedInId(str);
        }
        HashMap<String, PropertyValue> syncingPropertiesUnsafe = getSyncingPropertiesUnsafe();
        getCurrentUser().setSyncStatus(SyncStatus.UNSYNCED, new ArrayList<>(Arrays.asList((String[]) syncingPropertiesUnsafe.keySet().toArray(new String[syncingPropertiesUnsafe.keySet().size()]))));
    }

    void switchToUser(String str, String str2) {
        if (str2.equals(str)) {
            return;
        }
        boolean zIsSessionActive = this.sessionController.isSessionActive();
        if (zIsSessionActive) {
            this.sessionController.endSession();
        }
        initializeForIdentifier(str);
        if (zIsSessionActive) {
            this.sessionController.startSession();
        }
        this.switchUserController.requestSwitch(str, str2);
    }

    public boolean logout() {
        if (this.currentUser.identifier.equals(this.sdkInfoModel.getDeviceId())) {
            return true;
        }
        this.workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.controllers.UserController.1
            @Override // java.lang.Runnable
            public void run() {
                this.switchToUser(UserController.this.sdkInfoModel.getDeviceId(), this.currentUser.identifier);
            }
        });
        return true;
    }

    public boolean login(final HelpshiftUser helpshiftUser) {
        if (Arrays.asList(null, "", "null").contains(helpshiftUser.getIdentifier())) {
            logout();
            return false;
        }
        this.workerQueue.dispatchSync(new Runnable() { // from class: com.helpshift.campaigns.controllers.UserController.2
            @Override // java.lang.Runnable
            public void run() {
                this.switchToUser(helpshiftUser.getIdentifier(), this.currentUser.identifier);
                this.setNameAndEmail(helpshiftUser.getName(), helpshiftUser.getEmail());
                try {
                    NetworkManagerFactory.getInstance().inboxNetworkManager.fetchCampaigns();
                } catch (Exception e) {
                    HSLogger.d(UserController.TAG, "Exception while fetching campaigns after login", e);
                }
            }
        });
        return true;
    }

    Integer getSizeOfUserProperties() {
        return getSizeOfPropertiesMap(getAllPropertiesUnsafe());
    }

    Integer getSizeOfPropertiesMap(Map<String, PropertyValue> map) {
        int i = 0;
        if (map == null || map.size() <= 0) {
            return i;
        }
        HashMap map2 = new HashMap();
        for (Map.Entry<String, PropertyValue> entry : map.entrySet()) {
            map2.put(entry.getKey(), entry.getValue().getValueInfo());
        }
        try {
            return Integer.valueOf(new JSONObject(map2).toString().getBytes(DownloadManager.UTF8_CHARSET).length);
        } catch (UnsupportedEncodingException e) {
            HSLogger.d(TAG, "Exception while getting property size : ", e);
            return i;
        }
    }

    public boolean addProperty(final String str, final PropertyValue propertyValue) {
        final boolean zValidatePropertyKey = SchemaUtil.validatePropertyKey(str);
        if (!zValidatePropertyKey) {
            HSLogger.d(TAG, "Invalid property : Key : " + str + ", Value : " + propertyValue);
        }
        this.workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.controllers.UserController.3
            @Override // java.lang.Runnable
            public void run() {
                if (zValidatePropertyKey) {
                    HashMap map = new HashMap();
                    map.put(str, propertyValue);
                    if (this.getSizeOfUserProperties().intValue() + this.getSizeOfPropertiesMap(map).intValue() <= 102400) {
                        HSLogger.d(UserController.TAG, "Add property : Key " + str + ", Value : " + propertyValue.toString());
                        if (this.getCurrentUser().addProperty(str, propertyValue)) {
                            this.syncController.incrementDataChangeCount(SyncController.DataTypes.USER, 1);
                            return;
                        }
                        return;
                    }
                    HSLogger.d(UserController.TAG, "Property size exceeds the maximum allowed size : Key : " + str);
                }
            }
        });
        return zValidatePropertyKey;
    }

    public String[] addProperties(HashMap<String, PropertyValue> map) {
        final HashMap map2 = new HashMap();
        for (Map.Entry<String, PropertyValue> entry : map.entrySet()) {
            if (SchemaUtil.validatePropertyKey(entry.getKey())) {
                map2.put(entry.getKey(), entry.getValue());
            } else {
                HSLogger.d(TAG, "Invalid property : Key : " + entry.getKey() + ", Value : " + entry.getValue());
            }
        }
        this.workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.controllers.UserController.4
            @Override // java.lang.Runnable
            public void run() {
                if (map2.size() > 0) {
                    if (this.getSizeOfUserProperties().intValue() + this.getSizeOfPropertiesMap(map2).intValue() <= 102400) {
                        HSLogger.d(UserController.TAG, "Add properties : " + map2.toString());
                        this.syncController.incrementDataChangeCount(SyncController.DataTypes.USER, this.getCurrentUser().addProperties(map2).size());
                        return;
                    }
                    HSLogger.d(UserController.TAG, "Properties size exceeds the maximum allowed size");
                }
            }
        });
        return (String[]) map2.keySet().toArray(new String[map2.size()]);
    }

    public HashMap<String, PropertyValue> getUnsyncedProperties() {
        return new HashMap<>(getCurrentUser().getUnsyncedProperties());
    }

    public HashMap<String, PropertyValue> getSyncingPropertiesUnsafe() {
        return getCurrentUser().getSyncingProperties();
    }

    private Map<String, PropertyValue> getAllPropertiesUnsafe() {
        return getCurrentUser().getAllProperties();
    }

    private HashMap<String, ArrayList> batchProperties(HashMap<String, PropertyValue> map, Integer num) {
        int length;
        HashMap<String, ArrayList> map2 = new HashMap<>();
        Integer numValueOf = 0;
        Integer numValueOf2 = Integer.valueOf(num.intValue() * 1024 * 1024);
        for (Map.Entry<String, PropertyValue> entry : map.entrySet()) {
            ArrayList valueInfo = entry.getValue().getValueInfo();
            try {
                length = new JSONArray((Collection) valueInfo).toString().getBytes(DownloadManager.UTF8_CHARSET).length;
            } catch (UnsupportedEncodingException e) {
                HSLogger.d(TAG, "Exception in batching : ", e);
            }
            if (numValueOf.intValue() + length > numValueOf2.intValue()) {
                break;
            }
            map2.put(entry.getKey(), valueInfo);
            numValueOf = Integer.valueOf(numValueOf.intValue() + length);
        }
        return map2;
    }

    @Override // com.helpshift.network.NetworkDataProvider
    public Request getRequest() {
        HashMap<String, ArrayList> mapBatchProperties = batchProperties(getUnsyncedProperties(), this.batchSize);
        final ArrayList arrayList = new ArrayList(mapBatchProperties.keySet());
        return makeRequestForProperties(mapBatchProperties, new Response.Listener() { // from class: com.helpshift.campaigns.controllers.UserController.5
            @Override // com.helpshift.network.response.Response.Listener
            public void onResponse(Object obj, Integer num) {
                UserController.this.handlePropertySyncSuccess(this, arrayList, false);
            }
        }, new Response.ErrorListener() { // from class: com.helpshift.campaigns.controllers.UserController.6
            @Override // com.helpshift.network.response.Response.ErrorListener
            public void onErrorResponse(NetworkError networkError, Integer num) {
                UserController.this.handlePropertySyncFailure(this, arrayList, networkError);
            }
        });
    }

    @Override // com.helpshift.network.NetworkDataProvider
    public Request getRequestWithFullData() {
        HashMap<String, ArrayList> mapBatchProperties = batchProperties(getCurrentUser().getSyncedAndUnSyncedProperties(), this.batchSize);
        if (mapBatchProperties.size() == 0) {
            return null;
        }
        final ArrayList arrayList = new ArrayList(getUnsyncedProperties().keySet());
        final ArrayList arrayList2 = new ArrayList(mapBatchProperties.keySet());
        return makeRequestForProperties(mapBatchProperties, new Response.Listener<JSONArray>() { // from class: com.helpshift.campaigns.controllers.UserController.7
            @Override // com.helpshift.network.response.Response.Listener
            public void onResponse(JSONArray jSONArray, Integer num) {
                UserController.this.handlePropertySyncSuccess(this, arrayList2, true);
            }
        }, new Response.ErrorListener() { // from class: com.helpshift.campaigns.controllers.UserController.8
            @Override // com.helpshift.network.response.Response.ErrorListener
            public void onErrorResponse(NetworkError networkError, Integer num) {
                arrayList2.removeAll(arrayList);
                this.getCurrentUser().checkAndMarkPropertiesAsSynced(arrayList2);
                UserController.this.handlePropertySyncFailure(this, arrayList, networkError);
            }
        });
    }

    @Override // com.helpshift.network.NetworkDataProvider
    public void setBatchSize(Integer num) {
        this.batchSize = num;
    }

    void handlePropertySyncSuccess(UserController userController, ArrayList<String> arrayList, boolean z) {
        userController.syncController.dataSynced(SyncController.DataTypes.USER, z);
        userController.getCurrentUser().checkAndMarkPropertiesAsSynced(arrayList);
        userController.syncController.setDataChangeCount(SyncController.DataTypes.USER, getUnsyncedProperties().size());
    }

    void handlePropertySyncFailure(UserController userController, ArrayList<String> arrayList, NetworkError networkError) {
        userController.getCurrentUser().setSyncStatus(SyncStatus.UNSYNCED, arrayList);
        userController.syncController.dataSyncFailed(SyncController.DataTypes.USER, networkError);
    }

    private Request makeRequestForProperties(Map<String, ArrayList> map, Response.Listener<JSONArray> listener, Response.ErrorListener errorListener) {
        if (map.size() == 0) {
            return null;
        }
        JSONObject jSONObjectFromNestedMap = HSJSONUtils.fromNestedMap(map);
        HashMap map2 = new HashMap();
        map2.put(ProfileTable.Columns.COLUMN_DID, this.sdkInfoModel.getDeviceId());
        map2.put(ProfileTable.Columns.COLUMN_UID, getCurrentUser().identifier);
        map2.put(AnalyticsEventKey.PROTOCOL, jSONObjectFromNestedMap.toString());
        getCurrentUser().setSyncStatus(SyncStatus.SYNCING, new ArrayList<>(map.keySet()));
        return new Request(1, NetworkRoutes.USER_PROPERTIES_ROUTE, map2, listener, errorListener, new JsonArrayResponseParser());
    }

    public void setNameAndEmail(String str, String str2) {
        String strTrim = str != null ? str.trim() : null;
        String strTrim2 = str2 != null ? str2.trim() : null;
        HashMap<String, PropertyValue> map = new HashMap<>();
        if (!TextUtils.isEmpty(strTrim) && HSPattern.isValidName(strTrim)) {
            map.put("name", new PropertyValue(strTrim));
        }
        if (!TextUtils.isEmpty(strTrim2) && HSPattern.isValidEmail(strTrim2)) {
            map.put("email", new PropertyValue(strTrim2));
        }
        addProperties(map);
        this.currentUser.setNameAndEmail(strTrim, strTrim2);
    }
}
