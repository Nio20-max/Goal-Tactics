package com.ironsource.mediationsdk.events;

import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import android.text.TextUtils;
import com.ironsource.eventsmodule.DataBaseEventsStorage;
import com.ironsource.eventsmodule.EventData;
import com.ironsource.eventsmodule.EventsSender;
import com.ironsource.eventsmodule.IEventsManager;
import com.ironsource.eventsmodule.IEventsSenderResultListener;
import com.ironsource.mediationsdk.IronSourceSegment;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.model.ServerSegmetData;
import com.ironsource.mediationsdk.sdk.GeneralProperties;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.mediationsdk.utils.IronSourceUtils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public abstract class BaseEventsManager implements IEventsManager {
    int mAdUnitType;
    Set<Integer> mConnectivitySensitiveEventsSet;
    private Context mContext;
    private DataBaseEventsStorage mDbStorage;
    private EventThread mEventThread;
    String mEventType;
    private AbstractEventsFormatter mFormatter;
    String mFormatterType;
    private boolean mHasServerResponse;
    private ArrayList<EventData> mLocalEvents;
    private IronSourceLoggerManager mLoggerManager;
    private int[] mNonConnectivityEvents;
    private int[] mOptInEvents;
    private int[] mOptOutEvents;
    private IronSourceSegment mSegment;
    private ServerSegmetData mServerSegmentData;
    private String mSessionId;
    private int mTotalEvents;
    private int[] mTriggerEvents;
    final int DEFAULT_BACKUP_THRESHOLD = 1;
    final int DEFAULT_MAX_NUMBER_OF_EVENTS = 100;
    final int DEFAULT_MAX_EVENTS_PER_BATCH = 5000;
    final int NO_CONNECTIVITY_EVENT_ID_ADDITION = 90000;
    final int EVENT_DYNAMIC_STRING_MAX_LENGTH = 1024;
    final int DATABASE_VERSION = 5;
    final String DATABASE_NAME = "supersonic_sdk.db";
    final String KEY_PROVIDER = "provider";
    final String KEY_PLACEMENT = IronSourceConstants.EVENTS_PLACEMENT_NAME;
    private final String MEDIATION_ABT = "abt";
    private boolean mHadTriggerEvent = false;
    private boolean mIsEventsEnabled = true;
    private int mMaxNumberOfEvents = 100;
    private int mMaxEventsPerBatch = 5000;
    private int mBackupThreshold = 1;
    private Map<String, String> mBatchParams = new HashMap();
    private Map<String, String> mGenericEventParams = new HashMap();
    private String mAbt = "";
    private final Object mDBSyncLock = new Object();

    protected abstract String getCurrentPlacement(int i);

    protected abstract int getSessionDepth(EventData eventData);

    protected void initConnectivitySensitiveEventsSet() {
    }

    protected abstract boolean isTriggerEvent(EventData eventData);

    protected abstract void setCurrentPlacement(EventData eventData);

    protected abstract boolean shouldExtractCurrentPlacement(EventData eventData);

    protected abstract boolean shouldIncludeCurrentPlacement(EventData eventData);

    static /* synthetic */ int access$1208(BaseEventsManager baseEventsManager) {
        int i = baseEventsManager.mTotalEvents;
        baseEventsManager.mTotalEvents = i + 1;
        return i;
    }

    void initState() {
        this.mLocalEvents = new ArrayList<>();
        this.mTotalEvents = 0;
        this.mFormatter = EventsFormatterFactory.getFormatter(this.mFormatterType, this.mAdUnitType);
        EventThread eventThread = new EventThread(this.mEventType + "EventThread");
        this.mEventThread = eventThread;
        eventThread.start();
        this.mEventThread.prepareHandler();
        this.mLoggerManager = IronSourceLoggerManager.getLogger();
        this.mSessionId = IronSourceUtils.getSessionId();
        this.mConnectivitySensitiveEventsSet = new HashSet();
        initConnectivitySensitiveEventsSet();
    }

    public synchronized void start(Context context, IronSourceSegment ironSourceSegment) {
        String defaultEventsFormatterType = IronSourceUtils.getDefaultEventsFormatterType(context, this.mEventType, this.mFormatterType);
        this.mFormatterType = defaultEventsFormatterType;
        verifyCurrentFormatter(defaultEventsFormatterType);
        this.mFormatter.setEventsServerUrl(IronSourceUtils.getDefaultEventsURL(context, this.mEventType, null));
        this.mDbStorage = DataBaseEventsStorage.getInstance(context, "supersonic_sdk.db", 5);
        backupEventsToDb();
        this.mOptOutEvents = IronSourceUtils.getDefaultOptOutEvents(context, this.mEventType);
        this.mOptInEvents = IronSourceUtils.getDefaultOptInEvents(context, this.mEventType);
        this.mTriggerEvents = IronSourceUtils.getDefaultTriggerEvents(context, this.mEventType);
        this.mNonConnectivityEvents = IronSourceUtils.getDefaultNonConnectivityEvents(context, this.mEventType);
        this.mSegment = ironSourceSegment;
        this.mContext = context;
    }

    public synchronized void setServerSegmentData(ServerSegmetData serverSegmetData) {
        this.mServerSegmentData = serverSegmetData;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized boolean isNoConnectivityEvent(String str, EventData eventData) {
        boolean zContains;
        if (!str.equalsIgnoreCase("none")) {
            return false;
        }
        if (isEventsArrayNotEmpty(this.mNonConnectivityEvents)) {
            zContains = isEventInArray(eventData.getEventId(), this.mNonConnectivityEvents);
        } else {
            zContains = this.mConnectivitySensitiveEventsSet.contains(Integer.valueOf(eventData.getEventId()));
        }
        return zContains;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized int convertEventToNotConnected(EventData eventData) {
        return eventData.getEventId() + 90000;
    }

    @Override // com.ironsource.eventsmodule.IEventsManager
    public synchronized void log(final EventData eventData) {
        this.mEventThread.postTask(new Runnable() { // from class: com.ironsource.mediationsdk.events.BaseEventsManager.1
            @Override // java.lang.Runnable
            public void run() {
                boolean zIsTriggerEvent;
                if (eventData == null || !BaseEventsManager.this.mIsEventsEnabled) {
                    return;
                }
                eventData.addToAdditionalData("eventSessionId", BaseEventsManager.this.mSessionId);
                String connectionType = IronSourceUtils.getConnectionType(BaseEventsManager.this.mContext);
                if (BaseEventsManager.this.shouldAddConnectionType(eventData)) {
                    eventData.addToAdditionalData("connectionType", connectionType);
                }
                if (BaseEventsManager.this.isNoConnectivityEvent(connectionType, eventData)) {
                    EventData eventData2 = eventData;
                    eventData2.setEventId(BaseEventsManager.this.convertEventToNotConnected(eventData2));
                }
                BaseEventsManager.this.limitEventStringMember(eventData, IronSourceConstants.EVENTS_ERROR_REASON);
                BaseEventsManager.this.limitEventStringMember(eventData, IronSourceConstants.EVENTS_EXT1);
                if (!BaseEventsManager.this.getGenericEventParams().isEmpty()) {
                    for (Map.Entry<String, String> entry : BaseEventsManager.this.getGenericEventParams().entrySet()) {
                        if (!eventData.getAdditionalDataJSON().has(entry.getKey()) && entry.getKey() != "eventId" && entry.getKey() != DataBaseEventsStorage.EventEntry.COLUMN_NAME_TIMESTAMP) {
                            eventData.addToAdditionalData(entry.getKey(), entry.getValue());
                        }
                    }
                }
                if (BaseEventsManager.this.shouldEventBeLogged(eventData)) {
                    if (BaseEventsManager.this.shouldAddSessionDepth(eventData) && !BaseEventsManager.this.sessionDepthIsSet(eventData)) {
                        eventData.addToAdditionalData("sessionDepth", Integer.valueOf(BaseEventsManager.this.getSessionDepth(eventData)));
                    }
                    if (BaseEventsManager.this.shouldExtractCurrentPlacement(eventData)) {
                        BaseEventsManager.this.setCurrentPlacement(eventData);
                    } else if (!TextUtils.isEmpty(BaseEventsManager.this.getCurrentPlacement(eventData.getEventId())) && BaseEventsManager.this.shouldIncludeCurrentPlacement(eventData)) {
                        EventData eventData3 = eventData;
                        eventData3.addToAdditionalData(IronSourceConstants.EVENTS_PLACEMENT_NAME, BaseEventsManager.this.getCurrentPlacement(eventData3.getEventId()));
                    }
                    try {
                        BaseEventsManager.this.mLoggerManager.log(IronSourceLogger.IronSourceTag.EVENT, ("{\"eventId\":" + eventData.getEventId() + ",\"timestamp\":" + eventData.getTimeStamp() + "," + eventData.getAdditionalData().substring(1)).replace(",", "\n"), 0);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    BaseEventsManager.this.mLocalEvents.add(eventData);
                    BaseEventsManager.access$1208(BaseEventsManager.this);
                }
                BaseEventsManager baseEventsManager = BaseEventsManager.this;
                if (baseEventsManager.isEventsArrayNotEmpty(baseEventsManager.mTriggerEvents)) {
                    zIsTriggerEvent = BaseEventsManager.this.isEventInArray(eventData.getEventId(), BaseEventsManager.this.mTriggerEvents);
                } else {
                    zIsTriggerEvent = BaseEventsManager.this.isTriggerEvent(eventData);
                }
                if (!BaseEventsManager.this.mHadTriggerEvent && zIsTriggerEvent) {
                    BaseEventsManager.this.mHadTriggerEvent = true;
                }
                if (BaseEventsManager.this.mDbStorage != null) {
                    if (BaseEventsManager.this.shouldSendEvents()) {
                        BaseEventsManager.this.sendEvents();
                        return;
                    }
                    BaseEventsManager baseEventsManager2 = BaseEventsManager.this;
                    if (baseEventsManager2.shouldBackupEventsToDb(baseEventsManager2.mLocalEvents) || zIsTriggerEvent) {
                        BaseEventsManager.this.backupEventsToDb();
                    }
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    public void sendEvents() {
        ArrayList<EventData> arrayListInitCombinedEventList;
        this.mHadTriggerEvent = false;
        synchronized (this.mDBSyncLock) {
            arrayListInitCombinedEventList = initCombinedEventList(this.mLocalEvents, this.mDbStorage.loadEvents(this.mEventType), this.mMaxEventsPerBatch);
            this.mLocalEvents.clear();
            this.mDbStorage.clearEvents(this.mEventType);
        }
        this.mTotalEvents = 0;
        if (arrayListInitCombinedEventList.size() > 0) {
            JSONObject json = GeneralProperties.getProperties().toJSON();
            try {
                updateSegmentsData(json);
                String abt = getAbt();
                if (!TextUtils.isEmpty(abt)) {
                    json.put("abt", abt);
                }
                Map<String, String> batchParams = getBatchParams();
                if (!batchParams.isEmpty()) {
                    for (Map.Entry<String, String> entry : batchParams.entrySet()) {
                        if (!json.has(entry.getKey())) {
                            json.put(entry.getKey(), entry.getValue());
                        }
                    }
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            new EventsSender(new IEventsSenderResultListener() { // from class: com.ironsource.mediationsdk.events.BaseEventsManager.2
                @Override // com.ironsource.eventsmodule.IEventsSenderResultListener
                public synchronized void onEventsSenderResult(final ArrayList<EventData> arrayList, final boolean z) {
                    BaseEventsManager.this.mEventThread.postTask(new Runnable() { // from class: com.ironsource.mediationsdk.events.BaseEventsManager.2.1
                        @Override // java.lang.Runnable
                        public void run() {
                            if (z) {
                                ArrayList<EventData> arrayListLoadEvents = BaseEventsManager.this.mDbStorage.loadEvents(BaseEventsManager.this.mEventType);
                                BaseEventsManager.this.mTotalEvents = arrayListLoadEvents.size() + BaseEventsManager.this.mLocalEvents.size();
                            } else if (arrayList != null) {
                                BaseEventsManager.this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "Failed to send events", 0);
                                BaseEventsManager.this.mDbStorage.saveEvents(arrayList, BaseEventsManager.this.mEventType);
                                ArrayList<EventData> arrayListLoadEvents2 = BaseEventsManager.this.mDbStorage.loadEvents(BaseEventsManager.this.mEventType);
                                BaseEventsManager.this.mTotalEvents = arrayListLoadEvents2.size() + BaseEventsManager.this.mLocalEvents.size();
                            }
                        }
                    });
                }
            }).execute(this.mFormatter.format(arrayListInitCombinedEventList, json), this.mFormatter.getEventsServerUrl(), arrayListInitCombinedEventList);
        }
    }

    private ArrayList<EventData> initCombinedEventList(ArrayList<EventData> arrayList, ArrayList<EventData> arrayList2, int i) {
        ArrayList arrayList3 = new ArrayList();
        arrayList3.addAll(arrayList);
        arrayList3.addAll(arrayList2);
        Collections.sort(arrayList3, new Comparator<EventData>() { // from class: com.ironsource.mediationsdk.events.BaseEventsManager.3
            @Override // java.util.Comparator
            public int compare(EventData eventData, EventData eventData2) {
                return eventData.getTimeStamp() >= eventData2.getTimeStamp() ? 1 : -1;
            }
        });
        if (arrayList3.size() <= i) {
            return new ArrayList<>(arrayList3);
        }
        ArrayList<EventData> arrayList4 = new ArrayList<>(arrayList3.subList(0, i));
        this.mDbStorage.saveEvents(arrayList3.subList(i, arrayList3.size()), this.mEventType);
        return arrayList4;
    }

    private void verifyCurrentFormatter(String str) {
        AbstractEventsFormatter abstractEventsFormatter = this.mFormatter;
        if (abstractEventsFormatter == null || !abstractEventsFormatter.getFormatterType().equals(str)) {
            this.mFormatter = EventsFormatterFactory.getFormatter(str, this.mAdUnitType);
        }
    }

    @Override // com.ironsource.eventsmodule.IEventsManager
    public void setBackupThreshold(int i) {
        if (i > 0) {
            this.mBackupThreshold = i;
        }
    }

    @Override // com.ironsource.eventsmodule.IEventsManager
    public void setMaxNumberOfEvents(int i) {
        if (i > 0) {
            this.mMaxNumberOfEvents = i;
        }
    }

    @Override // com.ironsource.eventsmodule.IEventsManager
    public void setMaxEventsPerBatch(int i) {
        if (i > 0) {
            this.mMaxEventsPerBatch = i;
        }
    }

    @Override // com.ironsource.eventsmodule.IEventsManager
    public void setOptOutEvents(int[] iArr, Context context) {
        this.mOptOutEvents = iArr;
        IronSourceUtils.saveDefaultOptOutEvents(context, this.mEventType, iArr);
    }

    @Override // com.ironsource.eventsmodule.IEventsManager
    public void setOptInEvents(int[] iArr, Context context) {
        this.mOptInEvents = iArr;
        IronSourceUtils.saveDefaultOptInEvents(context, this.mEventType, iArr);
    }

    @Override // com.ironsource.eventsmodule.IEventsManager
    public void setTriggerEvents(int[] iArr, Context context) {
        this.mTriggerEvents = iArr;
        IronSourceUtils.saveDefaultTriggerEvents(context, this.mEventType, iArr);
    }

    @Override // com.ironsource.eventsmodule.IEventsManager
    public void setNonConnectivityEvents(int[] iArr, Context context) {
        this.mNonConnectivityEvents = iArr;
        IronSourceUtils.saveDefaultNonConnectivityEvents(context, this.mEventType, iArr);
    }

    @Override // com.ironsource.eventsmodule.IEventsManager
    public void setEventsUrl(String str, Context context) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        AbstractEventsFormatter abstractEventsFormatter = this.mFormatter;
        if (abstractEventsFormatter != null) {
            abstractEventsFormatter.setEventsServerUrl(str);
        }
        IronSourceUtils.saveDefaultEventsURL(context, this.mEventType, str);
    }

    @Override // com.ironsource.eventsmodule.IEventsManager
    public void setFormatterType(String str, Context context) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.mFormatterType = str;
        IronSourceUtils.saveDefaultEventsFormatterType(context, this.mEventType, str);
        verifyCurrentFormatter(str);
    }

    @Override // com.ironsource.eventsmodule.IEventsManager
    public void setIsEventsEnabled(boolean z) {
        this.mIsEventsEnabled = z;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void backupEventsToDb() {
        synchronized (this.mDBSyncLock) {
            this.mDbStorage.saveEvents(this.mLocalEvents, this.mEventType);
            this.mLocalEvents.clear();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean shouldSendEvents() {
        return (this.mTotalEvents >= this.mMaxNumberOfEvents || this.mHadTriggerEvent) && this.mHasServerResponse;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean shouldBackupEventsToDb(ArrayList<EventData> arrayList) {
        return arrayList != null && arrayList.size() >= this.mBackupThreshold;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isEventsArrayNotEmpty(int[] iArr) {
        return iArr != null && iArr.length > 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isEventInArray(int i, int[] iArr) {
        if (!isEventsArrayNotEmpty(iArr)) {
            return false;
        }
        for (int i2 : iArr) {
            if (i == i2) {
                return true;
            }
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean shouldEventBeLogged(EventData eventData) {
        if (eventData == null) {
            return false;
        }
        if (isEventsArrayNotEmpty(this.mOptOutEvents)) {
            return true ^ isEventInArray(eventData.getEventId(), this.mOptOutEvents);
        }
        if (isEventsArrayNotEmpty(this.mOptInEvents)) {
            return isEventInArray(eventData.getEventId(), this.mOptInEvents);
        }
        return true;
    }

    public void setHasServerResponse(boolean z) {
        this.mHasServerResponse = z;
    }

    String getProviderNameForEvent(EventData eventData) {
        try {
            return new JSONObject(eventData.getAdditionalData()).optString("provider", "");
        } catch (JSONException unused) {
            return "";
        }
    }

    public void triggerEventsSend() {
        sendEvents();
    }

    private void updateSegmentsData(JSONObject jSONObject) {
        try {
            IronSourceSegment ironSourceSegment = this.mSegment;
            if (ironSourceSegment != null) {
                if (ironSourceSegment.getAge() > 0) {
                    jSONObject.put(IronSourceSegment.AGE, this.mSegment.getAge());
                }
                if (!TextUtils.isEmpty(this.mSegment.getGender())) {
                    jSONObject.put(IronSourceSegment.GENDER, this.mSegment.getGender());
                }
                if (this.mSegment.getLevel() > 0) {
                    jSONObject.put(IronSourceSegment.LEVEL, this.mSegment.getLevel());
                }
                if (this.mSegment.getIsPaying() != null) {
                    jSONObject.put(IronSourceSegment.PAYING, this.mSegment.getIsPaying().get());
                }
                if (this.mSegment.getIapt() > 0.0d) {
                    jSONObject.put(IronSourceSegment.IAPT, this.mSegment.getIapt());
                }
                if (this.mSegment.getUcd() > 0) {
                    jSONObject.put(IronSourceSegment.USER_CREATION_DATE, this.mSegment.getUcd());
                }
            }
            ServerSegmetData serverSegmetData = this.mServerSegmentData;
            if (serverSegmetData != null) {
                String segmentId = serverSegmetData.getSegmentId();
                if (!TextUtils.isEmpty(segmentId)) {
                    jSONObject.put("segmentId", segmentId);
                }
                JSONObject customSegments = this.mServerSegmentData.getCustomSegments();
                Iterator<String> itKeys = customSegments.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    jSONObject.put(next, customSegments.get(next));
                }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public void setABT(String str) {
        this.mAbt = str;
    }

    public String getAbt() {
        return this.mAbt;
    }

    public void setBatchParams(Map<String, String> map) {
        this.mBatchParams.putAll(map);
    }

    public Map<String, String> getBatchParams() {
        return this.mBatchParams;
    }

    public void setEventGenericParams(Map<String, String> map) {
        this.mGenericEventParams.putAll(map);
    }

    public Map<String, String> getGenericEventParams() {
        return this.mGenericEventParams;
    }

    private class EventThread extends HandlerThread {
        private Handler mHandler;

        EventThread(String str) {
            super(str);
        }

        void postTask(Runnable runnable) {
            this.mHandler.post(runnable);
        }

        void prepareHandler() {
            this.mHandler = new Handler(getLooper());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean shouldAddSessionDepth(EventData eventData) {
        return (eventData.getEventId() == 14 || eventData.getEventId() == 114 || eventData.getEventId() == 514 || eventData.getEventId() == 140 || eventData.getEventId() == 40 || eventData.getEventId() == 41 || eventData.getEventId() == 50 || eventData.getEventId() == 51 || eventData.getEventId() == 52) ? false : true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean shouldAddConnectionType(EventData eventData) {
        return (eventData.getEventId() == 40 || eventData.getEventId() == 41 || eventData.getEventId() == 50 || eventData.getEventId() == 51 || eventData.getEventId() == 52) ? false : true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean sessionDepthIsSet(EventData eventData) {
        JSONObject additionalDataJSON = eventData.getAdditionalDataJSON();
        if (additionalDataJSON == null) {
            return false;
        }
        return additionalDataJSON.has("sessionDepth");
    }

    public void setEventAuctionParams(Map<String, Object> map, int i, String str) {
        map.put(IronSourceConstants.AUCTION_TRIALS, Integer.valueOf(i));
        if (TextUtils.isEmpty(str)) {
            return;
        }
        map.put(IronSourceConstants.AUCTION_FALLBACK, str);
    }

    private void limitEventStringMember(EventData eventData, String str, int i) {
        JSONObject additionalDataJSON = eventData.getAdditionalDataJSON();
        if (additionalDataJSON == null || !additionalDataJSON.has(str)) {
            return;
        }
        try {
            String string = additionalDataJSON.getString(str);
            eventData.addToAdditionalData(str, string.substring(0, Math.min(string.length(), i)));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void limitEventStringMember(EventData eventData, String str) {
        limitEventStringMember(eventData, str, 1024);
    }
}
