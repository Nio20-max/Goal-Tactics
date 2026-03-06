package com.helpshift.cif.dto;

import java.io.Serializable;

/* JADX INFO: loaded from: classes.dex */
public class CustomIssueFieldDTO implements Serializable {
    public final String key;
    public final String type;
    public final String[] values;

    public CustomIssueFieldDTO(String str, String str2, String[] strArr) {
        this.key = str;
        this.type = str2;
        this.values = strArr;
    }
}
