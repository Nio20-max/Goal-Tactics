package com.helpshift.faq;

import com.helpshift.analytics.AnalyticsEventType;
import com.helpshift.common.AutoRetriableDM;
import com.helpshift.common.AutoRetryFailedEventDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.domain.network.ContentUnchangedNetwork;
import com.helpshift.common.domain.network.ETagNetwork;
import com.helpshift.common.domain.network.FailedAPICallNetworkDecorator;
import com.helpshift.common.domain.network.GETNetwork;
import com.helpshift.common.domain.network.GuardOKNetwork;
import com.helpshift.common.domain.network.Network;
import com.helpshift.common.domain.network.NetworkErrorCodes;
import com.helpshift.common.domain.network.POSTNetwork;
import com.helpshift.common.domain.network.TSCorrectedNetwork;
import com.helpshift.common.exception.ExceptionType;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.platform.network.RequestData;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.faq.dao.FaqEventDAO;
import com.helpshift.util.FetchDataFromThread;
import com.helpshift.util.StringUtils;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class FaqsDM implements AutoRetriableDM {
    final Domain domain;
    final FaqEventDAO faqEventDAO;
    final Platform platform;

    public FaqsDM(Domain domain, Platform platform) {
        this.domain = domain;
        this.platform = platform;
        this.faqEventDAO = platform.getFaqEventDAO();
        domain.getAutoRetryFailedEventDM().register(AutoRetryFailedEventDM.EventType.FAQ, this);
    }

    public void markHelpful(final String str, final boolean z) {
        AnalyticsEventType analyticsEventType;
        this.domain.runParallel(new F() { // from class: com.helpshift.faq.FaqsDM.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                try {
                    FaqsDM.this.send(str, z);
                } catch (RootAPIException e) {
                    if (e.exceptionType == NetworkException.NON_RETRIABLE) {
                        return;
                    }
                    FaqsDM.this.faqEventDAO.insertFaqMarkHelpfulEvent(str, z);
                    FaqsDM.this.domain.getAutoRetryFailedEventDM().scheduleRetryTaskForEventType(AutoRetryFailedEventDM.EventType.FAQ, e.getServerStatusCode());
                    throw e;
                }
            }
        });
        if (z) {
            analyticsEventType = AnalyticsEventType.MARKED_HELPFUL;
        } else {
            analyticsEventType = AnalyticsEventType.MARKED_UNHELPFUL;
        }
        this.domain.getAnalyticsEventDM().pushEvent(analyticsEventType, str);
    }

    public void fetchQuestion(final FetchDataFromThread<FaqCore, Integer> fetchDataFromThread, final String str, final String str2, final boolean z) {
        this.domain.runParallel(new F() { // from class: com.helpshift.faq.FaqsDM.2
            @Override // com.helpshift.common.domain.F
            public void f() {
                try {
                    HashMap map = new HashMap();
                    String str3 = str2;
                    map.put("edfl", String.valueOf(z ? true : FaqsDM.this.domain.getSDKConfigurationDM().getBoolean(SDKConfigurationDM.DEFAULT_FALLBACK_LANGUAGE_ENABLE)));
                    String str4 = "/faqs/" + str + "/";
                    RequestData requestData = new RequestData(map);
                    FaqsDM.this.setFaqsCustomHeaders(requestData, str3);
                    fetchDataFromThread.onDataFetched(FaqsDM.this.platform.getResponseParser().parseSingleFAQ(FaqsDM.this.getFaqsNetwork(str4).makeRequest(requestData).responseString));
                } catch (RootAPIException e) {
                    if (e.exceptionType != NetworkException.CONTENT_UNCHANGED) {
                        int serverStatusCode = e.getServerStatusCode();
                        if (serverStatusCode == NetworkErrorCodes.FORBIDDEN_ACCESS.intValue() || serverStatusCode == NetworkErrorCodes.CONTENT_NOT_FOUND.intValue()) {
                            if (z) {
                                FaqsDM.this.platform.getFAQSuggestionsDAO().removeFAQ(str, str2);
                            }
                            FaqsDM.this.platform.getNetworkRequestDAO().storeETag("/faqs/" + str + "/", "");
                        }
                        fetchDataFromThread.onFailure(Integer.valueOf(serverStatusCode));
                    }
                }
            }
        });
    }

    public void fetchFaqs(final FetchDataFromThread<FaqsResponse, ExceptionType> fetchDataFromThread) {
        if (fetchDataFromThread == null) {
            return;
        }
        this.domain.runParallel(new F() { // from class: com.helpshift.faq.FaqsDM.3
            @Override // com.helpshift.common.domain.F
            public void f() {
                try {
                    Network faqsNetwork = FaqsDM.this.getFaqsNetwork("/faqs/");
                    HashMap map = new HashMap();
                    map.put("edfl", String.valueOf(FaqsDM.this.domain.getSDKConfigurationDM().getBoolean(SDKConfigurationDM.DEFAULT_FALLBACK_LANGUAGE_ENABLE)));
                    RequestData requestData = new RequestData(map);
                    HashMap map2 = new HashMap();
                    String sDKLanguage = FaqsDM.this.domain.getLocaleProviderDM().getSDKLanguage();
                    String defaultLanguage = FaqsDM.this.domain.getLocaleProviderDM().getDefaultLanguage();
                    if (StringUtils.isEmpty(sDKLanguage)) {
                        sDKLanguage = defaultLanguage;
                    }
                    int i = 1;
                    map2.put("Accept-Language", String.format(Locale.ENGLISH, "%s;q=1.0", sDKLanguage));
                    requestData.setCustomHeaders(map2);
                    Object objJsonifyToArray = null;
                    FaqsDM.this.setFaqsCustomHeaders(requestData, null);
                    String str = faqsNetwork.makeRequest(requestData).responseString;
                    if (str != null) {
                        objJsonifyToArray = FaqsDM.this.platform.getJsonifier().jsonifyToArray(str);
                    } else {
                        i = 2;
                    }
                    fetchDataFromThread.onDataFetched(new FaqsResponse(objJsonifyToArray, i));
                } catch (RootAPIException e) {
                    fetchDataFromThread.onFailure(e.exceptionType);
                }
            }
        });
    }

    @Override // com.helpshift.common.AutoRetriableDM
    public void sendFailedApiCalls(AutoRetryFailedEventDM.EventType eventType) {
        Map<String, Boolean> unSentFaqMarkHelpfulEvents;
        if (eventType == AutoRetryFailedEventDM.EventType.FAQ && (unSentFaqMarkHelpfulEvents = this.faqEventDAO.getUnSentFaqMarkHelpfulEvents()) != null) {
            for (String str : unSentFaqMarkHelpfulEvents.keySet()) {
                try {
                    send(str, unSentFaqMarkHelpfulEvents.get(str).booleanValue());
                    this.faqEventDAO.removeFaqMarkHelpfulEvent(str);
                } catch (RootAPIException e) {
                    if (e.exceptionType == NetworkException.NON_RETRIABLE) {
                        this.faqEventDAO.removeFaqMarkHelpfulEvent(str);
                    } else {
                        throw e;
                    }
                }
            }
        }
    }

    void send(String str, boolean z) {
        String str2;
        if (z) {
            str2 = "/faqs/" + str + "/helpful/";
        } else {
            str2 = "/faqs/" + str + "/unhelpful/";
        }
        new GuardOKNetwork(new TSCorrectedNetwork(new FailedAPICallNetworkDecorator(new POSTNetwork(str2, this.domain, this.platform)), this.platform)).makeRequest(new RequestData(new HashMap()));
    }

    void setFaqsCustomHeaders(RequestData requestData, String str) {
        HashMap map = new HashMap();
        if (StringUtils.isEmpty(str)) {
            str = this.domain.getLocaleProviderDM().getSDKLanguage();
            String defaultLanguage = this.domain.getLocaleProviderDM().getDefaultLanguage();
            if (StringUtils.isEmpty(str)) {
                str = defaultLanguage;
            }
        }
        map.put("Accept-Language", String.format(Locale.ENGLISH, "%s;q=1.0", str));
        requestData.setCustomHeaders(map);
    }

    Network getFaqsNetwork(String str) {
        return new ETagNetwork(new GuardOKNetwork(new ContentUnchangedNetwork(new TSCorrectedNetwork(new FailedAPICallNetworkDecorator(new GETNetwork(str, this.domain, this.platform)), this.platform))), this.platform, str);
    }
}
