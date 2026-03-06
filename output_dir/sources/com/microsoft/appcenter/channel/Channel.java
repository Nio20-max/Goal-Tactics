package com.microsoft.appcenter.channel;

import com.microsoft.appcenter.ingestion.Ingestion;
import com.microsoft.appcenter.ingestion.models.Log;

/* JADX INFO: loaded from: classes2.dex */
public interface Channel {

    public interface GroupListener {
        void onBeforeSending(Log log);

        void onFailure(Log log, Exception e);

        void onSuccess(Log log);
    }

    public interface Listener {
        void onClear(String groupName);

        void onGloballyEnabled(boolean isEnabled);

        void onGroupAdded(String groupName, GroupListener groupListener, long batchTimeInterval);

        void onGroupRemoved(String groupName);

        void onPaused(String groupName, String targetToken);

        void onPreparedLog(Log log, String groupName, int flags);

        void onPreparingLog(Log log, String groupName);

        void onResumed(String groupName, String targetToken);

        boolean shouldFilter(Log log);
    }

    void addGroup(String groupName, int maxLogsPerBatch, long batchTimeInterval, int maxParallelBatches, Ingestion ingestion, GroupListener groupListener);

    void addListener(Listener listener);

    void clear(String groupName);

    void enqueue(Log log, String groupName, int flags);

    void invalidateDeviceCache();

    boolean isEnabled();

    void pauseGroup(String groupName, String targetToken);

    void removeGroup(String groupName);

    void removeListener(Listener listener);

    void resumeGroup(String groupName, String targetToken);

    void setAppSecret(String appSecret);

    void setEnabled(boolean enabled);

    void setLogUrl(String logUrl);

    boolean setMaxStorageSize(long maxStorageSizeInBytes);

    void setNetworkRequests(boolean isAllowed);

    void shutdown();
}
