package com.helpshift.support;

import android.content.Context;
import android.database.SQLException;
import android.os.Build;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import com.helpshift.common.domain.network.NetworkConstants;
import com.helpshift.common.domain.network.NetworkErrorCodes;
import com.helpshift.common.exception.ExceptionType;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.platform.network.Response;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.configuration.response.PeriodicReview;
import com.helpshift.faq.FaqCore;
import com.helpshift.faq.FaqsResponse;
import com.helpshift.logger.model.LogModel;
import com.helpshift.model.InfoModelFactory;
import com.helpshift.providers.CrossModuleDataProvider;
import com.helpshift.providers.ICampaignsModuleAPIs;
import com.helpshift.support.HSSearch;
import com.helpshift.support.constants.GetSectionsCallBackStatus;
import com.helpshift.support.model.FaqSearchIndex;
import com.helpshift.support.model.FuzzySearchToken;
import com.helpshift.support.storage.FaqDAO;
import com.helpshift.support.storage.FaqsDataSource;
import com.helpshift.support.storage.SectionDAO;
import com.helpshift.support.storage.SectionsDataSource;
import com.helpshift.util.ErrorReportProvider;
import com.helpshift.util.FetchDataFromThread;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;

/* JADX INFO: loaded from: classes2.dex */
public final class HSApiData {
    public static final String TAG = "Helpshift_ApiData";
    public static ArrayList<HSFaqSyncStatusEvents> observers;
    public HSStorage storage;
    private static final Object flatFaqListSyncLock = new Object();
    private static final Object faqIndexLock = new Object();
    private Iterator failedApiKeys = null;
    private ArrayList<Faq> flatFaqList = null;
    SectionDAO sectionDAO = SectionsDataSource.getInstance();
    FaqDAO faqDAO = FaqsDataSource.getInstance();

    public HSApiData(Context context) {
        this.storage = new HSStorage(context);
    }

    protected static void addFaqSyncStatusObserver(HSFaqSyncStatusEvents hSFaqSyncStatusEvents) {
        if (observers == null) {
            observers = new ArrayList<>();
        }
        observers.add(hSFaqSyncStatusEvents);
    }

    protected static void removeFaqSyncStatusObserver(HSFaqSyncStatusEvents hSFaqSyncStatusEvents) {
        ArrayList<HSFaqSyncStatusEvents> arrayList = observers;
        if (arrayList != null) {
            arrayList.remove(hSFaqSyncStatusEvents);
        }
    }

    protected static void signalFaqsUpdated() {
        if (observers != null) {
            for (int i = 0; i < observers.size(); i++) {
                HSFaqSyncStatusEvents hSFaqSyncStatusEvents = observers.get(i);
                if (hSFaqSyncStatusEvents != null) {
                    hSFaqSyncStatusEvents.faqsUpdated();
                }
            }
        }
    }

    protected static void signalSearchIndexesUpdated() {
        if (observers != null) {
            for (int i = 0; i < observers.size(); i++) {
                HSFaqSyncStatusEvents hSFaqSyncStatusEvents = observers.get(i);
                if (hSFaqSyncStatusEvents != null) {
                    hSFaqSyncStatusEvents.searchIndexesUpdated();
                }
            }
        }
    }

