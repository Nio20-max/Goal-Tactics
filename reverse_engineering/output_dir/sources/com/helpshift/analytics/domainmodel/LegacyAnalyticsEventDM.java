package com.helpshift.analytics.domainmodel;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.platform.Platform;
import com.helpshift.util.StringUtils;

/* JADX INFO: loaded from: classes.dex */
public class LegacyAnalyticsEventDM {
    private Platform platform;

    public LegacyAnalyticsEventDM(Platform platform) {
        this.platform = platform;
    }

    public String getLegacyAnalyticsEventId(UserDM userDM) {
        if (userDM.isAnonymousUser() || StringUtils.isEmpty(userDM.getIdentifier())) {
            return null;
        }
        return this.platform.getLegacyAnalyticsEventIDDAO().getLegacyAnalyticsEventId(userDM.getIdentifier());
    }
}
