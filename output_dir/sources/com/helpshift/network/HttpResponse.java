package com.helpshift.network;

import com.helpshift.android.commons.downloader.HelpshiftSSLSocketFactory;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class HttpResponse {
    private HttpEntity entity;
    private List<Header> headers;
    private HelpshiftSSLSocketFactory helpshiftSSLSocketFactory;
    private StatusLine statusLine;

    public HttpResponse(StatusLine statusLine) {
        if (statusLine == null) {
            throw new IllegalArgumentException("Status line may not be null.");
        }
        this.statusLine = statusLine;
        this.headers = new ArrayList(16);
    }

    public HttpEntity getEntity() {
        return this.entity;
    }

    public void setEntity(HttpEntity httpEntity) {
        this.entity = httpEntity;
    }

    public StatusLine getStatusLine() {
        return this.statusLine;
    }

    public void addHeader(Header header) {
        if (header == null) {
            return;
        }
        this.headers.add(header);
    }

    public Header[] getAllHeaders() {
        return (Header[]) this.headers.toArray(new Header[0]);
    }

    public HelpshiftSSLSocketFactory getHelpshiftSSLSocketFactory() {
        return this.helpshiftSSLSocketFactory;
    }

    public void setHelpshiftSSLSocketFactory(HelpshiftSSLSocketFactory helpshiftSSLSocketFactory) {
        this.helpshiftSSLSocketFactory = helpshiftSSLSocketFactory;
    }
}
