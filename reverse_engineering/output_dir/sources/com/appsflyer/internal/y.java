package com.appsflyer.internal;

import android.content.Context;
import android.util.DisplayMetrics;
import android.view.WindowManager;
import com.appsflyer.AFLogger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: classes.dex */
public final class y {
    public final String[] AFInAppEventParameterName;

    y() {
    }

    static Map<String, String> AFInAppEventType(Context context) {
        HashMap map = new HashMap();
        try {
            DisplayMetrics displayMetrics = new DisplayMetrics();
            ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getMetrics(displayMetrics);
            int i = context.getResources().getConfiguration().screenLayout & 15;
            map.put("x_px", String.valueOf(displayMetrics.widthPixels));
            map.put("y_px", String.valueOf(displayMetrics.heightPixels));
            map.put("d_dpi", String.valueOf(displayMetrics.densityDpi));
            map.put("size", String.valueOf(i));
            map.put("xdp", String.valueOf(displayMetrics.xdpi));
            map.put("ydp", String.valueOf(displayMetrics.ydpi));
        } catch (Throwable th) {
            AFLogger.valueOf("Couldn't aggregate screen stats: ", th);
        }
        return map;
    }

    public y(String... strArr) {
        if (strArr == null || strArr.length == 0) {
            this.AFInAppEventParameterName = null;
            return;
        }
        Pattern patternCompile = Pattern.compile("[\\w]{1,45}");
        ArrayList arrayList = new ArrayList();
        for (String str : strArr) {
            if (str != null && patternCompile.matcher(str).matches()) {
                arrayList.add(str.toLowerCase());
            } else {
                AFLogger.AppsFlyer2dXConversionCallback("Invalid partner name: ".concat(String.valueOf(str)));
            }
        }
        if (arrayList.contains("all")) {
            this.AFInAppEventParameterName = new String[]{"all"};
        } else if (arrayList.isEmpty()) {
            this.AFInAppEventParameterName = null;
        } else {
            this.AFInAppEventParameterName = (String[]) arrayList.toArray(new String[0]);
        }
    }
}
