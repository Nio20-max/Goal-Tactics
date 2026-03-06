package com.helpshift.util;

import java.util.Locale;

/* JADX INFO: loaded from: classes2.dex */
public final class AttachmentFileSize {
    private static final String FILE_SIZE_UNIT_B = " B";
    private static final String FILE_SIZE_UNIT_KB = " KB";
    private static final String FILE_SIZE_UNIT_MB = " MB";

    public static String getFormattedFileSize(double d) {
        String str;
        if (d < 1024.0d) {
            str = FILE_SIZE_UNIT_B;
        } else if (d < 1048576.0d) {
            d /= 1024.0d;
            str = FILE_SIZE_UNIT_KB;
        } else {
            d /= 1048576.0d;
            str = FILE_SIZE_UNIT_MB;
        }
        if (str.equals(FILE_SIZE_UNIT_MB)) {
            return String.format(Locale.US, "%.1f", Double.valueOf(d)) + str;
        }
        return String.format(Locale.US, "%.0f", Double.valueOf(d)) + str;
    }
}
