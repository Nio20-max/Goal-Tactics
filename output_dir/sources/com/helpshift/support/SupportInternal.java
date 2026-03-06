package com.helpshift.support;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import com.helpshift.HelpshiftUser;
import com.helpshift.PluginEventBridge;
import com.helpshift.activities.MainActivity;
import com.helpshift.analytics.AnalyticsEventKey;
import com.helpshift.applifecycle.HSAppLifeCycleController;
import com.helpshift.common.HSBlockReason;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.configuration.dto.RootApiConfig;
import com.helpshift.configuration.dto.RootInstallConfig;
import com.helpshift.constants.CommonSharedPrefrences;
import com.helpshift.conversation.IssueType;
import com.helpshift.db.conversation.tables.ConversationTable;
import com.helpshift.delegate.RootDelegate;
import com.helpshift.logger.logmodels.LogExtrasModelProvider;
import com.helpshift.model.AppInfoModel;
import com.helpshift.model.InfoModelFactory;
import com.helpshift.providers.CrossModuleDataProvider;
import com.helpshift.support.FaqTagFilter;
import com.helpshift.support.activities.ParentActivity;
import com.helpshift.support.conversations.NewConversationFragment;
import com.helpshift.support.db.SupportDBNameRepo;
import com.helpshift.support.flows.CustomContactUsFlowListHolder;
import com.helpshift.support.flows.DynamicFormFlowListHolder;
import com.helpshift.support.flows.Flow;
import com.helpshift.support.fragments.SingleQuestionFragment;
import com.helpshift.support.fragments.SupportFragment;
import com.helpshift.support.fragments.SupportFragmentConstants;
import com.helpshift.support.providers.SupportDataProvider;
import com.helpshift.support.util.ConfigUtil;
import com.helpshift.util.ActivityUtil;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.util.FetchDataFromThread;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HSPattern;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.MapUtil;
import com.helpshift.util.SDKSanityCheck;
import com.helpshift.util.ValuePair;
import com.helpshift.views.FontApplier;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public final class SupportInternal {
    public static final String CONVERSATION_FLOW = "conversationFlow";
    public static final String CustomMetadataKey = "hs-custom-metadata";
    public static final String DYNAMIC_FORM_FLOW = "dynamicFormFlow";
    public static final String FAQS_FLOW = "faqsFlow";
    public static final String FAQ_SECTION_FLOW = "faqSectionFlow";
    public static final String SINGLE_FAQ_FLOW = "singleFaqFlow";
    public static final String TAG = "Helpshift_SupportInter";
    private static Context context;
    private static HSApiData data;
    private static HSStorage storage;

    public static class RateAlert {
        public static final int CLOSE = 2;
        public static final int FAIL = 3;
        public static final int FEEDBACK = 1;
        public static final int SUCCESS = 0;
    }

    private SupportInternal() {
    }

    private static void init(Application application) {
        initialize(application.getApplicationContext());
    }

    private static void init(Context context2) {
        initialize(context2.getApplicationContext());
    }

    private static void initialize(Context context2) {
        if (context == null) {
            HSApiData hSApiData = new HSApiData(context2);
            data = hSApiData;
            storage = hSApiData.storage;
            ContactUsFilter.init(context2);
            context = context2;
        }
    }

    public static void preInstall(Application application, String str, String str2, String str3, Map map) {
        SDKSanityCheck.checkInstallCredsSanity(application, CommonSharedPrefrences.JSON_PREFS, str, str2, str3, SupportDBNameRepo.dbNames);
        HelpshiftContext.setApplicationContext(application.getApplicationContext());
        HelpshiftContext.initializeCore(str, str2, str3);
        boolean zBooleanValue = (map == null || !map.containsKey("manualLifecycleTracking")) ? false : ((Boolean) map.get("manualLifecycleTracking")).booleanValue();
        SupportAppLifeCycleListener supportAppLifeCycleListener = new SupportAppLifeCycleListener();
        HSAppLifeCycleController hSAppLifeCycleController = HSAppLifeCycleController.getInstance();
        hSAppLifeCycleController.init(application, zBooleanValue);
        hSAppLifeCycleController.registerAppLifeCycleListener(supportAppLifeCycleListener);
    }

    public static void install(Application application, String str, String str2, String str3) {
        install(application, str, str2, str3, new HashMap());
    }

    public static void install(Application application, String str, String str2, String str3, Map<String, Object> map) {
        init(application);
        CrossModuleDataProvider.setSupportDataProvider(new SupportDataProvider());
        HashMap map2 = (HashMap) ConfigUtil.getDefaultInstallConfig();
        if (map != null) {
            map2.putAll(map);
        }
        String packageName = application.getPackageName();
        AppInfoModel appInfoModel = InfoModelFactory.getInstance().appInfoModel;
        Object obj = map2.get("notificationIcon");
        if (obj instanceof String) {
            map2.put("notificationIcon", Integer.valueOf(ApplicationUtil.getResourceIdFromName(application, (String) obj, "drawable", packageName)));
        }
        Object obj2 = map2.get("notificationSound");
        if (obj2 instanceof String) {
            map2.put("notificationSound", Integer.valueOf(ApplicationUtil.getResourceIdFromName(application, (String) obj2, "raw", packageName)));
        }
        RootInstallConfig rootInstallConfigBuild = new RootInstallConfig.RootInstallConfigBuilder().applyMap(map2).build();
        SupportMigrator.migrate(context, HelpshiftContext.getPlatform(), HelpshiftContext.getCoreApi().getDomain(), data, storage);
        appInfoModel.setFontPath(rootInstallConfigBuild.fontPath);
        FontApplier.setFontPath(appInfoModel.getFontPath());
        Integer num = (Integer) MapUtil.getValue(map2, AppInfoModel.SCREEN_ORIENTATION_KEY, Integer.class, null);
        appInfoModel.setScreenOrientation(Integer.valueOf(num == null ? -1 : num.intValue()));
        Boolean bool = rootInstallConfigBuild.disableAnimations;
        appInfoModel.setDisableAnimations(Boolean.valueOf(bool == null ? false : bool.booleanValue()));
        String applicationVersion = ApplicationUtil.getApplicationVersion(context);
        if (!storage.getApplicationVersion().equals(applicationVersion)) {
            data.resetReviewCounter();
            HelpshiftContext.getCoreApi().getSDKConfigurationDM().setAppReviewed(false);
            storage.setApplicationVersion(applicationVersion);
        }
        HelpshiftContext.getCoreApi().updateInstallConfig(rootInstallConfigBuild);
        application.deleteDatabase(HSLogger.OLD_ERROR_REPORTING_DATABASE_NAME);
        HelpshiftContext.getCoreApi().updateConversationExpiryProperties();
        if (HelpshiftContext.getCoreApi().getUserManagerDM().getActiveUser() == null) {
            HSLogger.e(TAG, "Active user null");
            HelpshiftContext.getCoreApi().getDomain().blockPublicAPI(HSBlockReason.FETCH_ACTIVE_USER_ERROR);
        }
    }

    public static boolean isConversationActive() {
        return HelpshiftContext.getCoreApi().isActiveConversationActionable();
    }

    public static Integer getNotificationCount() {
        return Integer.valueOf(HelpshiftContext.getCoreApi().getNotificationCountSync());
    }

    public static void getNotificationCount(final Handler handler, final Handler handler2) {
        if (handler == null) {
            return;
        }
        if (data == null || storage == null) {
            if (HelpshiftContext.getApplicationContext() == null) {
                return;
            } else {
                init(HelpshiftContext.getApplicationContext());
            }
        }
        HelpshiftContext.getCoreApi().getNotificationCountAsync(new FetchDataFromThread<ValuePair<Integer, Boolean>, Object>() { // from class: com.helpshift.support.SupportInternal.1
            @Override // com.helpshift.util.FetchDataFromThread
            public void onDataFetched(ValuePair<Integer, Boolean> valuePair) {
                if (valuePair == null) {
                    return;
                }
                Message messageObtainMessage = handler.obtainMessage();
                Bundle bundle = new Bundle();
                bundle.putInt("value", valuePair.first.intValue());
                bundle.putBoolean("cache", valuePair.second.booleanValue());
                messageObtainMessage.obj = bundle;
                handler.sendMessage(messageObtainMessage);
            }

            @Override // com.helpshift.util.FetchDataFromThread
            public void onFailure(Object obj) {
                Handler handler3 = handler2;
                if (handler3 != null) {
                    Message messageObtainMessage = handler3.obtainMessage();
                    Bundle bundle = new Bundle();
                    bundle.putInt("value", -1);
                    messageObtainMessage.obj = bundle;
                    handler2.sendMessage(messageObtainMessage);
                }
            }
        });
    }

    public static void setNameAndEmail(String str, String str2) {
        HelpshiftContext.getCoreApi().setNameAndEmail((str == null || HSPattern.hasOnlySpecialCharacters(str)) ? "" : str.trim(), HSPattern.isValidEmail(str2) ? str2.trim() : "");
    }

    public static void setUserIdentifier(String str) {
        if (str != null) {
            HelpshiftContext.getCoreApi().getUserManagerDM().setUserMetaIdentifier(str.trim());
        }
    }

    public static void registerDeviceToken(Context context2, String str) {
        init(context2);
        if (str != null) {
            HelpshiftContext.getCoreApi().setPushToken(str);
        } else {
            HSLogger.e(TAG, "Device Token is null");
        }
    }

    public static void leaveBreadCrumb(String str) {
        if (str == null || TextUtils.isEmpty(str.trim())) {
            return;
        }
        HelpshiftContext.getCoreApi().getMetaDataDM().pushBreadCrumb(str);
    }

    public static void clearBreadCrumbs() {
        HelpshiftContext.getCoreApi().getMetaDataDM().clearBreadCrumbs();
    }

    public static void showConversation(Activity activity, Map<String, Object> map) {
        PluginEventBridge.sendMessage("updateMetaData", "");
        HashMap map2 = new HashMap(map);
        HSLogger.d(TAG, "Show conversation : ", LogExtrasModelProvider.fromMap("Config", map2));
        Intent intent = new Intent(activity, (Class<?>) ParentActivity.class);
        intent.putExtra(SupportFragment.SUPPORT_MODE, 1);
        intent.putExtra(SupportFragmentConstants.DECOMPOSED, true);
        intent.putExtras(cleanConfig(removeShowConversationUnsupportedConfigs(map2)));
        intent.putExtra(MainActivity.SHOW_IN_FULLSCREEN, ActivityUtil.isFullScreen(activity));
        intent.putExtra("isRoot", true);
        intent.putExtra(NewConversationFragment.SEARCH_PERFORMED, false);
        activity.startActivity(intent);
    }

    public static void showFAQSection(Activity activity, String str) {
        showFAQSection(activity, str, new HashMap());
    }

    public static void showFAQSection(Activity activity, String str, Map<String, Object> map) {
        if (!isValidPublishId(str)) {
            str = null;
        }
        HashMap map2 = new HashMap(map);
        HSLogger.d(TAG, "Show FAQ section : Publish Id : " + str, LogExtrasModelProvider.fromMap("Config", map2));
        PluginEventBridge.sendMessage("updateMetaData", "");
        Intent intent = new Intent(activity, (Class<?>) ParentActivity.class);
        intent.putExtra(SupportFragment.SUPPORT_MODE, 2);
        intent.putExtras(cleanConfig(removeFAQFlowUnsupportedConfigs(map2)));
        intent.putExtra("sectionPublishId", str);
        intent.putExtra(MainActivity.SHOW_IN_FULLSCREEN, ActivityUtil.isFullScreen(activity));
        intent.putExtra(SupportFragmentConstants.DECOMPOSED, true);
        intent.putExtra("isRoot", true);
        activity.startActivity(intent);
    }

    public static void showSingleFAQ(Activity activity, String str, Map<String, Object> map) {
        if (!isValidPublishId(str)) {
            str = null;
        }
        HashMap map2 = new HashMap(map);
        HSLogger.d(TAG, "Show single FAQ : Publish Id : " + str, LogExtrasModelProvider.fromMap("Config", map2));
        PluginEventBridge.sendMessage("updateMetaData", "");
        Intent intent = new Intent(activity, (Class<?>) ParentActivity.class);
        intent.putExtra(SupportFragment.SUPPORT_MODE, 3);
        intent.putExtras(cleanConfig(removeFAQFlowUnsupportedConfigs(map2)));
        intent.putExtra(SingleQuestionFragment.BUNDLE_ARG_QUESTION_PUBLISH_ID, str);
        intent.putExtra(MainActivity.SHOW_IN_FULLSCREEN, ActivityUtil.isFullScreen(activity));
        intent.putExtra(SupportFragmentConstants.DECOMPOSED, true);
        intent.putExtra("isRoot", true);
        activity.startActivity(intent);
    }

    public static void setMetadataCallback(Callable callable) {
        HelpshiftContext.getCoreApi().getMetaDataDM().setCustomMetaDataCallable(callable);
    }

    public static void setMetadataCallback(final MetadataCallable metadataCallable) {
        setMetadataCallback(new Callable() { // from class: com.helpshift.support.SupportInternal.2
            @Override // com.helpshift.meta.RootMetaDataCallable
            public HashMap call() {
                Metadata metadataCall = metadataCallable.call();
                if (metadataCall != null) {
                    return new HashMap(metadataCall.toMap());
                }
                return null;
            }
        });
    }

    private static void createMetadataCallback(final HashMap map) {
        if (map.containsKey("hs-custom-metadata")) {
            setMetadataCallback(new Callable() { // from class: com.helpshift.support.SupportInternal.3
                @Override // com.helpshift.meta.RootMetaDataCallable
                public HashMap call() {
                    if (map.get("hs-custom-metadata") instanceof HashMap) {
                        return (HashMap) map.get("hs-custom-metadata");
                    }
                    return null;
                }
            });
        }
    }

    public static void showFAQs(Activity activity, Map<String, Object> map) {
        HashMap map2 = new HashMap(map);
        HSLogger.d(TAG, "Show FAQs : ", LogExtrasModelProvider.fromMap("Config", map2));
        PluginEventBridge.sendMessage("updateMetaData", "");
        Intent intent = new Intent(activity, (Class<?>) ParentActivity.class);
        intent.putExtras(cleanConfig(removeFAQFlowUnsupportedConfigs(map2)));
        intent.putExtra(MainActivity.SHOW_IN_FULLSCREEN, ActivityUtil.isFullScreen(activity));
        intent.putExtra(SupportFragmentConstants.DECOMPOSED, false);
        intent.putExtra("isRoot", true);
        activity.startActivity(intent);
    }

    public static void showDynamicForm(Activity activity, String str, List<Flow> list) {
        HSLogger.d(TAG, "Show dynamic form");
        PluginEventBridge.sendMessage("updateMetaData", "");
        Intent intent = new Intent(activity, (Class<?>) ParentActivity.class);
        DynamicFormFlowListHolder.setFlowList(list);
        intent.putExtra(MainActivity.SHOW_IN_FULLSCREEN, ActivityUtil.isFullScreen(activity));
        intent.putExtra(SupportFragment.SUPPORT_MODE, 4);
        intent.putExtra(SupportFragmentConstants.DECOMPOSED, true);
        intent.putExtra(SupportFragmentConstants.FLOW_TITLE, str.trim());
        activity.startActivity(intent);
    }

    public static HashMap<String, Object> removeFAQFlowUnsupportedConfigs(HashMap<String, Object> map) {
        HashMap<String, Object> map2 = new HashMap<>(map);
        map2.remove(SDKConfigurationDM.CONVERSATION_PRE_FILL_TEXT);
        return map2;
    }

    public static HashMap<String, Object> removeShowConversationUnsupportedConfigs(HashMap<String, Object> map) {
        HashMap<String, Object> map2 = new HashMap<>(map);
        map2.remove(SDKConfigurationDM.ENABLE_CONTACT_US);
        map2.remove("customContactUsFlows");
        return map2;
    }

    private static boolean isValidPublishId(String str) {
        return str != null && str.trim().length() > 0 && str.matches("\\d+");
    }

    public static Bundle cleanConfig(HashMap<String, Object> map) {
        HashMap map2 = new HashMap(ConfigUtil.getDefaultApiConfig());
        map2.putAll(map);
        ContactUsFilter.setConfig(map2);
        Bundle bundle = new Bundle();
        createMetadataCallback(map2);
        JSONObject jSONObject = new JSONObject(map2);
        HelpshiftContext.getCoreApi().updateApiConfig(new RootApiConfig.RootApiConfigBuilder().applyMap(map2).build());
        updateCustomIssueFieldData(map2);
        try {
            if (jSONObject.has(SDKConfigurationDM.CONVERSATION_PRE_FILL_TEXT) && !jSONObject.getString(SDKConfigurationDM.CONVERSATION_PRE_FILL_TEXT).equals("null") && jSONObject.has("hs-custom-metadata")) {
                bundle.putBoolean(NewConversationFragment.SHOULD_DROP_META, true);
            }
            if (jSONObject.has("toolbarId")) {
                bundle.putInt("toolbarId", jSONObject.getInt("toolbarId"));
            }
        } catch (JSONException e) {
            HSLogger.d(TAG, "JSON exception while parsing config : ", e);
        }
        bundle.putBoolean(SDKConfigurationDM.SHOW_SEARCH_ON_NEW_CONVERSATION, jSONObject.optBoolean(SDKConfigurationDM.SHOW_SEARCH_ON_NEW_CONVERSATION, false));
        bundle.putSerializable("withTagsMatching", cleanFaqTagFilter(map2.get("withTagsMatching")));
        CustomContactUsFlowListHolder.setFlowList((List) map2.get("customContactUsFlows"));
        return bundle;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void updateCustomIssueFieldData(java.util.Map<java.lang.String, java.lang.Object> r2) {
        /*
            java.lang.String r0 = "hs-custom-issue-field"
            boolean r1 = r2.containsKey(r0)
            if (r1 == 0) goto L1b
            java.lang.Object r2 = r2.get(r0)
            boolean r0 = r2 instanceof java.util.Map
            if (r0 == 0) goto L1b
            java.util.Map r2 = (java.util.Map) r2     // Catch: java.lang.Exception -> L13
            goto L1c
        L13:
            r2 = move-exception
            java.lang.String r0 = "Helpshift_SupportInter"
            java.lang.String r1 = "Exception while parsing CIF data : "
            com.helpshift.util.HSLogger.e(r0, r1, r2)
        L1b:
            r2 = 0
        L1c:
            com.helpshift.CoreApi r0 = com.helpshift.util.HelpshiftContext.getCoreApi()
            com.helpshift.cif.CustomIssueFieldDM r0 = r0.getCustomIssueFieldDM()
            r0.setCustomIssueFieldData(r2)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.support.SupportInternal.updateCustomIssueFieldData(java.util.Map):void");
    }

    private static FaqTagFilter cleanFaqTagFilter(Object obj) {
        if (obj == null) {
            return null;
        }
        try {
            Map map = (Map) obj;
            String str = (String) map.get("operator");
            if (!TextUtils.isEmpty(str)) {
                String lowerCase = str.trim().toLowerCase(Locale.US);
                String[] strArr = (String[]) map.get("tags");
                if (strArr != null && strArr.length > 0) {
                    if (lowerCase.equals(FaqTagFilter.Operator.AND)) {
                        return new FaqTagFilter(FaqTagFilter.Operator.AND, strArr);
                    }
                    if (lowerCase.equals(FaqTagFilter.Operator.OR)) {
                        return new FaqTagFilter(FaqTagFilter.Operator.OR, strArr);
                    }
                    if (lowerCase.equals(FaqTagFilter.Operator.NOT)) {
                        return new FaqTagFilter(FaqTagFilter.Operator.NOT, strArr);
                    }
                }
            }
        } catch (ClassCastException e) {
            HSLogger.e(TAG, "Invalid FaqTagFilter object in config", e);
        }
        return null;
    }

    public static void handlePush(Context context2, Intent intent) {
        init(context2);
        String issueType = getIssueType(intent);
        String issueId = getIssueId(intent, issueType);
        if (issueId == null) {
            HSLogger.e(TAG, "Unknown issuetype/issueId in push payload");
            return;
        }
        String string = null;
        Bundle extras = intent.getExtras();
        if (extras != null && extras.containsKey("app_name")) {
            string = extras.getString("app_name");
        }
        HelpshiftContext.getCoreApi().handlePushNotification(issueType, issueId, string);
    }

    private static String getIssueId(Intent intent, String str) {
        if (intent == null || intent.getExtras() == null) {
            return null;
        }
        Bundle extras = intent.getExtras();
        if (IssueType.ISSUE.equals(str)) {
            return extras.getString(AnalyticsEventKey.ISSUE_ID);
        }
        if (IssueType.PRE_ISSUE.equals(str)) {
            return extras.getString(AnalyticsEventKey.PREISSUE_ID);
        }
        return null;
    }

    private static String getIssueType(Intent intent) {
        if (intent == null || intent.getExtras() == null) {
            return null;
        }
        return intent.getExtras().getString(ConversationTable.Columns.ISSUE_TYPE);
    }

    public static void showAlertToRateApp(String str, AlertToRateAppListener alertToRateAppListener) {
        Intent intent = new Intent("android.intent.action.VIEW");
        if (!TextUtils.isEmpty(str)) {
            intent.setData(Uri.parse(str.trim()));
        }
        if (TextUtils.isEmpty(str)) {
            if (alertToRateAppListener != null) {
                alertToRateAppListener.onAction(3);
            }
        } else {
            HSReviewFragment.setAlertToRateAppListener(alertToRateAppListener);
            Intent intent2 = new Intent(context, (Class<?>) HSReview.class);
            intent2.putExtra("disableReview", false);
            intent2.putExtra("rurl", str.trim());
            intent2.setFlags(268435456);
            context.startActivity(intent2);
        }
    }

    public static void setDelegate(RootDelegate rootDelegate) {
        HelpshiftContext.getCoreApi().setDelegateListener(rootDelegate);
    }

    public static boolean login(HelpshiftUser helpshiftUser) {
        return HelpshiftContext.getCoreApi().login(helpshiftUser);
    }

    public static boolean logout() {
        return HelpshiftContext.getCoreApi().logout();
    }

    public static boolean clearAnonymousUser() {
        return HelpshiftContext.getCoreApi().clearAnonymousUser();
    }

    public static void setSDKLanguage(String str) {
        HelpshiftContext.getCoreApi().getSDKConfigurationDM().setSdkLanguage(str);
    }

    public static void setTheme(int i) {
        InfoModelFactory.getInstance().sdkInfoModel.setTheme(i);
    }

    public static SupportFragment getFAQsFragment(Activity activity, Map<String, Object> map) {
        HashMap map2 = new HashMap(map);
        HSLogger.d(TAG, "Get FAQ fragment : ", LogExtrasModelProvider.fromMap("Config", map2));
        Bundle bundleCleanConfig = cleanConfig(removeFAQFlowUnsupportedConfigs(map2));
        bundleCleanConfig.putBoolean(MainActivity.SHOW_IN_FULLSCREEN, ActivityUtil.isFullScreen(activity).booleanValue());
        bundleCleanConfig.putBoolean(SupportFragmentConstants.IS_EMBEDDED, true);
        return SupportFragment.newInstance(bundleCleanConfig);
    }

    public static SupportFragment getConversationFragment(Activity activity, Map<String, Object> map) {
        HashMap map2 = new HashMap(map);
        HSLogger.d(TAG, "Get Conversation fragment : ", LogExtrasModelProvider.fromMap("Config", map2));
        Bundle bundleCleanConfig = cleanConfig(removeShowConversationUnsupportedConfigs(map2));
        bundleCleanConfig.putBoolean(MainActivity.SHOW_IN_FULLSCREEN, ActivityUtil.isFullScreen(activity).booleanValue());
        bundleCleanConfig.putInt(SupportFragment.SUPPORT_MODE, 1);
        bundleCleanConfig.putBoolean(SupportFragmentConstants.DECOMPOSED, true);
        bundleCleanConfig.putBoolean(MainActivity.SHOW_IN_FULLSCREEN, ActivityUtil.isFullScreen(activity).booleanValue());
        bundleCleanConfig.putBoolean("isRoot", true);
        bundleCleanConfig.putBoolean(NewConversationFragment.SEARCH_PERFORMED, false);
        bundleCleanConfig.putBoolean(SupportFragmentConstants.IS_EMBEDDED, true);
        return SupportFragment.newInstance(bundleCleanConfig);
    }

    public static SupportFragment getFAQSectionFragment(Activity activity, String str, Map<String, Object> map) {
        HashMap map2 = new HashMap(map);
        HSLogger.d(TAG, "Get FAQ section fragment : Publish Id : " + str, LogExtrasModelProvider.fromMap("Config", map2));
        Bundle bundleCleanConfig = cleanConfig(removeFAQFlowUnsupportedConfigs(map2));
        bundleCleanConfig.putInt(SupportFragment.SUPPORT_MODE, 2);
        bundleCleanConfig.putString("sectionPublishId", str);
        bundleCleanConfig.putBoolean(MainActivity.SHOW_IN_FULLSCREEN, ActivityUtil.isFullScreen(activity).booleanValue());
        bundleCleanConfig.putBoolean(SupportFragmentConstants.DECOMPOSED, true);
        bundleCleanConfig.putBoolean("isRoot", true);
        bundleCleanConfig.putBoolean(SupportFragmentConstants.IS_EMBEDDED, true);
        return SupportFragment.newInstance(bundleCleanConfig);
    }

    public static SupportFragment getSingleFAQFragment(Activity activity, String str, Map<String, Object> map) {
        HashMap map2 = new HashMap(map);
        HSLogger.d(TAG, "Get single FAQ fragment : Publish Id : " + str, LogExtrasModelProvider.fromMap("Config", map2));
        Bundle bundleCleanConfig = cleanConfig(removeFAQFlowUnsupportedConfigs(map2));
        bundleCleanConfig.putInt(SupportFragment.SUPPORT_MODE, 3);
        bundleCleanConfig.putString(SingleQuestionFragment.BUNDLE_ARG_QUESTION_PUBLISH_ID, str);
        bundleCleanConfig.putBoolean(MainActivity.SHOW_IN_FULLSCREEN, ActivityUtil.isFullScreen(activity).booleanValue());
        bundleCleanConfig.putBoolean(SupportFragmentConstants.DECOMPOSED, true);
        bundleCleanConfig.putBoolean("isRoot", true);
        bundleCleanConfig.putBoolean(SupportFragmentConstants.IS_EMBEDDED, true);
        return SupportFragment.newInstance(bundleCleanConfig);
    }

    public static SupportFragment getDynamicFormFragment(Activity activity, String str, List<Flow> list, Map<String, Object> map) {
        DynamicFormFlowListHolder.setFlowList(list);
        HashMap map2 = new HashMap(map);
        HSLogger.d(TAG, "Get dynamic flow fragment : ", LogExtrasModelProvider.fromMap("Config", map2));
        Bundle bundleCleanConfig = cleanConfig(map2);
        bundleCleanConfig.putInt(SupportFragment.SUPPORT_MODE, 4);
        bundleCleanConfig.putBoolean(MainActivity.SHOW_IN_FULLSCREEN, ActivityUtil.isFullScreen(activity).booleanValue());
        bundleCleanConfig.putString(SupportFragmentConstants.FLOW_TITLE, str.trim());
        bundleCleanConfig.putBoolean(SupportFragmentConstants.DECOMPOSED, true);
        bundleCleanConfig.putBoolean(SupportFragmentConstants.IS_EMBEDDED, true);
        return SupportFragment.newInstance(bundleCleanConfig);
    }

    public static class EnableContactUs {
        public static final Integer ALWAYS = 0;
        public static final Integer NEVER = 1;
        public static final Integer AFTER_VIEWING_FAQS = 2;
        public static final Integer AFTER_MARKING_ANSWER_UNHELPFUL = 3;
        public static final HashSet valueSet = getSupportedValueSet();

        private static HashSet<Integer> getSupportedValueSet() {
            HashSet<Integer> hashSet = new HashSet<>();
            hashSet.add(ALWAYS);
            hashSet.add(NEVER);
            hashSet.add(AFTER_VIEWING_FAQS);
            hashSet.add(AFTER_MARKING_ANSWER_UNHELPFUL);
            return hashSet;
        }
    }
}
