package com.ironsource.mediationsdk.utils;

import android.content.Context;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.helpshift.common.domain.network.NetworkConstants;
import com.ironsource.environment.DeviceStatus;
import com.ironsource.environment.StringUtils;
import com.ironsource.mediationsdk.IronSource;
import com.ironsource.mediationsdk.events.InterstitialEventsManager;
import com.ironsource.mediationsdk.events.RewardedVideoEventsManager;
import com.ironsource.mediationsdk.logger.ConsoleLogger;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.model.ApplicationConfigurations;
import com.ironsource.mediationsdk.model.ApplicationEvents;
import com.ironsource.mediationsdk.model.ApplicationLogger;
import com.ironsource.mediationsdk.model.BannerConfigurations;
import com.ironsource.mediationsdk.model.BannerPlacement;
import com.ironsource.mediationsdk.model.Configurations;
import com.ironsource.mediationsdk.model.InterstitialConfigurations;
import com.ironsource.mediationsdk.model.InterstitialPlacement;
import com.ironsource.mediationsdk.model.OfferwallConfigurations;
import com.ironsource.mediationsdk.model.OfferwallPlacement;
import com.ironsource.mediationsdk.model.Placement;
import com.ironsource.mediationsdk.model.PlacementAvailabilitySettings;
import com.ironsource.mediationsdk.model.PlacementCappingType;
import com.ironsource.mediationsdk.model.ProviderOrder;
import com.ironsource.mediationsdk.model.ProviderSettings;
import com.ironsource.mediationsdk.model.ProviderSettingsHolder;
import com.ironsource.mediationsdk.model.RewardedVideoConfigurations;
import com.ironsource.mediationsdk.model.ServerSegmetData;
import com.ironsource.sdk.constants.Constants;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class ServerResponseWrapper {
    public static final String APP_KEY_FIELD = "appKey";
    public static final String RESPONSE_FIELD = "response";
    public static final String USER_ID_FIELD = "userId";
    private String mAppKey;
    private Configurations mConfigurations;
    private Context mContext;
    private ProviderOrder mProviderOrder;
    private ProviderSettingsHolder mProviderSettingsHolder;
    private JSONObject mResponse;
    private String mUserId;
    private final String ERROR_KEY = "error";
    private final int DEFAULT_LOG_LEVEL = 3;
    private final int DEFAULT_ADAPTERS_SMARTLOAD_AMOUNT = 2;
    private final int DEFAULT_ADAPTERS_SMARTLOAD_TIMEOUT = 60;
    private final int DEFAULT_BANNER_SMARTLOAD_TIMEOUT = 10000;
    private final int DEFAULT_MAX_EVENTS_PER_BATCH = 5000;
    private final int DEFAULT_MANUAL_LOAD_INTERVAL_FIELD = 300;
    private final int DEFAULT_IS_DELAY_LOAD_FAILURE_TIMEOUT = 3;
    private final int DEFAULT_BN_DELAY_LOAD_FAILURE_TIMEOUT = 3;
    private final int DEFAULT_TRIALS = 2;
    private final int DEFAULT_AUCTION_SAVED_HISTORY_LIMIT = 15;
    private final long DEFAULT_TIMEOUT = 10000;
    private final int DEFAULT_ADVANCED_LOADING_AMOUNT = 0;
    private final boolean DEFAULT_ADVANCED_LOADING = false;
    private final int DEFAULT_TIME_TO_DELETE_WATERFALL_AFTER_AUCTION = NetworkConstants.UPLOAD_CONNECT_TIMEOUT;
    private final String PROVIDER_ORDER_FIELD = "providerOrder";
    private final String PROVIDER_SETTINGS_FIELD = "providerSettings";
    private final String CONFIGURATIONS_FIELD = "configurations";
    private final String GENERIC_PARAMS_FIELD = "genericParams";
    private final String AD_UNITS_FIELD = "adUnits";
    private final String PROVIDER_LOAD_NAME_FIELD = "providerLoadName";
    private final String APPLICATION_FIELD = Constants.ParametersKeys.ORIENTATION_APPLICATION;
    private final String RV_FIELD = "rewardedVideo";
    private final String IS_FIELD = IronSourceConstants.AD_UNIT_IS_MEDIATION_STATE;
    private final String OW_FIELD = "offerwall";
    private final String BN_FIELD = "banner";
    private final String INTEGRATION_FIELD = "integration";
    private final String LOGGERS_FIELD = "loggers";
    private final String SEGMENT_FIELD = "segment";
    private final String EVENTS_FIELD = "events";
    private final String TOKEN_FIELD = "token";
    private final String SMART_LOAD_FIELD = "maxNumOfAdaptersToLoadOnStart";
    private final String ADVANCED_LOADING_FIELD = "advancedLoading";
    private final String ADAPTER_TIMEOUT_IN_SECS_FIELD = "adapterTimeOutInSeconds";
    private final String ADAPTER_TIMEOUT_IN_MILLIS_FIELD = "atim";
    private final String DEFAULT_BANNER_LOAD_REFRESH_INTERVAL = "bannerInterval";
    private final String MANUAL_LOAD_INTERVAL_FIELD = "loadRVInterval";
    private final String SERVER_FIELD = "server";
    private final String PUBLISHER_FIELD = "publisher";
    private final String CONSOLE_FIELD = ConsoleLogger.NAME;
    private final String SEND_ULTRA_EVENTS_FIELD = "sendUltraEvents";
    private final String SEND_EVENTS_TOGGLE_FIELD = "sendEventsToggle";
    private final String SERVER_EVENTS_URL_FIELD = "serverEventsURL";
    private final String SERVER_EVENTS_TYPE = "serverEventsType";
    private final String BACKUP_THRESHOLD_FIELD = "backupThreshold";
    private final String MAX_NUM_OF_EVENTS_FIELD = "maxNumberOfEvents";
    private final String MAX_EVENTS_PER_BATCH = "maxEventsPerBatch";
    private final String OPT_OUT_EVENTS_FIELD = "optOut";
    private final String OPT_IN_EVENTS_FIELD = "optIn";
    private final String TRIGGER_EVENTS_FIELD = "triggerEvents";
    private final String NON_CONNECTIVITY_EVENTS_FIELD = "nonConnectivityEvents";
    private final String PLACEMENTS_FIELD = "placements";
    private final String PLACEMENT_ID_FIELD = Constants.PLACEMENT_ID;
    private final String PLACEMENT_NAME_FIELD = "placementName";
    private final String PLACEMENT_SETTINGS_DELIVERY_FIELD = "delivery";
    private final String PLACEMENT_SETTINGS_IS_DEFAULT_FIELD = "isDefault";
    private final String PLACEMENT_SETTINGS_CAPPING_FIELD = "capping";
    private final String PLACEMENT_SETTINGS_PACING_FIELD = "pacing";
    private final String PLACEMENT_SETTINGS_ENABLED_FIELD = "enabled";
    private final String PLACEMENT_SETTINGS_CAPPING_VALUE_FIELD = "maxImpressions";
    private final String PLACEMENT_SETTINGS_PACING_VALUE_FIELD = "numOfSeconds";
    private final String PLACEMENT_SETTINGS_CAPPING_UNIT_FIELD = "unit";
    private final String VIRTUAL_ITEM_NAME_FIELD = "virtualItemName";
    private final String VIRTUAL_ITEM_COUNT_FIELD = "virtualItemCount";
    private final String BACKFILL_FIELD = "backFill";
    private final String PREMIUM_FIELD = "premium";
    private final String UUID_ENABLED_FIELD = DeviceStatus.UUID_ENABLED;
    private final String AB_TESTING = "abt";
    private final String DELAY_LOAD_FAILURE = "delayLoadFailure";
    private final String AD_SOURCE_NAME_FIELD = "adSourceName";
    private final String SUB_PROVIDER_ID_FIELD = "spId";
    private final String IS_MULTIPLE_INSTANCES_FIELD = "mpis";
    private final String AUCTION_FIELD = "auction";
    private final String AUCTION_DATA_FIELD = "auctionData";
    private final String AUCTION_URL_FIELD = "auctioneerURL";
    private final String AUCTION_PROGRAMMATIC_FIELD = IronSourceConstants.EVENTS_PROGRAMMATIC;
    private final String MIN_TIME_BEFORE_FIRST_AUCTION_FIELD = "minTimeBeforeFirstAuction";
    private final String TIME_TO_WAIT_BEFORE_AUCTION_FIELD = "timeToWaitBeforeAuction";
    private final String TIME_TO_WAIT_BEFORE_LOAD_FIELD = "timeToWaitBeforeLoad";
    private final String AUCTION_RETRY_INTERVAL_FIELD = "auctionRetryInterval";
    private final String IS_AUCTION_ON_SHOW_START_FIELD = "isAuctionOnShowStart";
    private final String IS_LOAD_WHILE_SHOW_FIELD = "isLoadWhileShow";
    private final String AUCTION_TRIALS_FIELD = IronSourceConstants.AUCTION_TRIALS;
    private final String AUCTION_TIMEOUT_FIELD = "auctionTimeout";
    private final String AUCTION_SAVED_HISTORY_LIMIT_FIELD = "auctionSavedHistory";
    private final String AUCTION_DISABLE_LOAD_WHILE_SHOW_SUPPORT_FIELD = "disableLoadWhileShowSupportFor";
    private final String RV_TIME_TO_DELETE_WATERFALL_AFTER_AUCTION = "timeToDeleteOldWaterfallAfterAuction";
    private final String SDK_TOKEN_FIELD = "optInKeys";

    public ServerResponseWrapper(Context context, String str, String str2, String str3) {
        this.mContext = context;
        try {
            if (TextUtils.isEmpty(str3)) {
                this.mResponse = new JSONObject();
            } else {
                this.mResponse = new JSONObject(str3);
            }
            parseProviderSettings();
            parseConfigurations();
            parseProviderOrder();
            this.mAppKey = TextUtils.isEmpty(str) ? "" : str;
            this.mUserId = TextUtils.isEmpty(str2) ? "" : str2;
        } catch (JSONException e) {
            e.printStackTrace();
            defaultInit();
        }
    }

    public ServerResponseWrapper(ServerResponseWrapper serverResponseWrapper) {
        try {
            this.mContext = serverResponseWrapper.getContext();
            this.mResponse = new JSONObject(serverResponseWrapper.mResponse.toString());
            this.mAppKey = serverResponseWrapper.mAppKey;
            this.mUserId = serverResponseWrapper.mUserId;
            this.mProviderOrder = serverResponseWrapper.getProviderOrder();
            this.mProviderSettingsHolder = serverResponseWrapper.getProviderSettingsHolder();
            this.mConfigurations = serverResponseWrapper.getConfigurations();
        } catch (Exception unused) {
            defaultInit();
        }
    }

    private void defaultInit() {
        this.mResponse = new JSONObject();
        this.mAppKey = "";
        this.mUserId = "";
        this.mProviderOrder = new ProviderOrder();
        this.mProviderSettingsHolder = ProviderSettingsHolder.getProviderSettingsHolder();
        this.mConfigurations = new Configurations();
    }

    public String toString() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("appKey", this.mAppKey);
            jSONObject.put("userId", this.mUserId);
            jSONObject.put("response", this.mResponse);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jSONObject.toString();
    }

    public boolean isValidResponse() {
        JSONObject jSONObject = this.mResponse;
        return ((((jSONObject != null) && !jSONObject.has("error")) && this.mProviderOrder != null) && this.mProviderSettingsHolder != null) && this.mConfigurations != null;
    }

    public List<IronSource.AD_UNIT> getInitiatedAdUnits() {
        ProviderOrder providerOrder;
        ProviderOrder providerOrder2;
        if (this.mResponse == null || this.mConfigurations == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        if (this.mConfigurations.getRewardedVideoConfigurations() != null && (providerOrder2 = this.mProviderOrder) != null && providerOrder2.getRewardedVideoProviderOrder().size() > 0) {
            arrayList.add(IronSource.AD_UNIT.REWARDED_VIDEO);
        }
        if (this.mConfigurations.getInterstitialConfigurations() != null && (providerOrder = this.mProviderOrder) != null && providerOrder.getInterstitialProviderOrder().size() > 0) {
            arrayList.add(IronSource.AD_UNIT.INTERSTITIAL);
        }
        if (this.mConfigurations.getOfferwallConfigurations() != null) {
            arrayList.add(IronSource.AD_UNIT.OFFERWALL);
        }
        if (this.mConfigurations.getBannerConfigurations() != null) {
            arrayList.add(IronSource.AD_UNIT.BANNER);
        }
        return arrayList;
    }

    private void parseProviderOrder() {
        try {
            JSONObject section = getSection(this.mResponse, "providerOrder");
            JSONArray jSONArrayOptJSONArray = section.optJSONArray("rewardedVideo");
            JSONArray jSONArrayOptJSONArray2 = section.optJSONArray(IronSourceConstants.AD_UNIT_IS_MEDIATION_STATE);
            JSONArray jSONArrayOptJSONArray3 = section.optJSONArray("banner");
            this.mProviderOrder = new ProviderOrder();
            if (jSONArrayOptJSONArray != null && getConfigurations() != null && getConfigurations().getRewardedVideoConfigurations() != null) {
                String backFillProviderName = getConfigurations().getRewardedVideoConfigurations().getBackFillProviderName();
                String premiumProviderName = getConfigurations().getRewardedVideoConfigurations().getPremiumProviderName();
                for (int i = 0; i < jSONArrayOptJSONArray.length(); i++) {
                    String strOptString = jSONArrayOptJSONArray.optString(i);
                    if (strOptString.equals(backFillProviderName)) {
                        this.mProviderOrder.setRVBackFillProvider(backFillProviderName);
                    } else {
                        if (strOptString.equals(premiumProviderName)) {
                            this.mProviderOrder.setRVPremiumProvider(premiumProviderName);
                        }
                        this.mProviderOrder.addRewardedVideoProvider(strOptString);
                        ProviderSettings providerSettings = ProviderSettingsHolder.getProviderSettingsHolder().getProviderSettings(strOptString);
                        if (providerSettings != null) {
                            providerSettings.setRewardedVideoPriority(i);
                        }
                    }
                }
            }
            if (jSONArrayOptJSONArray2 != null && getConfigurations() != null && getConfigurations().getInterstitialConfigurations() != null) {
                String backFillProviderName2 = getConfigurations().getInterstitialConfigurations().getBackFillProviderName();
                String premiumProviderName2 = getConfigurations().getInterstitialConfigurations().getPremiumProviderName();
                for (int i2 = 0; i2 < jSONArrayOptJSONArray2.length(); i2++) {
                    String strOptString2 = jSONArrayOptJSONArray2.optString(i2);
                    if (strOptString2.equals(backFillProviderName2)) {
                        this.mProviderOrder.setISBackFillProvider(backFillProviderName2);
                    } else {
                        if (strOptString2.equals(premiumProviderName2)) {
                            this.mProviderOrder.setISPremiumProvider(premiumProviderName2);
                        }
                        this.mProviderOrder.addInterstitialProvider(strOptString2);
                        ProviderSettings providerSettings2 = ProviderSettingsHolder.getProviderSettingsHolder().getProviderSettings(strOptString2);
                        if (providerSettings2 != null) {
                            providerSettings2.setInterstitialPriority(i2);
                        }
                    }
                }
            }
            if (jSONArrayOptJSONArray3 != null) {
                for (int i3 = 0; i3 < jSONArrayOptJSONArray3.length(); i3++) {
                    String strOptString3 = jSONArrayOptJSONArray3.optString(i3);
                    this.mProviderOrder.addBannerProvider(strOptString3);
                    ProviderSettings providerSettings3 = ProviderSettingsHolder.getProviderSettingsHolder().getProviderSettings(strOptString3);
                    if (providerSettings3 != null) {
                        providerSettings3.setBannerPriority(i3);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void parseProviderSettings() {
        try {
            this.mProviderSettingsHolder = ProviderSettingsHolder.getProviderSettingsHolder();
            JSONObject section = getSection(this.mResponse, "providerSettings");
            Iterator<String> itKeys = section.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                JSONObject jSONObjectOptJSONObject = section.optJSONObject(next);
                if (jSONObjectOptJSONObject != null) {
                    boolean zOptBoolean = jSONObjectOptJSONObject.optBoolean("mpis", false);
                    String strOptString = jSONObjectOptJSONObject.optString("spId", AppEventsConstants.EVENT_PARAM_VALUE_NO);
                    String strOptString2 = jSONObjectOptJSONObject.optString("adSourceName", null);
                    String strOptString3 = jSONObjectOptJSONObject.optString("providerLoadName", next);
                    JSONObject section2 = getSection(jSONObjectOptJSONObject, "adUnits");
                    JSONObject section3 = getSection(jSONObjectOptJSONObject, Constants.ParametersKeys.ORIENTATION_APPLICATION);
                    JSONObject section4 = getSection(section2, "rewardedVideo");
                    JSONObject section5 = getSection(section2, IronSourceConstants.AD_UNIT_IS_MEDIATION_STATE);
                    JSONObject section6 = getSection(section2, "banner");
                    JSONObject jSONObjectMergeJsons = IronSourceUtils.mergeJsons(section4, section3);
                    JSONObject jSONObjectMergeJsons2 = IronSourceUtils.mergeJsons(section5, section3);
                    JSONObject jSONObjectMergeJsons3 = IronSourceUtils.mergeJsons(section6, section3);
                    if (this.mProviderSettingsHolder.containsProviderSettings(next)) {
                        ProviderSettings providerSettings = this.mProviderSettingsHolder.getProviderSettings(next);
                        JSONObject rewardedVideoSettings = providerSettings.getRewardedVideoSettings();
                        JSONObject interstitialSettings = providerSettings.getInterstitialSettings();
                        JSONObject bannerSettings = providerSettings.getBannerSettings();
                        providerSettings.setRewardedVideoSettings(IronSourceUtils.mergeJsons(rewardedVideoSettings, jSONObjectMergeJsons));
                        providerSettings.setInterstitialSettings(IronSourceUtils.mergeJsons(interstitialSettings, jSONObjectMergeJsons2));
                        providerSettings.setBannerSettings(IronSourceUtils.mergeJsons(bannerSettings, jSONObjectMergeJsons3));
                        providerSettings.setIsMultipleInstances(zOptBoolean);
                        providerSettings.setSubProviderId(strOptString);
                        providerSettings.setAdSourceNameForEvents(strOptString2);
                    } else if (shouldMergeWithDebugSettings(strOptString3)) {
                        ProviderSettings providerSettings2 = this.mProviderSettingsHolder.getProviderSettings("Mediation");
                        JSONObject rewardedVideoSettings2 = providerSettings2.getRewardedVideoSettings();
                        JSONObject interstitialSettings2 = providerSettings2.getInterstitialSettings();
                        JSONObject bannerSettings2 = providerSettings2.getBannerSettings();
                        ProviderSettings providerSettings3 = new ProviderSettings(next, strOptString3, section3, IronSourceUtils.mergeJsons(new JSONObject(rewardedVideoSettings2.toString()), jSONObjectMergeJsons), IronSourceUtils.mergeJsons(new JSONObject(interstitialSettings2.toString()), jSONObjectMergeJsons2), IronSourceUtils.mergeJsons(new JSONObject(bannerSettings2.toString()), jSONObjectMergeJsons3));
                        providerSettings3.setIsMultipleInstances(zOptBoolean);
                        providerSettings3.setSubProviderId(strOptString);
                        providerSettings3.setAdSourceNameForEvents(strOptString2);
                        this.mProviderSettingsHolder.addProviderSettings(providerSettings3);
                    } else {
                        ProviderSettings providerSettings4 = new ProviderSettings(next, strOptString3, section3, jSONObjectMergeJsons, jSONObjectMergeJsons2, jSONObjectMergeJsons3);
                        providerSettings4.setIsMultipleInstances(zOptBoolean);
                        providerSettings4.setSubProviderId(strOptString);
                        providerSettings4.setAdSourceNameForEvents(strOptString2);
                        this.mProviderSettingsHolder.addProviderSettings(providerSettings4);
                    }
                }
            }
            this.mProviderSettingsHolder.fillSubProvidersDetails();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private boolean shouldMergeWithDebugSettings(String str) {
        String lowerCase = StringUtils.toLowerCase(str);
        return this.mProviderSettingsHolder.containsProviderSettings("Mediation") && (StringUtils.toLowerCase(IronSourceConstants.SUPERSONIC_CONFIG_NAME).equals(lowerCase) || StringUtils.toLowerCase(IronSourceConstants.IRONSOURCE_CONFIG_NAME).equals(lowerCase));
    }

    private void parseConfigurations() {
        String str;
        String str2;
        String str3;
        String str4;
        String str5;
        String str6;
        String str7;
        String str8;
        JSONObject jSONObject;
        String str9;
        String str10;
        RewardedVideoConfigurations rewardedVideoConfigurations;
        String str11;
        String str12;
        String str13;
        String str14;
        JSONObject jSONObject2;
        String str15;
        String str16;
        String str17;
        InterstitialConfigurations interstitialConfigurations;
        String str18;
        String str19;
        String str20;
        JSONObject jSONObject3;
        String str21;
        String str22;
        String str23;
        BannerConfigurations bannerConfigurations;
        OfferwallConfigurations offerwallConfigurations;
        JSONObject section;
        JSONArray jSONArrayOptJSONArray;
        int[] iArr;
        int[] iArr2;
        int[] iArr3;
        int[] iArr4;
        int[] iArr5;
        int[] iArr6;
        int[] iArr7;
        int[] iArr8;
        AuctionSettings auctionSettings;
        AuctionSettings auctionSettings2;
        int i;
        boolean z;
        int[] iArr9;
        int[] iArr10;
        int[] iArr11;
        int[] iArr12;
        AuctionSettings auctionSettings3;
        int i2;
        boolean z2;
        int[] iArr13;
        int[] iArr14;
        int[] iArr15;
        int[] iArr16;
        AuctionSettings auctionSettings4;
        try {
            JSONObject section2 = getSection(this.mResponse, "configurations");
            JSONObject section3 = getSection(section2, "adUnits");
            JSONObject section4 = getSection(section2, Constants.ParametersKeys.ORIENTATION_APPLICATION);
            JSONObject section5 = getSection(section3, "rewardedVideo");
            JSONObject section6 = getSection(section3, IronSourceConstants.AD_UNIT_IS_MEDIATION_STATE);
            JSONObject section7 = getSection(section3, "offerwall");
            JSONObject section8 = getSection(section3, "banner");
            JSONObject section9 = getSection(section4, "events");
            JSONObject section10 = getSection(section4, "loggers");
            JSONObject section11 = getSection(section4, "token");
            JSONObject section12 = getSection(section4, "segment");
            JSONObject section13 = getSection(section4, "auction");
            if (section4 != null) {
                IronSourceUtils.saveBooleanToSharedPrefs(this.mContext, DeviceStatus.UUID_ENABLED, section4.optBoolean(DeviceStatus.UUID_ENABLED, true));
            }
            if (section9 != null) {
                String strOptString = section9.optString("abt");
                if (!TextUtils.isEmpty(strOptString)) {
                    InterstitialEventsManager.getInstance().setABT(strOptString);
                    RewardedVideoEventsManager.getInstance().setABT(strOptString);
                }
            }
            String str24 = "nonConnectivityEvents";
            String str25 = "triggerEvents";
            String str26 = "optIn";
            if (section5 != null) {
                JSONArray jSONArrayOptJSONArray2 = section5.optJSONArray("placements");
                str4 = "placements";
                JSONObject section14 = getSection(section5, "events");
                str = "events";
                int intConfigValue = getIntConfigValue(section5, section4, "maxNumOfAdaptersToLoadOnStart", 2);
                str3 = "maxNumOfAdaptersToLoadOnStart";
                int intConfigValue2 = getIntConfigValue(section5, section4, "advancedLoading", 0);
                if (intConfigValue2 > 0) {
                    i2 = intConfigValue2;
                    z2 = true;
                } else {
                    i2 = intConfigValue;
                    z2 = false;
                }
                int intConfigValue3 = getIntConfigValue(section5, section4, "adapterTimeOutInSeconds", 60);
                int intConfigValue4 = getIntConfigValue(section5, section4, "loadRVInterval", 300);
                JSONObject jSONObjectMergeJsons = IronSourceUtils.mergeJsons(section14, section9);
                boolean zOptBoolean = jSONObjectMergeJsons.optBoolean("sendUltraEvents", false);
                boolean zOptBoolean2 = jSONObjectMergeJsons.optBoolean("sendEventsToggle", false);
                String strOptString2 = jSONObjectMergeJsons.optString("serverEventsURL", "");
                String strOptString3 = jSONObjectMergeJsons.optString("serverEventsType", "");
                int iOptInt = jSONObjectMergeJsons.optInt("backupThreshold", -1);
                int iOptInt2 = jSONObjectMergeJsons.optInt("maxNumberOfEvents", -1);
                int iOptInt3 = jSONObjectMergeJsons.optInt("maxEventsPerBatch", 5000);
                JSONArray jSONArrayOptJSONArray3 = jSONObjectMergeJsons.optJSONArray("optOut");
                if (jSONArrayOptJSONArray3 != null) {
                    int[] iArr17 = new int[jSONArrayOptJSONArray3.length()];
                    str7 = "maxEventsPerBatch";
                    str8 = "optOut";
                    for (int i3 = 0; i3 < jSONArrayOptJSONArray3.length(); i3++) {
                        iArr17[i3] = jSONArrayOptJSONArray3.optInt(i3);
                    }
                    iArr13 = iArr17;
                } else {
                    str7 = "maxEventsPerBatch";
                    str8 = "optOut";
                    iArr13 = null;
                }
                JSONArray jSONArrayOptJSONArray4 = jSONObjectMergeJsons.optJSONArray(str26);
                if (jSONArrayOptJSONArray4 != null) {
                    int[] iArr18 = new int[jSONArrayOptJSONArray4.length()];
                    str26 = str26;
                    for (int i4 = 0; i4 < jSONArrayOptJSONArray4.length(); i4++) {
                        iArr18[i4] = jSONArrayOptJSONArray4.optInt(i4);
                    }
                    iArr14 = iArr18;
                } else {
                    str26 = str26;
                    iArr14 = null;
                }
                JSONArray jSONArrayOptJSONArray5 = jSONObjectMergeJsons.optJSONArray(str25);
                if (jSONArrayOptJSONArray5 != null) {
                    int[] iArr19 = new int[jSONArrayOptJSONArray5.length()];
                    str25 = str25;
                    for (int i5 = 0; i5 < jSONArrayOptJSONArray5.length(); i5++) {
                        iArr19[i5] = jSONArrayOptJSONArray5.optInt(i5);
                    }
                    iArr15 = iArr19;
                } else {
                    str25 = str25;
                    iArr15 = null;
                }
                JSONArray jSONArrayOptJSONArray6 = jSONObjectMergeJsons.optJSONArray(str24);
                if (jSONArrayOptJSONArray6 != null) {
                    int[] iArr20 = new int[jSONArrayOptJSONArray6.length()];
                    for (int i6 = 0; i6 < jSONArrayOptJSONArray6.length(); i6++) {
                        iArr20[i6] = jSONArrayOptJSONArray6.optInt(i6);
                    }
                    iArr16 = iArr20;
                } else {
                    iArr16 = null;
                }
                ApplicationEvents applicationEvents = new ApplicationEvents(zOptBoolean, zOptBoolean2, strOptString2, strOptString3, iOptInt, iOptInt2, iOptInt3, iArr13, iArr14, iArr15, iArr16);
                if (section13 != null) {
                    JSONObject section15 = getSection(section13, "rewardedVideo");
                    str24 = str24;
                    str10 = "maxNumberOfEvents";
                    jSONObject = section13;
                    str5 = "backupThreshold";
                    str6 = "serverEventsType";
                    str2 = "";
                    str9 = "serverEventsURL";
                    AuctionSettings auctionSettings5 = new AuctionSettings(section13.optString("auctionData", ""), section13.optString("auctioneerURL", ""), section13.optInt(IronSourceConstants.AUCTION_TRIALS, 2), section13.optInt("auctionSavedHistory", 15), section13.optLong("auctionTimeout", 10000L), section15.optBoolean(IronSourceConstants.EVENTS_PROGRAMMATIC, false), section15.optInt("minTimeBeforeFirstAuction", IronSourceConstants.IS_AUCTION_REQUEST), section15.optInt("auctionRetryInterval", NetworkConstants.UPLOAD_CONNECT_TIMEOUT), section15.optInt("timeToWaitBeforeAuction", 5000), section15.optInt("timeToWaitBeforeLoad", 50), section15.optBoolean("isAuctionOnShowStart", false), section15.optBoolean("isLoadWhileShow", false), section15.optInt("timeToDeleteOldWaterfallAfterAuction", NetworkConstants.UPLOAD_CONNECT_TIMEOUT));
                    JSONArray jSONArrayOptJSONArray7 = section15.optJSONArray("disableLoadWhileShowSupportFor");
                    if (jSONArrayOptJSONArray7 != null) {
                        for (int i7 = 0; i7 < jSONArrayOptJSONArray7.length(); i7++) {
                            auctionSettings5.addLoadWhileShowSupportProvider(jSONArrayOptJSONArray7.optString(i7));
                        }
                    }
                    auctionSettings4 = auctionSettings5;
                } else {
                    str2 = "";
                    str9 = "serverEventsURL";
                    str24 = str24;
                    str5 = "backupThreshold";
                    str6 = "serverEventsType";
                    jSONObject = section13;
                    str10 = "maxNumberOfEvents";
                    auctionSettings4 = new AuctionSettings();
                }
                RewardedVideoConfigurations rewardedVideoConfigurations2 = new RewardedVideoConfigurations(i2, z2, intConfigValue3, intConfigValue4, applicationEvents, auctionSettings4);
                if (jSONArrayOptJSONArray2 != null) {
                    for (int i8 = 0; i8 < jSONArrayOptJSONArray2.length(); i8++) {
                        Placement singleRVPlacement = parseSingleRVPlacement(jSONArrayOptJSONArray2.optJSONObject(i8));
                        if (singleRVPlacement != null) {
                            rewardedVideoConfigurations2.addRewardedVideoPlacement(singleRVPlacement);
                        }
                    }
                }
                String strOptString4 = section5.optString("backFill");
                if (!TextUtils.isEmpty(strOptString4)) {
                    rewardedVideoConfigurations2.setBackFillProviderName(strOptString4);
                }
                String strOptString5 = section5.optString("premium");
                if (!TextUtils.isEmpty(strOptString5)) {
                    rewardedVideoConfigurations2.setPremiumProviderName(strOptString5);
                }
                rewardedVideoConfigurations = rewardedVideoConfigurations2;
            } else {
                str = "events";
                str2 = "";
                str3 = "maxNumOfAdaptersToLoadOnStart";
                str4 = "placements";
                str5 = "backupThreshold";
                str6 = "serverEventsType";
                str7 = "maxEventsPerBatch";
                str8 = "optOut";
                jSONObject = section13;
                str9 = "serverEventsURL";
                str10 = "maxNumberOfEvents";
                rewardedVideoConfigurations = null;
            }
            if (section6 != null) {
                str12 = str4;
                JSONArray jSONArrayOptJSONArray8 = section6.optJSONArray(str12);
                str13 = str;
                JSONObject section16 = getSection(section6, str13);
                str14 = str3;
                int intConfigValue5 = getIntConfigValue(section6, section4, str14, 2);
                int intConfigValue6 = getIntConfigValue(section6, section4, "advancedLoading", 0);
                if (intConfigValue6 > 0) {
                    i = intConfigValue6;
                    z = true;
                } else {
                    i = intConfigValue5;
                    z = false;
                }
                int intConfigValue7 = getIntConfigValue(section6, section4, "adapterTimeOutInSeconds", 60);
                int intConfigValue8 = getIntConfigValue(section6, section4, "delayLoadFailure", 3);
                JSONObject jSONObjectMergeJsons2 = IronSourceUtils.mergeJsons(section16, section9);
                boolean zOptBoolean3 = jSONObjectMergeJsons2.optBoolean("sendEventsToggle", false);
                str15 = str2;
                String strOptString6 = jSONObjectMergeJsons2.optString(str9, str15);
                String str27 = str6;
                String strOptString7 = jSONObjectMergeJsons2.optString(str27, str15);
                String str28 = str5;
                int iOptInt4 = jSONObjectMergeJsons2.optInt(str28, -1);
                String str29 = str10;
                int iOptInt5 = jSONObjectMergeJsons2.optInt(str29, -1);
                str17 = str9;
                String str30 = str7;
                int iOptInt6 = jSONObjectMergeJsons2.optInt(str30, 5000);
                str7 = str30;
                String str31 = str8;
                JSONArray jSONArrayOptJSONArray9 = jSONObjectMergeJsons2.optJSONArray(str31);
                if (jSONArrayOptJSONArray9 != null) {
                    str8 = str31;
                    int[] iArr21 = new int[jSONArrayOptJSONArray9.length()];
                    str16 = str29;
                    str5 = str28;
                    for (int i9 = 0; i9 < jSONArrayOptJSONArray9.length(); i9++) {
                        iArr21[i9] = jSONArrayOptJSONArray9.optInt(i9);
                    }
                    iArr9 = iArr21;
                } else {
                    str16 = str29;
                    str8 = str31;
                    str5 = str28;
                    iArr9 = null;
                }
                String str32 = str26;
                JSONArray jSONArrayOptJSONArray10 = jSONObjectMergeJsons2.optJSONArray(str32);
                if (jSONArrayOptJSONArray10 != null) {
                    int[] iArr22 = new int[jSONArrayOptJSONArray10.length()];
                    str26 = str32;
                    for (int i10 = 0; i10 < jSONArrayOptJSONArray10.length(); i10++) {
                        iArr22[i10] = jSONArrayOptJSONArray10.optInt(i10);
                    }
                    iArr10 = iArr22;
                } else {
                    str26 = str32;
                    iArr10 = null;
                }
                String str33 = str25;
                JSONArray jSONArrayOptJSONArray11 = jSONObjectMergeJsons2.optJSONArray(str33);
                if (jSONArrayOptJSONArray11 != null) {
                    int[] iArr23 = new int[jSONArrayOptJSONArray11.length()];
                    str25 = str33;
                    for (int i11 = 0; i11 < jSONArrayOptJSONArray11.length(); i11++) {
                        iArr23[i11] = jSONArrayOptJSONArray11.optInt(i11);
                    }
                    iArr11 = iArr23;
                } else {
                    str25 = str33;
                    iArr11 = null;
                }
                str11 = str24;
                JSONArray jSONArrayOptJSONArray12 = jSONObjectMergeJsons2.optJSONArray(str11);
                if (jSONArrayOptJSONArray12 != null) {
                    int[] iArr24 = new int[jSONArrayOptJSONArray12.length()];
                    for (int i12 = 0; i12 < jSONArrayOptJSONArray12.length(); i12++) {
                        iArr24[i12] = jSONArrayOptJSONArray12.optInt(i12);
                    }
                    iArr12 = iArr24;
                } else {
                    iArr12 = null;
                }
                ApplicationEvents applicationEvents2 = new ApplicationEvents(false, zOptBoolean3, strOptString6, strOptString7, iOptInt4, iOptInt5, iOptInt6, iArr9, iArr10, iArr11, iArr12);
                if (jSONObject != null) {
                    jSONObject2 = jSONObject;
                    str6 = str27;
                    auctionSettings3 = new AuctionSettings(jSONObject2.optString("auctionData", str15), jSONObject2.optString("auctioneerURL", str15), jSONObject2.optInt(IronSourceConstants.AUCTION_TRIALS, 2), jSONObject2.optInt("auctionSavedHistory", 15), jSONObject2.optLong("auctionTimeout", 10000L), getSection(jSONObject2, IronSourceConstants.AD_UNIT_IS_MEDIATION_STATE).optBoolean(IronSourceConstants.EVENTS_PROGRAMMATIC, false), r3.optInt("minTimeBeforeFirstAuction", IronSourceConstants.IS_AUCTION_REQUEST), 0L, 0L, 0L, true, true, 0);
                } else {
                    str6 = str27;
                    jSONObject2 = jSONObject;
                    auctionSettings3 = new AuctionSettings();
                }
                InterstitialConfigurations interstitialConfigurations2 = new InterstitialConfigurations(i, z, intConfigValue7, applicationEvents2, auctionSettings3, intConfigValue8);
                if (jSONArrayOptJSONArray8 != null) {
                    for (int i13 = 0; i13 < jSONArrayOptJSONArray8.length(); i13++) {
                        InterstitialPlacement singleISPlacement = parseSingleISPlacement(jSONArrayOptJSONArray8.optJSONObject(i13));
                        if (singleISPlacement != null) {
                            interstitialConfigurations2.addInterstitialPlacement(singleISPlacement);
                        }
                    }
                }
                String strOptString8 = section6.optString("backFill");
                if (!TextUtils.isEmpty(strOptString8)) {
                    interstitialConfigurations2.setBackFillProviderName(strOptString8);
                }
                String strOptString9 = section6.optString("premium");
                if (!TextUtils.isEmpty(strOptString9)) {
                    interstitialConfigurations2.setPremiumProviderName(strOptString9);
                }
                interstitialConfigurations = interstitialConfigurations2;
            } else {
                str11 = str24;
                str12 = str4;
                str13 = str;
                str14 = str3;
                jSONObject2 = jSONObject;
                str15 = str2;
                str16 = str10;
                str17 = str9;
                interstitialConfigurations = null;
            }
            if (section8 != null) {
                JSONArray jSONArrayOptJSONArray13 = section8.optJSONArray(str12);
                JSONObject section17 = getSection(section8, str13);
                int intConfigValue9 = getIntConfigValue(section8, section4, str14, 1);
                String str34 = str15;
                String str35 = str25;
                String str36 = str11;
                str19 = str12;
                String str37 = str26;
                long longConfigValue = getLongConfigValue(section8, section4, "atim", 10000L);
                int intConfigValue10 = getIntConfigValue(section8, section4, "delayLoadFailure", 3);
                int intConfigValue11 = getIntConfigValue(section8, section4, "bannerInterval", 60);
                JSONObject jSONObjectMergeJsons3 = IronSourceUtils.mergeJsons(section17, section9);
                boolean zOptBoolean4 = jSONObjectMergeJsons3.optBoolean("sendEventsToggle", false);
                str20 = str34;
                str21 = str17;
                String strOptString10 = jSONObjectMergeJsons3.optString(str21, str20);
                String str38 = str6;
                String strOptString11 = jSONObjectMergeJsons3.optString(str38, str20);
                String str39 = str5;
                int iOptInt7 = jSONObjectMergeJsons3.optInt(str39, -1);
                String str40 = str16;
                int iOptInt8 = jSONObjectMergeJsons3.optInt(str40, -1);
                String str41 = str7;
                int iOptInt9 = jSONObjectMergeJsons3.optInt(str41, 5000);
                String str42 = str8;
                JSONArray jSONArrayOptJSONArray14 = jSONObjectMergeJsons3.optJSONArray(str42);
                if (jSONArrayOptJSONArray14 != null) {
                    jSONObject3 = section4;
                    int[] iArr25 = new int[jSONArrayOptJSONArray14.length()];
                    str7 = str41;
                    str8 = str42;
                    for (int i14 = 0; i14 < jSONArrayOptJSONArray14.length(); i14++) {
                        iArr25[i14] = jSONArrayOptJSONArray14.optInt(i14);
                    }
                    iArr5 = iArr25;
                } else {
                    jSONObject3 = section4;
                    str7 = str41;
                    str8 = str42;
                    iArr5 = null;
                }
                JSONArray jSONArrayOptJSONArray15 = jSONObjectMergeJsons3.optJSONArray(str37);
                if (jSONArrayOptJSONArray15 != null) {
                    int[] iArr26 = new int[jSONArrayOptJSONArray15.length()];
                    str22 = str37;
                    for (int i15 = 0; i15 < jSONArrayOptJSONArray15.length(); i15++) {
                        iArr26[i15] = jSONArrayOptJSONArray15.optInt(i15);
                    }
                    iArr6 = iArr26;
                } else {
                    str22 = str37;
                    iArr6 = null;
                }
                JSONArray jSONArrayOptJSONArray16 = jSONObjectMergeJsons3.optJSONArray(str35);
                if (jSONArrayOptJSONArray16 != null) {
                    int[] iArr27 = new int[jSONArrayOptJSONArray16.length()];
                    str25 = str35;
                    for (int i16 = 0; i16 < jSONArrayOptJSONArray16.length(); i16++) {
                        iArr27[i16] = jSONArrayOptJSONArray16.optInt(i16);
                    }
                    iArr7 = iArr27;
                } else {
                    str25 = str35;
                    iArr7 = null;
                }
                JSONArray jSONArrayOptJSONArray17 = jSONObjectMergeJsons3.optJSONArray(str36);
                if (jSONArrayOptJSONArray17 != null) {
                    int[] iArr28 = new int[jSONArrayOptJSONArray17.length()];
                    for (int i17 = 0; i17 < jSONArrayOptJSONArray17.length(); i17++) {
                        iArr28[i17] = jSONArrayOptJSONArray17.optInt(i17);
                    }
                    iArr8 = iArr28;
                } else {
                    iArr8 = null;
                }
                ApplicationEvents applicationEvents3 = new ApplicationEvents(false, zOptBoolean4, strOptString10, strOptString11, iOptInt7, iOptInt8, iOptInt9, iArr5, iArr6, iArr7, iArr8);
                if (jSONObject2 != null) {
                    JSONObject section18 = getSection(jSONObject2, "banner");
                    if (section18 != null) {
                        str18 = str36;
                        str23 = str40;
                        str6 = str38;
                        str5 = str39;
                        auctionSettings2 = new AuctionSettings(jSONObject2.optString("auctionData", str20), jSONObject2.optString("auctioneerURL", str20), jSONObject2.optInt(IronSourceConstants.AUCTION_TRIALS, 2), jSONObject2.optInt("auctionSavedHistory", 15), jSONObject2.optLong("auctionTimeout", 10000L), section18.optBoolean(IronSourceConstants.EVENTS_PROGRAMMATIC, false), section18.optInt("minTimeBeforeFirstAuction", IronSourceConstants.IS_AUCTION_REQUEST), 0L, 0L, 0L, true, true, 0);
                    } else {
                        str6 = str38;
                        str5 = str39;
                        str18 = str36;
                        str23 = str40;
                        auctionSettings2 = new AuctionSettings();
                    }
                    auctionSettings = auctionSettings2;
                } else {
                    str6 = str38;
                    str5 = str39;
                    str18 = str36;
                    str23 = str40;
                    auctionSettings = new AuctionSettings();
                }
                BannerConfigurations bannerConfigurations2 = new BannerConfigurations(intConfigValue9, longConfigValue, applicationEvents3, intConfigValue11, auctionSettings, intConfigValue10);
                if (jSONArrayOptJSONArray13 != null) {
                    for (int i18 = 0; i18 < jSONArrayOptJSONArray13.length(); i18++) {
                        BannerPlacement singleBNPlacement = parseSingleBNPlacement(jSONArrayOptJSONArray13.optJSONObject(i18));
                        if (singleBNPlacement != null) {
                            bannerConfigurations2.addBannerPlacement(singleBNPlacement);
                        }
                    }
                }
                bannerConfigurations = bannerConfigurations2;
            } else {
                str18 = str11;
                str19 = str12;
                str20 = str15;
                jSONObject3 = section4;
                str21 = str17;
                str22 = str26;
                str23 = str16;
                bannerConfigurations = null;
            }
            if (section7 != null) {
                JSONObject jSONObjectMergeJsons4 = IronSourceUtils.mergeJsons(getSection(section7, str13), section9);
                boolean zOptBoolean5 = jSONObjectMergeJsons4.optBoolean("sendEventsToggle", false);
                String strOptString12 = jSONObjectMergeJsons4.optString(str21, str20);
                String strOptString13 = jSONObjectMergeJsons4.optString(str6, str20);
                int iOptInt10 = jSONObjectMergeJsons4.optInt(str5, -1);
                int iOptInt11 = jSONObjectMergeJsons4.optInt(str23, -1);
                int iOptInt12 = jSONObjectMergeJsons4.optInt(str7, 5000);
                JSONArray jSONArrayOptJSONArray18 = jSONObjectMergeJsons4.optJSONArray(str8);
                if (jSONArrayOptJSONArray18 != null) {
                    int[] iArr29 = new int[jSONArrayOptJSONArray18.length()];
                    for (int i19 = 0; i19 < jSONArrayOptJSONArray18.length(); i19++) {
                        iArr29[i19] = jSONArrayOptJSONArray18.optInt(i19);
                    }
                    iArr = iArr29;
                } else {
                    iArr = null;
                }
                JSONArray jSONArrayOptJSONArray19 = jSONObjectMergeJsons4.optJSONArray(str22);
                if (jSONArrayOptJSONArray19 != null) {
                    int[] iArr30 = new int[jSONArrayOptJSONArray19.length()];
                    for (int i20 = 0; i20 < jSONArrayOptJSONArray19.length(); i20++) {
                        iArr30[i20] = jSONArrayOptJSONArray19.optInt(i20);
                    }
                    iArr2 = iArr30;
                } else {
                    iArr2 = null;
                }
                JSONArray jSONArrayOptJSONArray20 = jSONObjectMergeJsons4.optJSONArray(str25);
                if (jSONArrayOptJSONArray20 != null) {
                    int[] iArr31 = new int[jSONArrayOptJSONArray20.length()];
                    for (int i21 = 0; i21 < jSONArrayOptJSONArray20.length(); i21++) {
                        iArr31[i21] = jSONArrayOptJSONArray20.optInt(i21);
                    }
                    iArr3 = iArr31;
                } else {
                    iArr3 = null;
                }
                JSONArray jSONArrayOptJSONArray21 = jSONObjectMergeJsons4.optJSONArray(str18);
                if (jSONArrayOptJSONArray21 != null) {
                    int[] iArr32 = new int[jSONArrayOptJSONArray21.length()];
                    for (int i22 = 0; i22 < jSONArrayOptJSONArray21.length(); i22++) {
                        iArr32[i22] = jSONArrayOptJSONArray21.optInt(i22);
                    }
                    iArr4 = iArr32;
                } else {
                    iArr4 = null;
                }
                OfferwallConfigurations offerwallConfigurations2 = new OfferwallConfigurations(new ApplicationEvents(false, zOptBoolean5, strOptString12, strOptString13, iOptInt10, iOptInt11, iOptInt12, iArr, iArr2, iArr3, iArr4));
                JSONArray jSONArrayOptJSONArray22 = section7.optJSONArray(str19);
                if (jSONArrayOptJSONArray22 != null) {
                    for (int i23 = 0; i23 < jSONArrayOptJSONArray22.length(); i23++) {
                        OfferwallPlacement singleOWPlacement = parseSingleOWPlacement(jSONArrayOptJSONArray22.optJSONObject(i23));
                        if (singleOWPlacement != null) {
                            offerwallConfigurations2.addOfferwallPlacement(singleOWPlacement);
                        }
                    }
                }
                offerwallConfigurations = offerwallConfigurations2;
            } else {
                offerwallConfigurations = null;
            }
            TokenSettings tokenSettings = new TokenSettings();
            if (section11 != null && (jSONArrayOptJSONArray = section11.optJSONArray("optInKeys")) != null) {
                for (int i24 = 0; i24 < jSONArrayOptJSONArray.length(); i24++) {
                    tokenSettings.addOptInKeyParam(jSONArrayOptJSONArray.optString(i24));
                }
            }
            this.mConfigurations = new Configurations(rewardedVideoConfigurations, interstitialConfigurations, offerwallConfigurations, bannerConfigurations, new ApplicationConfigurations(new ApplicationLogger(section10.optInt("server", 3), section10.optInt("publisher", 3), section10.optInt(ConsoleLogger.NAME, 3)), section12 != null ? new ServerSegmetData(section12.optString("name", str20), section12.optString("id", "-1"), section12.optJSONObject("custom")) : null, tokenSettings, jSONObject3.optBoolean("integration", false)));
            JSONObject section19 = getSection(section9, "genericParams");
            if (section19 != null && (section = getSection(section19, str13)) != null) {
                section19.remove(str13);
                Map<String, String> jsonToStringMap = IronSourceUtils.parseJsonToStringMap(section);
                RewardedVideoEventsManager.getInstance().setEventGenericParams(jsonToStringMap);
                InterstitialEventsManager.getInstance().setEventGenericParams(jsonToStringMap);
            }
            if (section19 != null) {
                Map<String, String> jsonToStringMap2 = IronSourceUtils.parseJsonToStringMap(section19);
                RewardedVideoEventsManager.getInstance().setBatchParams(jsonToStringMap2);
                InterstitialEventsManager.getInstance().setBatchParams(jsonToStringMap2);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private boolean getBooleanConfigValue(JSONObject jSONObject, JSONObject jSONObject2, String str, boolean z) {
        if (jSONObject.has(str)) {
            return jSONObject.optBoolean(str, z);
        }
        return jSONObject2.has(str) ? jSONObject2.optBoolean(str, z) : z;
    }

    private int getIntConfigValue(JSONObject jSONObject, JSONObject jSONObject2, String str, int i) {
        int iOptInt = 0;
        if (jSONObject.has(str)) {
            iOptInt = jSONObject.optInt(str, 0);
        } else if (jSONObject2.has(str)) {
            iOptInt = jSONObject2.optInt(str, 0);
        }
        return iOptInt == 0 ? i : iOptInt;
    }

    private long getLongConfigValue(JSONObject jSONObject, JSONObject jSONObject2, String str, long j) {
        long jOptLong;
        if (jSONObject.has(str)) {
            jOptLong = jSONObject.optLong(str, 0L);
        } else {
            jOptLong = jSONObject2.has(str) ? jSONObject2.optLong(str, 0L) : 0L;
        }
        return jOptLong == 0 ? j : jOptLong;
    }

    private Placement parseSingleRVPlacement(JSONObject jSONObject) {
        if (jSONObject != null) {
            int iOptInt = jSONObject.optInt(Constants.PLACEMENT_ID, -1);
            String strOptString = jSONObject.optString("placementName", "");
            boolean zOptBoolean = jSONObject.optBoolean("isDefault", false);
            String strOptString2 = jSONObject.optString("virtualItemName", "");
            int iOptInt2 = jSONObject.optInt("virtualItemCount", -1);
            PlacementAvailabilitySettings placementAvailabilitySettings = getPlacementAvailabilitySettings(jSONObject);
            if (iOptInt >= 0 && !TextUtils.isEmpty(strOptString) && !TextUtils.isEmpty(strOptString2) && iOptInt2 > 0) {
                Placement placement = new Placement(iOptInt, strOptString, zOptBoolean, strOptString2, iOptInt2, placementAvailabilitySettings);
                if (placementAvailabilitySettings == null) {
                    return placement;
                }
                CappingManager.addCappingInfo(this.mContext, placement);
                return placement;
            }
        }
        return null;
    }

    private InterstitialPlacement parseSingleISPlacement(JSONObject jSONObject) {
        if (jSONObject != null) {
            int iOptInt = jSONObject.optInt(Constants.PLACEMENT_ID, -1);
            String strOptString = jSONObject.optString("placementName", "");
            boolean zOptBoolean = jSONObject.optBoolean("isDefault", false);
            PlacementAvailabilitySettings placementAvailabilitySettings = getPlacementAvailabilitySettings(jSONObject);
            if (iOptInt >= 0 && !TextUtils.isEmpty(strOptString)) {
                InterstitialPlacement interstitialPlacement = new InterstitialPlacement(iOptInt, strOptString, zOptBoolean, placementAvailabilitySettings);
                if (placementAvailabilitySettings == null) {
                    return interstitialPlacement;
                }
                CappingManager.addCappingInfo(this.mContext, interstitialPlacement);
                return interstitialPlacement;
            }
        }
        return null;
    }

    private OfferwallPlacement parseSingleOWPlacement(JSONObject jSONObject) {
        if (jSONObject != null) {
            int iOptInt = jSONObject.optInt(Constants.PLACEMENT_ID, -1);
            String strOptString = jSONObject.optString("placementName", "");
            boolean zOptBoolean = jSONObject.optBoolean("isDefault", false);
            if (iOptInt >= 0 && !TextUtils.isEmpty(strOptString)) {
                return new OfferwallPlacement(iOptInt, strOptString, zOptBoolean);
            }
        }
        return null;
    }

    private BannerPlacement parseSingleBNPlacement(JSONObject jSONObject) {
        if (jSONObject != null) {
            int iOptInt = jSONObject.optInt(Constants.PLACEMENT_ID, -1);
            String strOptString = jSONObject.optString("placementName", "");
            boolean zOptBoolean = jSONObject.optBoolean("isDefault", false);
            PlacementAvailabilitySettings placementAvailabilitySettings = getPlacementAvailabilitySettings(jSONObject);
            if (iOptInt >= 0 && !TextUtils.isEmpty(strOptString)) {
                BannerPlacement bannerPlacement = new BannerPlacement(iOptInt, strOptString, zOptBoolean, placementAvailabilitySettings);
                if (placementAvailabilitySettings == null) {
                    return bannerPlacement;
                }
                CappingManager.addCappingInfo(this.mContext, bannerPlacement);
                return bannerPlacement;
            }
        }
        return null;
    }

    private PlacementAvailabilitySettings getPlacementAvailabilitySettings(JSONObject jSONObject) {
        PlacementCappingType placementCappingType = null;
        if (jSONObject == null) {
            return null;
        }
        PlacementAvailabilitySettings.PlacementAvailabilitySettingsBuilder placementAvailabilitySettingsBuilder = new PlacementAvailabilitySettings.PlacementAvailabilitySettingsBuilder();
        placementAvailabilitySettingsBuilder.delivery(jSONObject.optBoolean("delivery", true));
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("capping");
        if (jSONObjectOptJSONObject != null) {
            String strOptString = jSONObjectOptJSONObject.optString("unit");
            if (!TextUtils.isEmpty(strOptString)) {
                if (PlacementCappingType.PER_DAY.toString().equals(strOptString)) {
                    placementCappingType = PlacementCappingType.PER_DAY;
                } else if (PlacementCappingType.PER_HOUR.toString().equals(strOptString)) {
                    placementCappingType = PlacementCappingType.PER_HOUR;
                }
            }
            int iOptInt = jSONObjectOptJSONObject.optInt("maxImpressions", 0);
            placementAvailabilitySettingsBuilder.capping(jSONObjectOptJSONObject.optBoolean("enabled", false) && iOptInt > 0, placementCappingType, iOptInt);
        }
        JSONObject jSONObjectOptJSONObject2 = jSONObject.optJSONObject("pacing");
        if (jSONObjectOptJSONObject2 != null) {
            int iOptInt2 = jSONObjectOptJSONObject2.optInt("numOfSeconds", 0);
            placementAvailabilitySettingsBuilder.pacing(jSONObjectOptJSONObject2.optBoolean("enabled", false) && iOptInt2 > 0, iOptInt2);
        }
        return placementAvailabilitySettingsBuilder.build();
    }

    private JSONObject getSection(JSONObject jSONObject, String str) {
        if (jSONObject != null) {
            return jSONObject.optJSONObject(str);
        }
        return null;
    }

    public String getRVBackFillProvider() {
        try {
            return this.mProviderOrder.getRVBackFillProvider();
        } catch (Exception e) {
            IronSourceLoggerManager.getLogger().logException(IronSourceLogger.IronSourceTag.INTERNAL, "getRVBackFillProvider", e);
            return null;
        }
    }

    public String getRVPremiumProvider() {
        try {
            return this.mProviderOrder.getRVPremiumProvider();
        } catch (Exception e) {
            IronSourceLoggerManager.getLogger().logException(IronSourceLogger.IronSourceTag.INTERNAL, "getRVPremiumProvider", e);
            return null;
        }
    }

    public ProviderSettingsHolder getProviderSettingsHolder() {
        return this.mProviderSettingsHolder;
    }

    public ProviderOrder getProviderOrder() {
        return this.mProviderOrder;
    }

    public Configurations getConfigurations() {
        return this.mConfigurations;
    }

    private Context getContext() {
        return this.mContext;
    }
}
