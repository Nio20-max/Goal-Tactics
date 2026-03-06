package com.ironsource.eventsmodule;

import android.os.AsyncTask;
import android.util.Pair;
import com.ironsource.network.ISHttpService;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes2.dex */
public class EventsSender extends AsyncTask<Object, Void, Boolean> {
    private static final String APPLICATION_JSON = "application/json";
    private static final String CONTENT_TYPE_FIELD = "Content-Type";
    private ArrayList extraData;
    private IEventsSenderResultListener mResultListener;

    public EventsSender() {
    }

    public EventsSender(IEventsSenderResultListener iEventsSenderResultListener) {
        this.mResultListener = iEventsSenderResultListener;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.AsyncTask
    public Boolean doInBackground(Object... objArr) {
        try {
            this.extraData = (ArrayList) objArr[2];
            boolean z = true;
            String str = (String) objArr[1];
            String str2 = (String) objArr[0];
            ArrayList arrayList = new ArrayList();
            arrayList.add(new Pair("Content-Type", "application/json"));
            arrayList.add(new Pair("Content-Length", String.valueOf(str2.length())));
            if (ISHttpService.sendPOSTRequest(str, str2, arrayList).responseCode != 200) {
                z = false;
            }
            return Boolean.valueOf(z);
        } catch (Exception unused) {
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public void onPostExecute(Boolean bool) {
        IEventsSenderResultListener iEventsSenderResultListener = this.mResultListener;
        if (iEventsSenderResultListener != null) {
            iEventsSenderResultListener.onEventsSenderResult(this.extraData, bool.booleanValue());
        }
    }
}
