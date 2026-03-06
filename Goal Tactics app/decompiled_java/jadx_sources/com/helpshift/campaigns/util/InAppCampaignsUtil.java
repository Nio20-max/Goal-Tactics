package com.helpshift.campaigns.util;

import android.content.Context;
import com.helpshift.campaigns.controllers.AnalyticsEventController;
import com.helpshift.campaigns.controllers.ControllerFactory;
import com.helpshift.campaigns.models.AnalyticsEvent;
import com.helpshift.campaigns.models.CampaignDetailModel;
import com.helpshift.campaigns.storage.CampaignStorage;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.util.TextUtils;
import com.helpshift.util.concurrent.DispatchQueue;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class InAppCampaignsUtil {
    private static DispatchQueue workerQueue = new DispatchQueue(false);

    private InAppCampaignsUtil() {
    }

    public static String getCampaignIdForLoggedInUser(String str) {
        return str + ":" + ControllerFactory.getInstance().userController.getCurrentUser().identifier;
    }

    public static List<CampaignDetailModel> cleanAndGetActiveCampaigns(Context context, CampaignStorage campaignStorage, String str) {
        if (campaignStorage == null || TextUtils.isEmpty(str)) {
            return null;
        }
        return removeExpiredCampaigns(context, campaignStorage, campaignStorage.getAllCampaigns(str));
    }

    public static List<CampaignDetailModel> cleanAndGetActiveCampaigns(Context context, CampaignStorage campaignStorage, boolean z, String str) {
        if (campaignStorage == null || TextUtils.isEmpty(str)) {
            return null;
        }
        return removeExpiredCampaigns(context, campaignStorage, campaignStorage.getAllCampaigns(z, str));
    }

    private static List<CampaignDetailModel> removeExpiredCampaigns(final Context context, final CampaignStorage campaignStorage, List<CampaignDetailModel> list) {
        ArrayList arrayList = new ArrayList();
        final ArrayList arrayList2 = new ArrayList();
        long jCurrentTimeMillis = System.currentTimeMillis() / 1000;
        if (list != null) {
            for (CampaignDetailModel campaignDetailModel : list) {
                long expiryTimeStamp = campaignDetailModel.getExpiryTimeStamp();
                if (expiryTimeStamp == Long.MAX_VALUE || expiryTimeStamp > jCurrentTimeMillis) {
                    arrayList.add(campaignDetailModel);
                } else {
                    arrayList2.add(campaignDetailModel.getIdentifier());
                }
            }
        }
        if (arrayList2.size() > 0) {
            workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.util.InAppCampaignsUtil.1
                @Override // java.lang.Runnable
                public void run() {
                    campaignStorage.deleteCampaigns((String[]) arrayList2.toArray(new String[0]));
                    AnalyticsEventController analyticsEventController = ControllerFactory.getInstance().analyticsEventController;
                    for (String str : arrayList2) {
                        ApplicationUtil.cancelNotification(context, str);
                        analyticsEventController.recordAnalyticsEvent(AnalyticsEvent.AnalyticsEventType.DELETE_EXPIRED_MESSAGE, str, false);
                    }
                }
            });
        }
        return arrayList;
    }
}
