package com.helpshift.support.search;

import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class SearchTokenDto {
    public final Map<Integer, Double> scoreMap;
    public final int wordType;
    public final String wordValue;

    public SearchTokenDto(String str, int i, Map<Integer, Double> map) {
        this.wordValue = str;
        this.wordType = i;
        this.scoreMap = map;
    }
}
