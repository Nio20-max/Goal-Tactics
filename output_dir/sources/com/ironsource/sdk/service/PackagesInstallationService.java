package com.ironsource.sdk.service;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import com.ironsource.environment.DeviceStatus;
import com.ironsource.sdk.Events.ISNEventParams;
import com.ironsource.sdk.Events.ISNEventsTracker;
import com.ironsource.sdk.Events.SDK5Events;
import com.ironsource.sdk.constants.Constants;
import com.ironsource.sdk.constants.Events;
import com.ironsource.sdk.utils.Logger;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class PackagesInstallationService {
    private static final String TAG = "PackagesInstallationService";
    private static final ArrayList<String> googlePlayAppPackageNames = new ArrayList<String>() { // from class: com.ironsource.sdk.service.PackagesInstallationService.1
        {
            add(Constants.AppPackageNames.GOOGLE_MARKET);
            add("com.android.vending");
        }
    };

    private static JSONObject getGooglePlayAppPackagesInstallationData(Context context) {
        return checkInstalledPackages(context, googlePlayAppPackageNames);
    }

    public static boolean isGooglePlayInstalled(Context context) {
        JSONObject googlePlayAppPackagesInstallationData = getGooglePlayAppPackagesInstallationData(context);
        Iterator<String> itKeys = googlePlayAppPackagesInstallationData.keys();
        while (itKeys.hasNext()) {
            JSONObject jSONObjectOptJSONObject = googlePlayAppPackagesInstallationData.optJSONObject(itKeys.next());
            if (jSONObjectOptJSONObject != null && jSONObjectOptJSONObject.optBoolean(Constants.ParametersKeys.IS_PACKAGE_INSTALLED)) {
                return true;
            }
        }
        return false;
    }

    private static JSONObject checkInstalledPackages(Context context, ArrayList<String> arrayList) {
        JSONObject jSONObject = new JSONObject();
        try {
            ArrayList<String> installedPackageNamesOnDevice = getInstalledPackageNamesOnDevice(context);
            for (String str : arrayList) {
                jSONObject.put(str, buildAppPackageInstallationObject(installedPackageNamesOnDevice.contains(str.trim().toLowerCase())));
            }
        } catch (Exception e) {
            ISNEventsTracker.logEvent(SDK5Events.extractInstalledPackagesFailed, new ISNEventParams().addPair(Events.CALL_FAILED_REASON, e.getMessage()).addPair(Events.GENERAL_MSG, arrayList.toString()).getData());
            Logger.d(TAG, "Error while extracting packages installation data");
        }
        return jSONObject;
    }

    private static JSONObject buildAppPackageInstallationObject(boolean z) throws JSONException {
        return new JSONObject(z) { // from class: com.ironsource.sdk.service.PackagesInstallationService.2
            final /* synthetic */ boolean val$isInstalled;

            {
                this.val$isInstalled = z;
                put(Constants.ParametersKeys.IS_PACKAGE_INSTALLED, z);
            }
        };
    }

    private static ArrayList<String> getInstalledPackageNamesOnDevice(Context context) {
        List<ApplicationInfo> installedApplications = DeviceStatus.getInstalledApplications(context);
        ArrayList<String> arrayList = new ArrayList<>();
        for (ApplicationInfo applicationInfo : installedApplications) {
            if (applicationInfo != null) {
                arrayList.add(applicationInfo.packageName.toLowerCase());
            }
        }
        return arrayList;
    }
}
