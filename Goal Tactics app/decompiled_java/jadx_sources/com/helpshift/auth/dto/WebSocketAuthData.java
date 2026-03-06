package com.helpshift.auth.dto;

import java.io.Serializable;

/* JADX INFO: loaded from: classes.dex */
public class WebSocketAuthData implements Serializable {
    public final String authToken;
    public final String webSocketRoute;

    public WebSocketAuthData(String str, String str2) {
        this.authToken = str;
        this.webSocketRoute = str2;
    }
}
