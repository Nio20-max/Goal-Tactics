package com.microsoft.appcenter.analytics;

import com.microsoft.appcenter.ingestion.models.properties.BooleanTypedProperty;
import com.microsoft.appcenter.ingestion.models.properties.DateTimeTypedProperty;
import com.microsoft.appcenter.ingestion.models.properties.DoubleTypedProperty;
import com.microsoft.appcenter.ingestion.models.properties.LongTypedProperty;
import com.microsoft.appcenter.ingestion.models.properties.StringTypedProperty;
import com.microsoft.appcenter.ingestion.models.properties.TypedProperty;
import com.microsoft.appcenter.utils.AppCenterLog;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* JADX INFO: loaded from: classes2.dex */
public class EventProperties {
    private static final String VALUE_NULL_ERROR_MESSAGE = "Property value cannot be null";
    private final Map<String, TypedProperty> mProperties = new ConcurrentHashMap();

    Map<String, TypedProperty> getProperties() {
        return this.mProperties;
    }

    public EventProperties set(String key, boolean value) {
        if (isValidKey(key)) {
            BooleanTypedProperty booleanTypedProperty = new BooleanTypedProperty();
            booleanTypedProperty.setName(key);
            booleanTypedProperty.setValue(value);
            this.mProperties.put(key, booleanTypedProperty);
        }
        return this;
    }

    public EventProperties set(String key, Date value) {
        if (isValidKey(key) && isValidValue(value)) {
            DateTimeTypedProperty dateTimeTypedProperty = new DateTimeTypedProperty();
            dateTimeTypedProperty.setName(key);
            dateTimeTypedProperty.setValue(value);
            this.mProperties.put(key, dateTimeTypedProperty);
        }
        return this;
    }

    public EventProperties set(String key, double value) {
        if (isValidKey(key)) {
            if (Double.isInfinite(value) || Double.isNaN(value)) {
                AppCenterLog.error(Analytics.LOG_TAG, "Double property value cannot be NaN or infinite.");
            } else {
                DoubleTypedProperty doubleTypedProperty = new DoubleTypedProperty();
                doubleTypedProperty.setName(key);
                doubleTypedProperty.setValue(value);
                this.mProperties.put(key, doubleTypedProperty);
            }
        }
        return this;
    }

    public EventProperties set(String key, long value) {
        if (isValidKey(key)) {
            LongTypedProperty longTypedProperty = new LongTypedProperty();
            longTypedProperty.setName(key);
            longTypedProperty.setValue(value);
            this.mProperties.put(key, longTypedProperty);
        }
        return this;
    }

    public EventProperties set(String key, String value) {
        if (isValidKey(key) && isValidValue(value)) {
            StringTypedProperty stringTypedProperty = new StringTypedProperty();
            stringTypedProperty.setName(key);
            stringTypedProperty.setValue(value);
            this.mProperties.put(key, stringTypedProperty);
        }
        return this;
    }

    private boolean isValidKey(String key) {
        if (key == null) {
            AppCenterLog.error(Analytics.LOG_TAG, "Property key must not be null");
            return false;
        }
        if (!this.mProperties.containsKey(key)) {
            return true;
        }
        AppCenterLog.warn(Analytics.LOG_TAG, "Property \"" + key + "\" is already set and will be overridden.");
        return true;
    }

    private boolean isValidValue(Object value) {
        if (value != null) {
            return true;
        }
        AppCenterLog.error(Analytics.LOG_TAG, VALUE_NULL_ERROR_MESSAGE);
        return false;
    }
}
