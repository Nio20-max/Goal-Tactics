package com.helpshift.controllers;

import android.os.Handler;
import android.os.HandlerThread;
import com.helpshift.app.CampaignAppLifeCycleListener;
import com.helpshift.app.LifecycleListener;
import com.helpshift.common.poller.Delay;
import com.helpshift.common.poller.HttpBackoff;
import com.helpshift.listeners.SyncListener;
import com.helpshift.model.InfoModelFactory;
import com.helpshift.network.errors.NetworkError;
import com.helpshift.specifications.DecayingIntervalSyncSpecification;
import com.helpshift.specifications.SyncSpecification;
import com.helpshift.storage.KeyValueStorage;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.TimeUtil;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: loaded from: classes2.dex */
public class SyncController implements LifecycleListener, DataSyncCompletionListener {
    static final String COUNT = "count";
    static final String FULL_SYNC_TIME = "full_sync_time";
    static final long FULL_SYNC_TIME_THRESHOLD = 86400000;
    private static final int MAX_RETRY_ATTEMPTS = 10;
    private static final long REALTIME_SYNC_BATCHER_DELAY_MS = 60000;
    static final String SYNC_TIME = "sync_time";
    private static final String TAG = "Helpshift_SyncControl";
    private Runnable batcherJob;
    Set<String> dataTypesWithChangedData;
    private Handler handler;
    private final KeyValueStorage keyValueStorage;
    private HttpBackoff retryBackoff;
    private final TimeUtil timeUtil;
    private final LinkedBlockingQueue<SyncListener> syncListeners = new LinkedBlockingQueue<>();
    private final Map<String, SyncSpecification> syncSpecificationMap = new HashMap();
    private AtomicBoolean isBatcherScheduled = new AtomicBoolean(false);

    public static class DataTypes {
        public static final String ANALYTICS_EVENT = "data_type_analytics_event";
        public static final String DEVICE = "data_type_device";
        public static final String SESSION = "data_type_session";
        public static final String SWITCH_USER = "data_type_switch_user";
        public static final String USER = "data_type_user";
    }

    public SyncController(KeyValueStorage keyValueStorage, TimeUtil timeUtil, SyncSpecification... syncSpecificationArr) {
        this.keyValueStorage = keyValueStorage;
        this.timeUtil = timeUtil;
        CampaignAppLifeCycleListener campaignAppLifeCycleListener = HelpshiftContext.getCampaignAppLifeCycleListener();
        if (campaignAppLifeCycleListener != null) {
            campaignAppLifeCycleListener.addLifecycleListener(this);
        }
        for (SyncSpecification syncSpecification : syncSpecificationArr) {
            this.syncSpecificationMap.put(syncSpecification.getDataType(), syncSpecification);
        }
    }

    private Runnable getBatcherJob() {
        if (this.batcherJob == null) {
            this.batcherJob = new Runnable() { // from class: com.helpshift.controllers.SyncController.1
                @Override // java.lang.Runnable
                public void run() {
                    if (SyncController.this.dataTypesWithChangedData != null) {
                        SyncController syncController = SyncController.this;
                        syncController.triggerSync(false, (String[]) syncController.dataTypesWithChangedData.toArray(new String[SyncController.this.dataTypesWithChangedData.size()]));
                    }
                    SyncController.this.cleanUpBatcherJob();
                }
            };
        }
        return this.batcherJob;
    }

    public void addSpecification(SyncSpecification syncSpecification) {
        this.syncSpecificationMap.put(syncSpecification.getDataType(), syncSpecification);
    }

    public void addSyncListeners(SyncListener... syncListenerArr) {
        for (SyncListener syncListener : syncListenerArr) {
            if (this.syncSpecificationMap.containsKey(syncListener.getDataType())) {
                this.syncListeners.add(syncListener);
            }
        }
    }

    void triggerSync(boolean z, String... strArr) {
        for (String str : strArr) {
            HSLogger.d(TAG, "Triggering sync for  type : " + str);
            if (isFullSyncSatisfied(str)) {
                dispatchSync(str, true);
            } else if (z) {
                SyncSpecification syncSpecification = this.syncSpecificationMap.get(str);
                if (syncSpecification != null && syncSpecification.isSatisfied(getDataChangeCount(str), getElapsedTimeSinceLastSync(str))) {
                    dispatchSync(str, false);
                }
            } else {
                dispatchSync(str, false);
            }
        }
    }

    private void dispatchSync(String str, boolean z) {
        HSLogger.d(TAG, "Dispatching sync for type :" + str + ", isFullSync : " + z);
        SyncListener syncListener = getSyncListener(str);
        if (syncListener != null) {
            if (z) {
                syncListener.fullSync();
            } else {
                syncListener.sync();
            }
        }
    }

