package com.helpshift.support;

import java.util.Comparator;
import java.util.HashMap;

/* JADX INFO: compiled from: HSSearch.java */
/* JADX INFO: loaded from: classes2.dex */
class RankComparator implements Comparator<String> {
    HashMap<String, Double> base;

    public RankComparator(HashMap<String, Double> map) {
        this.base = map;
    }

    @Override // java.util.Comparator
    public int compare(String str, String str2) {
        return this.base.get(str).doubleValue() >= this.base.get(str2).doubleValue() ? -1 : 1;
    }
}
