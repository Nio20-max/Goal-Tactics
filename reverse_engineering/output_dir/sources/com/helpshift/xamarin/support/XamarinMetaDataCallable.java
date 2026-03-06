package com.helpshift.xamarin.support;

import com.helpshift.support.Metadata;
import com.helpshift.support.MetadataCallable;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class XamarinMetaDataCallable implements MetadataCallable {
    private String[] issueTags;
    private Map<String, Object> metadata;

    public XamarinMetaDataCallable(Map<String, Object> map, String[] strArr) {
        this.metadata = map;
        this.issueTags = strArr;
    }

    @Override // com.helpshift.support.MetadataCallable
    public Metadata call() {
        return new Metadata(this.metadata, this.issueTags);
    }
}
