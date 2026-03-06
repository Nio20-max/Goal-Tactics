package com.ironsource.sdk.utils;

import android.content.Context;
import com.helpshift.campaigns.util.constants.DomainConstants;
import com.ironsource.environment.DeviceStatus;
import com.ironsource.sdk.constants.Constants;
import com.ironsource.sdk.data.SSAFile;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class IronSourceStorageUtils {
    private static final String SSA_DIRECTORY_NAME = "supersonicads";

    public static String initializeCacheDirectory(Context context) {
        createRootDirectory(context);
        return refreshRootDirectory(context);
    }

    private static String refreshRootDirectory(Context context) {
        String currentSDKVersion = IronSourceSharedPrefHelper.getSupersonicPrefHelper(context).getCurrentSDKVersion();
        String supersonicSdkVersion = DeviceProperties.getSupersonicSdkVersion();
        if (!currentSDKVersion.equalsIgnoreCase(supersonicSdkVersion)) {
            IronSourceSharedPrefHelper.getSupersonicPrefHelper().setCurrentSDKVersion(supersonicSdkVersion);
            File externalCacheDir = DeviceStatus.getExternalCacheDir(context);
            if (externalCacheDir != null) {
                deleteAllFiles(externalCacheDir.getAbsolutePath() + File.separator + SSA_DIRECTORY_NAME + File.separator);
            }
            deleteAllFiles(DeviceStatus.getInternalCacheDirPath(context) + File.separator + SSA_DIRECTORY_NAME + File.separator);
            return createRootDirectory(context);
        }
        return getDiskCacheDir(context, SSA_DIRECTORY_NAME).getPath();
    }

    private static void deleteAllFiles(String str) {
        File[] fileArrListFiles = new File(str).listFiles();
        if (fileArrListFiles == null) {
            return;
        }
        for (File file : fileArrListFiles) {
            if (file.isDirectory()) {
                deleteAllFiles(file.getAbsolutePath());
                file.delete();
            } else {
                file.delete();
            }
        }
    }

    private static File getDiskCacheDir(Context context, String str) {
        return new File(getDiskCacheDirPath(context) + File.separator + str);
    }

    public static String getDiskCacheDirPath(Context context) {
        if (SDKUtils.isExternalStorageAvailable()) {
            File externalCacheDir = DeviceStatus.getExternalCacheDir(context);
            if (externalCacheDir != null && externalCacheDir.canWrite()) {
                return externalCacheDir.getPath();
            }
            return DeviceStatus.getInternalCacheDirPath(context);
        }
        return DeviceStatus.getInternalCacheDirPath(context);
    }

    private static String createRootDirectory(Context context) {
        File diskCacheDir = getDiskCacheDir(context, SSA_DIRECTORY_NAME);
        if (!diskCacheDir.exists()) {
            diskCacheDir.mkdir();
        }
        return diskCacheDir.getPath();
    }

    public static String makeDir(String str, String str2) {
        File file = new File(str, str2);
        if (file.exists() || file.mkdirs()) {
            return file.getPath();
        }
        return null;
    }

    public static synchronized boolean deleteFile(String str, String str2, String str3) {
        File file = new File(str, str2);
        if (!file.exists()) {
            return false;
        }
        File[] fileArrListFiles = file.listFiles();
        if (fileArrListFiles == null) {
            return false;
        }
        for (File file2 : fileArrListFiles) {
            if (file2.isFile() && file2.getName().equalsIgnoreCase(str3)) {
                return file2.delete();
            }
        }
        return false;
    }

    public static synchronized boolean isFileCached(String str, SSAFile sSAFile) {
        File file = new File(str, sSAFile.getPath());
        if (file.listFiles() != null) {
            for (File file2 : file.listFiles()) {
                if (file2.isFile() && file2.getName().equalsIgnoreCase(SDKUtils.getFileName(sSAFile.getFile()))) {
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean isPathExist(String str, String str2) {
        return new File(str, str2).exists();
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static synchronized boolean deleteFolder(java.lang.String r2, java.lang.String r3) {
        /*
            java.lang.Class<com.ironsource.sdk.utils.IronSourceStorageUtils> r0 = com.ironsource.sdk.utils.IronSourceStorageUtils.class
            monitor-enter(r0)
            java.io.File r1 = new java.io.File     // Catch: java.lang.Throwable -> L19
            r1.<init>(r2, r3)     // Catch: java.lang.Throwable -> L19
            boolean r2 = deleteFolderContentRecursive(r1)     // Catch: java.lang.Throwable -> L19
            if (r2 == 0) goto L16
            boolean r2 = r1.delete()     // Catch: java.lang.Throwable -> L19
            if (r2 == 0) goto L16
            r2 = 1
            goto L17
        L16:
            r2 = 0
        L17:
            monitor-exit(r0)
            return r2
        L19:
            r2 = move-exception
            monitor-exit(r0)
            throw r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ironsource.sdk.utils.IronSourceStorageUtils.deleteFolder(java.lang.String, java.lang.String):boolean");
    }

    private static boolean deleteFolderContentRecursive(File file) {
        File[] fileArrListFiles = file.listFiles();
        boolean zDeleteFolderContentRecursive = true;
        if (fileArrListFiles != null) {
            for (File file2 : fileArrListFiles) {
                if (file2.isDirectory()) {
                    zDeleteFolderContentRecursive &= deleteFolderContentRecursive(file2);
                }
                if (!file2.delete()) {
                    zDeleteFolderContentRecursive = false;
                }
            }
        }
        return zDeleteFolderContentRecursive;
    }

    public static String getCachedFilesMap(String str, String str2) {
        JSONObject jSONObjectBuildFilesMap = buildFilesMap(str, str2);
        try {
            jSONObjectBuildFilesMap.put("path", str2);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jSONObjectBuildFilesMap.toString();
    }

    private static JSONObject buildFilesMap(String str, String str2) {
        File file = new File(str, str2);
        JSONObject jSONObject = new JSONObject();
        File[] fileArrListFiles = file.listFiles();
        if (fileArrListFiles != null) {
            for (File file2 : fileArrListFiles) {
                try {
                    Object objLooping = looping(file2);
                    if (objLooping instanceof JSONArray) {
                        jSONObject.put("files", looping(file2));
                    } else if (objLooping instanceof JSONObject) {
                        jSONObject.put(file2.getName(), looping(file2));
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                    new IronSourceAsyncHttpRequestTask().execute(Constants.NATIVE_EXCEPTION_BASE_URL + e.getStackTrace()[0].getMethodName());
                }
            }
        }
        return jSONObject;
    }

    private static Object looping(File file) {
        String campaignLastUpdate;
        JSONObject jSONObject = new JSONObject();
        JSONArray jSONArray = new JSONArray();
        try {
        } catch (JSONException e) {
            e.printStackTrace();
            new IronSourceAsyncHttpRequestTask().execute(Constants.NATIVE_EXCEPTION_BASE_URL + e.getStackTrace()[0].getMethodName());
        }
        if (file.isFile()) {
            jSONArray.put(file.getName());
            return jSONArray;
        }
        for (File file2 : file.listFiles()) {
            if (file2.isDirectory()) {
                jSONObject.put(file2.getName(), looping(file2));
            } else {
                jSONArray.put(file2.getName());
                jSONObject.put("files", jSONArray);
            }
        }
        if (file.isDirectory() && (campaignLastUpdate = IronSourceSharedPrefHelper.getSupersonicPrefHelper().getCampaignLastUpdate(file.getName())) != null) {
            jSONObject.put("lastUpdateTime", campaignLastUpdate);
        }
        return jSONObject;
    }

    public static boolean renameFile(String str, String str2) throws Exception {
        return new File(str).renameTo(new File(str2));
    }

    public static int saveFile(byte[] bArr, String str) throws Exception {
        FileOutputStream fileOutputStream = new FileOutputStream(new File(str));
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
        try {
            byte[] bArr2 = new byte[DomainConstants.USER_PROPERTIES_SIZE_LIMIT];
            int i = 0;
            while (true) {
                int i2 = byteArrayInputStream.read(bArr2);
                if (i2 == -1) {
                    return i;
                }
                fileOutputStream.write(bArr2, 0, i2);
                i += i2;
            }
        } finally {
            fileOutputStream.close();
            byteArrayInputStream.close();
        }
    }
}
