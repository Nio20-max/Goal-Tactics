package com.helpshift.redaction;

/* JADX INFO: loaded from: classes2.dex */
public interface RedactionDAO {
    void deleteRedactionDetail(long j);

    RedactionDetail getRedactionDetail(long j);

    void insertRedactionDetail(RedactionDetail redactionDetail);

    void updateRedactionRedail(RedactionDetail redactionDetail);

    void updateRedactionState(long j, RedactionState redactionState);
}
