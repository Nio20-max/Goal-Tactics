package com.helpshift.logger.logmodels;

import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class LogExtrasModelProvider {
    private static ILogExtrasModelFactory factory;

    public static void initialize(ILogExtrasModelFactory iLogExtrasModelFactory) {
        factory = iLogExtrasModelFactory;
    }

    public static ILogExtrasModel fromString(String str, String str2) {
        ILogExtrasModelFactory iLogExtrasModelFactory = factory;
        if (iLogExtrasModelFactory != null) {
            return iLogExtrasModelFactory.fromString(str, str2);
        }
        return null;
    }

    public static ILogExtrasModel fromMap(String str, Map map) {
        ILogExtrasModelFactory iLogExtrasModelFactory = factory;
        if (iLogExtrasModelFactory != null) {
            return iLogExtrasModelFactory.fromMap(str, map);
        }
        return null;
    }
}
