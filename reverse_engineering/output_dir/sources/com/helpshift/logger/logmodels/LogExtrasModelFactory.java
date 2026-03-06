package com.helpshift.logger.logmodels;

import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class LogExtrasModelFactory implements ILogExtrasModelFactory {
    @Override // com.helpshift.logger.logmodels.ILogExtrasModelFactory
    public ILogExtrasModel fromString(String str, String str2) {
        return new StringExtrasModel(str, str2);
    }

    @Override // com.helpshift.logger.logmodels.ILogExtrasModelFactory
    public ILogExtrasModel fromMap(String str, Map map) {
        return new MapExtrasModel(str, map);
    }
}
