package com.helpshift.util;

import android.os.SystemClock;
import com.helpshift.campaigns.util.constants.ModelKeys;
import com.helpshift.model.InfoModelFactory;

/* JADX INFO: loaded from: classes2.dex */
public class TimeUtil {
    private static String getAdjustedTimestamp(Float f) {
        String str = HSFormat.tsSecFormatter.format(System.currentTimeMillis() / 1000.0d);
        if (f == null || f.floatValue() == 0.0f) {
            return str;
        }
        return HSFormat.tsSecFormatter.format(Double.valueOf(System.currentTimeMillis() / 1000.0d).doubleValue() + ((double) f.floatValue()));
    }

    private static long getAdjustedTimeInMillis(Float f) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        return (f == null || f.floatValue() == 0.0f) ? jCurrentTimeMillis : (long) (jCurrentTimeMillis + (f.floatValue() * 1000.0f));
    }

    public static long getCurrentTimeInMillis() {
        return getAdjustedTimeInMillis(InfoModelFactory.getInstance().sdkInfoModel.getServerTimeDelta());
    }

    public static String getCurrentTimestamp() {
        return getAdjustedTimestamp(InfoModelFactory.getInstance().sdkInfoModel.getServerTimeDelta());
    }

    public static String getSinceText(long j) {
        long jCurrentTimeMillis = (System.currentTimeMillis() / 1000) - j;
        if (jCurrentTimeMillis < 60) {
            return jCurrentTimeMillis + "s";
        }
        if (jCurrentTimeMillis < 3600) {
            return (jCurrentTimeMillis / 60) + ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_BODY;
        }
        if (jCurrentTimeMillis < 86400) {
            return (jCurrentTimeMillis / 3600) + "h";
        }
        return (jCurrentTimeMillis / 86400) + "d";
    }

    public long elapsedTimeMillis() {
        return SystemClock.elapsedRealtime();
    }
}
