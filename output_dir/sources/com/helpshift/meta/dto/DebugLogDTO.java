package com.helpshift.meta.dto;

/* JADX INFO: loaded from: classes2.dex */
public class DebugLogDTO {
    public final Integer level;
    public final String msg;
    public final String tag;
    public final String throwable;

    public DebugLogDTO(Integer num, String str, String str2, String str3) {
        this.level = num;
        this.tag = str;
        this.msg = str2;
        this.throwable = str3;
    }
}
