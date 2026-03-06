package com.helpshift.support;

import android.content.Context;
import android.content.Intent;
import com.helpshift.CoreApi;
import com.helpshift.app.AppLifeCycleStateHolder;
import com.helpshift.applifecycle.HSAppLifeCycleListener;
import com.helpshift.common.domain.network.NetworkConstants;
import com.helpshift.common.platform.network.NetworkRequestDAO;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.logger.model.LogModel;
import com.helpshift.static_classes.ErrorReporting;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.util.ErrorReportProvider;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftConnectionUtil;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.StringUtils;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class SupportAppLifeCycleListener implements HSAppLifeCycleListener {
    private static final String TAG = "SupLifeCycleListnr";
    HSApiData data = null;
    HSStorage storage = null;

    @Override // com.helpshift.applifecycle.HSAppLifeCycleListener
    public void onAppForeground(Context context) {
        List<LogModel> all;
        if (HelpshiftContext.verifyInstall()) {
            boolean z = true;
            AppLifeCycleStateHolder.setAppInForeground(true);
            if (this.data == null) {
                HSApiData hSApiData = new HSApiData(context);
                this.data = hSApiData;
                this.storage = hSApiData.storage;
            }
            this.data.updateReviewCounter();
            if (this.data.shouldShowReviewPopup()) {
                Intent intent = new Intent(context, (Class<?>) HSReview.class);
                intent.setFlags(268435456);
                context.startActivity(intent);
            }
            tryFetchingServerConfig(context);
            HelpshiftContext.getCoreApi().sendFailedApiCalls();
            HelpshiftContext.getCoreApi().sendAppStartEvent();
            HelpshiftContext.getCoreApi().resetPreIssueConversations();
            boolean zIsOnline = HelpshiftConnectionUtil.isOnline(context);
            synchronized (this) {
                if (zIsOnline) {
                    if (ErrorReporting.isEnabled()) {
                        long lastErrorReportedTime = this.storage.getLastErrorReportedTime();
                        long currentAdjustedTimeInMillis = HSDateFormatSpec.getCurrentAdjustedTimeInMillis(HelpshiftContext.getPlatform());
                        if (currentAdjustedTimeInMillis - lastErrorReportedTime <= ErrorReportProvider.BATCH_TIME) {
                            z = false;
                        }
                        if (z && (all = HSLogger.getAll()) != null && !all.isEmpty()) {
                            this.storage.setLastErrorReportedTime(currentAdjustedTimeInMillis);
                            this.data.sendErrorReports(all);
                        }
                    }
                }
            }
        }
    }

    @Override // com.helpshift.applifecycle.HSAppLifeCycleListener
    public void onAppBackground(Context context) {
        if (HelpshiftContext.verifyInstall()) {
            AppLifeCycleStateHolder.setAppInForeground(false);
            HelpshiftContext.getCoreApi().getConversationInboxPoller().stop();
            HelpshiftContext.getCoreApi().sendRequestIdsForSuccessfulApiCalls();
        }
    }

    private void tryFetchingServerConfig(Context context) {
        try {
            boolean zIsApplicationDebuggable = ApplicationUtil.isApplicationDebuggable(context);
            CoreApi coreApi = HelpshiftContext.getCoreApi();
            NetworkRequestDAO networkRequestDAO = HelpshiftContext.getPlatform().getNetworkRequestDAO();
            SDKConfigurationDM sDKConfigurationDM = coreApi.getDomain().getSDKConfigurationDM();
            long jCurrentTimeMillis = System.currentTimeMillis() / 1000;
            if (zIsApplicationDebuggable || StringUtils.isEmpty(networkRequestDAO.getETag(NetworkConstants.SUPPORT_CONFIG_ROUTE)) || Math.abs(jCurrentTimeMillis - sDKConfigurationDM.getLastSuccessfulConfigFetchTime().longValue()) >= sDKConfigurationDM.getPeriodicFetchInterval()) {
                coreApi.getConfigFetchDM().fetchServerConfig(false);
            }
            coreApi.refreshPoller();
        } catch (Exception e) {
            HSLogger.e(TAG, "Exception while fetching config", e);
        }
    }
}
