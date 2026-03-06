package com.ironsource.sdk.Events;

import android.util.Log;
import com.ironsource.eventsTracker.EventsConfiguration;
import com.ironsource.eventsTracker.EventsTracker;
import com.ironsource.sdk.Events.SDK5Events;
import com.ironsource.sdk.constants.Events;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class ISNEventsTracker {
    private static ISNEventsTracker eventsTrackerInstance;
    private EventsTracker eventsTracker;

    private ISNEventsTracker() {
    }

    private static ISNEventsTracker getInstance() {
        if (eventsTrackerInstance == null) {
            eventsTrackerInstance = new ISNEventsTracker();
        }
        return eventsTrackerInstance;
    }

    public static void init(EventsConfiguration eventsConfiguration, ISNEventsBaseData iSNEventsBaseData) {
        if (eventsConfiguration != null) {
            try {
                getInstance().eventsTracker = new EventsTracker(eventsConfiguration, iSNEventsBaseData);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void logEvent(SDK5Events.Event event) {
        logEvent(event, new HashMap());
    }

    public static void logEvent(SDK5Events.Event event, Map<String, Object> map) {
        EventsTracker eventsTracker = getInstance().eventsTracker;
        if (eventsTracker == null) {
            Log.d(Events.TAG, Events.LOG_EVENT_FAILED);
            return;
        }
        if (map != null) {
            map.put("eventid", Integer.valueOf(event.id));
        }
        eventsTracker.log(event.name, map);
    }
}
