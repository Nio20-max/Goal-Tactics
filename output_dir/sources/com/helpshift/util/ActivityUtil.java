package com.helpshift.util;

import android.app.Activity;
import android.content.Intent;

/* JADX INFO: loaded from: classes2.dex */
public class ActivityUtil {
    public static Boolean isFullScreen(Activity activity) {
        return Boolean.valueOf((activity.getWindow().getAttributes().flags & 1024) == 1024);
    }

    public static void startLauncherActivityAndFinish(Activity activity) {
        Intent launchIntent;
        if (activity == null || (launchIntent = ApplicationUtil.getLaunchIntent(activity, activity.getPackageName())) == null) {
            return;
        }
        activity.finish();
        activity.startActivity(launchIntent);
    }
}
