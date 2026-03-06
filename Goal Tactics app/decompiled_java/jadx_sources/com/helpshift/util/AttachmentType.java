package com.helpshift.util;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* JADX INFO: loaded from: classes2.dex */
public class AttachmentType {
    public static final int DOCUMENT = 3;
    public static final int IMAGE = 1;
    public static final int VIDEO = 2;

    @Retention(RetentionPolicy.SOURCE)
    public @interface Type {
    }
}
