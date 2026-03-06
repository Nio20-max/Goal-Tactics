package com.helpshift.campaigns.models;

import android.os.SystemClock;
import com.helpshift.campaigns.controllers.ControllerFactory;
import com.helpshift.campaigns.util.constants.SyncStatus;
import com.helpshift.util.TimeUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

/* JADX INFO: loaded from: classes.dex */
public class SessionModel {
    public final String deviceIdentifier;
    public final ArrayList<Long> durations;
    public long endTime;
    public final String identifier;
    private long referenceTime;
    private long startElapsedTime;
    public final long startTime;
    public final Integer syncStatus;
    public final String userIdentifier;

    public SessionModel() {
        long currentTimeInMillis = TimeUtil.getCurrentTimeInMillis();
        this.startElapsedTime = SystemClock.elapsedRealtime();
        DeviceModel deviceModel = ControllerFactory.getInstance().deviceController.deviceModel;
        this.identifier = "__hs_session_" + deviceModel.getIdentifier() + "_" + currentTimeInMillis;
        this.deviceIdentifier = deviceModel.getIdentifier();
        this.userIdentifier = ControllerFactory.getInstance().userController.getCurrentUser().identifier;
        this.startTime = currentTimeInMillis;
        this.endTime = 0L;
        this.referenceTime = currentTimeInMillis;
        this.syncStatus = SyncStatus.UNSYNCED;
        this.durations = new ArrayList<>();
    }

    public SessionModel(String str, String str2, String str3, long j, long j2, ArrayList<Long> arrayList, Integer num) {
        this.identifier = str;
        this.deviceIdentifier = str2;
        this.userIdentifier = str3;
        this.startTime = j;
        this.endTime = j2;
        this.durations = arrayList;
        this.syncStatus = num;
        Iterator<Long> it = arrayList.iterator();
        while (it.hasNext()) {
            j += it.next().longValue();
        }
        this.referenceTime = j;
    }

    public ArrayList<HashMap> toData() {
        ArrayList<HashMap> arrayList = new ArrayList<>();
        HashMap map = new HashMap();
        map.put("t", "s");
        map.put("sid", this.identifier);
        map.put("ts", Long.valueOf(this.startTime));
        arrayList.add(map);
        for (Long l : this.durations) {
            HashMap map2 = new HashMap();
            map2.put("t", "d");
            map2.put("sid", this.identifier);
            map2.put("d", l);
            arrayList.add(map2);
        }
        HashMap map3 = new HashMap();
        map3.put("t", "e");
        map3.put("sid", this.identifier);
        map3.put("ts", Long.valueOf(this.endTime));
        map3.put("d", Long.valueOf(this.endTime - this.referenceTime));
        arrayList.add(map3);
        return arrayList;
    }

    public void endNow() {
        if (this.endTime == 0) {
            this.endTime = this.startTime + (SystemClock.elapsedRealtime() - this.startElapsedTime);
        }
    }

    public void updateDurations() {
        if (this.endTime == 0) {
            long jElapsedRealtime = this.startTime + (SystemClock.elapsedRealtime() - this.startElapsedTime);
            this.durations.add(Long.valueOf(jElapsedRealtime - this.referenceTime));
            this.referenceTime = jElapsedRealtime;
        }
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof SessionModel)) {
            return false;
        }
        SessionModel sessionModel = (SessionModel) obj;
        return this.identifier.equals(sessionModel.identifier) && this.deviceIdentifier.equals(sessionModel.deviceIdentifier) && this.userIdentifier.equals(sessionModel.userIdentifier) && this.startTime == sessionModel.startTime && this.endTime == sessionModel.endTime && this.syncStatus.equals(sessionModel.syncStatus) && this.durations.equals(sessionModel.durations);
    }
}
