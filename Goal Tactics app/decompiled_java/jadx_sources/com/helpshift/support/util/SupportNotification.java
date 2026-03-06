package com.helpshift.support.util;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Build;
import androidx.core.app.NotificationCompat;
import com.helpshift.PluginEventBridge;
import com.helpshift.R;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.support.activities.ParentActivity;
import com.helpshift.support.fragments.SupportFragment;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.util.AssetsUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;

/* JADX INFO: loaded from: classes2.dex */
public final class SupportNotification {
    public static final String APP_NAME = "app_name";
    public static final String BUNGLE_ARG_NOTIFICATION_CONVERSATION_ID = "conversationIdInPush";

    public static NotificationCompat.Builder createNotification(Context context, Long l, String str, int i, String str2) {
        HSLogger.d("Helpshift_SupportNotif", "Creating Support notification : \n Id : " + str + "\n Title : " + str2 + "\n Message count : " + i);
        HelpshiftContext.getCoreApi().getDelegate().didReceiveNotification(i);
        String quantityString = context.getResources().getQuantityString(R.plurals.hs__notification_content_title, i, Integer.valueOf(i));
        int logoResourceValue = ApplicationUtil.getLogoResourceValue(context);
        Integer num = HelpshiftContext.getCoreApi().getSDKConfigurationDM().getInt(SDKConfigurationDM.NOTIFICATION_ICON_ID);
        if (AssetsUtil.resourceExists(context, num)) {
            logoResourceValue = num.intValue();
        }
        Integer num2 = HelpshiftContext.getCoreApi().getSDKConfigurationDM().getInt(SDKConfigurationDM.NOTIFICATION_LARGE_ICON_ID);
        Bitmap bitmapDecodeResource = AssetsUtil.resourceExists(context, num2) ? BitmapFactory.decodeResource(context.getResources(), num2.intValue()) : null;
        int iAbs = str != null ? Math.abs(str.hashCode()) : 0;
        Intent intent = new Intent(context, (Class<?>) ParentActivity.class);
        intent.setFlags(268435456);
        intent.putExtra(SupportFragment.SUPPORT_MODE, 1);
        intent.putExtra(BUNGLE_ARG_NOTIFICATION_CONVERSATION_ID, l);
        intent.putExtra("isRoot", true);
        PendingIntent pendingIntentForNotification = PluginEventBridge.getPendingIntentForNotification(context, PendingIntent.getActivity(context, iAbs, intent, Build.VERSION.SDK_INT >= 23 ? 67108864 : 0));
        NotificationCompat.Builder builder = new NotificationCompat.Builder(context);
        builder.setSmallIcon(logoResourceValue);
        builder.setContentTitle(str2);
        builder.setContentText(quantityString);
        builder.setContentIntent(pendingIntentForNotification);
        builder.setAutoCancel(true);
        if (bitmapDecodeResource != null) {
            builder.setLargeIcon(bitmapDecodeResource);
        }
        Uri notificationSoundUri = AssetsUtil.getNotificationSoundUri(HelpshiftContext.getApplicationContext(), HelpshiftContext.getCoreApi().getSDKConfigurationDM().getInt(SDKConfigurationDM.NOTIFICATION_SOUND_ID));
        if (notificationSoundUri == null) {
            if (ApplicationUtil.isPermissionGranted(context, "android.permission.VIBRATE")) {
                builder.setDefaults(-1);
            } else {
                builder.setDefaults(5);
            }
        } else {
            builder.setSound(notificationSoundUri);
            if (ApplicationUtil.isPermissionGranted(context, "android.permission.VIBRATE")) {
                builder.setDefaults(6);
            } else {
                builder.setDefaults(4);
            }
        }
        return builder;
    }
}
