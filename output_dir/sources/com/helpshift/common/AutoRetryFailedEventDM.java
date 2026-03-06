package com.helpshift.common;

import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.domain.network.NetworkErrorCodes;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.poller.HttpBackoff;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: loaded from: classes.dex */
public class AutoRetryFailedEventDM {
    private final Domain domain;
    private final Platform platform;
    private final HttpBackoff retryBackoff;
    private boolean shouldScheduleAuthenticationEvent = true;
    private AtomicBoolean isBatcherScheduled = new AtomicBoolean(false);
    private AtomicBoolean isSendAllEventsScheduled = new AtomicBoolean(false);
    private Map<EventType, AutoRetriableDM> listeners = new HashMap();
    private Set<EventType> pendingRetryEventTypes = Collections.synchronizedSet(new LinkedHashSet());

    public enum EventType {
        MIGRATION,
        SYNC_USER,
        PUSH_TOKEN,
        CLEAR_USER,
        CONVERSATION,
        FAQ,
        ANALYTICS,
        CONFIG
    }

    public AutoRetryFailedEventDM(Domain domain, Platform platform, HttpBackoff httpBackoff) {
        this.domain = domain;
        this.platform = platform;
        this.retryBackoff = httpBackoff;
    }

    public void register(EventType eventType, AutoRetriableDM autoRetriableDM) {
        this.listeners.put(eventType, autoRetriableDM);
    }

    public void scheduleRetryTaskForEventType(EventType eventType, int i) {
        this.pendingRetryEventTypes.add(eventType);
        if (isAuthenticatedType(eventType)) {
            if (i == NetworkErrorCodes.INVALID_AUTH_TOKEN.intValue() || i == NetworkErrorCodes.AUTH_TOKEN_NOT_PROVIDED.intValue()) {
                this.shouldScheduleAuthenticationEvent = false;
                return;
            } else {
                scheduleSync(i, this.pendingRetryEventTypes);
                return;
            }
        }
        scheduleSync(i, this.pendingRetryEventTypes);
    }

    public void sendAllEvents() {
        if (this.isSendAllEventsScheduled.compareAndSet(false, true)) {
            this.pendingRetryEventTypes.add(EventType.MIGRATION);
            this.pendingRetryEventTypes.add(EventType.SYNC_USER);
            this.pendingRetryEventTypes.add(EventType.PUSH_TOKEN);
            this.pendingRetryEventTypes.add(EventType.CLEAR_USER);
            this.pendingRetryEventTypes.add(EventType.CONVERSATION);
            this.pendingRetryEventTypes.add(EventType.FAQ);
            this.pendingRetryEventTypes.add(EventType.ANALYTICS);
            this.pendingRetryEventTypes.add(EventType.CONFIG);
            this.domain.runParallel(new F() { // from class: com.helpshift.common.AutoRetryFailedEventDM.1
                @Override // com.helpshift.common.domain.F
                public void f() {
                    try {
                        AutoRetryFailedEventDM autoRetryFailedEventDM = AutoRetryFailedEventDM.this;
                        autoRetryFailedEventDM.retryFailedApis(autoRetryFailedEventDM.pendingRetryEventTypes);
                    } finally {
                        AutoRetryFailedEventDM.this.isSendAllEventsScheduled.compareAndSet(true, false);
                    }
                }
            });
        }
    }

    public void sendEventForcefully(final EventType eventType) {
        this.domain.runParallel(new F() { // from class: com.helpshift.common.AutoRetryFailedEventDM.2
            @Override // com.helpshift.common.domain.F
            public void f() {
                LinkedHashSet linkedHashSet = new LinkedHashSet();
                linkedHashSet.add(eventType);
                AutoRetryFailedEventDM.this.retryFailedApis(linkedHashSet);
            }
        });
    }

    public void resetBackoff() {
        this.retryBackoff.reset();
    }

    private void scheduleSync(int i, final Set<EventType> set) {
        if (this.isBatcherScheduled.compareAndSet(false, true)) {
            long jNextIntervalMillis = this.retryBackoff.nextIntervalMillis(i);
            if (jNextIntervalMillis != -100) {
                this.domain.runDelayedInParallel(new F() { // from class: com.helpshift.common.AutoRetryFailedEventDM.3
                    @Override // com.helpshift.common.domain.F
                    public void f() {
                        AutoRetryFailedEventDM.this.isBatcherScheduled.compareAndSet(true, false);
                        AutoRetryFailedEventDM.this.retryFailedApis(set);
                    }
                }, jNextIntervalMillis);
            } else {
                this.isBatcherScheduled.compareAndSet(true, false);
            }
        }
    }

    void retryFailedApis(Set<EventType> set) {
        if (!this.platform.isOnline()) {
            scheduleSync(0, set);
            return;
        }
        try {
            for (EventType eventType : new LinkedList(set)) {
                if (canRetryEventType(eventType)) {
                    AutoRetriableDM autoRetriableDM = this.listeners.get(eventType);
                    if (autoRetriableDM == null) {
                        this.pendingRetryEventTypes.remove(eventType);
                        set.remove(eventType);
                    } else {
                        try {
                            autoRetriableDM.sendFailedApiCalls(eventType);
                            this.pendingRetryEventTypes.remove(eventType);
                            set.remove(eventType);
                        } catch (RootAPIException e) {
                            if (e.exceptionType != NetworkException.INVALID_AUTH_TOKEN && e.exceptionType != NetworkException.AUTH_TOKEN_NOT_PROVIDED) {
                                throw e;
                            }
                            this.shouldScheduleAuthenticationEvent = false;
                        }
                    }
                }
            }
            this.retryBackoff.reset();
        } catch (RootAPIException e2) {
            scheduleSync(e2.getServerStatusCode(), set);
        }
    }

    public void onUserAuthenticationUpdated() {
        if (this.shouldScheduleAuthenticationEvent) {
            return;
        }
        this.shouldScheduleAuthenticationEvent = true;
        this.domain.runParallel(new F() { // from class: com.helpshift.common.AutoRetryFailedEventDM.4
            @Override // com.helpshift.common.domain.F
            public void f() {
                AutoRetryFailedEventDM autoRetryFailedEventDM = AutoRetryFailedEventDM.this;
                autoRetryFailedEventDM.retryFailedApis(autoRetryFailedEventDM.pendingRetryEventTypes);
            }
        });
    }

    /* JADX INFO: renamed from: com.helpshift.common.AutoRetryFailedEventDM$5, reason: invalid class name */
    static /* synthetic */ class AnonymousClass5 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$common$AutoRetryFailedEventDM$EventType;

        static {
            int[] iArr = new int[EventType.values().length];
            $SwitchMap$com$helpshift$common$AutoRetryFailedEventDM$EventType = iArr;
            try {
                iArr[EventType.PUSH_TOKEN.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$common$AutoRetryFailedEventDM$EventType[EventType.CONVERSATION.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$common$AutoRetryFailedEventDM$EventType[EventType.SYNC_USER.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
        }
    }

    private boolean isAuthenticatedType(EventType eventType) {
        int i = AnonymousClass5.$SwitchMap$com$helpshift$common$AutoRetryFailedEventDM$EventType[eventType.ordinal()];
        return i == 1 || i == 2 || i == 3;
    }

    private boolean canRetryEventType(EventType eventType) {
        return !isAuthenticatedType(eventType) || this.shouldScheduleAuthenticationEvent;
    }
}
