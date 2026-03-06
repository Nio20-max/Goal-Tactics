package com.microsoft.appcenter;

import android.app.Application;
import android.content.Context;
import com.microsoft.appcenter.channel.Channel;
import com.microsoft.appcenter.ingestion.models.json.LogFactory;
import com.microsoft.appcenter.utils.ApplicationLifecycleListener;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public interface AppCenterService extends Application.ActivityLifecycleCallbacks, ApplicationLifecycleListener.ApplicationLifecycleCallbacks {
    Map<String, LogFactory> getLogFactories();

    String getServiceName();

    boolean isAppSecretRequired();

    boolean isInstanceEnabled();

    void onConfigurationUpdated(String appSecret, String transmissionTargetToken);

    void onStarted(Context context, Channel channel, String appSecret, String transmissionTargetToken, boolean startedFromApp);

    void onStarting(AppCenterHandler handler);

    void setInstanceEnabled(boolean enabled);
}
