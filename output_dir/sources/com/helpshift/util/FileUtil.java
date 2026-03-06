package com.helpshift.util;

import java.io.File;

/* JADX INFO: loaded from: classes2.dex */
public class FileUtil {
    public static final int BUFFER_SIZE = 8192;

    public static File validateAndCreateFile(String str) {
        if (StringUtils.isEmpty(str)) {
            return null;
        }
        File file = new File(str);
        if (file.exists()) {
            return file;
        }
        return null;
    }

    public static boolean doesFilePathExistAndCanRead(String str) {
        File fileValidateAndCreateFile = validateAndCreateFile(str);
        return fileValidateAndCreateFile != null && fileValidateAndCreateFile.canRead();
    }

    public static boolean deleteFile(String str) {
        File fileValidateAndCreateFile = validateAndCreateFile(str);
        return fileValidateAndCreateFile != null && fileValidateAndCreateFile.delete();
    }
}
