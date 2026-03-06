package com.ironsource.sdk.utils;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.os.Build;
import android.os.Environment;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.View;
import com.facebook.appevents.AppEventsConstants;
import com.ironsource.environment.DeviceStatus;
import com.ironsource.sdk.constants.Constants;
import com.ironsource.sdk.controller.ControllerActivity;
import com.ironsource.sdk.controller.OpenUrlActivity;
import com.ironsource.sdk.data.SSAEnums;
import com.ironsource.sdk.data.SSAObj;
import com.ironsource.sdk.precache.DownloadManager;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.zip.GZIPInputStream;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class SDKUtils {
    private static final String TAG = "SDKUtils";
    private static String mAdvertisingId = null;
    private static String mControllerConfig = null;
    private static String mControllerUrl = null;
    private static int mDebugMode = 0;
    private static Map<String, String> mInitSDKParams = null;
    private static boolean mIsLimitedTrackingEnabled = true;
    private static String mUserGroup = "";
    private static final AtomicInteger sNextGeneratedId = new AtomicInteger(1);

    public static String getSDKVersion() {
        return Constants.SDK_VERSION;
    }

    public static String translateOrientation(int i) {
        return i != 1 ? i != 2 ? "none" : Constants.ParametersKeys.ORIENTATION_LANDSCAPE : Constants.ParametersKeys.ORIENTATION_PORTRAIT;
    }

    public static String translateRequestedOrientation(int i) {
        if (i != 0) {
            if (i != 1) {
                if (i != 11) {
                    if (i != 12) {
                        switch (i) {
                            case 6:
                            case 8:
                                break;
                            case 7:
                            case 9:
                                break;
                            default:
                                return "none";
                        }
                    }
                }
            }
            return Constants.ParametersKeys.ORIENTATION_PORTRAIT;
        }
        return Constants.ParametersKeys.ORIENTATION_LANDSCAPE;
    }

    public static String getFileName(String str) {
        try {
            return URLEncoder.encode(str.split(File.separator)[r1.length - 1].split("\\?")[0], DownloadManager.UTF8_CHARSET);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static int pxToDp(long j) {
        return (int) ((j / Resources.getSystem().getDisplayMetrics().density) + 0.5f);
    }

    public static int dpToPx(long j) {
        return (int) ((j * Resources.getSystem().getDisplayMetrics().density) + 0.5f);
    }

    public static int convertPxToDp(int i) {
        return (int) TypedValue.applyDimension(1, i, Resources.getSystem().getDisplayMetrics());
    }

    public static int convertDpToPx(int i) {
        return (int) TypedValue.applyDimension(0, i, Resources.getSystem().getDisplayMetrics());
    }

    public static JSONObject getOrientation(Context context) {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(Constants.ParametersKeys.ORIENTATION, translateOrientation(DeviceStatus.getDeviceOrientation(context)));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jSONObject;
    }

    public static String createErrorMessage(String str, String str2) {
        return String.format("%s Failure occurred during initiation at: %s", str, str2);
    }

    public static Long getCurrentTimeMillis() {
        return Long.valueOf(System.currentTimeMillis());
    }

    public static boolean isApplicationVisible(Context context) {
        String packageName = context.getPackageName();
        for (ActivityManager.RunningAppProcessInfo runningAppProcessInfo : ((ActivityManager) context.getSystemService("activity")).getRunningAppProcesses()) {
            if (runningAppProcessInfo.processName.equalsIgnoreCase(packageName) && runningAppProcessInfo.importance == 100) {
                return true;
            }
        }
        return false;
    }

    public static void showNoInternetDialog(Context context) {
        new AlertDialog.Builder(context).setMessage("No Internet Connection").setPositiveButton("Ok", new DialogInterface.OnClickListener() { // from class: com.ironsource.sdk.utils.SDKUtils.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.dismiss();
            }
        }).show();
    }

    public static byte[] encrypt(String str) {
        MessageDigest messageDigest;
        try {
            messageDigest = MessageDigest.getInstance("SHA-1");
            try {
                messageDigest.reset();
                messageDigest.update(str.getBytes(DownloadManager.UTF8_CHARSET));
            } catch (UnsupportedEncodingException e) {
                e = e;
                e.printStackTrace();
            } catch (NoSuchAlgorithmException e2) {
                e = e2;
                e.printStackTrace();
            }
        } catch (UnsupportedEncodingException e3) {
            e = e3;
            messageDigest = null;
        } catch (NoSuchAlgorithmException e4) {
            e = e4;
            messageDigest = null;
        }
        if (messageDigest != null) {
            return messageDigest.digest();
        }
        return null;
    }

    public static String convertStreamToString(InputStream inputStream, boolean z, String str, String str2) throws Throwable {
        Throwable th;
        BufferedReader bufferedReader;
        InputStream gZIPInputStream = z ? new GZIPInputStream(inputStream) : inputStream;
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(new File(str, str2)));
        try {
            bufferedReader = new BufferedReader(new InputStreamReader(gZIPInputStream, DownloadManager.UTF8_CHARSET));
            try {
                StringBuilder sb = new StringBuilder();
                while (true) {
                    String line = bufferedReader.readLine();
                    if (line == null) {
                        break;
                    }
                    sb.append(line);
                    sb.append("\n");
                }
                bufferedWriter.write(sb.toString());
                String string = sb.toString();
                bufferedReader.close();
                gZIPInputStream.close();
                if (z) {
                    inputStream.close();
                }
                bufferedWriter.close();
                return string;
            } catch (Throwable th2) {
                th = th2;
                if (bufferedReader != null) {
                    bufferedReader.close();
                }
                gZIPInputStream.close();
                if (z) {
                    inputStream.close();
                }
                bufferedWriter.close();
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            bufferedReader = null;
        }
    }

    public static String encodeString(String str) {
        try {
            return URLEncoder.encode(str, DownloadManager.UTF8_CHARSET).replace("+", "%20");
        } catch (UnsupportedEncodingException unused) {
            return "";
        }
    }

    public static String decodeString(String str) {
        try {
            return URLDecoder.decode(str, DownloadManager.UTF8_CHARSET);
        } catch (UnsupportedEncodingException e) {
            Logger.d(TAG, "Failed decoding string " + e.getMessage());
            return "";
        }
    }

    public static String getMD5(String str) {
        try {
            String string = new BigInteger(1, MessageDigest.getInstance("MD5").digest(str.getBytes())).toString(16);
            while (string.length() < 32) {
                string = AppEventsConstants.EVENT_PARAM_VALUE_NO + string;
            }
            return string;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public static void loadGoogleAdvertiserInfo(Context context) {
        try {
            String[] advertisingIdInfo = DeviceStatus.getAdvertisingIdInfo(context);
            mAdvertisingId = advertisingIdInfo[0];
            mIsLimitedTrackingEnabled = Boolean.valueOf(advertisingIdInfo[1]).booleanValue();
        } catch (Exception e) {
            if (e != null) {
                if (e.getMessage() != null) {
                    Logger.i(TAG, e.getClass().getSimpleName() + ": " + e.getMessage());
                }
                if (e.getCause() != null) {
                    Logger.i(TAG, e.getClass().getSimpleName() + ": " + e.getCause());
                }
            }
        }
    }

    public static String getAdvertiserId() {
        return mAdvertisingId;
    }

    public static boolean isLimitAdTrackingEnabled() {
        return mIsLimitedTrackingEnabled;
    }

    public static String getControllerUrl() {
        return !TextUtils.isEmpty(mControllerUrl) ? mControllerUrl : "";
    }

    public static void setControllerUrl(String str) {
        mControllerUrl = str;
    }

    public static String getControllerConfig() {
        return mControllerConfig;
    }

    public static void setControllerConfig(String str) {
        mControllerConfig = str;
    }

    public static Map<String, String> getInitSDKParams() {
        return mInitSDKParams;
    }

    public static void setInitSDKParams(Map<String, String> map) {
        mInitSDKParams = map;
    }

    public static int getDebugMode() {
        return mDebugMode;
    }

    public static void setDebugMode(int i) {
        mDebugMode = i;
    }

    public static String getValueFromJsonObject(String str, String str2) {
        try {
            return new JSONObject(str).getString(str2);
        } catch (Exception unused) {
            return null;
        }
    }

    public static boolean isExternalStorageAvailable() {
        String externalStorageState = Environment.getExternalStorageState();
        return "mounted".equals(externalStorageState) || "mounted_ro".equals(externalStorageState);
    }

    public static int getActivityUIFlags(boolean z) {
        int i = Build.VERSION.SDK_INT >= 14 ? 2 : 0;
        if (Build.VERSION.SDK_INT >= 16) {
            i |= 1796;
        }
        return (Build.VERSION.SDK_INT < 19 || !z) ? i : i | 4096;
    }

    private static int generateViewIdForOldOS() {
        AtomicInteger atomicInteger;
        int i;
        int i2;
        do {
            atomicInteger = sNextGeneratedId;
            i = atomicInteger.get();
            i2 = i + 1;
            if (i2 > 16777215) {
                i2 = 1;
            }
        } while (!atomicInteger.compareAndSet(i, i2));
        return i;
    }

    public static int generateViewId() {
        if (Build.VERSION.SDK_INT < 17) {
            return generateViewIdForOldOS();
        }
        return View.generateViewId();
    }

    public static JSONObject getControllerConfigAsJSONObject() {
        try {
            return new JSONObject(getControllerConfig());
        } catch (Exception e) {
            e.printStackTrace();
            return new JSONObject();
        }
    }

    public static SSAEnums.ProductType getProductType(String str) {
        if (str.equalsIgnoreCase(SSAEnums.ProductType.RewardedVideo.toString())) {
            return SSAEnums.ProductType.RewardedVideo;
        }
        if (str.equalsIgnoreCase(SSAEnums.ProductType.Interstitial.toString())) {
            return SSAEnums.ProductType.Interstitial;
        }
        if (str.equalsIgnoreCase(SSAEnums.ProductType.OfferWall.toString())) {
            return SSAEnums.ProductType.OfferWall;
        }
        return null;
    }

    public static void setTesterParameters(String str) {
        mUserGroup = str;
    }

    public static String getTesterParameters() {
        return mUserGroup;
    }

    public static JSONObject mergeJSONObjects(JSONObject jSONObject, JSONObject jSONObject2) throws Exception {
        JSONObject jSONObject3 = new JSONObject();
        JSONArray jSONArray = new JSONArray();
        if (jSONObject != null) {
            jSONObject3 = new JSONObject(jSONObject.toString());
        }
        if (jSONObject2 != null) {
            jSONArray = jSONObject2.names();
        }
        if (jSONArray != null) {
            for (int i = 0; i < jSONArray.length(); i++) {
                String string = jSONArray.getString(i);
                jSONObject3.putOpt(string, jSONObject2.opt(string));
            }
        }
        return jSONObject3;
    }

    public static String flatMapToJsonAsString(Map<String, String> map) {
        JSONObject jSONObject = new JSONObject();
        if (map != null) {
            Iterator<Map.Entry<String, String>> it = map.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry<String, String> next = it.next();
                try {
                    jSONObject.putOpt(next.getKey(), encodeString(next.getValue()));
                } catch (JSONException e) {
                    Logger.i(TAG, "flatMapToJsonAsStringfailed " + e.toString());
                }
                it.remove();
            }
        }
        return jSONObject.toString();
    }

    public static int getMinOSVersionSupport() {
        return getControllerConfigAsJSONObject().optInt(Constants.FeaturesManager.MIN_OS_VERSION_SUPPORT);
    }

    public static Map<String, String> mergeHashMaps(Map<String, String>[] mapArr) {
        HashMap map = new HashMap();
        if (mapArr == null) {
            return map;
        }
        for (Map<String, String> map2 : mapArr) {
            if (map2 != null) {
                map.putAll(map2);
            }
        }
        return map;
    }

    public static String fetchDemandSourceId(SSAObj sSAObj) {
        return fetchDemandSourceId(sSAObj.getJsonObject());
    }

    public static String fetchDemandSourceId(JSONObject jSONObject) {
        String strOptString = jSONObject.optString("demandSourceId");
        return !TextUtils.isEmpty(strOptString) ? strOptString : jSONObject.optString("demandSourceName");
    }

    public static <T> T requireNonNull(T t, String str) {
        Objects.requireNonNull(t, str);
        return t;
    }

    public static String requireNonEmptyOrNull(String str, String str2) {
        Objects.requireNonNull(str, str2);
        return str;
    }

    public static boolean isIronSourceActivity(Activity activity) {
        return (activity instanceof ControllerActivity) || (activity instanceof OpenUrlActivity);
    }

    public static JSONObject getNetworkConfiguration() {
        JSONObject jSONObject = new JSONObject();
        try {
            return getControllerConfigAsJSONObject().getJSONObject("networkConfig");
        } catch (Exception e) {
            e.printStackTrace();
            return jSONObject;
        }
    }
}
