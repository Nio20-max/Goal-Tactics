package com.helpshift.support.model;

import java.io.Serializable;

/* JADX INFO: loaded from: classes2.dex */
public class FuzzySearchToken implements Serializable {
    private static final long serialVersionUID = 1;
    public final String docId;
    public final String word;

    public FuzzySearchToken(String str, String str2) {
        this.word = str;
        this.docId = str2;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null || !(obj instanceof FuzzySearchToken)) {
            return false;
        }
        FuzzySearchToken fuzzySearchToken = (FuzzySearchToken) obj;
        String str = this.word;
        if (str != null ? !str.equals(fuzzySearchToken.word) : fuzzySearchToken.word != null) {
            return false;
        }
        String str2 = this.docId;
        String str3 = fuzzySearchToken.docId;
        return str2 == null ? str3 == null : str2.equals(str3);
    }
}
