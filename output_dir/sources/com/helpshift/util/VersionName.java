package com.helpshift.util;

/* JADX INFO: loaded from: classes2.dex */
public class VersionName implements Comparable<VersionName> {
    public final int[] numbers;

    public VersionName(String str) {
        String[] strArrSplit = str.split("-")[0].split("\\.");
        this.numbers = new int[strArrSplit.length];
        for (int i = 0; i < strArrSplit.length; i++) {
            this.numbers[i] = Integer.valueOf(strArrSplit[i]).intValue();
        }
    }

    @Override // java.lang.Comparable
    public int compareTo(VersionName versionName) {
        int iMax = Math.max(this.numbers.length, versionName.numbers.length);
        int i = 0;
        while (i < iMax) {
            int[] iArr = this.numbers;
            int i2 = i < iArr.length ? iArr[i] : 0;
            int[] iArr2 = versionName.numbers;
            int i3 = i < iArr2.length ? iArr2[i] : 0;
            if (i2 != i3) {
                return i2 < i3 ? -1 : 1;
            }
            i++;
        }
        return 0;
    }

    public boolean isGreaterThanOrEqualTo(VersionName versionName) {
        int iCompareTo = compareTo(versionName);
        return iCompareTo == 1 || iCompareTo == 0;
    }

    public boolean isLessThanOrEqualTo(VersionName versionName) {
        int iCompareTo = compareTo(versionName);
        return iCompareTo == -1 || iCompareTo == 0;
    }

    public boolean isLessThan(VersionName versionName) {
        return compareTo(versionName) == -1;
    }

    public boolean isGreaterThan(VersionName versionName) {
        return compareTo(versionName) == 1;
    }
}
