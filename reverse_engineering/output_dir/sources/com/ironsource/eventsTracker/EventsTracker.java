package com.ironsource.eventsTracker;

import android.util.Log;
import android.util.Pair;
import com.ironsource.network.ISHttpService;
import com.ironsource.network.Response;
import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* JADX INFO: loaded from: classes2.dex */
public class EventsTracker {
    private static final String TAG = "EventsTracker";
    private IBaseData _baseData;
    private EventsConfiguration _configuration;
    private IFormatter _formatter;
    private ExecutorService _logExecutorService;

    public EventsTracker(EventsConfiguration eventsConfiguration, IBaseData iBaseData) {
        if (eventsConfiguration == null) {
            throw new InvalidParameterException("Null configuration not supported ");
        }
        if (eventsConfiguration.getFormatter() == null) {
            throw new InvalidParameterException("Null formatter not supported ");
        }
        this._configuration = eventsConfiguration;
        this._baseData = iBaseData;
        this._formatter = eventsConfiguration.getFormatter();
        this._logExecutorService = Executors.newSingleThreadExecutor();
    }

    public void log(String str, Map<String, Object> map) {
        logConsole(String.format(Locale.ENGLISH, "%s %s", str, map.toString()));
        if (this._configuration.areEventsEnabled() && !str.isEmpty()) {
            HashMap map2 = new HashMap();
            map2.put("eventname", str);
            append(map2, this._baseData.getData());
            append(map2, map);
            logEvent(this._formatter.format(map2));
        }
    }

    private void append(Map<String, Object> map, Map<String, Object> map2) {
        try {
            map.putAll(map2);
        } catch (Exception unused) {
        }
    }

    private void logEvent(final String str) {
        this._logExecutorService.submit(new Runnable() { // from class: com.ironsource.eventsTracker.EventsTracker.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Response response = new Response();
                    ArrayList<Pair<String, String>> headers = EventsTracker.this._configuration.getHeaders();
                    if ("POST".equals(EventsTracker.this._configuration.getHttpMethod())) {
                        response = ISHttpService.sendPOSTRequest(EventsTracker.this._configuration.getEndpoint(), str, headers);
                    } else if ("GET".equals(EventsTracker.this._configuration.getHttpMethod())) {
                        response = ISHttpService.sendGETRequest(EventsTracker.this._configuration.getEndpoint(), str, headers);
                    }
                    EventsTracker.this.logConsole("response status code: " + response.responseCode);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void logConsole(String str) {
        if (this._configuration.isAllowLogs()) {
            Log.d(TAG, str);
        }
    }
}
