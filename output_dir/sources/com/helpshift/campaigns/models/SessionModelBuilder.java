package com.helpshift.campaigns.models;

import com.helpshift.campaigns.util.constants.SyncStatus;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class SessionModelBuilder {
    private final String deviceIdentifier;
    private ArrayList<Long> durations;
    private final String identifier;
    private final long startTime;
    private final String userIdentifier;
    private long endTime = 0;
    private Integer syncStatus = SyncStatus.UNSYNCED;

    public SessionModelBuilder(String str, String str2, String str3, long j) {
        this.identifier = str;
        this.deviceIdentifier = str2;
        this.userIdentifier = str3;
        this.startTime = j;
    }

    public SessionModelBuilder setEndTime(long j) {
        this.endTime = j;
        return this;
    }

    public SessionModelBuilder setSyncStatus(Integer num) {
        this.syncStatus = num;
        return this;
    }

    public SessionModelBuilder setDurations(ArrayList<Long> arrayList) {
        this.durations = arrayList;
        return this;
    }

    public SessionModel build() {
        return new SessionModel(this.identifier, this.deviceIdentifier, this.userIdentifier, this.startTime, this.endTime, this.durations, this.syncStatus);
    }
}
