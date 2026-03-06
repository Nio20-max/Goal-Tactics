package com.ironsource.mediationsdk.model;

/* JADX INFO: loaded from: classes2.dex */
public enum PlacementCappingType {
    PER_DAY("d"),
    PER_HOUR("h");

    public String value;

    PlacementCappingType(String str) {
        this.value = str;
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.value;
    }
}
