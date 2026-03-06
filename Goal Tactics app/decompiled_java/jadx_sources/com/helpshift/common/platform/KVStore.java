package com.helpshift.common.platform;

import java.io.Serializable;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public interface KVStore {
    Boolean getBoolean(String str);

    Boolean getBoolean(String str, Boolean bool);

    Float getFloat(String str);

    Float getFloat(String str, Float f);

    Integer getInt(String str);

    Integer getInt(String str, Integer num);

    Long getLong(String str);

    Long getLong(String str, Long l);

    Object getSerializable(String str);

    String getString(String str);

    String getString(String str, String str2);

    void removeAllKeys();

    void setBoolean(String str, Boolean bool);

    void setFloat(String str, Float f);

    void setInt(String str, Integer num);

    void setKeyValues(Map<String, Serializable> map);

    void setLong(String str, Long l);

    void setSerializable(String str, Serializable serializable);

    void setString(String str, String str2);
}
