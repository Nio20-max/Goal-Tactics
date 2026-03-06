package com.ironsource.sdk.service.Connectivity;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.LinkProperties;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkRequest;
import android.os.Build;
import android.util.Log;
import com.ironsource.network.ConnectivityUtils;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class NetworkCallbackStrategy implements IConnectivity {
    private String TAG = NetworkCallbackStrategy.class.getSimpleName();
    private int kSupportingVersionForNetworkCallback = 23;
    private ConnectivityManager.NetworkCallback mNetworkCallback;
    private final IConnectivityStatus mNetworkState;

    public NetworkCallbackStrategy(IConnectivityStatus iConnectivityStatus) {
        this.mNetworkState = iConnectivityStatus;
    }

    @Override // com.ironsource.sdk.service.Connectivity.IConnectivity
    public void startListenToNetworkChanges(final Context context) {
        if (Build.VERSION.SDK_INT >= this.kSupportingVersionForNetworkCallback) {
            stopListenToNetworkChanges(context);
            if (ConnectivityUtils.getConnectionType(context).equals("none")) {
                this.mNetworkState.onDisconnected();
            }
            if (this.mNetworkCallback == null) {
                this.mNetworkCallback = new ConnectivityManager.NetworkCallback() { // from class: com.ironsource.sdk.service.Connectivity.NetworkCallbackStrategy.1
                    @Override // android.net.ConnectivityManager.NetworkCallback
                    public void onAvailable(Network network) {
                        if (network != null) {
                            NetworkCallbackStrategy.this.mNetworkState.onConnected(ConnectivityUtils.getConnectionType(network, context), ConnectivityUtils.getNetworkData(context, network));
                            return;
                        }
                        IConnectivityStatus iConnectivityStatus = NetworkCallbackStrategy.this.mNetworkState;
                        String connectionType = ConnectivityUtils.getConnectionType(context);
                        Context context2 = context;
                        iConnectivityStatus.onConnected(connectionType, ConnectivityUtils.getNetworkData(context2, ConnectivityUtils.getActiveNetwork(context2)));
                    }

                    @Override // android.net.ConnectivityManager.NetworkCallback
                    public void onLost(Network network) {
                        if (ConnectivityUtils.getConnectionType(context).equals("none")) {
                            NetworkCallbackStrategy.this.mNetworkState.onDisconnected();
                        }
                    }

                    @Override // android.net.ConnectivityManager.NetworkCallback
                    public void onCapabilitiesChanged(Network network, NetworkCapabilities networkCapabilities) {
                        if (network != null) {
                            NetworkCallbackStrategy.this.mNetworkState.onStatusChanged(ConnectivityUtils.getConnectionType(network, context), ConnectivityUtils.getNetworkData(context, network));
                        }
                    }

                    @Override // android.net.ConnectivityManager.NetworkCallback
                    public void onLinkPropertiesChanged(Network network, LinkProperties linkProperties) {
                        if (network != null) {
                            NetworkCallbackStrategy.this.mNetworkState.onStatusChanged(ConnectivityUtils.getConnectionType(network, context), ConnectivityUtils.getNetworkData(context, network));
                        }
                    }
                };
            }
            NetworkRequest networkRequestBuild = new NetworkRequest.Builder().addCapability(12).build();
            try {
                ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
                if (connectivityManager != null) {
                    connectivityManager.registerNetworkCallback(networkRequestBuild, this.mNetworkCallback);
                }
            } catch (Exception unused) {
                Log.e(this.TAG, "NetworkCallback was not able to register");
            }
        }
    }

    @Override // com.ironsource.sdk.service.Connectivity.IConnectivity
    public void stopListenToNetworkChanges(Context context) {
        ConnectivityManager connectivityManager;
        if (Build.VERSION.SDK_INT < this.kSupportingVersionForNetworkCallback || this.mNetworkCallback == null || context == null || (connectivityManager = (ConnectivityManager) context.getSystemService("connectivity")) == null) {
            return;
        }
        try {
            connectivityManager.unregisterNetworkCallback(this.mNetworkCallback);
        } catch (Exception unused) {
            Log.e(this.TAG, "NetworkCallback for was not registered or already unregistered");
        }
    }

    @Override // com.ironsource.sdk.service.Connectivity.IConnectivity
    public JSONObject getConnectivityInfo(Context context) {
        return ConnectivityUtils.getNetworkData(context, ConnectivityUtils.getActiveNetwork(context));
    }

    @Override // com.ironsource.sdk.service.Connectivity.IConnectivity
    public void release() {
        this.mNetworkCallback = null;
    }
}
