package com.helpshift.campaigns.controllers;

import com.helpshift.app.CampaignAppLifeCycleListener;
import com.helpshift.app.LifecycleListener;
import com.helpshift.campaigns.models.SessionModel;
import com.helpshift.campaigns.storage.SessionStorage;
import com.helpshift.campaigns.util.constants.NetworkRoutes;
import com.helpshift.campaigns.util.constants.SyncStatus;
import com.helpshift.controllers.SyncController;
import com.helpshift.db.legacy_profile.tables.ProfileTable;
import com.helpshift.network.NetworkDataProvider;
import com.helpshift.network.errors.NetworkError;
import com.helpshift.network.request.Request;
import com.helpshift.network.response.JsonArrayResponseParser;
import com.helpshift.network.response.Response;
import com.helpshift.util.HSJSONUtils;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.concurrent.DispatchQueue;
import com.ironsource.sdk.precache.DownloadManager;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;

/* JADX INFO: loaded from: classes.dex */
public class SessionController implements NetworkDataProvider, LifecycleListener {
    private static final String TAG = "HelpshiftDebug";
    private Integer batchSize;
    SessionModel currentSession;
    public final SessionStorage storage;
    public final SyncController syncController;
    public final DispatchQueue workerQueue;

    @Override // com.helpshift.network.NetworkDataProvider
    public Request getRequestWithFullData() {
        return null;
    }

    protected SessionController(SyncController syncController, DispatchQueue dispatchQueue, SessionStorage sessionStorage, Integer num) {
        this.workerQueue = dispatchQueue;
        this.storage = sessionStorage;
        this.batchSize = num;
        this.syncController = syncController;
        CampaignAppLifeCycleListener campaignAppLifeCycleListener = HelpshiftContext.getCampaignAppLifeCycleListener();
        if (campaignAppLifeCycleListener != null) {
            campaignAppLifeCycleListener.addLifecycleListener(this);
        }
        sessionStorage.cleanUpInvalidSessions();
        ArrayList<SessionModel> allSessions = sessionStorage.getAllSessions(SyncStatus.SYNCING);
        if (allSessions == null || allSessions.size() <= 0) {
            return;
        }
        int size = allSessions.size();
        String[] strArr = new String[size];
        for (int i = 0; i < size; i++) {
            strArr[i] = allSessions.get(i).identifier;
        }
        this.storage.setSyncStatus(SyncStatus.UNSYNCED, strArr);
    }

    public boolean isSessionActive() {
        return this.currentSession != null;
    }

    public void startSession() {
        this.workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.controllers.SessionController.1
            @Override // java.lang.Runnable
            public void run() {
                this.currentSession = new SessionModel();
                this.storeSession();
            }
        });
    }

    public void endSession() {
        this.workerQueue.dispatchSync(new Runnable() { // from class: com.helpshift.campaigns.controllers.SessionController.2
            @Override // java.lang.Runnable
            public void run() {
                if (this.currentSession != null) {
                    this.currentSession.endNow();
                    this.updateSession();
                    this.currentSession = null;
                    this.syncController.incrementDataChangeCount(SyncController.DataTypes.SESSION, 1);
                }
            }
        });
    }

    public void updateDurations() {
        this.workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.controllers.SessionController.3
            @Override // java.lang.Runnable
            public void run() {
                this.currentSession.updateDurations();
                this.updateSession();
            }
        });
    }

    public void storeSession() {
        this.storage.storeSession(this.currentSession);
    }

    public void updateSession() {
        this.storage.updateSession(this.currentSession);
    }

    public SessionModel getCurrentSession() {
        this.workerQueue.join();
        return this.currentSession;
    }

    private List<SessionModel> batchEvents(ArrayList<SessionModel> arrayList, Integer num) {
        ArrayList arrayList2 = new ArrayList();
        if (arrayList == null) {
            return arrayList2;
        }
        ArrayList arrayList3 = new ArrayList();
        Integer numValueOf = Integer.valueOf(num.intValue() * 1024 * 1024);
        Iterator<SessionModel> it = arrayList.iterator();
        while (it.hasNext()) {
            arrayList3.add(it.next().toData());
        }
        try {
            int length = new JSONArray((Collection) arrayList3).toString().getBytes(DownloadManager.UTF8_CHARSET).length;
            if (length <= numValueOf.intValue()) {
                return arrayList;
            }
            return arrayList.subList(0, Integer.valueOf(numValueOf.intValue() / Integer.valueOf(length / arrayList3.size()).intValue()).intValue());
        } catch (UnsupportedEncodingException e) {
            HSLogger.d(TAG, "Unsupported exception in batching events : ", e);
            return arrayList;
        }
    }

    @Override // com.helpshift.network.NetworkDataProvider
    public Request getRequest() {
        List<SessionModel> listBatchEvents = batchEvents(this.storage.getAllSessions(SyncStatus.UNSYNCED), this.batchSize);
        if (listBatchEvents.size() <= 0) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        String str = ControllerFactory.getInstance().userController.getCurrentUser().identifier;
        String identifier = ControllerFactory.getInstance().deviceController.deviceModel.getIdentifier();
        for (SessionModel sessionModel : listBatchEvents) {
            if (sessionModel.userIdentifier.equals(str) && sessionModel.deviceIdentifier.equals(identifier)) {
                arrayList.addAll(sessionModel.toData());
                arrayList2.add(sessionModel.identifier);
            }
        }
        if (arrayList.isEmpty()) {
            return null;
        }
        JSONArray jSONArrayFromListOfMaps = HSJSONUtils.fromListOfMaps(arrayList);
        HashMap map = new HashMap();
        map.put(ProfileTable.Columns.COLUMN_DID, identifier);
        map.put(ProfileTable.Columns.COLUMN_UID, str);
        map.put("e", jSONArrayFromListOfMaps.toString());
        final String[] strArr = (String[]) arrayList2.toArray(new String[arrayList2.size()]);
        this.storage.setSyncStatus(SyncStatus.SYNCING, strArr);
        return new Request(1, NetworkRoutes.SESSIONS_ROUTE, map, new Response.Listener<JSONArray>() { // from class: com.helpshift.campaigns.controllers.SessionController.4
            @Override // com.helpshift.network.response.Response.Listener
            public void onResponse(JSONArray jSONArray, Integer num) {
                this.workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.controllers.SessionController.4.1
                    @Override // java.lang.Runnable
                    public void run() {
                        this.storage.removeSessions(strArr);
                        this.syncController.dataSynced(SyncController.DataTypes.SESSION, false);
                    }
                });
            }
        }, new Response.ErrorListener() { // from class: com.helpshift.campaigns.controllers.SessionController.5
            @Override // com.helpshift.network.response.Response.ErrorListener
            public void onErrorResponse(NetworkError networkError, Integer num) {
                this.storage.setSyncStatus(SyncStatus.UNSYNCED, strArr);
                this.syncController.dataSyncFailed(SyncController.DataTypes.SESSION, networkError);
            }
        }, new JsonArrayResponseParser());
    }

    @Override // com.helpshift.network.NetworkDataProvider
    public void setBatchSize(Integer num) {
        this.batchSize = num;
    }

    @Override // com.helpshift.app.LifecycleListener
    public void onForeground() {
        startSession();
    }

    @Override // com.helpshift.app.LifecycleListener
    public void onBackground() {
        endSession();
    }
}
