package com.facebook.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import com.facebook.FacebookSdk;
import com.facebook.GraphRequest;
import com.facebook.internal.gatekeeper.GateKeeper;
import com.facebook.internal.gatekeeper.GateKeeperRuntimeCache;
import com.ironsource.eventsmodule.DataBaseEventsStorage;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.StringCompanionObject;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: FetchedAppGateKeepersManager.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\\\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010$\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001:\u00013B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0010\u0010\u001c\u001a\u00020\u00152\u0006\u0010\u001d\u001a\u00020\u0004H\u0002J\"\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020\u00042\b\u0010\u001d\u001a\u0004\u0018\u00010\u00042\u0006\u0010!\u001a\u00020\u001fH\u0007J\u001c\u0010\"\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u001f0#2\b\u0010\u001d\u001a\u0004\u0018\u00010\u0004J\u0017\u0010$\u001a\u00020\u001f2\b\u0010\u001a\u001a\u0004\u0018\u00010\u0006H\u0002¢\u0006\u0002\u0010%J\u0006\u0010&\u001a\u00020'J\u0012\u0010&\u001a\u00020'2\b\u0010(\u001a\u0004\u0018\u00010\u0012H\u0007J\u001f\u0010)\u001a\u00020\u00152\u0006\u0010\u001d\u001a\u00020\u00042\b\u0010*\u001a\u0004\u0018\u00010\u0015H\u0001¢\u0006\u0002\b+J\b\u0010,\u001a\u00020'H\u0002J\u0018\u0010-\u001a\u00020\u00152\u0006\u0010\u001d\u001a\u00020\u00042\u0006\u0010.\u001a\u00020\u001fH\u0007J\b\u0010/\u001a\u00020'H\u0007J\u001a\u00100\u001a\u00020'2\b\b\u0002\u0010\u001d\u001a\u00020\u00042\u0006\u00101\u001a\u000202H\u0007R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u0010\u0010\u000f\u001a\u0004\u0018\u00010\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00120\u0011X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u0013\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00150\u0014X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0016\u001a\u0004\u0018\u00010\u0017X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0019X\u0082\u0004¢\u0006\u0002\n\u0000R\u0012\u0010\u001a\u001a\u0004\u0018\u00010\u0006X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u001b¨\u00064"}, d2 = {"Lcom/facebook/internal/FetchedAppGateKeepersManager;", "", "()V", "APPLICATION_FIELDS", "", "APPLICATION_GATEKEEPER_CACHE_TIMEOUT", "", "APPLICATION_GATEKEEPER_EDGE", "APPLICATION_GATEKEEPER_FIELD", "APPLICATION_GRAPH_DATA", "APPLICATION_PLATFORM", "APPLICATION_SDK_VERSION", "APP_GATEKEEPERS_PREFS_KEY_FORMAT", "APP_GATEKEEPERS_PREFS_STORE", "APP_PLATFORM", "TAG", "callbacks", "Ljava/util/concurrent/ConcurrentLinkedQueue;", "Lcom/facebook/internal/FetchedAppGateKeepersManager$Callback;", "fetchedAppGateKeepers", "", "Lorg/json/JSONObject;", "gateKeeperRuntimeCache", "Lcom/facebook/internal/gatekeeper/GateKeeperRuntimeCache;", "isLoading", "Ljava/util/concurrent/atomic/AtomicBoolean;", DataBaseEventsStorage.EventEntry.COLUMN_NAME_TIMESTAMP, "Ljava/lang/Long;", "getAppGateKeepersQueryResponse", "applicationId", "getGateKeeperForKey", "", "name", "defaultValue", "getGateKeepersForApplication", "", "isTimestampValid", "(Ljava/lang/Long;)Z", "loadAppGateKeepersAsync", "", "callback", "parseAppGateKeepersFromJSON", "gateKeepersJSON", "parseAppGateKeepersFromJSON$facebook_core_release", "pollCallbacks", "queryAppGateKeepers", "forceRequery", "resetRuntimeGateKeeperCache", "setRuntimeGateKeeper", "gateKeeper", "Lcom/facebook/internal/gatekeeper/GateKeeper;", "Callback", "facebook-core_release"}, k = 1, mv = {1, 5, 1}, xi = 48)
public final class FetchedAppGateKeepersManager {
    private static final String APPLICATION_FIELDS = "fields";
    private static final long APPLICATION_GATEKEEPER_CACHE_TIMEOUT = 3600000;
    private static final String APPLICATION_GATEKEEPER_EDGE = "mobile_sdk_gk";
    private static final String APPLICATION_GATEKEEPER_FIELD = "gatekeepers";
    private static final String APPLICATION_GRAPH_DATA = "data";
    private static final String APPLICATION_PLATFORM = "platform";
    private static final String APPLICATION_SDK_VERSION = "sdk_version";
    private static final String APP_GATEKEEPERS_PREFS_KEY_FORMAT = "com.facebook.internal.APP_GATEKEEPERS.%s";
    private static final String APP_GATEKEEPERS_PREFS_STORE = "com.facebook.internal.preferences.APP_GATEKEEPERS";
    private static final String APP_PLATFORM = "android";
    private static GateKeeperRuntimeCache gateKeeperRuntimeCache;
    private static Long timestamp;
    public static final FetchedAppGateKeepersManager INSTANCE = new FetchedAppGateKeepersManager();
    private static final String TAG = Reflection.getOrCreateKotlinClass(FetchedAppGateKeepersManager.class).getSimpleName();
    private static final AtomicBoolean isLoading = new AtomicBoolean(false);
    private static final ConcurrentLinkedQueue<Callback> callbacks = new ConcurrentLinkedQueue<>();
    private static final Map<String, JSONObject> fetchedAppGateKeepers = new ConcurrentHashMap();

