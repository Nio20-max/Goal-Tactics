package com.helpshift.campaigns.storage;

import com.helpshift.campaigns.models.SessionModel;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public interface SessionStorage {
    int cleanUpInvalidSessions();

    ArrayList<SessionModel> getAllSessions(Integer num);

    SessionModel getSession(String str);

    void removeSessions(String[] strArr);

    void setSyncStatus(Integer num, String[] strArr);

    void storeSession(SessionModel sessionModel);

    void updateSession(SessionModel sessionModel);
}
