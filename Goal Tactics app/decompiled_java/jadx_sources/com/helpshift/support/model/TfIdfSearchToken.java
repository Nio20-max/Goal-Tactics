package com.helpshift.support.model;

import java.io.Serializable;

/* JADX INFO: loaded from: classes2.dex */
public class TfIdfSearchToken implements Serializable {
    private static final long serialVersionUID = 1;
    public final int type;
    public final String value;

    public static class Type {
        public static final int IMPORTANT_WORD = 20;
        public static final int METAPHONE = 50;
        public static final int NGRAM = 40;
        public static final int TAG_WORD = 30;
        public static final int WORD = 10;
    }

    public TfIdfSearchToken(String str, int i) {
        this.value = str;
        this.type = i;
    }

    public String toString() {
        return "value: " + this.value + ", type: " + this.type;
    }
}
