package com.helpshift.network;

import com.helpshift.exceptions.InstallException;
import com.helpshift.network.request.Request;
import java.io.IOException;

/* JADX INFO: loaded from: classes2.dex */
public interface HttpStack {
    HttpResponse performRequest(Request request) throws InstallException, IOException;
}
