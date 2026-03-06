package com.ironsource.mediationsdk.metadata;

import com.facebook.internal.ServerProtocol;
import com.ironsource.mediationsdk.metadata.MetaData;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class MetaDataUtils {
    public static MetaData.MetaDataValueTypes getValueTypeForKey(String str) {
        if (str.equalsIgnoreCase(MetaDataConstants.META_DATA_CCPA_KEY)) {
            return MetaData.MetaDataValueTypes.META_DATA_VALUE_BOOLEAN;
        }
        return MetaData.MetaDataValueTypes.META_DATA_VALUE_STRING;
    }

    public static boolean isKnownKey(String str) {
        return str.equalsIgnoreCase(MetaDataConstants.META_DATA_CCPA_KEY);
    }

    public static String formatValueForType(String str, MetaData.MetaDataValueTypes metaDataValueTypes) {
        return metaDataValueTypes == MetaData.MetaDataValueTypes.META_DATA_VALUE_BOOLEAN ? (str.equalsIgnoreCase(ServerProtocol.DIALOG_RETURN_SCOPES_TRUE) || str.equalsIgnoreCase("yes")) ? ServerProtocol.DIALOG_RETURN_SCOPES_TRUE : (str.equalsIgnoreCase("false") || str.equalsIgnoreCase("no")) ? "false" : "" : str;
    }

    public static MetaData formatMetaData(String str, List<String> list) {
        if (!isKnownKey(str)) {
            return new MetaData(str, list);
        }
        String lowerCase = str.toLowerCase();
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (String str2 : list) {
            MetaData.MetaDataValueTypes valueTypeForKey = getValueTypeForKey(lowerCase);
            String valueForType = formatValueForType(str2, valueTypeForKey);
            arrayList.add(valueTypeForKey);
            arrayList2.add(valueForType);
        }
        return new MetaData(lowerCase, arrayList2, arrayList);
    }

    public static String checkMetaDataKeyValidity(String str) {
        return (str == null || str.length() > 64 || !str.matches("[A-Za-z0-9_\\-.]+")) ? "The MetaData key you entered is invalid. Please enter a key of maximum 64 characters that consists of only letters, digits and the following characters: . - _" : "";
    }

    public static String checkMetaDataValueValidity(List<String> list) {
        if (list.size() == 0) {
            return "The MetaData list should include at least one element.";
        }
        for (String str : list) {
            if (str == null || str.length() > 64 || !str.matches("[A-Za-z0-9_\\-.]+")) {
                return "The MetaData value(s) you entered is invalid. Please enter a value of maximum 64 characters that consists of only letters, digits and the following characters: . - _";
            }
        }
        return "";
    }

    public static boolean isValidCCPAMetaData(String str, String str2) {
        return str.equals(MetaDataConstants.META_DATA_CCPA_KEY) && str2.length() > 0;
    }

    public static boolean getMetaDataBooleanValue(String str) {
        return !str.equals("false");
    }
}
