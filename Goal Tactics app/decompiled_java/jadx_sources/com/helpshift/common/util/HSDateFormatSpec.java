package com.helpshift.common.util;

import com.helpshift.common.platform.Platform;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HSSimpleDateFormat;
import com.helpshift.util.ValuePair;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class HSDateFormatSpec {
    public static final String DISPLAY_DATE_PATTERN = "EEEE, MMMM dd, yyyy";
    public static final String DISPLAY_TIME_PATTERN_12HR = "h:mm a";
    public static final String DISPLAY_TIME_PATTERN_24HR = "H:mm";
    private static final String TAG = "Helpshift_DFSpec";
    public static final String STORAGE_TIME_PATTERN = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
    public static final HSSimpleDateFormat STORAGE_TIME_FORMAT = new HSSimpleDateFormat(STORAGE_TIME_PATTERN, "GMT");
    private static final Map<String, HSSimpleDateFormat> formatterCache = new HashMap();

    private HSDateFormatSpec() {
    }

    public static HSSimpleDateFormat getDateFormatter(String str, Locale locale, String str2) {
        String str3 = str + "_" + locale.getLanguage() + "_" + str2;
        Map<String, HSSimpleDateFormat> map = formatterCache;
        HSSimpleDateFormat hSSimpleDateFormat = map.get(str3);
        if (hSSimpleDateFormat != null) {
            return hSSimpleDateFormat;
        }
        HSSimpleDateFormat hSSimpleDateFormat2 = new HSSimpleDateFormat(str, locale, str2);
        map.put(str3, hSSimpleDateFormat2);
        return hSSimpleDateFormat2;
    }

    public static HSSimpleDateFormat getDateFormatter(String str, Locale locale) {
        String str2 = str + "_" + locale.getLanguage();
        Map<String, HSSimpleDateFormat> map = formatterCache;
        HSSimpleDateFormat hSSimpleDateFormat = map.get(str2);
        if (hSSimpleDateFormat != null) {
            return hSSimpleDateFormat;
        }
        HSSimpleDateFormat hSSimpleDateFormat2 = new HSSimpleDateFormat(str, locale);
        map.put(str2, hSSimpleDateFormat2);
        return hSSimpleDateFormat2;
    }

    public static long getCurrentAdjustedTimeInMillis(Platform platform) {
        float serverTimeDelta = platform.getNetworkRequestDAO().getServerTimeDelta();
        return System.currentTimeMillis() + ((serverTimeDelta <= -0.001f || serverTimeDelta >= 0.001f) ? (long) (serverTimeDelta * 1000.0f) : 0L);
    }

    public static Date getCurrentAdjustedTime(Platform platform) {
        return new Date(getCurrentAdjustedTimeInMillis(platform));
    }

    public static ValuePair<String, Long> getCurrentAdjustedTimeForStorage(Platform platform) {
        Long lValueOf = Long.valueOf(getCurrentAdjustedTimeInMillis(platform));
        return new ValuePair<>(STORAGE_TIME_FORMAT.format(new Date(lValueOf.longValue())), lValueOf);
    }

    public static String addMilliSeconds(HSSimpleDateFormat hSSimpleDateFormat, String str, int i) {
        try {
            Date date = hSSimpleDateFormat.parse(str);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            return hSSimpleDateFormat.format(new Date(calendar.getTimeInMillis() + ((long) i)));
        } catch (ParseException e) {
            HSLogger.e(TAG, "Parsing exception on adding millisecond", e);
            return str;
        }
    }

    public static float calculateTimeDelta(String str) {
        return (float) (Double.valueOf(Double.parseDouble(str)).doubleValue() - Double.valueOf(System.currentTimeMillis() / 1000.0d).doubleValue());
    }

    public static long convertToEpochTime(String str) {
        try {
            return STORAGE_TIME_FORMAT.parse(str).getTime();
        } catch (ParseException e) {
            HSLogger.e(TAG, "Parsing exception on converting storageTimeFormat to epochTime", e);
            return -1L;
        }
    }
}
