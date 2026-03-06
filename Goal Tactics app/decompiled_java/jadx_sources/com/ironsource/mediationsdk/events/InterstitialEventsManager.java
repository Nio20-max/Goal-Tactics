package com.ironsource.mediationsdk.events;

import com.ironsource.eventsmodule.EventData;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.mediationsdk.utils.SessionDepthManager;

/* JADX INFO: loaded from: classes2.dex */
public class InterstitialEventsManager extends BaseEventsManager {
    private static InterstitialEventsManager sInstance;
    private String mCurrentISPlacement;

    @Override // com.ironsource.mediationsdk.events.BaseEventsManager
    protected boolean shouldExtractCurrentPlacement(EventData eventData) {
        return false;
    }

    @Override // com.ironsource.mediationsdk.events.BaseEventsManager
    protected boolean shouldIncludeCurrentPlacement(EventData eventData) {
        return false;
    }

    private InterstitialEventsManager() {
        this.mFormatterType = "ironbeast";
        this.mAdUnitType = 2;
        this.mEventType = IronSourceConstants.INTERSTITIAL_EVENT_TYPE;
        this.mCurrentISPlacement = "";
    }

    public static synchronized InterstitialEventsManager getInstance() {
        if (sInstance == null) {
            InterstitialEventsManager interstitialEventsManager = new InterstitialEventsManager();
            sInstance = interstitialEventsManager;
            interstitialEventsManager.initState();
        }
        return sInstance;
    }

    @Override // com.ironsource.mediationsdk.events.BaseEventsManager
    protected boolean isTriggerEvent(EventData eventData) {
        int eventId = eventData.getEventId();
        return eventId == 2204 || eventId == 2004 || eventId == 2005 || eventId == 2301 || eventId == 2300 || eventId == 3005 || eventId == 3015;
    }

    @Override // com.ironsource.mediationsdk.events.BaseEventsManager
    protected int getSessionDepth(EventData eventData) {
        return SessionDepthManager.getInstance().getSessionDepth(eventData.getEventId() >= 3000 && eventData.getEventId() < 4000 ? 3 : 2);
    }

    @Override // com.ironsource.mediationsdk.events.BaseEventsManager
    protected void setCurrentPlacement(EventData eventData) {
        this.mCurrentISPlacement = eventData.getAdditionalDataJSON().optString(IronSourceConstants.EVENTS_PLACEMENT_NAME);
    }

    @Override // com.ironsource.mediationsdk.events.BaseEventsManager
    protected String getCurrentPlacement(int i) {
        return this.mCurrentISPlacement;
    }

    @Override // com.ironsource.mediationsdk.events.BaseEventsManager
    protected void initConnectivitySensitiveEventsSet() {
        this.mConnectivitySensitiveEventsSet.add(Integer.valueOf(IronSourceConstants.IS_LOAD_CALLED));
        this.mConnectivitySensitiveEventsSet.add(Integer.valueOf(IronSourceConstants.IS_INSTANCE_LOAD));
        this.mConnectivitySensitiveEventsSet.add(Integer.valueOf(IronSourceConstants.IS_CALLBACK_LOAD_SUCCESS));
        this.mConnectivitySensitiveEventsSet.add(Integer.valueOf(IronSourceConstants.IS_INSTANCE_READY_TRUE));
        this.mConnectivitySensitiveEventsSet.add(Integer.valueOf(IronSourceConstants.IS_INSTANCE_READY_FALSE));
    }
}
