package com.helpshift.network.util;

import android.text.TextUtils;
import com.helpshift.model.InfoModelFactory;
import com.helpshift.util.HelpshiftContext;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class HeaderUtil {
    public static Map<String, String> getCommonHeaders() {
        HashMap map = new HashMap();
        map.put("Accept-Language", String.format("%s;q=1.0", getAcceptLanguageHeader()));
        map.put("Accept-Encoding", "gzip");
        map.put("X-HS-V", "Helpshift-Android/" + HelpshiftContext.getPlatform().getDevice().getSDKVersion());
        return map;
    }

    public static String getAcceptLanguageHeader() {
        String sdkLanguage = InfoModelFactory.getInstance().sdkInfoModel.getSdkLanguage();
        return TextUtils.isEmpty(sdkLanguage) ? Locale.getDefault().toString() : sdkLanguage;
    }
}