    /* JADX INFO: compiled from: FetchedAppGateKeepersManager.kt */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\bæ\u0080\u0001\u0018\u00002\u00020\u0001J\b\u0010\u0002\u001a\u00020\u0003H&¨\u0006\u0004"}, d2 = {"Lcom/facebook/internal/FetchedAppGateKeepersManager$Callback;", "", "onCompleted", "", "facebook-core_release"}, k = 1, mv = {1, 5, 1}, xi = 48)
    public interface Callback {
        void onCompleted();
    }

    private FetchedAppGateKeepersManager() {
    }

    public final void loadAppGateKeepersAsync() {
        loadAppGateKeepersAsync(null);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0046 A[DONT_GENERATE] */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0048 A[Catch: all -> 0x008f, TRY_ENTER, TRY_LEAVE, TryCatch #1 {, blocks: (B:5:0x0005, B:6:0x000a, B:8:0x001a, B:10:0x0022, B:13:0x0027, B:17:0x0048, B:19:0x005b, B:24:0x006e, B:25:0x0071, B:29:0x007b, B:33:0x0085, B:22:0x0063), top: B:41:0x0005, inners: #0 }] */
    @kotlin.jvm.JvmStatic
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final synchronized void loadAppGateKeepersAsync(com.facebook.internal.FetchedAppGateKeepersManager.Callback r8) {
        /*
            java.lang.Class<com.facebook.internal.FetchedAppGateKeepersManager> r0 = com.facebook.internal.FetchedAppGateKeepersManager.class
            monitor-enter(r0)
            if (r8 == 0) goto La
            java.util.concurrent.ConcurrentLinkedQueue<com.facebook.internal.FetchedAppGateKeepersManager$Callback> r1 = com.facebook.internal.FetchedAppGateKeepersManager.callbacks     // Catch: java.lang.Throwable -> L8f
            r1.add(r8)     // Catch: java.lang.Throwable -> L8f
        La:
            com.facebook.FacebookSdk r8 = com.facebook.FacebookSdk.INSTANCE     // Catch: java.lang.Throwable -> L8f
            java.lang.String r8 = com.facebook.FacebookSdk.getApplicationId()     // Catch: java.lang.Throwable -> L8f
            com.facebook.internal.FetchedAppGateKeepersManager r1 = com.facebook.internal.FetchedAppGateKeepersManager.INSTANCE     // Catch: java.lang.Throwable -> L8f
            java.lang.Long r2 = com.facebook.internal.FetchedAppGateKeepersManager.timestamp     // Catch: java.lang.Throwable -> L8f
            boolean r2 = r1.isTimestampValid(r2)     // Catch: java.lang.Throwable -> L8f
            if (r2 == 0) goto L27
            java.util.Map<java.lang.String, org.json.JSONObject> r2 = com.facebook.internal.FetchedAppGateKeepersManager.fetchedAppGateKeepers     // Catch: java.lang.Throwable -> L8f
            boolean r2 = r2.containsKey(r8)     // Catch: java.lang.Throwable -> L8f
            if (r2 == 0) goto L27
            r1.pollCallbacks()     // Catch: java.lang.Throwable -> L8f
            monitor-exit(r0)
            return
        L27:
            com.facebook.FacebookSdk r1 = com.facebook.FacebookSdk.INSTANCE     // Catch: java.lang.Throwable -> L8f
            android.content.Context r1 = com.facebook.FacebookSdk.getApplicationContext()     // Catch: java.lang.Throwable -> L8f
            kotlin.jvm.internal.StringCompanionObject r2 = kotlin.jvm.internal.StringCompanionObject.INSTANCE     // Catch: java.lang.Throwable -> L8f
            java.lang.String r2 = "com.facebook.internal.APP_GATEKEEPERS.%s"
            r3 = 1
            java.lang.Object[] r4 = new java.lang.Object[r3]     // Catch: java.lang.Throwable -> L8f
            r5 = 0
            r4[r5] = r8     // Catch: java.lang.Throwable -> L8f
            java.lang.Object[] r4 = java.util.Arrays.copyOf(r4, r3)     // Catch: java.lang.Throwable -> L8f
            java.lang.String r2 = java.lang.String.format(r2, r4)     // Catch: java.lang.Throwable -> L8f
            java.lang.String r4 = "java.lang.String.format(format, *args)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r2, r4)     // Catch: java.lang.Throwable -> L8f
            if (r1 != 0) goto L48
            monitor-exit(r0)
            return
        L48:
            java.lang.String r4 = "com.facebook.internal.preferences.APP_GATEKEEPERS"
            android.content.SharedPreferences r4 = r1.getSharedPreferences(r4, r5)     // Catch: java.lang.Throwable -> L8f
            r6 = 0
            java.lang.String r4 = r4.getString(r2, r6)     // Catch: java.lang.Throwable -> L8f
            com.facebook.internal.Utility r7 = com.facebook.internal.Utility.INSTANCE     // Catch: java.lang.Throwable -> L8f
            boolean r7 = com.facebook.internal.Utility.isNullOrEmpty(r4)     // Catch: java.lang.Throwable -> L8f
            if (r7 != 0) goto L71
            org.json.JSONObject r7 = new org.json.JSONObject     // Catch: org.json.JSONException -> L62 java.lang.Throwable -> L8f
            r7.<init>(r4)     // Catch: org.json.JSONException -> L62 java.lang.Throwable -> L8f
            r6 = r7
            goto L6c
        L62:
            r4 = move-exception
            com.facebook.internal.Utility r7 = com.facebook.internal.Utility.INSTANCE     // Catch: java.lang.Throwable -> L8f
            java.lang.String r7 = "FacebookSDK"
            java.lang.Exception r4 = (java.lang.Exception) r4     // Catch: java.lang.Throwable -> L8f
            com.facebook.internal.Utility.logd(r7, r4)     // Catch: java.lang.Throwable -> L8f
        L6c:
            if (r6 == 0) goto L71
            parseAppGateKeepersFromJSON$facebook_core_release(r8, r6)     // Catch: java.lang.Throwable -> L8f
        L71:
            com.facebook.FacebookSdk r4 = com.facebook.FacebookSdk.INSTANCE     // Catch: java.lang.Throwable -> L8f
            java.util.concurrent.Executor r4 = com.facebook.FacebookSdk.getExecutor()     // Catch: java.lang.Throwable -> L8f
            if (r4 != 0) goto L7b
            monitor-exit(r0)
            return
        L7b:
            java.util.concurrent.atomic.AtomicBoolean r6 = com.facebook.internal.FetchedAppGateKeepersManager.isLoading     // Catch: java.lang.Throwable -> L8f
            boolean r3 = r6.compareAndSet(r5, r3)     // Catch: java.lang.Throwable -> L8f
            if (r3 != 0) goto L85
            monitor-exit(r0)
            return
        L85:
            com.facebook.internal.-$$Lambda$FetchedAppGateKeepersManager$Tw9JXEbPRzoud2mdIxizp6VF2V0 r3 = new com.facebook.internal.-$$Lambda$FetchedAppGateKeepersManager$Tw9JXEbPRzoud2mdIxizp6VF2V0     // Catch: java.lang.Throwable -> L8f
            r3.<init>()     // Catch: java.lang.Throwable -> L8f
            r4.execute(r3)     // Catch: java.lang.Throwable -> L8f
            monitor-exit(r0)
            return
        L8f:
            r8 = move-exception
            monitor-exit(r0)
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.facebook.internal.FetchedAppGateKeepersManager.loadAppGateKeepersAsync(com.facebook.internal.FetchedAppGateKeepersManager$Callback):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX INFO: renamed from: loadAppGateKeepersAsync$lambda-0, reason: not valid java name */
    public static final void m121loadAppGateKeepersAsync$lambda0(String applicationId, Context context, String gateKeepersKey) {
        Intrinsics.checkNotNullParameter(applicationId, "$applicationId");
        Intrinsics.checkNotNullParameter(context, "$context");
        Intrinsics.checkNotNullParameter(gateKeepersKey, "$gateKeepersKey");
        FetchedAppGateKeepersManager fetchedAppGateKeepersManager = INSTANCE;
        JSONObject appGateKeepersQueryResponse = fetchedAppGateKeepersManager.getAppGateKeepersQueryResponse(applicationId);
        if (appGateKeepersQueryResponse.length() != 0) {
            parseAppGateKeepersFromJSON$facebook_core_release(applicationId, appGateKeepersQueryResponse);
            context.getSharedPreferences(APP_GATEKEEPERS_PREFS_STORE, 0).edit().putString(gateKeepersKey, appGateKeepersQueryResponse.toString()).apply();
            timestamp = Long.valueOf(System.currentTimeMillis());
        }
        fetchedAppGateKeepersManager.pollCallbacks();
        isLoading.set(false);
    }

    private final void pollCallbacks() {
        Handler handler = new Handler(Looper.getMainLooper());
        while (true) {
            ConcurrentLinkedQueue<Callback> concurrentLinkedQueue = callbacks;
            if (concurrentLinkedQueue.isEmpty()) {
                return;
            }
            final Callback callbackPoll = concurrentLinkedQueue.poll();
            if (callbackPoll != null) {
                handler.post(new Runnable() { // from class: com.facebook.internal.-$$Lambda$FetchedAppGateKeepersManager$88hCiLqd34I9PIXLsFQQ5bjLs-Q
                    @Override // java.lang.Runnable
                    public final void run() {
                        callbackPoll.onCompleted();
                    }
                });
            }
        }
    }

    @JvmStatic
    public static final JSONObject queryAppGateKeepers(String applicationId, boolean forceRequery) {
        Intrinsics.checkNotNullParameter(applicationId, "applicationId");
        if (!forceRequery) {
            Map<String, JSONObject> map = fetchedAppGateKeepers;
            if (map.containsKey(applicationId)) {
                JSONObject jSONObject = map.get(applicationId);
                return jSONObject == null ? new JSONObject() : jSONObject;
            }
        }
        JSONObject appGateKeepersQueryResponse = INSTANCE.getAppGateKeepersQueryResponse(applicationId);
        FacebookSdk facebookSdk = FacebookSdk.INSTANCE;
        Context applicationContext = FacebookSdk.getApplicationContext();
        StringCompanionObject stringCompanionObject = StringCompanionObject.INSTANCE;
        String str = String.format(APP_GATEKEEPERS_PREFS_KEY_FORMAT, Arrays.copyOf(new Object[]{applicationId}, 1));
        Intrinsics.checkNotNullExpressionValue(str, "java.lang.String.format(format, *args)");
        applicationContext.getSharedPreferences(APP_GATEKEEPERS_PREFS_STORE, 0).edit().putString(str, appGateKeepersQueryResponse.toString()).apply();
        return parseAppGateKeepersFromJSON$facebook_core_release(applicationId, appGateKeepersQueryResponse);
    }

    public final Map<String, Boolean> getGateKeepersForApplication(String applicationId) {
        loadAppGateKeepersAsync();
        if (applicationId != null) {
            Map<String, JSONObject> map = fetchedAppGateKeepers;
            if (map.containsKey(applicationId)) {
                GateKeeperRuntimeCache gateKeeperRuntimeCache2 = gateKeeperRuntimeCache;
                List<GateKeeper> listDumpGateKeepers = gateKeeperRuntimeCache2 == null ? null : gateKeeperRuntimeCache2.dumpGateKeepers(applicationId);
                if (listDumpGateKeepers != null) {
                    HashMap map2 = new HashMap();
                    for (GateKeeper gateKeeper : listDumpGateKeepers) {
                        map2.put(gateKeeper.getName(), Boolean.valueOf(gateKeeper.getValue()));
                    }
                    return map2;
                }
                HashMap map3 = new HashMap();
                JSONObject jSONObject = map.get(applicationId);
                if (jSONObject == null) {
                    jSONObject = new JSONObject();
                }
                Iterator<String> itKeys = jSONObject.keys();
                while (itKeys.hasNext()) {
                    String key = itKeys.next();
                    Intrinsics.checkNotNullExpressionValue(key, "key");
                    map3.put(key, Boolean.valueOf(jSONObject.optBoolean(key)));
                }
                GateKeeperRuntimeCache gateKeeperRuntimeCache3 = gateKeeperRuntimeCache;
                if (gateKeeperRuntimeCache3 == null) {
                    gateKeeperRuntimeCache3 = new GateKeeperRuntimeCache();
                }
                ArrayList arrayList = new ArrayList(map3.size());
                for (Map.Entry entry : map3.entrySet()) {
                    arrayList.add(new GateKeeper((String) entry.getKey(), ((Boolean) entry.getValue()).booleanValue()));
                }
                gateKeeperRuntimeCache3.setGateKeepers(applicationId, arrayList);
                gateKeeperRuntimeCache = gateKeeperRuntimeCache3;
                return map3;
            }
        }
        return new HashMap();
    }

    @JvmStatic
    public static final boolean getGateKeeperForKey(String name, String applicationId, boolean defaultValue) {
        Boolean bool;
        Intrinsics.checkNotNullParameter(name, "name");
        Map<String, Boolean> gateKeepersForApplication = INSTANCE.getGateKeepersForApplication(applicationId);
        return (gateKeepersForApplication.containsKey(name) && (bool = gateKeepersForApplication.get(name)) != null) ? bool.booleanValue() : defaultValue;
    }

    public static /* synthetic */ void setRuntimeGateKeeper$default(String str, GateKeeper gateKeeper, int i, Object obj) {
        if ((i & 1) != 0) {
            FacebookSdk facebookSdk = FacebookSdk.INSTANCE;
            str = FacebookSdk.getApplicationId();
        }
        setRuntimeGateKeeper(str, gateKeeper);
    }

    @JvmStatic
    public static final void setRuntimeGateKeeper(String applicationId, GateKeeper gateKeeper) {
        Intrinsics.checkNotNullParameter(applicationId, "applicationId");
        Intrinsics.checkNotNullParameter(gateKeeper, "gateKeeper");
        GateKeeperRuntimeCache gateKeeperRuntimeCache2 = gateKeeperRuntimeCache;
        if ((gateKeeperRuntimeCache2 == null ? null : gateKeeperRuntimeCache2.getGateKeeper(applicationId, gateKeeper.getName())) != null) {
            GateKeeperRuntimeCache gateKeeperRuntimeCache3 = gateKeeperRuntimeCache;
            if (gateKeeperRuntimeCache3 == null) {
                return;
            }
            gateKeeperRuntimeCache3.setGateKeeper(applicationId, gateKeeper);
            return;
        }
        Log.w(TAG, "Missing gatekeeper runtime cache");
    }

    @JvmStatic
    public static final void resetRuntimeGateKeeperCache() {
        GateKeeperRuntimeCache gateKeeperRuntimeCache2 = gateKeeperRuntimeCache;
        if (gateKeeperRuntimeCache2 == null) {
            return;
        }
        GateKeeperRuntimeCache.resetCache$default(gateKeeperRuntimeCache2, null, 1, null);
    }

    private final JSONObject getAppGateKeepersQueryResponse(String applicationId) {
        Bundle bundle = new Bundle();
        bundle.putString(APPLICATION_PLATFORM, "android");
        FacebookSdk facebookSdk = FacebookSdk.INSTANCE;
        bundle.putString(APPLICATION_SDK_VERSION, FacebookSdk.getSdkVersion());
        bundle.putString("fields", APPLICATION_GATEKEEPER_FIELD);
        GraphRequest.Companion companion = GraphRequest.INSTANCE;
        StringCompanionObject stringCompanionObject = StringCompanionObject.INSTANCE;
        String str = String.format("app/%s", Arrays.copyOf(new Object[]{APPLICATION_GATEKEEPER_EDGE}, 1));
        Intrinsics.checkNotNullExpressionValue(str, "java.lang.String.format(format, *args)");
        GraphRequest graphRequestNewGraphPathRequest = companion.newGraphPathRequest(null, str, null);
        graphRequestNewGraphPathRequest.setParameters(bundle);
        JSONObject jsonObject = graphRequestNewGraphPathRequest.executeAndWait().getJsonObject();
        return jsonObject == null ? new JSONObject() : jsonObject;
    }

    @JvmStatic
    public static final synchronized JSONObject parseAppGateKeepersFromJSON$facebook_core_release(String applicationId, JSONObject gateKeepersJSON) {
        JSONObject jSONObject;
        JSONArray jSONArrayOptJSONArray;
        Intrinsics.checkNotNullParameter(applicationId, "applicationId");
        jSONObject = fetchedAppGateKeepers.get(applicationId);
        if (jSONObject == null) {
            jSONObject = new JSONObject();
        }
        int i = 0;
        JSONObject jSONObjectOptJSONObject = null;
        if (gateKeepersJSON != null && (jSONArrayOptJSONArray = gateKeepersJSON.optJSONArray("data")) != null) {
            jSONObjectOptJSONObject = jSONArrayOptJSONArray.optJSONObject(0);
        }
        if (jSONObjectOptJSONObject == null) {
            jSONObjectOptJSONObject = new JSONObject();
        }
        JSONArray jSONArrayOptJSONArray2 = jSONObjectOptJSONObject.optJSONArray(APPLICATION_GATEKEEPER_FIELD);
        if (jSONArrayOptJSONArray2 == null) {
            jSONArrayOptJSONArray2 = new JSONArray();
        }
        int length = jSONArrayOptJSONArray2.length();
        if (length > 0) {
            while (true) {
                int i2 = i + 1;
                try {
                    JSONObject jSONObject2 = jSONArrayOptJSONArray2.getJSONObject(i);
                    jSONObject.put(jSONObject2.getString("key"), jSONObject2.getBoolean("value"));
                } catch (JSONException e) {
                    Utility utility = Utility.INSTANCE;
                    Utility.logd(Utility.LOG_TAG, e);
                }
                if (i2 >= length) {
                    break;
                }
                i = i2;
            }
            fetchedAppGateKeepers.put(applicationId, jSONObject);
        } else {
            fetchedAppGateKeepers.put(applicationId, jSONObject);
        }
        return jSONObject;
    }

    private final boolean isTimestampValid(Long timestamp2) {
        return timestamp2 != null && System.currentTimeMillis() - timestamp2.longValue() < APPLICATION_GATEKEEPER_CACHE_TIMEOUT;
    }
}