    private void updateFlatList() {
        ArrayList<Section> sections = getSections();
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < sections.size(); i++) {
            arrayList.addAll(getFaqsDataForSection(sections.get(i).getPublishId()));
        }
        synchronized (flatFaqListSyncLock) {
            this.flatFaqList = new ArrayList<>(arrayList);
        }
    }

    private void getAndStoreSections(final Handler handler, final Handler handler2, final FaqTagFilter faqTagFilter) {
        HelpshiftContext.getCoreApi().getFaqDM().fetchFaqs(new FetchDataFromThread<FaqsResponse, ExceptionType>() { // from class: com.helpshift.support.HSApiData.1
            @Override // com.helpshift.util.FetchDataFromThread
            public void onDataFetched(FaqsResponse faqsResponse) {
                Handler handler3 = handler;
                if (handler3 != null) {
                    Message messageObtainMessage = handler3.obtainMessage();
                    if (1 == faqsResponse.statusCode) {
                        messageObtainMessage.what = GetSectionsCallBackStatus.API_SUCCESS_NEW_DATA;
                    } else if (2 == faqsResponse.statusCode) {
                        messageObtainMessage.what = GetSectionsCallBackStatus.API_SUCCESS_NO_NEW_DATA;
                    }
                    Object obj = faqsResponse.response;
                    if (obj != null) {
                        HSApiData.this.storeSections((JSONArray) obj);
                        messageObtainMessage.obj = HSApiData.this.sectionDAO.getAllSections(faqTagFilter);
                        HSApiData.this.startSearchIndexing();
                    }
                    handler.sendMessage(messageObtainMessage);
                    HSApiData.signalFaqsUpdated();
                }
            }

            @Override // com.helpshift.util.FetchDataFromThread
            public void onFailure(ExceptionType exceptionType) {
                int i;
                Handler handler3 = handler2;
                if (handler3 != null) {
                    Message messageObtainMessage = handler3.obtainMessage();
                    messageObtainMessage.obj = exceptionType;
                    if (exceptionType == NetworkException.CONTENT_UNCHANGED) {
                        i = GetSectionsCallBackStatus.API_FAILURE_CONTENT_UNCHANGED;
                    } else {
                        i = GetSectionsCallBackStatus.API_FAILURE;
                    }
                    messageObtainMessage.what = i;
                    handler2.sendMessage(messageObtainMessage);
                }
            }
        });
    }

    void storeSections(JSONArray jSONArray) {
        StringBuilder sb = new StringBuilder();
        sb.append("Updating ");
        sb.append(jSONArray == null ? 0 : jSONArray.length());
        sb.append(" FAQ sections in DB");
        HSLogger.d(TAG, sb.toString());
        this.sectionDAO.clearSectionsData();
        this.sectionDAO.storeSections(jSONArray);
    }

    void startSearchIndexing() {
        Thread thread = new Thread(new Runnable() { // from class: com.helpshift.support.HSApiData.2
            @Override // java.lang.Runnable
            public void run() {
                HSApiData.this.updateIndex();
            }
        }, "HS-search-index");
        thread.setDaemon(true);
        thread.start();
    }

    public void getSections(Handler handler, Handler handler2, FaqTagFilter faqTagFilter) {
        ArrayList arrayList;
        try {
            arrayList = (ArrayList) this.sectionDAO.getAllSections(faqTagFilter);
        } catch (SQLException e) {
            HSLogger.e(TAG, "Database exception in getting sections data ", e);
            arrayList = null;
        }
        if (arrayList != null) {
            Message messageObtainMessage = handler.obtainMessage();
            messageObtainMessage.what = GetSectionsCallBackStatus.DATABASE_SUCCESS;
            messageObtainMessage.obj = arrayList;
            handler.sendMessage(messageObtainMessage);
        } else {
            Message messageObtainMessage2 = handler2.obtainMessage();
            messageObtainMessage2.what = GetSectionsCallBackStatus.DATABASE_FAILURE;
            handler2.sendMessage(messageObtainMessage2);
        }
        getAndStoreSections(handler, handler2, faqTagFilter);
    }

    protected ArrayList<Section> getSections() {
        ArrayList<Section> arrayList = new ArrayList<>();
        try {
            return (ArrayList) this.sectionDAO.getAllSections();
        } catch (SQLException e) {
            HSLogger.e(TAG, "Database exception in getting sections data ", e);
            return arrayList;
        }
    }

    public ArrayList<Section> getPopulatedSections(ArrayList<Section> arrayList, FaqTagFilter faqTagFilter) {
        ArrayList<Section> arrayList2 = new ArrayList<>();
        for (int i = 0; i < arrayList.size(); i++) {
            if (!isSectionEmpty(arrayList.get(i), faqTagFilter)) {
                arrayList2.add(arrayList.get(i));
            }
        }
        return arrayList2;
    }

    protected ArrayList<Section> getPopulatedSections(FaqTagFilter faqTagFilter) {
        ArrayList<Section> arrayList = new ArrayList<>();
        try {
            arrayList = (ArrayList) this.sectionDAO.getAllSections(faqTagFilter);
        } catch (SQLException e) {
            HSLogger.e(TAG, "Database exception in getting sections data ", e);
        }
        return getPopulatedSections(arrayList, faqTagFilter);
    }

    protected boolean isSectionEmpty(Section section, FaqTagFilter faqTagFilter) {
        return getFaqsForSection(section.getPublishId(), faqTagFilter).isEmpty();
    }

    public ArrayList<Faq> getFaqsForSection(String str, FaqTagFilter faqTagFilter) {
        ArrayList<Faq> arrayList = new ArrayList<>();
        try {
            return (ArrayList) this.faqDAO.getFaqsForSection(str, faqTagFilter);
        } catch (SQLException e) {
            HSLogger.e(TAG, "Database exception in getting faqs for section", e);
            return arrayList;
        }
    }

    protected ArrayList<Faq> getFaqsDataForSection(String str) {
        ArrayList<Faq> arrayList = new ArrayList<>();
        try {
            return (ArrayList) this.faqDAO.getFaqsDataForSection(str);
        } catch (SQLException e) {
            HSLogger.e(TAG, "Database exception in getting faqs for section", e);
            return arrayList;
        }
    }

    public void markFaqInDB(String str, boolean z) {
        this.faqDAO.setIsHelpful(str, Boolean.valueOf(z));
    }

    public ArrayList<Faq> localFaqSearch(String str, HSSearch.HS_SEARCH_OPTIONS hs_search_options) {
        return localFaqSearch(str, hs_search_options, null);
    }

    public ArrayList<Faq> localFaqSearch(String str, HSSearch.HS_SEARCH_OPTIONS hs_search_options, FaqTagFilter faqTagFilter) {
        ArrayList<Faq> arrayList = this.flatFaqList;
        if (arrayList == null) {
            updateFlatList();
        } else {
            Iterator<Faq> it = arrayList.iterator();
            while (it.hasNext()) {
                it.next().clearSearchTerms();
            }
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        String lowerCase = str.toLowerCase();
        if (!this.storage.isCacheSearchIndexNull() && this.storage.getDBFlag().booleanValue()) {
            FaqSearchIndex index = this.storage.readIndex();
            Map<String, List<FuzzySearchToken>> map = index != null ? index.fuzzyIndex : null;
            ArrayList<HashMap> arrayListQueryDocs = HSSearch.queryDocs(str, hs_search_options);
            ArrayList<HashMap> fuzzyMatches = HSSearch.getFuzzyMatches(str, map);
            for (HashMap map2 : arrayListQueryDocs) {
                int iIntValue = Integer.decode((String) map2.get("f")).intValue();
                if (iIntValue < this.flatFaqList.size()) {
                    Faq faq = this.flatFaqList.get(iIntValue);
                    faq.addSearchTerms((ArrayList) map2.get("t"));
                    linkedHashSet.add(faq);
                }
            }
            for (HashMap map3 : fuzzyMatches) {
                int iIntValue2 = Integer.decode((String) map3.get("f")).intValue();
                if (iIntValue2 < this.flatFaqList.size()) {
                    Faq faq2 = this.flatFaqList.get(iIntValue2);
                    faq2.addSearchTerms((ArrayList) map3.get("t"));
                    linkedHashSet.add(faq2);
                }
            }
        } else {
            for (int i = 0; i < this.flatFaqList.size(); i++) {
                Faq faq3 = this.flatFaqList.get(i);
                if (!faq3.title.toLowerCase().contains(lowerCase)) {
                    linkedHashSet.add(faq3);
                }
            }
        }
        if (faqTagFilter != null) {
            return new ArrayList<>(this.faqDAO.getFilteredFaqs(new ArrayList(linkedHashSet), faqTagFilter));
        }
        return new ArrayList<>(linkedHashSet);
    }

    public List<Faq> getAllFaqs(FaqTagFilter faqTagFilter) {
        ArrayList<Faq> arrayList = this.flatFaqList;
        if (arrayList == null) {
            updateFlatList();
        } else {
            Iterator<Faq> it = arrayList.iterator();
            while (it.hasNext()) {
                it.next().clearSearchTerms();
            }
        }
        if (faqTagFilter != null) {
            return new ArrayList(this.faqDAO.getFilteredFaqs(new ArrayList(this.flatFaqList), faqTagFilter));
        }
        return this.flatFaqList;
    }

    protected boolean shouldShowReviewPopup() {
        SDKConfigurationDM sDKConfigurationDM = HelpshiftContext.getCoreApi().getSDKConfigurationDM();
        if (sDKConfigurationDM.getBoolean(SDKConfigurationDM.APP_REVIEWED) || TextUtils.isEmpty(sDKConfigurationDM.getString(SDKConfigurationDM.REVIEW_URL))) {
            return false;
        }
        PeriodicReview periodicReview = sDKConfigurationDM.getPeriodicReview();
        if (periodicReview.isEnabled && periodicReview.interval > 0) {
            int reviewCounter = this.storage.getReviewCounter();
            String str = periodicReview.type;
            int i = periodicReview.interval;
            if ("l".equals(str) && reviewCounter >= i) {
                return true;
            }
            if ("s".equals(str) && reviewCounter != 0 && (new Date().getTime() / 1000) - ((long) reviewCounter) >= i) {
                return true;
            }
        }
        return false;
    }

    protected void updateReviewCounter() {
        int launchReviewCounter;
        int reviewCounter = this.storage.getReviewCounter();
        int launchReviewCounter2 = this.storage.getLaunchReviewCounter();
        if (reviewCounter == 0) {
            launchReviewCounter = (int) (new Date().getTime() / 1000);
        } else {
            launchReviewCounter = reviewCounter;
            reviewCounter = launchReviewCounter2;
        }
        this.storage.setLaunchReviewCounter(reviewCounter + 1);
        if ("l".equals(HelpshiftContext.getCoreApi().getSDKConfigurationDM().getPeriodicReview().type)) {
            launchReviewCounter = this.storage.getLaunchReviewCounter();
        }
        this.storage.setReviewCounter(launchReviewCounter);
    }

    protected void resetReviewCounter() {
        int reviewCounter = this.storage.getReviewCounter();
        String str = HelpshiftContext.getCoreApi().getSDKConfigurationDM().getPeriodicReview().type;
        if (str.equals("s")) {
            reviewCounter = (int) (new Date().getTime() / 1000);
        } else if (str.equals("l")) {
            reviewCounter = 0;
        }
        this.storage.setReviewCounter(reviewCounter);
        this.storage.setLaunchReviewCounter(0);
    }

    public void storeFile(String str) {
        try {
            JSONArray storedFiles = this.storage.getStoredFiles();
            storedFiles.put(str);
            this.storage.setStoredFiles(storedFiles);
        } catch (JSONException e) {
            HSLogger.d(TAG, "storeFile", e);
        }
    }

    void updateIndex() {
        synchronized (faqIndexLock) {
            HSLogger.d(TAG, "Updating search indexes.");
            this.storage.deleteIndex();
            updateFlatList();
            FaqSearchIndex faqSearchIndexIndexDocuments = HSSearch.indexDocuments(new ArrayList(this.flatFaqList));
            if (faqSearchIndexIndexDocuments != null) {
                this.storage.storeIndex(faqSearchIndexIndexDocuments);
            }
            signalSearchIndexesUpdated();
            HSLogger.d(TAG, "Search index update finished.");
        }
    }

    public void loadIndex() {
        Thread thread = new Thread(new Runnable() { // from class: com.helpshift.support.HSApiData.3
            @Override // java.lang.Runnable
            public void run() throws Throwable {
                try {
                    HSApiData.this.storage.loadIndex();
                } catch (IOException | ClassCastException | ClassNotFoundException e) {
                    HSLogger.e(HSApiData.TAG, "Exception while loading index: trying to re-create the index", e);
                    HSApiData.this.updateIndex();
                    try {
                        HSApiData.this.storage.loadIndex();
                    } catch (Exception e2) {
                        HSLogger.e(HSApiData.TAG, "Exception caught again, while loading index: ", e2);
                    }
                }
            }
        }, "HS-load-index");
        thread.setDaemon(true);
        thread.start();
    }

    public void getSection(final String str, final Handler handler, Handler handler2, FaqTagFilter faqTagFilter) {
        try {
            if (TextUtils.isEmpty(str)) {
                handler2.sendMessage(handler2.obtainMessage());
                return;
            }
            Section section = this.sectionDAO.getSection(str);
            if (section != null) {
                Message messageObtainMessage = handler.obtainMessage();
                messageObtainMessage.obj = section;
                handler.sendMessage(messageObtainMessage);
            }
            getAndStoreSections(new Handler() { // from class: com.helpshift.support.HSApiData.4
                @Override // android.os.Handler
                public void handleMessage(Message message) {
                    super.handleMessage(message);
                    Section section2 = HSApiData.this.sectionDAO.getSection(str);
                    Message messageObtainMessage2 = handler.obtainMessage();
                    messageObtainMessage2.obj = section2;
                    handler.sendMessage(messageObtainMessage2);
                }
            }, handler2, faqTagFilter);
        } catch (SQLException e) {
            HSLogger.e(TAG, "Database exception in getting section data ", e);
        }
    }

    public Section getSection(String str) {
        return this.sectionDAO.getSection(str);
    }

    public void getSectionSync(String str, Handler handler, Handler handler2) {
        if (TextUtils.isEmpty(str)) {
            handler2.sendMessage(handler2.obtainMessage());
            return;
        }
        try {
            Section section = this.sectionDAO.getSection(str);
            if (section != null) {
                Message messageObtainMessage = handler.obtainMessage();
                messageObtainMessage.obj = section;
                handler.sendMessage(messageObtainMessage);
            } else {
                handler2.sendMessage(handler2.obtainMessage());
            }
        } catch (SQLException e) {
            HSLogger.e(TAG, "Database exception in getting section data ", e);
        }
    }

    String getPublishIdFromSectionId(String str) {
        ArrayList<Section> sections = getSections();
        String publishId = "";
        for (int i = 0; i < sections.size(); i++) {
            Section section = sections.get(i);
            if (section.getSectionId().equals(str)) {
                publishId = section.getPublishId();
            }
        }
        return publishId;
    }

    private void getQuestionAsync(final String str, String str2, final boolean z, final Handler handler, final Handler handler2) {
        HelpshiftContext.getCoreApi().getFaqDM().fetchQuestion(new FetchDataFromThread<FaqCore, Integer>() { // from class: com.helpshift.support.HSApiData.5
            @Override // com.helpshift.util.FetchDataFromThread
            public void onDataFetched(FaqCore faqCore) {
                Message messageObtainMessage = handler.obtainMessage();
                Faq faq = new Faq(faqCore, HSApiData.this.getPublishIdFromSectionId(faqCore.section_id));
                messageObtainMessage.obj = faq;
                handler.sendMessage(messageObtainMessage);
                if (z) {
                    HelpshiftContext.getPlatform().getFAQSuggestionsDAO().insertOrUpdateFAQ(faq);
                } else {
                    HSApiData.this.faqDAO.addFaq(faq);
                }
            }

            @Override // com.helpshift.util.FetchDataFromThread
            public void onFailure(Integer num) {
                Message messageObtainMessage = handler2.obtainMessage();
                if (NetworkErrorCodes.FORBIDDEN_ACCESS.equals(num) || NetworkErrorCodes.CONTENT_NOT_FOUND.equals(num)) {
                    if (!z) {
                        HSApiData.this.faqDAO.removeFaq(str);
                    }
                    InfoModelFactory.getInstance().sdkInfoModel.clearEtag("/faqs/" + str + "/");
                }
                HashMap map = new HashMap();
                map.put("status", num);
                messageObtainMessage.obj = map;
                handler2.sendMessage(messageObtainMessage);
            }
        }, str, str2, z);
    }

    public void getQuestion(Handler handler, Handler handler2, boolean z, boolean z2, String str, String str2) {
        Faq faq;
        if (TextUtils.isEmpty(str)) {
            handler2.sendMessage(handler2.obtainMessage());
            return;
        }
        if (z2) {
            faq = (Faq) HelpshiftContext.getPlatform().getFAQSuggestionsDAO().getFAQ(str, str2);
            if (faq == null) {
                faq = this.faqDAO.getFaq(str, str2);
            }
        } else {
            faq = this.faqDAO.getFaq(str);
        }
        Message messageObtainMessage = handler.obtainMessage();
        messageObtainMessage.obj = faq;
        handler.sendMessage(messageObtainMessage);
        if (faq == null || z) {
            getQuestionAsync(str, str2, z2, handler, handler2);
        }
    }

    void sendErrorReports(List<LogModel> list) {
        if (list != null) {
            try {
                if (list.isEmpty()) {
                    return;
                }
                ICampaignsModuleAPIs campaignModuleAPIs = CrossModuleDataProvider.getCampaignModuleAPIs();
                HelpshiftContext.getCoreApi().getErrorReportsDM().sendErrorReport(new FetchDataFromThread<Response, Void>() { // from class: com.helpshift.support.HSApiData.6
                    @Override // com.helpshift.util.FetchDataFromThread
                    public void onDataFetched(Response response) {
                        HSLogger.deleteAll();
                    }

                    @Override // com.helpshift.util.FetchDataFromThread
                    public void onFailure(Void r5) {
                        HSApiData.this.storage.setLastErrorReportedTime((HSDateFormatSpec.getCurrentAdjustedTimeInMillis(HelpshiftContext.getPlatform()) - ErrorReportProvider.BATCH_TIME) - 1);
                    }
                }, list, HelpshiftContext.getCoreApi().getUserManagerDM().getActiveUser(), NetworkConstants.apiVersion, "7.11.1", Build.MODEL, campaignModuleAPIs != null ? campaignModuleAPIs.getDeviceIdentifier() : "", Build.VERSION.RELEASE);
            } catch (Exception unused) {
            }
        }
    }

    void clearETagsForFaqs() {
        Iterator<String> it = this.faqDAO.getAllFaqPublishIds().iterator();
        while (it.hasNext()) {
            String questionRoute = getQuestionRoute(it.next());
            HelpshiftContext.getPlatform().getNetworkRequestDAO().storeETag(questionRoute, "");
            InfoModelFactory.getInstance().sdkInfoModel.clearEtag(questionRoute);
        }
        HelpshiftContext.getPlatform().getNetworkRequestDAO().storeETag("/faqs/", null);
    }

    String getQuestionRoute(String str) {
        return "/faqs/" + str + "/";
    }
}
