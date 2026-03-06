package com.helpshift.util;

/* JADX INFO: loaded from: classes2.dex */
public class DateUtil {
    public static boolean isToday(long j) {
        return j / ErrorReportProvider.BATCH_TIME == System.currentTimeMillis() / ErrorReportProvider.BATCH_TIME;
    }
}
