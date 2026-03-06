package com.helpshift.campaigns.services;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import com.helpshift.campaigns.controllers.ControllerFactory;
import com.helpshift.campaigns.models.AnalyticsEvent;
import com.helpshift.util.ApplicationUtil;
import com.ironsource.sdk.constants.Constants;

/* JADX INFO: loaded from: classes.dex */
public class NotificationService extends Service {
    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        String stringExtra = intent.getStringExtra(Constants.RequestParameters.CAMPAIGN_ID);
        ApplicationUtil.cancelNotification(this, stringExtra, 1);
        ControllerFactory.getInstance().analyticsEventController.recordAnalyticsEvent(Integer.valueOf(intent.getIntExtra("type", AnalyticsEvent.AnalyticsEventType.DEFAULT.intValue())), stringExtra, false);
        stopSelf();
        return 2;
    }
}
