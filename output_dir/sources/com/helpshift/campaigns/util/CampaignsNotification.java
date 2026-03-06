package com.helpshift.campaigns.util;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import androidx.core.app.NotificationCompat;
import com.helpshift.PluginEventBridge;
import com.helpshift.campaigns.activities.NotificationActivity;
import com.helpshift.campaigns.controllers.ControllerFactory;
import com.helpshift.campaigns.models.AnalyticsEvent;
import com.helpshift.campaigns.models.CampaignSyncModel;
import com.helpshift.campaigns.services.NotificationService;
import com.helpshift.campaigns.storage.CampaignsStorageFactory;
import com.helpshift.campaigns.util.constants.ModelKeys;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.enums.ACTION_TYPE;
import com.helpshift.model.InfoModelFactory;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.util.AssetsUtil;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.TextUtils;
import com.ironsource.sdk.constants.Constants;
import java.util.HashMap;

/* JADX INFO: loaded from: classes.dex */
public class CampaignsNotification {
    public static String getCampaignsId(Intent intent) {
        String stringExtra = intent.getStringExtra("cid");
        return (stringExtra == null || ACTION_TYPE.SHOW_INBOX != ACTION_TYPE.getEnum(intent.getStringExtra("hsp.a"))) ? stringExtra : InAppCampaignsUtil.getCampaignIdForLoggedInUser(stringExtra);
    }

    public static NotificationCompat.Builder createNotification(Context context, Intent intent) {
        String str;
        Bitmap bitmapDecodeResource;
        String str2 = ControllerFactory.getInstance().userController.getCurrentUser().identifier;
        String stringExtra = intent.getStringExtra("cid");
        if (InfoModelFactory.getInstance().sdkInfoModel.isDuplicateNotification(stringExtra, str2)) {
            return null;
        }
        String stringExtra2 = intent.getStringExtra("hsp.a");
        String stringExtra3 = intent.getStringExtra("hsp.d");
        String stringExtra4 = intent.getStringExtra("alert");
        String stringExtra5 = intent.getStringExtra("app_name");
        HashMap<String, Object> actionsData = getActionsData(context, intent.getStringExtra("category"));
        if (ACTION_TYPE.SHOW_INBOX == ACTION_TYPE.getEnum(stringExtra2)) {
            String campaignIdForLoggedInUser = InAppCampaignsUtil.getCampaignIdForLoggedInUser(stringExtra);
            InfoModelFactory.getInstance().sdkInfoModel.setChangeSetId(stringExtra, campaignIdForLoggedInUser);
            String stringExtra6 = intent.getStringExtra(ModelKeys.KEY_CAMPAIGN_SYNC_MODEL_EXPIRY_TIME);
            str = campaignIdForLoggedInUser;
            CampaignsStorageFactory.getInstance().campaignSyncModelStorage.addCampaign(new CampaignSyncModel(campaignIdForLoggedInUser, stringExtra3, System.currentTimeMillis() / 1000, TextUtils.isEmpty(stringExtra6) ? Long.MAX_VALUE : Long.parseLong(stringExtra6), false), str2);
        } else {
            str = stringExtra;
        }
        Boolean bool = InfoModelFactory.getInstance().appInfoModel.muteNotifications;
        if (bool == null || !bool.booleanValue()) {
            PendingIntent pendingIntent = getPendingIntent(context, stringExtra2, stringExtra3, str, AnalyticsEvent.AnalyticsEventType.VIEW.intValue(), true);
            if (pendingIntent != null) {
                NotificationCompat.Builder builder = new NotificationCompat.Builder(context);
                builder.setContentText(stringExtra4);
                builder.setStyle(new NotificationCompat.BigTextStyle().bigText(stringExtra4));
                builder.setWhen(System.currentTimeMillis());
                builder.setAutoCancel(true);
                builder.setContentIntent(pendingIntent);
                int[] iArr = (int[]) actionsData.get("actionIds");
                int[] iArr2 = (int[]) actionsData.get("actionIcons");
                String[] strArr = (String[]) actionsData.get("actionLabels");
                boolean[] zArr = (boolean[]) actionsData.get("foregroundStatus");
                boolean[] zArr2 = (boolean[]) actionsData.get("requiresAuth");
                String str3 = str;
                NotificationCompat.Builder builderAddAction = addAction(addAction(builder, context, intent, iArr[1], iArr2[1], strArr[1], str3, zArr[1]), context, intent, iArr[0], iArr2[0], strArr[0], str3, zArr[0]);
                if (zArr2[0] || zArr2[1]) {
                    builderAddAction.setVisibility(0);
                }
                if (stringExtra5 != null) {
                    builderAddAction.setContentTitle(stringExtra5);
                } else {
                    builderAddAction.setContentTitle(ApplicationUtil.getApplicationName(context));
                }
                Integer numValueOf = InfoModelFactory.getInstance().appInfoModel.notificationIconId;
                if (!AssetsUtil.resourceExists(context, numValueOf)) {
                    numValueOf = Integer.valueOf(ApplicationUtil.getLogoResourceValue(context));
                }
                builderAddAction.setSmallIcon(numValueOf.intValue());
                Integer num = InfoModelFactory.getInstance().appInfoModel.largeNotificationIconId;
                if (AssetsUtil.resourceExists(context, num) && (bitmapDecodeResource = BitmapFactory.decodeResource(context.getResources(), num.intValue())) != null) {
                    builderAddAction.setLargeIcon(bitmapDecodeResource);
                }
                Uri notificationSoundUri = AssetsUtil.getNotificationSoundUri(HelpshiftContext.getApplicationContext(), HelpshiftContext.getCoreApi().getSDKConfigurationDM().getInt(SDKConfigurationDM.NOTIFICATION_SOUND_ID));
                boolean zIsPermissionGranted = ApplicationUtil.isPermissionGranted(context, "android.permission.VIBRATE");
                if (notificationSoundUri != null) {
                    builderAddAction.setSound(notificationSoundUri);
                    if (zIsPermissionGranted) {
                        builderAddAction.setDefaults(6);
                    } else {
                        builderAddAction.setDefaults(4);
                    }
                } else if (zIsPermissionGranted) {
                    builderAddAction.setDefaults(-1);
                } else {
                    builderAddAction.setDefaults(5);
                }
                return builderAddAction;
            }
        }
        return null;
    }

