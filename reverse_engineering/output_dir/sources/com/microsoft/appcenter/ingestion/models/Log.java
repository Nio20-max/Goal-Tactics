package com.microsoft.appcenter.ingestion.models;

import java.util.Date;
import java.util.Set;
import java.util.UUID;

/* JADX INFO: loaded from: classes2.dex */
public interface Log extends Model {
    void addTransmissionTarget(String transmissionTargetToken);

    Device getDevice();

    String getDistributionGroupId();

    UUID getSid();

    Object getTag();

    Date getTimestamp();

    Set<String> getTransmissionTargetTokens();

    String getType();

    String getUserId();

    void setDevice(Device device);

    void setDistributionGroupId(String distributionGroupId);

    void setSid(UUID sid);

    void setTag(Object tag);

    void setTimestamp(Date timestamp);

    void setUserId(String userId);
}
