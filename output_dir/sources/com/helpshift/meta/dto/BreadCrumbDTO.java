package com.helpshift.meta.dto;

import java.io.Serializable;

/* JADX INFO: loaded from: classes2.dex */
public class BreadCrumbDTO implements Serializable {
    public final String action;
    public final String dateTime;

    public BreadCrumbDTO(String str, String str2) {
        this.dateTime = str2;
        this.action = str;
    }
}
