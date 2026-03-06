package com.helpshift.notifications;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.media.AudioAttributes;
import android.net.Uri;
import android.os.Build;
import com.helpshift.R;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.model.InfoModelFactory;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.util.AssetsUtil;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.TextUtils;

/* JADX INFO: loaded from: classes2.dex */
public class NotificationChannelsManager {
    private static final String DEFAULT_CHANNEL_ID = "helpshift_default_channel_id";
    private final Context context;

    public enum NotificationChannelType {
        SUPPORT,
        CAMPAIGN
    }

    public NotificationChannelsManager(Context context) {
        this.context = context;
    }

    /* JADX INFO: renamed from: com.helpshift.notifications.NotificationChannelsManager$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$notifications$NotificationChannelsManager$NotificationChannelType;

        static {
            int[] iArr = new int[NotificationChannelType.values().length];
            $SwitchMap$com$helpshift$notifications$NotificationChannelsManager$NotificationChannelType = iArr;
            try {
                iArr[NotificationChannelType.SUPPORT.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$notifications$NotificationChannelsManager$NotificationChannelType[NotificationChannelType.CAMPAIGN.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
        }
    }

    private String getActiveChannelId(NotificationChannelType notificationChannelType) {
        int i = AnonymousClass1.$SwitchMap$com$helpshift$notifications$NotificationChannelsManager$NotificationChannelType[notificationChannelType.ordinal()];
        if (i == 1) {
            return getActiveSupportNotificationChannel();
        }
        if (i == 2) {
            return getActiveCampaignsNotificationChannel();
        }
        throw new IllegalStateException();
    }

    private String getActiveSupportNotificationChannel() {
        String string = HelpshiftContext.getCoreApi().getSDKConfigurationDM().getString(SDKConfigurationDM.SUPPORT_NOTIFICATION_CHANNEL_ID);
        if (TextUtils.isEmpty(string)) {
            ensureDefaultNotificationChannelCreated();
            return DEFAULT_CHANNEL_ID;
        }
        deleteDefaultNotificationChannel();
        return string;
    }

    private String getActiveCampaignsNotificationChannel() {
        String str = InfoModelFactory.getInstance().appInfoModel.campaignsNotificationChannelId;
        if (TextUtils.isEmpty(str)) {
            ensureDefaultNotificationChannelCreated();
            return DEFAULT_CHANNEL_ID;
        }
        deleteDefaultNotificationChannel();
        return str;
    }

    private void ensureDefaultNotificationChannelCreated() {
        NotificationManager notificationManager = ApplicationUtil.getNotificationManager(this.context);
        if (notificationManager == null || notificationManager.getNotificationChannel(DEFAULT_CHANNEL_ID) != null) {
            return;
        }
        String string = this.context.getResources().getString(R.string.hs__default_notification_channel_name);
        String string2 = this.context.getResources().getString(R.string.hs__default_notification_channel_desc);
        NotificationChannel notificationChannel = new NotificationChannel(DEFAULT_CHANNEL_ID, string, 3);
        notificationChannel.setDescription(string2);
        Uri notificationSoundUri = AssetsUtil.getNotificationSoundUri(HelpshiftContext.getApplicationContext(), HelpshiftContext.getCoreApi().getSDKConfigurationDM().getInt(SDKConfigurationDM.NOTIFICATION_SOUND_ID));
        if (notificationSoundUri != null) {
            notificationChannel.setSound(notificationSoundUri, new AudioAttributes.Builder().build());
        }
        notificationManager.createNotificationChannel(notificationChannel);
    }

    public void checkAndUpdateDefaultChannelInfo() {
        NotificationManager notificationManager;
        NotificationChannel notificationChannel;
        if (Build.VERSION.SDK_INT < 26 || ApplicationUtil.getTargetSDKVersion(this.context) < 26 || (notificationManager = ApplicationUtil.getNotificationManager(this.context)) == null || (notificationChannel = notificationManager.getNotificationChannel(DEFAULT_CHANNEL_ID)) == null) {
            return;
        }
        CharSequence name = notificationChannel.getName();
        String description = notificationChannel.getDescription();
        String string = this.context.getResources().getString(R.string.hs__default_notification_channel_name);
        String string2 = this.context.getResources().getString(R.string.hs__default_notification_channel_desc);
        if (string.equals(name) && string2.equals(description)) {
            return;
        }
        NotificationChannel notificationChannel2 = new NotificationChannel(DEFAULT_CHANNEL_ID, string, notificationChannel.getImportance());
        notificationChannel2.setDescription(string2);
        notificationManager.createNotificationChannel(notificationChannel2);
    }

    private void deleteDefaultNotificationChannel() {
        NotificationManager notificationManager = ApplicationUtil.getNotificationManager(this.context);
        if (notificationManager == null || notificationManager.getNotificationChannel(DEFAULT_CHANNEL_ID) == null) {
            return;
        }
        notificationManager.deleteNotificationChannel(DEFAULT_CHANNEL_ID);
    }

    public Notification attachChannelId(Notification notification, NotificationChannelType notificationChannelType) {
        if (Build.VERSION.SDK_INT < 26 || ApplicationUtil.getTargetSDKVersion(this.context) < 26) {
            return notification;
        }
        Notification.Builder builderRecoverBuilder = Notification.Builder.recoverBuilder(this.context, notification);
        builderRecoverBuilder.setChannelId(getActiveChannelId(notificationChannelType));
        return builderRecoverBuilder.build();
    }
}
