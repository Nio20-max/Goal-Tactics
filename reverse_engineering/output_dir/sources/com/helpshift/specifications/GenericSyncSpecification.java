package com.helpshift.specifications;

import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes2.dex */
public class GenericSyncSpecification implements SyncSpecification {
    private final int dataChangeThreshold;
    private final String dataType;
    private final long elapsedTimeThreshold;

    public GenericSyncSpecification(int i, long j, TimeUnit timeUnit, String str) {
        this.dataChangeThreshold = i;
        this.elapsedTimeThreshold = TimeUnit.MILLISECONDS.convert(j, timeUnit);
        this.dataType = str;
    }

    @Override // com.helpshift.specifications.SyncSpecification
    public String getDataType() {
        return this.dataType;
    }

    @Override // com.helpshift.specifications.SyncSpecification
    public boolean isSatisfied(int i, long j) {
        return i >= this.dataChangeThreshold || Math.abs(j) > this.elapsedTimeThreshold;
    }
}
