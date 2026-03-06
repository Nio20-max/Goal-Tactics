package com.microsoft.appcenter.ingestion.models;

import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class LogContainer {
    private List<Log> logs;

    public List<Log> getLogs() {
        return this.logs;
    }

    public void setLogs(List<Log> logs) {
        this.logs = logs;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        List<Log> list = this.logs;
        List<Log> list2 = ((LogContainer) o).logs;
        return list != null ? list.equals(list2) : list2 == null;
    }

    public int hashCode() {
        List<Log> list = this.logs;
        if (list != null) {
            return list.hashCode();
        }
        return 0;
    }
}
