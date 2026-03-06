package com.appsflyer;

import com.appsflyer.internal.cd;
import com.google.firebase.messaging.FirebaseMessagingService;

/* JADX INFO: loaded from: classes.dex */
public class FirebaseMessagingServiceListener extends FirebaseMessagingService {
    @Override // com.google.firebase.messaging.FirebaseMessagingService
    public void onNewToken(String str) {
        new cd(getApplicationContext()).AFInAppEventParameterName(str);
    }
}
