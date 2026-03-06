package com.ironsource.sdk.service.Connectivity;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.util.Log;
import com.ironsource.network.ConnectivityUtils;
import com.ironsource.sdk.constants.Constants;
import com.ironsource.sdk.utils.IronSourceAsyncHttpRequestTask;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class BroadcastReceiverStrategy implements IConnectivity {
    private BroadcastReceiver mConnectionReceiver = new BroadcastReceiver() { // from class: com.ironsource.sdk.service.Connectivity.BroadcastReceiverStrategy.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            String connectionType = ConnectivityUtils.getConnectionType(context);
            if (connectionType.equals("none")) {
                BroadcastReceiverStrategy.this.mNetworkState.onDisconnected();
            } else {
                BroadcastReceiverStrategy.this.mNetworkState.onConnected(connectionType, new JSONObject());
            }
        }
    };
    private final IConnectivityStatus mNetworkState;

    public BroadcastReceiverStrategy(IConnectivityStatus iConnectivityStatus) {
        this.mNetworkState = iConnectivityStatus;
    }

    @Override // com.ironsource.sdk.service.Connectivity.IConnectivity
    public void startListenToNetworkChanges(Context context) {
        try {
            context.registerReceiver(this.mConnectionReceiver, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override // com.ironsource.sdk.service.Connectivity.IConnectivity
    public void stopListenToNetworkChanges(Context context) {
        try {
            context.unregisterReceiver(this.mConnectionReceiver);
        } catch (IllegalArgumentException unused) {
        } catch (Exception e) {
            Log.e("ContentValues", "unregisterConnectionReceiver - " + e);
            new IronSourceAsyncHttpRequestTask().execute(Constants.NATIVE_EXCEPTION_BASE_URL + e.getStackTrace()[0].getMethodName());
        }
    }

    @Override // com.ironsource.sdk.service.Connectivity.IConnectivity
    public JSONObject getConnectivityInfo(Context context) {
        return new JSONObject();
    }

    @Override // com.ironsource.sdk.service.Connectivity.IConnectivity
    public void release() {
        this.mConnectionReceiver = null;
    }
}