    private SyncListener getSyncListener(String str) {
        for (SyncListener syncListener : this.syncListeners) {
            if (syncListener.getDataType().equals(str)) {
                return syncListener;
            }
        }
        return null;
    }

    public void scheduleSync(String str, long j) {
        HSLogger.d(TAG, "Scheduling sync : " + str + ", Delay : " + j);
        if (isDataTypeAllowedForImmediateSync(str)) {
            if (this.isBatcherScheduled.compareAndSet(false, true)) {
                startBatcherThread();
                this.handler.postDelayed(getBatcherJob(), j);
            }
            addDataTypeWithChangedData(str);
        }
    }

    private void onDataChanged(String str) {
        scheduleSync(str, REALTIME_SYNC_BATCHER_DELAY_MS);
    }

    public void incrementDataChangeCount(String str, int i) {
        if (i <= 0) {
            return;
        }
        HashMap<String, String> syncInformation = getSyncInformation(str);
        syncInformation.put(COUNT, Integer.toString(Integer.valueOf(syncInformation.get(COUNT)).intValue() + i));
        this.keyValueStorage.set(str, syncInformation);
        onDataChanged(str);
    }

    public void setDataChangeCount(String str, int i) {
        HashMap<String, String> syncInformation = getSyncInformation(str);
        int iIntValue = Integer.valueOf(syncInformation.get(COUNT)).intValue();
        syncInformation.put(COUNT, Integer.toString(i));
        this.keyValueStorage.set(str, syncInformation);
        if (iIntValue == i || i <= 0) {
            return;
        }
        onDataChanged(str);
    }

    public void dataSynced(String str, boolean z) {
        HSLogger.d(TAG, "Data sync complete : " + str + ", Full sync : " + z);
        String string = Long.toString(this.timeUtil.elapsedTimeMillis());
        HashMap<String, String> syncInformation = getSyncInformation(str);
        syncInformation.put(COUNT, Integer.toString(0));
        syncInformation.put(SYNC_TIME, string);
        if (z) {
            syncInformation.put(FULL_SYNC_TIME, string);
        }
        this.keyValueStorage.set(str, syncInformation);
        HttpBackoff httpBackoff = this.retryBackoff;
        if (httpBackoff != null) {
            httpBackoff.reset();
        }
    }

    public void dataSyncFailed(String str, NetworkError networkError) {
        HSLogger.w(TAG, "Data sync failed : " + str + ", Error : " + networkError.getMessage());
        SyncSpecification syncSpecification = this.syncSpecificationMap.get(str);
        if (syncSpecification != null) {
            str.hashCode();
            if ((str.equals(DataTypes.SWITCH_USER) || str.equals(DataTypes.ANALYTICS_EVENT)) && (syncSpecification instanceof DecayingIntervalSyncSpecification)) {
                ((DecayingIntervalSyncSpecification) syncSpecification).decayElapsedTimeThreshold();
            }
        }
        if (this.retryBackoff == null) {
            this.retryBackoff = new HttpBackoff.Builder().setBaseInterval(Delay.of(5L, TimeUnit.SECONDS)).setMaxAttempts(10).setRetryPolicy(HttpBackoff.RetryPolicy.FAILURE).build();
        }
        Integer reason = networkError.getReason();
        long jNextIntervalMillis = reason != null ? this.retryBackoff.nextIntervalMillis(reason.intValue()) : -100L;
        if (jNextIntervalMillis != -100) {
            scheduleSync(str, jNextIntervalMillis);
        }
    }

    private int getDataChangeCount(String str) {
        return Integer.valueOf(getSyncInformation(str).get(COUNT)).intValue();
    }

    private long getElapsedTimeSinceLastSync(String str) {
        return this.timeUtil.elapsedTimeMillis() - Long.valueOf(getSyncInformation(str).get(SYNC_TIME)).longValue();
    }