    private static PendingIntent getPendingIntent(Context context, String str, String str2, String str3, int i, boolean z) {
        Intent intent;
        PendingIntent service;
        if (z) {
            intent = new Intent(context, (Class<?>) NotificationActivity.class);
            intent.setFlags(268468224);
        } else {
            intent = new Intent(context, (Class<?>) NotificationService.class);
        }
        intent.putExtra("action", str);
        intent.putExtra("data", str2);
        intent.putExtra(Constants.RequestParameters.CAMPAIGN_ID, str3);
        intent.putExtra("type", i);
        intent.putExtra("foregroundStatus", z);
        intent.setAction(str3 + i);
        if (z) {
            service = PendingIntent.getActivity(context, 1, intent, 268435456);
        } else {
            service = PendingIntent.getService(context, 1, intent, 268435456);
        }
        return PluginEventBridge.getPendingIntentForNotification(context, service);
    }

    private static NotificationCompat.Builder addAction(NotificationCompat.Builder builder, Context context, Intent intent, int i, int i2, String str, String str2, boolean z) {
        if (i2 != 0 && str != null) {
            builder.addAction(i2, str, getPendingIntent(context, intent.getStringExtra(i + ".a"), intent.getStringExtra(i + ".d"), str2, i, z));
        }
        return builder;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:6:0x0023  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static java.util.HashMap<java.lang.String, java.lang.Object> getActionsData(android.content.Context r11, java.lang.String r12) {
        /*
            Method dump skipped, instruction units count: 1554
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.campaigns.util.CampaignsNotification.getActionsData(android.content.Context, java.lang.String):java.util.HashMap");
    }
}
