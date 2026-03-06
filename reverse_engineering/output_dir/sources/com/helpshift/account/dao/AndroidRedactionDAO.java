package com.helpshift.account.dao;

import com.helpshift.redaction.RedactionDAO;
import com.helpshift.redaction.RedactionDetail;
import com.helpshift.redaction.RedactionState;

/* JADX INFO: loaded from: classes.dex */
public class AndroidRedactionDAO implements RedactionDAO {
    private final UserDB userDB;

    public AndroidRedactionDAO(UserDB userDB) {
        this.userDB = userDB;
    }

    @Override // com.helpshift.redaction.RedactionDAO
    public RedactionDetail getRedactionDetail(long j) {
        if (j < 0) {
            return null;
        }
        return this.userDB.fetchRedactionDetail(j);
    }

    @Override // com.helpshift.redaction.RedactionDAO
    public void insertRedactionDetail(RedactionDetail redactionDetail) {
        if (redactionDetail == null) {
            return;
        }
        this.userDB.insertRedactionDetail(redactionDetail);
    }

    @Override // com.helpshift.redaction.RedactionDAO
    public void updateRedactionRedail(RedactionDetail redactionDetail) {
        if (redactionDetail == null) {
            return;
        }
        this.userDB.updateRedactionDetail(redactionDetail);
    }

    @Override // com.helpshift.redaction.RedactionDAO
    public void updateRedactionState(long j, RedactionState redactionState) {
        if (j < 0 || redactionState == null) {
            return;
        }
        this.userDB.updateRedactionState(j, redactionState);
    }

    @Override // com.helpshift.redaction.RedactionDAO
    public void deleteRedactionDetail(long j) {
        if (j > 0) {
            this.userDB.deleteRedactionDetail(j);
        }
    }
}
