package com.helpshift.account.dao;

import com.helpshift.common.platform.network.KeyValuePair;
import com.helpshift.migration.LegacyAnalyticsEventIDDAO;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class AndroidLegacyAnalyticsEventIDDAO implements LegacyAnalyticsEventIDDAO {
    private UserDB userDB;

    public AndroidLegacyAnalyticsEventIDDAO(UserDB userDB) {
        this.userDB = userDB;
    }

    @Override // com.helpshift.migration.LegacyAnalyticsEventIDDAO
    public String getLegacyAnalyticsEventId(String str) {
        if (StringUtils.isEmpty(str)) {
            return null;
        }
        return this.userDB.fetchLegacyAnalyticsEventId(str);
    }

    @Override // com.helpshift.migration.LegacyAnalyticsEventIDDAO
    public void storeLegacyAnalyticsEventIDs(List<KeyValuePair> list) {
        if (ListUtils.isEmpty(list)) {
            return;
        }
        ArrayList arrayList = new ArrayList();
        for (KeyValuePair keyValuePair : list) {
            if (keyValuePair != null && !StringUtils.isEmpty(keyValuePair.key) && !StringUtils.isEmpty(keyValuePair.value)) {
                arrayList.add(keyValuePair);
            }
        }
        this.userDB.storeLegacyAnalyticsEventIds(arrayList);
    }
}
