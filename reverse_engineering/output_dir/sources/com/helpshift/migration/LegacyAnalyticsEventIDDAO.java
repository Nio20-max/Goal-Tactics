package com.helpshift.migration;

import com.helpshift.common.platform.network.KeyValuePair;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public interface LegacyAnalyticsEventIDDAO {
    String getLegacyAnalyticsEventId(String str);

    void storeLegacyAnalyticsEventIDs(List<KeyValuePair> list);
}
