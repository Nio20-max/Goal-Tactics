package com.helpshift.common.platform;

import android.text.TextUtils;
import androidx.core.app.NotificationCompat;
import com.facebook.appevents.UserDataStore;
import com.facebook.appevents.internal.ViewHierarchyConstants;
import com.facebook.share.internal.ShareConstants;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.helpshift.analytics.AnalyticsEventKey;
import com.helpshift.analytics.dto.AnalyticsEventDTO;
import com.helpshift.cif.dto.CustomIssueFieldDTO;
import com.helpshift.common.exception.ParseException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.logger.model.LogModel;
import com.helpshift.meta.dto.BreadCrumbDTO;
import com.helpshift.meta.dto.DebugLogDTO;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class AndroidJsonifier implements Jsonifier {
    @Override // com.helpshift.common.platform.Jsonifier
    public String jsonify(Map<String, Object> map) {
        try {
            JSONObject jSONObject = new JSONObject();
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                jSONObject.put(entry.getKey(), entry.getValue());
            }
            return jSONObject.toString();
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Exception while calling jsonify on map");
        }
    }

    @Override // com.helpshift.common.platform.Jsonifier
    public Object jsonifyToObject(Map<String, Object> map) {
        try {
            JSONObject jSONObject = new JSONObject();
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                jSONObject.put(entry.getKey(), entry.getValue());
            }
            return jSONObject;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Exception while calling jsonify on map");
        }
    }

    @Override // com.helpshift.common.platform.Jsonifier
    public String jsonify(Collection collection) {
        return new JSONArray(collection).toString();
    }

    @Override // com.helpshift.common.platform.Jsonifier
    public <T> Object jsonifyListToJsonArray(List<T> list) {
        JSONArray jSONArray = new JSONArray();
        Iterator<T> it = list.iterator();
        while (it.hasNext()) {
            jSONArray.put(it.next());
        }
        return jSONArray;
    }

    @Override // com.helpshift.common.platform.Jsonifier
    public String jsonifyAnalyticsDTOList(List<AnalyticsEventDTO> list) {
        if (list == null) {
            return null;
        }
        JSONArray jSONArray = new JSONArray();
        try {
            Iterator<AnalyticsEventDTO> it = list.iterator();
            while (it.hasNext()) {
                jSONArray.put(jsonifyAnalyticsDTO(it.next()));
            }
            return jSONArray.toString();
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Exception while forming analytics string");
        }
    }

    @Override // com.helpshift.common.platform.Jsonifier
    public Object jsonifyBreadCrumbDTOList(List<BreadCrumbDTO> list) {
        JSONArray jSONArray = new JSONArray();
        if (list != null) {
            try {
                Iterator<BreadCrumbDTO> it = list.iterator();
                while (it.hasNext()) {
                    jSONArray.put(jsonifyBreadCrumbDTO(it.next()));
                }
            } catch (JSONException e) {
                throw RootAPIException.wrap(e, ParseException.GENERIC, "Exception while forming breadcrumb string");
            }
        }
        return jSONArray;
    }

    @Override // com.helpshift.common.platform.Jsonifier
    public Object jsonifyDebugLogDTOList(List<DebugLogDTO> list) {
        JSONArray jSONArray = new JSONArray();
        if (list != null) {
            try {
                Iterator<DebugLogDTO> it = list.iterator();
                while (it.hasNext()) {
                    jSONArray.put(jsonifyDebugLogDTO(it.next()));
                }
            } catch (JSONException e) {
                throw RootAPIException.wrap(e, ParseException.GENERIC, "Exception while forming debugLog string");
            }
        }
        return jSONArray;
    }

    @Override // com.helpshift.common.platform.Jsonifier
    public String removeKeyFromJsonObjString(String str, String str2) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            jSONObject.remove(str2);
            return jSONObject.toString();
        } catch (JSONException unused) {
            return str;
        }
    }

    @Override // com.helpshift.common.platform.Jsonifier
    public Object jsonifyCustomMetaMap(Map<String, Serializable> map) {
        try {
            JSONObject jSONObject = new JSONObject();
            for (Map.Entry<String, Serializable> entry : map.entrySet()) {
                Object value = entry.getValue();
                if (value instanceof String[]) {
                    value = jsonifyListToJsonArray(new ArrayList(Arrays.asList((String[]) value)));
                }
                jSONObject.put(entry.getKey(), value);
            }
            return jSONObject;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Exception while forming custom meta string");
        }
    }

    @Override // com.helpshift.common.platform.Jsonifier
    public Object jsonifyCustomIssueFieldDTOList(List<CustomIssueFieldDTO> list) {
        JSONObject jSONObject = new JSONObject();
        for (CustomIssueFieldDTO customIssueFieldDTO : list) {
            try {
                JSONArray jSONArray = new JSONArray();
                jSONArray.put(customIssueFieldDTO.type);
                for (String str : customIssueFieldDTO.values) {
                    jSONArray.put(str);
                }
                jSONObject.put(customIssueFieldDTO.key, jSONArray);
            } catch (JSONException e) {
                throw RootAPIException.wrap(e, ParseException.GENERIC, "Exception while forming custom issue field string");
            }
        }
        return jSONObject;
    }

    private JSONObject jsonifyDebugLogDTO(DebugLogDTO debugLogDTO) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        if (debugLogDTO.msg != null) {
            jSONObject.put(ShareConstants.WEB_DIALOG_PARAM_MESSAGE, debugLogDTO.msg);
        }
        jSONObject.put(FirebaseAnalytics.Param.LEVEL, debugLogDTO.level);
        jSONObject.put(ViewHierarchyConstants.TAG_KEY, debugLogDTO.tag);
        if (!TextUtils.isEmpty(debugLogDTO.throwable)) {
            jSONObject.put("exception", debugLogDTO.throwable);
        }
        return jSONObject;
    }

    private JSONObject jsonifyBreadCrumbDTO(BreadCrumbDTO breadCrumbDTO) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("action", breadCrumbDTO.action);
        jSONObject.put("datetime", breadCrumbDTO.dateTime);
        return jSONObject;
    }

    private JSONObject jsonifyAnalyticsDTO(AnalyticsEventDTO analyticsEventDTO) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("ts", analyticsEventDTO.timeStamp);
        jSONObject.put("t", analyticsEventDTO.type.key);
        if (analyticsEventDTO.data != null && analyticsEventDTO.data.size() > 0) {
            jSONObject.put("d", jsonifyToObject(new HashMap(analyticsEventDTO.data)));
        }
        return jSONObject;
    }

    @Override // com.helpshift.common.platform.Jsonifier
    public Object jsonifyToArray(String str) {
        try {
            return new JSONArray(str);
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Exception while jsonifying string to array");
        }
    }

    @Override // com.helpshift.common.platform.Jsonifier
    public Object jsonifyLogModelList(List<LogModel> list) {
        try {
            JSONArray jSONArray = new JSONArray();
            for (LogModel logModel : list) {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("dt", logModel.timeStamp);
                jSONObject.put("l", logModel.level);
                jSONObject.put(UserDataStore.CITY, logModel.extras);
                jSONObject.put(NotificationCompat.CATEGORY_MESSAGE, logModel.message);
                jSONObject.put(UserDataStore.STATE, logModel.stacktrace);
                if (!TextUtils.isEmpty(logModel.sdkVersion)) {
                    jSONObject.put(AnalyticsEventKey.FAQ_SOURCE, "sdk.android." + logModel.sdkVersion);
                }
                jSONArray.put(jSONObject);
            }
            return jSONArray;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Exception while jsonifying LogModelList");
        }
    }

    @Override // com.helpshift.common.platform.Jsonifier
    public Object jsonifyToObject(String str, String str2) {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put(str, str2);
            return jSONObject;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Exception while jsonifying single object.");
        }
    }
}
