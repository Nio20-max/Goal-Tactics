package com.helpshift.campaigns;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.location.Location;
import androidx.core.app.NotificationCompat;
import com.helpshift.Core;
import com.helpshift.HelpshiftUser;
import com.helpshift.activities.MainActivity;
import com.helpshift.app.CampaignAppLifeCycleListener;
import com.helpshift.applifecycle.HSAppLifeCycleController;
import com.helpshift.campaigns.activities.ParentActivity;
import com.helpshift.campaigns.controllers.ControllerFactory;
import com.helpshift.campaigns.delegates.CampaignsDelegateRouter;
import com.helpshift.campaigns.delegates.InboxMessageDelegate;
import com.helpshift.campaigns.fragments.InboxFragment;
import com.helpshift.campaigns.models.CampaignDetailModel;
import com.helpshift.campaigns.models.PropertyValue;
import com.helpshift.campaigns.network.NetworkManagerFactory;
import com.helpshift.campaigns.observers.CampaignStorageObserver;
import com.helpshift.campaigns.providers.CampaignsModuleAPIs;
import com.helpshift.campaigns.storage.CampaignsDBNameRepo;
import com.helpshift.campaigns.storage.CampaignsSharedPrefs;
import com.helpshift.campaigns.storage.CampaignsStorageFactory;
import com.helpshift.campaigns.util.CampaignsNotification;
import com.helpshift.campaigns.util.InAppCampaignsUtil;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.constants.CommonSharedPrefrences;
import com.helpshift.executors.ActionExecutor;
import com.helpshift.executors.CampaignActionExecutor;
import com.helpshift.model.AppInfoModel;
import com.helpshift.model.InfoModelFactory;
import com.helpshift.notifications.NotificationChannelsManager;
import com.helpshift.providers.CrossModuleDataProvider;
import com.helpshift.util.ActivityUtil;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.SDKSanityCheck;
import com.helpshift.util.StringUtils;
import com.helpshift.util.concurrent.ApiExecutorFactory;
import com.helpshift.views.FontApplier;
import com.ironsource.sdk.constants.Constants;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class Campaigns implements Core.ApiProvider, CampaignStorageObserver {
    private static final String TAG = "Helpshift_Campaigns";
    static InboxMessageDelegate delegate;

    public interface Delegate {
        void sessionBegan();

        void sessionEnded();
    }

    @Override // com.helpshift.Core.ApiProvider
    public boolean _clearAnonymousUser() {
        return true;
    }

    Campaigns() {
    }

    public static Campaigns getInstance() {
        return LazyHolder.INSTANCE;
    }

    public static boolean addProperty(String str, String str2) {
        return addPropertyInternal(str, str2);
    }

    public static boolean addProperty(String str, Integer num) {
        return addPropertyInternal(str, num != null ? Long.valueOf(num.intValue()) : null);
    }

    public static boolean addProperty(String str, Long l) {
        return addPropertyInternal(str, l);
    }

    public static boolean addProperty(String str, Boolean bool) {
        return addPropertyInternal(str, bool);
    }

    public static boolean addProperty(String str, Date date) {
        return addPropertyInternal(str, date);
    }

    private static boolean addPropertyInternal(String str, Object obj) {
        if (!HelpshiftContext.verifyInstall()) {
            return false;
        }
        ApiExecutorFactory.getHandlerExecutor().awaitForSyncExecution();
        return ControllerFactory.getInstance().userController.addProperty(str, new PropertyValue(obj));
    }

    public static String[] addProperties(Map<String, Object> map) {
        PropertyValue propertyValue;
        if (!HelpshiftContext.verifyInstall()) {
            return null;
        }
        ApiExecutorFactory.getHandlerExecutor().awaitForSyncExecution();
        HashMap<String, PropertyValue> map2 = new HashMap<>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (!(entry.getValue() instanceof Location)) {
                if (entry.getValue() instanceof Integer) {
                    propertyValue = new PropertyValue(Long.valueOf(((Integer) entry.getValue()).intValue()));
                } else {
                    propertyValue = new PropertyValue(entry.getValue());
                }
                map2.put(entry.getKey(), propertyValue);
            }
        }
        return ControllerFactory.getInstance().userController.addProperties(map2);
    }

    public static void showInbox(final Activity activity) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runOnUiThread(new Runnable() { // from class: com.helpshift.campaigns.Campaigns.1
                @Override // java.lang.Runnable
                public void run() {
                    HSLogger.d(Campaigns.TAG, "Show Inbox");
                    Intent intent = new Intent(activity, (Class<?>) ParentActivity.class);
                    intent.putExtra(MainActivity.SHOW_IN_FULLSCREEN, ActivityUtil.isFullScreen(activity));
                    intent.putExtra(InboxFragment.LAUNCH_SOURCE, 2);
                    activity.startActivity(intent);
                    ControllerFactory.getInstance().deviceController.resetPoller();
                }
            });
        }
    }

    public static void showMessage(final String str, final Activity activity) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runOnUiThread(new Runnable() { // from class: com.helpshift.campaigns.Campaigns.2
                @Override // java.lang.Runnable
                public void run() {
                    HSLogger.d(Campaigns.TAG, "Show message : Id : " + str);
                    Intent intent = new Intent(activity, (Class<?>) ParentActivity.class);
                    intent.putExtra(MainActivity.SHOW_IN_FULLSCREEN, ActivityUtil.isFullScreen(activity));
                    intent.putExtra(InboxFragment.LAUNCH_SOURCE, 3);
                    intent.putExtra(Constants.RequestParameters.CAMPAIGN_ID, str);
                    activity.startActivity(intent);
                }
            });
        }
    }

    public static int getCountOfUnreadMessages() {
        if (!HelpshiftContext.verifyInstall()) {
            return -1;
        }
        ApiExecutorFactory.getHandlerExecutor().awaitForSyncExecution();
        List<CampaignDetailModel> listCleanAndGetActiveCampaigns = InAppCampaignsUtil.cleanAndGetActiveCampaigns(HelpshiftContext.getApplicationContext(), CampaignsStorageFactory.getInstance().campaignStorage, false, ControllerFactory.getInstance().userController.getCurrentUser().identifier);
        if (listCleanAndGetActiveCampaigns != null) {
            return listCleanAndGetActiveCampaigns.size();
        }
        return 0;
    }

    public static void setInboxMessageDelegate(final InboxMessageDelegate inboxMessageDelegate) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.campaigns.Campaigns.3
                @Override // java.lang.Runnable
                public void run() {
                    Campaigns.delegate = inboxMessageDelegate;
                    if (inboxMessageDelegate != null) {
                        CampaignsStorageFactory.getInstance().campaignStorage.addObserver(Campaigns.getInstance());
                    } else {
                        CampaignsStorageFactory.getInstance().campaignStorage.removeObserver(Campaigns.getInstance());
                    }
                }
            });
        }
    }

    public static void setDelegate(final Delegate delegate2) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.campaigns.Campaigns.4
                @Override // java.lang.Runnable
                public void run() {
                    CampaignsDelegateRouter.setDelegate(delegate2);
                }
            });
        }
    }

    public static void configure(Map map) {
        Object obj = map.get("muteNotifications");
        if (obj instanceof Boolean) {
            InfoModelFactory.getInstance().appInfoModel.setMuteNotifications((Boolean) obj);
        } else {
            InfoModelFactory.getInstance().appInfoModel.setMuteNotifications(false);
        }
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _preInstall(Application application, String str, String str2, String str3, Map<String, Object> map) {
        reconcileSDKVersionFromSupport(application);
        SDKSanityCheck.checkInstallCredsSanity(application, CampaignsSharedPrefs.SHARED_PREF_NAME, str, str2, str3, CampaignsDBNameRepo.dbNames);
        HelpshiftContext.setApplicationContext(application);
        boolean zBooleanValue = (map == null || !map.containsKey("manualLifecycleTracking")) ? false : ((Boolean) map.get("manualLifecycleTracking")).booleanValue();
        CampaignAppLifeCycleListener campaignAppLifeCycleListener = new CampaignAppLifeCycleListener();
        HelpshiftContext.setCampaignAppLifeCycleListener(campaignAppLifeCycleListener);
        HSAppLifeCycleController hSAppLifeCycleController = HSAppLifeCycleController.getInstance();
        hSAppLifeCycleController.init(application, zBooleanValue);
        hSAppLifeCycleController.registerAppLifeCycleListener(campaignAppLifeCycleListener);
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _install(Application application, String str, String str2, String str3) {
        _install(application, str, str2, str3, new HashMap());
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _install(Application application, String str, String str2, String str3, Map<String, Object> map) {
        CrossModuleDataProvider.setCampaignsDataProvider(new CampaignsModuleAPIs());
        CampaignsStorageFactory.getInstance();
        InfoModelFactory infoModelFactory = InfoModelFactory.getInstance();
        Object obj = map.get("enableInboxPolling");
        infoModelFactory.appInfoModel.setEnableInboxPolling(Boolean.valueOf(obj instanceof Boolean ? ((Boolean) obj).booleanValue() : true));
        com.helpshift.controllers.ControllerFactory.getInstance();
        ControllerFactory controllerFactory = ControllerFactory.getInstance();
        NetworkManagerFactory.getInstance();
        if (InfoModelFactory.getInstance().appInfoModel.isInstalled()) {
            InfoModelFactory.getInstance().sdkInfoModel.setFirstLaunch(false);
        } else {
            InfoModelFactory.getInstance().sdkInfoModel.setFirstLaunch(true);
        }
        InfoModelFactory.getInstance().appInfoModel.install(str, str2, str3);
        Object obj2 = map.get("font");
        InfoModelFactory.getInstance().appInfoModel.setFontPath(obj2 instanceof String ? (String) obj2 : null);
        FontApplier.setFontPath(InfoModelFactory.getInstance().appInfoModel.getFontPath());
        Object obj3 = map.get("notificationSound");
        if (obj3 instanceof Integer) {
            InfoModelFactory.getInstance().appInfoModel.setNotificationSoundId((Integer) obj3);
        }
        Object obj4 = map.get("notificationIcon");
        if (obj4 instanceof Integer) {
            InfoModelFactory.getInstance().appInfoModel.setNotificationIconId((Integer) obj4);
        }
        Object obj5 = map.get("campaignsNotificationChannelId");
        if (obj5 instanceof String) {
            InfoModelFactory.getInstance().appInfoModel.setCampaignsNotificationChannelId((String) obj5);
        }
        if (map.get("largeNotificationIcon") instanceof Integer) {
            InfoModelFactory.getInstance().appInfoModel.setLargeNotificationIconId((Integer) map.get("largeNotificationIcon"));
        }
        Object obj6 = map.get(AppInfoModel.SCREEN_ORIENTATION_KEY);
        if (obj6 instanceof Integer) {
            InfoModelFactory.getInstance().appInfoModel.setScreenOrientation((Integer) obj6);
        } else {
            InfoModelFactory.getInstance().appInfoModel.setScreenOrientation(-1);
        }
        Object obj7 = map.get(SDKConfigurationDM.SDK_TYPE);
        if (obj7 instanceof String) {
            controllerFactory.deviceController.setDevelopmentPlatform((String) obj7);
        } else {
            controllerFactory.deviceController.setDevelopmentPlatform("android");
        }
        Object obj8 = map.get("disableHelpshiftBranding");
        if (obj8 instanceof Boolean) {
            InfoModelFactory.getInstance().appInfoModel.setDisableHelpshiftBranding((Boolean) obj8);
        } else {
            InfoModelFactory.getInstance().appInfoModel.setDisableHelpshiftBranding(false);
        }
        Object obj9 = map.get(SDKConfigurationDM.DISABLE_ANIMATION);
        if (obj9 instanceof Boolean) {
            InfoModelFactory.getInstance().appInfoModel.setDisableAnimations((Boolean) obj9);
        } else {
            InfoModelFactory.getInstance().appInfoModel.setDisableAnimations(false);
        }
        CampaignsSharedPrefs campaignsSharedPrefs = CampaignsSharedPrefs.getInstance(application);
        if ("7.11.1".equals(campaignsSharedPrefs.getCurrentSDKVersion())) {
            return;
        }
        campaignsSharedPrefs.setCurrentSDKVersion("7.11.1");
    }

    private void reconcileSDKVersionFromSupport(Context context) {
        if (StringUtils.isEmpty(CampaignsSharedPrefs.getInstance(context).getCurrentSDKVersion())) {
            CampaignsSharedPrefs.getInstance(context).setCurrentSDKVersion(context.getSharedPreferences(CommonSharedPrefrences.JSON_PREFS, 0).getString(CommonSharedPrefrences.LIBRARY_VERSION, ""));
        }
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _setNameAndEmail(String str, String str2) {
        ControllerFactory.getInstance().userController.setNameAndEmail(str, str2);
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _registerDeviceToken(Context context, String str) {
        ControllerFactory.getInstance().deviceController.setPushToken(str);
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _handlePush(final Context context, final Intent intent) {
        ApiExecutorFactory.getHandlerExecutor().runOnUiThread(new Runnable() { // from class: com.helpshift.campaigns.Campaigns.5
            @Override // java.lang.Runnable
            public void run() {
                NotificationCompat.Builder builderCreateNotification = CampaignsNotification.createNotification(context, intent);
                if (builderCreateNotification != null) {
                    ApplicationUtil.showNotification(context, CampaignsNotification.getCampaignsId(intent), new NotificationChannelsManager(context).attachChannelId(builderCreateNotification.build(), NotificationChannelsManager.NotificationChannelType.CAMPAIGN));
                }
            }
        });
    }

    @Override // com.helpshift.Core.ApiProvider
    public boolean _login(HelpshiftUser helpshiftUser) {
        return ControllerFactory.getInstance().userController.login(helpshiftUser);
    }

    @Override // com.helpshift.Core.ApiProvider
    public boolean _logout() {
        return ControllerFactory.getInstance().userController.logout();
    }

    @Override // com.helpshift.Core.ApiProvider
    public ActionExecutor _getActionExecutor() {
        return new CampaignActionExecutor();
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _setSDKLanguage(String str) {
        InfoModelFactory.getInstance().sdkInfoModel.setSdkLanguage(str);
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _setTheme(final int i) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.campaigns.Campaigns.6
                @Override // java.lang.Runnable
                public void run() {
                    InfoModelFactory.getInstance().sdkInfoModel.setTheme(i);
                }
            });
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignDetailModelAdded(CampaignDetailModel campaignDetailModel) {
        InboxMessageDelegate inboxMessageDelegate = delegate;
        if (inboxMessageDelegate != null) {
            inboxMessageDelegate.inboxMessageAdded(campaignDetailModel);
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignIconImageFilePathUpdated(String str) {
        InboxMessageDelegate inboxMessageDelegate = delegate;
        if (inboxMessageDelegate != null) {
            inboxMessageDelegate.iconImageDownloaded(str);
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignCoverImageFilePathUpdated(String str) {
        InboxMessageDelegate inboxMessageDelegate = delegate;
        if (inboxMessageDelegate != null) {
            inboxMessageDelegate.coverImageDownloaded(str);
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignDeleted(String str) {
        InboxMessageDelegate inboxMessageDelegate = delegate;
        if (inboxMessageDelegate != null) {
            inboxMessageDelegate.inboxMessageDeleted(str);
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignRead(String str) {
        InboxMessageDelegate inboxMessageDelegate = delegate;
        if (inboxMessageDelegate != null) {
            inboxMessageDelegate.inboxMessageMarkedAsRead(str);
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignSeen(String str) {
        InboxMessageDelegate inboxMessageDelegate = delegate;
        if (inboxMessageDelegate != null) {
            inboxMessageDelegate.inboxMessageMarkedAsSeen(str);
        }
    }

    private static class LazyHolder {
        static final Campaigns INSTANCE = new Campaigns();

        private LazyHolder() {
        }
    }
}