    private long getElapsedTimeSinceFullSync(String str) {
        return this.timeUtil.elapsedTimeMillis() - Long.valueOf(getSyncInformation(str).get(FULL_SYNC_TIME)).longValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0068  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.util.HashMap<java.lang.String, java.lang.String> getSyncInformation(java.lang.String r13) {
        /*
            r12 = this;
            com.helpshift.storage.KeyValueStorage r0 = r12.keyValueStorage
            java.lang.Object r0 = r0.get(r13)
            java.util.HashMap r0 = (java.util.HashMap) r0
            r1 = 0
            r2 = 1
            java.lang.String r3 = "sync_time"
            java.lang.String r4 = "full_sync_time"
            r5 = 0
            if (r0 != 0) goto L30
            java.util.HashMap r0 = new java.util.HashMap
            r0.<init>()
            java.lang.String r1 = java.lang.Integer.toString(r1)
            java.lang.String r7 = "count"
            r0.put(r7, r1)
            java.lang.String r1 = java.lang.Long.toString(r5)
            r0.put(r3, r1)
            java.lang.String r1 = java.lang.Long.toString(r5)
            r0.put(r4, r1)
        L2e:
            r1 = 1
            goto L57
        L30:
            com.helpshift.util.TimeUtil r7 = r12.timeUtil
            long r7 = r7.elapsedTimeMillis()
            java.lang.Object r9 = r0.get(r3)
            java.lang.String r9 = (java.lang.String) r9
            java.lang.Long r9 = java.lang.Long.valueOf(r9)
            long r9 = r9.longValue()
            int r11 = (r7 > r9 ? 1 : (r7 == r9 ? 0 : -1))
            if (r11 >= 0) goto L57
            java.lang.String r1 = java.lang.Long.toString(r5)
            r0.put(r3, r1)
            java.lang.String r1 = java.lang.Long.toString(r5)
            r0.put(r4, r1)
            goto L2e
        L57:
            boolean r3 = r0.containsKey(r4)
            if (r3 != 0) goto L65
            java.lang.String r1 = java.lang.Long.toString(r5)
            r0.put(r4, r1)
            goto L66
        L65:
            r2 = r1
        L66:
            if (r2 == 0) goto L6d
            com.helpshift.storage.KeyValueStorage r1 = r12.keyValueStorage
            r1.set(r13, r0)
        L6d:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.controllers.SyncController.getSyncInformation(java.lang.String):java.util.HashMap");
    }

    public boolean isFullSyncSatisfied(String str) {
        SyncListener syncListener = getSyncListener(str);
        return syncListener != null && syncListener.isFullSyncEnabled() && getElapsedTimeSinceFullSync(str) > 86400000;
    }

    @Override // com.helpshift.controllers.DataSyncCompletionListener
    public void switchUserComplete(String str) {
        retryForDependentDataTypes(getSyncListener(DataTypes.SWITCH_USER));
    }

    @Override // com.helpshift.controllers.DataSyncCompletionListener
    public void firstDeviceSyncComplete() {
        retryForDependentDataTypes(getSyncListener(DataTypes.DEVICE));
    }

    private void retryForDependentDataTypes(SyncListener syncListener) {
        Set<String> dependentChildDataTypes;
        if (syncListener == null || (dependentChildDataTypes = syncListener.getDependentChildDataTypes()) == null) {
            return;
        }
        Iterator<String> it = dependentChildDataTypes.iterator();
        while (it.hasNext()) {
            triggerSync(false, it.next());
        }
    }

    public Set<String> getDataTypesWithChangedData() {
        return this.dataTypesWithChangedData;
    }

    private void addDataTypeWithChangedData(String str) {
        if (this.dataTypesWithChangedData == null) {
            this.dataTypesWithChangedData = new HashSet();
        }
        this.dataTypesWithChangedData.add(str);
    }

    @Override // com.helpshift.app.LifecycleListener
    public void onForeground() {
        triggerSync(true, DataTypes.SWITCH_USER, DataTypes.USER, DataTypes.ANALYTICS_EVENT);
    }

    @Override // com.helpshift.app.LifecycleListener
    public void onBackground() {
        cancelBatcherJob();
        triggerSync(true, DataTypes.SWITCH_USER, DataTypes.DEVICE, DataTypes.USER, DataTypes.SESSION, DataTypes.ANALYTICS_EVENT);
    }

    private void startBatcherThread() {
        if (this.handler == null) {
            HandlerThread handlerThread = new HandlerThread("HS-cm-agg-sync");
            handlerThread.start();
            this.handler = new Handler(handlerThread.getLooper());
        }
    }

    void cleanUpBatcherJob() {
        this.isBatcherScheduled.compareAndSet(true, false);
        Set<String> set = this.dataTypesWithChangedData;
        if (set != null) {
            set.clear();
        }
    }

    private void cancelBatcherJob() {
        cleanUpBatcherJob();
        Handler handler = this.handler;
        if (handler == null || this.batcherJob == null) {
            return;
        }
        handler.removeCallbacks(getBatcherJob());
    }

    private boolean isDataTypeAllowedForImmediateSync(String str) {
        return str.equals(DataTypes.USER) || str.equals(DataTypes.ANALYTICS_EVENT) || (str.equals(DataTypes.DEVICE) && InfoModelFactory.getInstance().sdkInfoModel.getDevicePropertiesSyncImmediately().booleanValue()) || str.equals(DataTypes.SWITCH_USER);
    }
}
