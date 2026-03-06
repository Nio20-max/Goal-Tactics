package com.helpshift.common.domain.network;

import com.helpshift.account.domainmodel.ClearedUserDM;
import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.platform.network.NetworkRequestDAO;
import com.helpshift.db.legacy_profile.tables.ProfileTable;
import com.helpshift.support.res.values.HSConsts;
import com.helpshift.util.StringUtils;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class NetworkDataRequestUtil {
    public static HashMap<String, String> getUserRequestData(UserDM userDM) {
        HashMap<String, String> map = new HashMap<>();
        if (userDM != null) {
            if (!StringUtils.isEmpty(userDM.getDeviceId())) {
                map.put(ProfileTable.Columns.COLUMN_DID, userDM.getDeviceId());
            }
            if (!StringUtils.isEmpty(userDM.getIdentifier())) {
                map.put(ProfileTable.Columns.COLUMN_UID, userDM.getIdentifier());
            }
            if (!StringUtils.isEmpty(userDM.getEmail())) {
                map.put("email", userDM.getEmail());
            }
            if (!StringUtils.isEmpty(userDM.getAuthToken())) {
                map.put("user_auth_token", userDM.getAuthToken());
            }
        }
        return map;
    }

    public static HashMap<String, String> getUserRequestData(ClearedUserDM clearedUserDM) {
        HashMap<String, String> map = new HashMap<>();
        if (clearedUserDM != null) {
            if (!StringUtils.isEmpty(clearedUserDM.deviceId)) {
                map.put(ProfileTable.Columns.COLUMN_DID, clearedUserDM.deviceId);
            }
            if (!StringUtils.isEmpty(clearedUserDM.identifier)) {
                map.put(ProfileTable.Columns.COLUMN_UID, clearedUserDM.identifier);
            }
            if (!StringUtils.isEmpty(clearedUserDM.email)) {
                map.put("email", clearedUserDM.email);
            }
            if (!StringUtils.isEmpty(clearedUserDM.authToken)) {
                map.put("user_auth_token", clearedUserDM.authToken);
            }
        }
        return map;
    }

    public static Map<String, String> cleanData(Map<String, String> map) {
        String str;
        HashMap map2 = new HashMap();
        for (String str2 : map.keySet()) {
            if (str2 != null && (str = map.get(str2)) != null) {
                map2.put(str2, str);
            }
        }
        return map2;
    }

    public static Map<String, Object> getSdkMeta() {
        HashMap map = new HashMap();
        map.put(HSConsts.ISSUE_ARCHIVAL_KEY, true);
        map.put(HSConsts.READ_STATUS_KEY, true);
        map.put(HSConsts.CORRECT_LANGUAGE_CODE_KEY, true);
        map.put(HSConsts.AGENT_TYPING_INDICATOR_KEY, true);
        map.put(HSConsts.ENABLE_FULL_PRIVACY_KEY, true);
        map.put("cb", true);
        return map;
    }

    public static String getAdjustedTimestamp(NetworkRequestDAO networkRequestDAO) {
        return new DecimalFormat("0.000", new DecimalFormatSymbols(Locale.US)).format((System.currentTimeMillis() / 1000.0d) + ((double) networkRequestDAO.getServerTimeDelta()));
    }
}
