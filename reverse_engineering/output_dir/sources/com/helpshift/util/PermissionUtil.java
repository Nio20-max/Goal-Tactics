package com.helpshift.util;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.net.Uri;
import android.view.View;
import androidx.fragment.app.Fragment;
import com.google.android.material.snackbar.Snackbar;
import com.helpshift.views.HSSnackbar;

/* JADX INFO: loaded from: classes2.dex */
public class PermissionUtil {
    private static final String TAG = "Helpshift_Permissions";

    public static void showSettingsPage(Context context) {
        if (context == null) {
            return;
        }
        try {
            Intent intent = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS");
            intent.addCategory("android.intent.category.DEFAULT");
            intent.setData(Uri.parse("package:" + context.getPackageName()));
            context.startActivity(intent);
        } catch (ActivityNotFoundException unused) {
            Intent intent2 = new Intent("android.settings.MANAGE_APPLICATIONS_SETTINGS");
            intent2.addCategory("android.intent.category.DEFAULT");
            context.startActivity(intent2);
        }
    }

    public static Snackbar requestPermissions(final Fragment fragment, final String[] strArr, int i, int i2, final int i3, View view) {
        HSLogger.d(TAG, "Requesting permission : " + strArr[0]);
        if (fragment.shouldShowRequestPermissionRationale(strArr[0])) {
            Snackbar action = HSSnackbar.make(view, i, -2).setAction(i2, new View.OnClickListener() { // from class: com.helpshift.util.PermissionUtil.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view2) {
                    fragment.requestPermissions(strArr, i3);
                }
            });
            action.show();
            return action;
        }
        fragment.requestPermissions(strArr, i3);
        return null;
    }

    public static boolean hasPermissionInManifest(Context context, String str) {
        try {
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 4096);
            if (packageInfo.requestedPermissions != null) {
                for (String str2 : packageInfo.requestedPermissions) {
                    if (str2.equals(str)) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            HSLogger.d(TAG, "Error checking permission in Manifest : ", e);
        }
        return false;
    }
}
