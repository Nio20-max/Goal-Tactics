package com.helpshift.logger;

import com.facebook.internal.ServerProtocol;
import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.analytics.AnalyticsEventKey;
import com.helpshift.campaigns.util.constants.DeviceProperties;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.domain.network.CustomAuthDataPOSTNetwork;
import com.helpshift.common.domain.network.FailedAPICallNetworkDecorator;
import com.helpshift.common.domain.network.GuardOKNetwork;
import com.helpshift.common.domain.network.NetworkDataRequestUtil;
import com.helpshift.common.domain.network.TSCorrectedNetwork;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Device;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.platform.network.RequestData;
import com.helpshift.common.platform.network.Response;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.db.legacy_profile.tables.ProfileTable;
import com.helpshift.logger.model.LogModel;
import com.helpshift.support.res.values.HSConsts;
import com.helpshift.util.FetchDataFromThread;
import com.helpshift.util.HSFormat;
import com.helpshift.util.StringUtils;
import com.ironsource.sdk.constants.Constants;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/* JADX INFO: loaded from: classes2.dex */
public class ErrorReportsDM {
    Domain domain;
    Platform platform;

    public ErrorReportsDM(Platform platform, Domain domain) {
        this.platform = platform;
        this.domain = domain;
    }

    public void sendErrorReport(final FetchDataFromThread<Response, Void> fetchDataFromThread, final List<LogModel> list, final UserDM userDM, final String str, final String str2, final String str3, final String str4, final String str5) {
        this.domain.runParallel(new F() { // from class: com.helpshift.logger.ErrorReportsDM.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                try {
                    Object objJsonifyLogModelList = ErrorReportsDM.this.platform.getJsonifier().jsonifyLogModelList(list);
                    Device device = ErrorReportsDM.this.platform.getDevice();
                    String appName = device.getAppName();
                    String appVersion = device.getAppVersion();
                    ArrayList arrayList = new ArrayList(5);
                    arrayList.add(ErrorReportsDM.this.platform.getJsonifier().jsonifyToObject(Constants.RequestParameters.DOMAIN, ErrorReportsDM.this.platform.getDomain()));
                    arrayList.add(ErrorReportsDM.this.platform.getJsonifier().jsonifyToObject(DeviceProperties.DeviceKeys.MODEL, str3));
                    arrayList.add(ErrorReportsDM.this.platform.getJsonifier().jsonifyToObject(ProfileTable.Columns.COLUMN_DID, userDM.getDeviceId()));
                    if (!StringUtils.isEmpty(str4)) {
                        arrayList.add(ErrorReportsDM.this.platform.getJsonifier().jsonifyToObject("cdid", str4));
                    }
                    arrayList.add(ErrorReportsDM.this.platform.getJsonifier().jsonifyToObject(DeviceProperties.DeviceKeys.OS, str5));
                    if (!StringUtils.isEmpty(appName)) {
                        arrayList.add(ErrorReportsDM.this.platform.getJsonifier().jsonifyToObject("an", appName));
                    }
                    if (!StringUtils.isEmpty(appVersion)) {
                        arrayList.add(ErrorReportsDM.this.platform.getJsonifier().jsonifyToObject(DeviceProperties.DeviceKeys.APP_VERSION, appVersion));
                    }
                    Object objJsonifyListToJsonArray = ErrorReportsDM.this.platform.getJsonifier().jsonifyListToJsonArray(arrayList);
                    HashMap map = new HashMap();
                    map.put("id", UUID.randomUUID().toString());
                    map.put("v", str);
                    map.put("ctime", HSFormat.errorLogReportingTimeFormat.format(HSDateFormatSpec.getCurrentAdjustedTime(ErrorReportsDM.this.platform)));
                    map.put(AnalyticsEventKey.FAQ_SOURCE, "sdk.android." + str2);
                    map.put("logs", objJsonifyLogModelList.toString());
                    map.put("md", objJsonifyListToJsonArray.toString());
                    fetchDataFromThread.onDataFetched(new GuardOKNetwork(new TSCorrectedNetwork(new FailedAPICallNetworkDecorator(new CustomAuthDataPOSTNetwork("/events/crash-log", ErrorReportsDM.this.domain, ErrorReportsDM.this.platform, ErrorReportsDM.this.getAuthDataForErrorReports())), ErrorReportsDM.this.platform)).makeRequest(new RequestData(map)));
                } catch (RootAPIException unused) {
                    fetchDataFromThread.onFailure(null);
                }
            }
        });
    }

    Map<String, String> getAuthDataForErrorReports() {
        try {
            HashMap map = new HashMap();
            ArrayList arrayList = new ArrayList();
            arrayList.add("platform-id=sdk");
            String string = UUID.randomUUID().toString();
            arrayList.add("token=" + string);
            map.put("token", string);
            map.put(HSConsts.SDK_META, this.platform.getJsonifier().jsonify(NetworkDataRequestUtil.getSdkMeta()));
            arrayList.add("sm=" + this.platform.getJsonifier().jsonify(NetworkDataRequestUtil.getSdkMeta()));
            map.put("signature", this.domain.getCryptoDM().getSignature(StringUtils.join(Constants.RequestParameters.AMPERSAND, arrayList), ServerProtocol.DIALOG_PARAM_SDK_VERSION));
            return map;
        } catch (GeneralSecurityException e) {
            throw RootAPIException.wrap(e, null, "SecurityException while creating signature");
        }
    }
}
