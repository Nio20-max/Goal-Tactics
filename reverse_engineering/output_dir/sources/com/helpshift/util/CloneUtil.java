package com.helpshift.util;

import com.ironsource.sdk.ISNAdView.ViewVisibilityParameters;
import com.ironsource.sdk.service.PackagesInstallationService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class CloneUtil {
    /* JADX WARN: Multi-variable type inference failed */
    public static <T extends HSCloneable> HSObservableList<T> deepClone(HSObservableList<T> hSObservableList) {
        if (hSObservableList == null) {
            return null;
        }
        HSObservableList<T> hSObservableList2 = (HSObservableList<T>) new HSObservableList();
        Iterator<T> it = hSObservableList.iterator();
        while (it.hasNext()) {
            hSObservableList2.add((HSCloneable) it.next().deepClone());
        }
        return hSObservableList2;
    }

    public static <T extends HSCloneable> ArrayList<T> deepClone(List<T> list) {
        if (list == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList(list);
        PackagesInstallationService.AnonymousClass1 anonymousClass1 = (ArrayList<T>) new ArrayList();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            anonymousClass1.add((HSCloneable) ((HSCloneable) it.next()).deepClone());
        }
        return anonymousClass1;
    }

    public static <K, V extends HSCloneable> HashMap<K, V> deepClone(Map<K, V> map) {
        if (map == null) {
            return null;
        }
        ViewVisibilityParameters.AnonymousClass1 anonymousClass1 = (HashMap<K, V>) new HashMap();
        for (Map.Entry<K, V> entry : map.entrySet()) {
            anonymousClass1.put(entry.getKey(), (HSCloneable) entry.getValue().deepClone());
        }
        return anonymousClass1;
    }
}
