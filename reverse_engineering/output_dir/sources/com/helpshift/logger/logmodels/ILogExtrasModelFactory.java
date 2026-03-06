package com.helpshift.logger.logmodels;

import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public interface ILogExtrasModelFactory {
    ILogExtrasModel fromMap(String str, Map map);

    ILogExtrasModel fromString(String str, String str2);
}
