package com.helpshift.campaigns.activities;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import com.facebook.appevents.AppEventsConstants;
import com.helpshift.CoreInternal;
import com.helpshift.campaigns.Inbox;
import com.helpshift.campaigns.controllers.ControllerFactory;
import com.helpshift.campaigns.fragments.InboxFragment;
import com.helpshift.campaigns.models.AnalyticsEvent;
import com.helpshift.enums.ACTION_TYPE;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.util.HSLogger;
import com.ironsource.sdk.constants.Constants;

/* JADX INFO: loaded from: classes.dex */
public class NotificationActivity extends Activity {
    private static final String TAG = "Helpshift_NotifAct";

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        HSLogger.d(TAG, "Campaign notification clicked");
        Intent intent = getIntent();
        String stringExtra = intent.getStringExtra("action");
        if (stringExtra == null) {
            stringExtra = AppEventsConstants.EVENT_PARAM_VALUE_NO;
        }
        ACTION_TYPE action_type = ACTION_TYPE.getEnum(stringExtra);
        String stringExtra2 = intent.getStringExtra("data");
        String stringExtra3 = intent.getStringExtra(Constants.RequestParameters.CAMPAIGN_ID);
        boolean booleanExtra = intent.getBooleanExtra("foregroundStatus", true);
        ApplicationUtil.cancelNotification(this, stringExtra3, 1);
        if (action_type != ACTION_TYPE.SHOW_INBOX) {
            ControllerFactory.getInstance().analyticsEventController.recordAnalyticsEvent(Integer.valueOf(intent.getIntExtra("type", AnalyticsEvent.AnalyticsEventType.DEFAULT.intValue())), stringExtra3, false);
        }
        if (booleanExtra) {
            if (AnonymousClass1.$SwitchMap$com$helpshift$enums$ACTION_TYPE[action_type.ordinal()] == 1) {
                Inbox inbox = ControllerFactory.getInstance().inboxApi;
                if (inbox != null && inbox.getInboxPushNotificationDelegate() != null) {
                    inbox.getInboxPushNotificationDelegate().onInboxMessagePushNotificationClicked(stringExtra3);
                } else {
                    Intent intent2 = new Intent(this, (Class<?>) ParentActivity.class);
                    intent2.putExtra(InboxFragment.LAUNCH_SOURCE, 1);
                    intent2.putExtra(Constants.RequestParameters.CAMPAIGN_ID, stringExtra3);
                    startActivity(intent2);
                }
            } else {
                CoreInternal.getActionExecutor().executeAction(this, action_type, stringExtra2);
            }
        }
        finish();
    }

    /* JADX INFO: renamed from: com.helpshift.campaigns.activities.NotificationActivity$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$enums$ACTION_TYPE;

        static {
            int[] iArr = new int[ACTION_TYPE.values().length];
            $SwitchMap$com$helpshift$enums$ACTION_TYPE = iArr;
            try {
                iArr[ACTION_TYPE.SHOW_INBOX.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
        }
    }
}
