package com.helpshift.common.platform;

import com.helpshift.analytics.dto.AnalyticsEventDTO;
import com.helpshift.cif.dto.CustomIssueFieldDTO;
import com.helpshift.logger.model.LogModel;
import com.helpshift.meta.dto.BreadCrumbDTO;
import com.helpshift.meta.dto.DebugLogDTO;
import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public interface Jsonifier {
    String jsonify(Collection collection);

    String jsonify(Map<String, Object> map);

    String jsonifyAnalyticsDTOList(List<AnalyticsEventDTO> list);

    Object jsonifyBreadCrumbDTOList(List<BreadCrumbDTO> list);

    Object jsonifyCustomIssueFieldDTOList(List<CustomIssueFieldDTO> list);

    Object jsonifyCustomMetaMap(Map<String, Serializable> map);

    Object jsonifyDebugLogDTOList(List<DebugLogDTO> list);

    <T> Object jsonifyListToJsonArray(List<T> list);

    Object jsonifyLogModelList(List<LogModel> list);

    Object jsonifyToArray(String str);

    Object jsonifyToObject(String str, String str2);

    Object jsonifyToObject(Map<String, Object> map);

    String removeKeyFromJsonObjString(String str, String str2);
}
