package com.microsoft.appcenter.analytics.channel;

import com.microsoft.appcenter.analytics.Analytics;
import com.microsoft.appcenter.analytics.ingestion.models.EventLog;
import com.microsoft.appcenter.analytics.ingestion.models.LogWithNameAndProperties;
import com.microsoft.appcenter.analytics.ingestion.models.PageLog;
import com.microsoft.appcenter.channel.AbstractChannelListener;
import com.microsoft.appcenter.ingestion.models.Log;
import com.microsoft.appcenter.ingestion.models.properties.BooleanTypedProperty;
import com.microsoft.appcenter.ingestion.models.properties.DateTimeTypedProperty;
import com.microsoft.appcenter.ingestion.models.properties.DoubleTypedProperty;
import com.microsoft.appcenter.ingestion.models.properties.LongTypedProperty;
import com.microsoft.appcenter.ingestion.models.properties.StringTypedProperty;
import com.microsoft.appcenter.ingestion.models.properties.TypedProperty;
import com.microsoft.appcenter.utils.AppCenterLog;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class AnalyticsValidator extends AbstractChannelListener {
    static final int MAX_NAME_LENGTH = 256;
    static final int MAX_PROPERTY_COUNT = 20;
    static final int MAX_PROPERTY_ITEM_LENGTH = 125;

    private boolean validateLog(LogWithNameAndProperties log) {
        String strValidateName = validateName(log.getName(), log.getType());
        if (strValidateName == null) {
            return false;
        }
        Map<String, String> mapValidateProperties = validateProperties(log.getProperties(), strValidateName, log.getType());
        log.setName(strValidateName);
        log.setProperties(mapValidateProperties);
        return true;
    }

    private boolean validateLog(EventLog log) {
        String strValidateName = validateName(log.getName(), log.getType());
        if (strValidateName == null) {
            return false;
        }
        validateProperties(log.getTypedProperties());
        log.setName(strValidateName);
        return true;
    }

    private static String validateName(String name, String logType) {
        if (name == null || name.isEmpty()) {
            AppCenterLog.error(Analytics.LOG_TAG, logType + " name cannot be null or empty.");
            return null;
        }
        if (name.length() <= 256) {
            return name;
        }
        AppCenterLog.warn(Analytics.LOG_TAG, String.format("%s '%s' : name length cannot be longer than %s characters. Name will be truncated.", logType, name, 256));
        return name.substring(0, 256);
    }

    private static Map<String, String> validateProperties(Map<String, String> properties, String logName, String logType) {
        if (properties == null) {
            return null;
        }
        HashMap map = new HashMap();
        Iterator<Map.Entry<String, String>> it = properties.entrySet().iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Map.Entry<String, String> next = it.next();
            String key = next.getKey();
            String value = next.getValue();
            if (map.size() >= 20) {
                AppCenterLog.warn(Analytics.LOG_TAG, String.format("%s '%s' : properties cannot contain more than %s items. Skipping other properties.", logType, logName, 20));
                break;
            }
            if (key == null || key.isEmpty()) {
                AppCenterLog.warn(Analytics.LOG_TAG, String.format("%s '%s' : a property key cannot be null or empty. Property will be skipped.", logType, logName));
            } else if (value == null) {
                AppCenterLog.warn(Analytics.LOG_TAG, String.format("%s '%s' : property '%s' : property value cannot be null. Property '%s' will be skipped.", logType, logName, key, key));
            } else {
                if (key.length() > 125) {
                    AppCenterLog.warn(Analytics.LOG_TAG, String.format("%s '%s' : property '%s' : property key length cannot be longer than %s characters. Property key will be truncated.", logType, logName, key, 125));
                    key = key.substring(0, 125);
                }
                if (value.length() > 125) {
                    AppCenterLog.warn(Analytics.LOG_TAG, String.format("%s '%s' : property '%s' : property value cannot be longer than %s characters. Property value will be truncated.", logType, logName, key, 125));
                    value = value.substring(0, 125);
                }
                map.put(key, value);
            }
        }
        return map;
    }

    private static void validateProperties(List<TypedProperty> properties) {
        boolean z;
        if (properties == null) {
            return;
        }
        ListIterator<TypedProperty> listIterator = properties.listIterator();
        int i = 0;
        boolean z2 = false;
        while (listIterator.hasNext()) {
            TypedProperty next = listIterator.next();
            String name = next.getName();
            if (i >= 20) {
                if (!z2) {
                    AppCenterLog.warn(Analytics.LOG_TAG, String.format("Typed properties cannot contain more than %s items. Skipping other properties.", 20));
                    z2 = true;
                }
                listIterator.remove();
            } else if (name == null || name.isEmpty()) {
                AppCenterLog.warn(Analytics.LOG_TAG, "A typed property key cannot be null or empty. Property will be skipped.");
                listIterator.remove();
            } else {
                if (name.length() > 125) {
                    AppCenterLog.warn(Analytics.LOG_TAG, String.format("Typed property '%s' : property key length cannot be longer than %s characters. Property key will be truncated.", name, 125));
                    name = name.substring(0, 125);
                    next = copyProperty(next, name);
                    listIterator.set(next);
                    z = false;
                } else {
                    z = true;
                }
                if (next instanceof StringTypedProperty) {
                    StringTypedProperty stringTypedProperty = (StringTypedProperty) next;
                    String value = stringTypedProperty.getValue();
                    if (value == null) {
                        AppCenterLog.warn(Analytics.LOG_TAG, String.format("Typed property '%s' : property value cannot be null. Property '%s' will be skipped.", name, name));
                        listIterator.remove();
                    } else if (value.length() > 125) {
                        AppCenterLog.warn(Analytics.LOG_TAG, String.format("A String property '%s' : property value cannot be longer than %s characters. Property value will be truncated.", name, 125));
                        String strSubstring = value.substring(0, 125);
                        if (z) {
                            StringTypedProperty stringTypedProperty2 = new StringTypedProperty();
                            stringTypedProperty2.setName(name);
                            stringTypedProperty2.setValue(strSubstring);
                            listIterator.set(stringTypedProperty2);
                        } else {
                            stringTypedProperty.setValue(strSubstring);
                        }
                    }
                }
                i++;
            }
        }
    }

    private static TypedProperty copyProperty(TypedProperty typedProperty, String str) {
        TypedProperty typedProperty2;
        String type = typedProperty.getType();
        if ("boolean".equals(type)) {
            BooleanTypedProperty booleanTypedProperty = new BooleanTypedProperty();
            booleanTypedProperty.setValue(((BooleanTypedProperty) typedProperty).getValue());
            typedProperty2 = booleanTypedProperty;
        } else if (DateTimeTypedProperty.TYPE.equals(type)) {
            DateTimeTypedProperty dateTimeTypedProperty = new DateTimeTypedProperty();
            dateTimeTypedProperty.setValue(((DateTimeTypedProperty) typedProperty).getValue());
            typedProperty2 = dateTimeTypedProperty;
        } else if (DoubleTypedProperty.TYPE.equals(type)) {
            DoubleTypedProperty doubleTypedProperty = new DoubleTypedProperty();
            doubleTypedProperty.setValue(((DoubleTypedProperty) typedProperty).getValue());
            typedProperty2 = doubleTypedProperty;
        } else if (LongTypedProperty.TYPE.equals(type)) {
            LongTypedProperty longTypedProperty = new LongTypedProperty();
            longTypedProperty.setValue(((LongTypedProperty) typedProperty).getValue());
            typedProperty2 = longTypedProperty;
        } else {
            StringTypedProperty stringTypedProperty = new StringTypedProperty();
            stringTypedProperty.setValue(((StringTypedProperty) typedProperty).getValue());
            typedProperty2 = stringTypedProperty;
        }
        typedProperty2.setName(str);
        return typedProperty2;
    }

    @Override // com.microsoft.appcenter.channel.AbstractChannelListener, com.microsoft.appcenter.channel.Channel.Listener
    public boolean shouldFilter(Log log) {
        if (log instanceof PageLog) {
            return !validateLog((LogWithNameAndProperties) log);
        }
        if (log instanceof EventLog) {
            return !validateLog((EventLog) log);
        }
        return false;
    }
}
