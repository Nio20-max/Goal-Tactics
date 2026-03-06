package com.helpshift.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: classes2.dex */
public final class HSPattern {
    private static final int EMAIL_LIMIT = 256;
    private static final int IDENTIFIER_LIMIT = 750;
    private static Pattern customPropertyPattern;
    private static Pattern domainNamePattern;
    private static Pattern emailPattern;
    private static Pattern ipPattern;
    private static Pattern mimePattern;
    private static Pattern namePattern;
    private static Pattern positiveNumbersPattern;
    private static Pattern propertyKeyPattern;
    private static Pattern specialCharPattern;
    private static Pattern timeStampPattern;
    private static Pattern urlPattern;

    public static boolean isValidEmail(String str) {
        if (str == null) {
            return false;
        }
        return getEmailPattern().matcher(str.trim()).matches();
    }

    public static boolean isValidName(String str) {
        if (namePattern == null) {
            namePattern = Pattern.compile("^[\\p{L}\\p{M}\\p{N}].*");
        }
        return namePattern.matcher(str.trim()).matches();
    }

    public static boolean isValidLoginIdentifier(String str) {
        if (str == null || str.length() == 0) {
            return true;
        }
        return str.length() == str.trim().length() && str.length() <= IDENTIFIER_LIMIT;
    }

    public static boolean isValidLoginEmail(String str) {
        if (str == null || str.length() == 0) {
            return true;
        }
        if (str.length() == str.trim().length() && str.length() <= 256) {
            return getEmailPattern().matcher(str).matches();
        }
        return false;
    }

    public static boolean hasOnlySpecialCharacters(String str) {
        if (specialCharPattern == null) {
            specialCharPattern = Pattern.compile("\\W+");
        }
        return specialCharPattern.matcher(str.trim()).matches();
    }

    public static String sanitiseCustomPropertyKey(String str) {
        if (customPropertyPattern == null) {
            customPropertyPattern = Pattern.compile("^[A-Za-z0-9_]+$");
        }
        String strReplace = str.trim().replace("-", "_").replace(" ", "_");
        if (customPropertyPattern.matcher(strReplace).matches()) {
            return strReplace;
        }
        return null;
    }

    public static boolean checkIpv4Address(String str) {
        if (ipPattern == null) {
            ipPattern = Pattern.compile("^(\\d+)\\.(\\d+)\\.(\\d+)\\.(\\d+)$");
        }
        if (str != null && str.trim().length() != 0) {
            Matcher matcher = ipPattern.matcher(str.trim());
            if (matcher.matches()) {
                for (int i = 1; i < matcher.groupCount(); i++) {
                    Integer numValueOf = Integer.valueOf(Integer.parseInt(matcher.group(i)));
                    if (numValueOf.intValue() < 0 || numValueOf.intValue() > 255) {
                        return false;
                    }
                }
                return true;
            }
        }
        return false;
    }

    public static Pattern getComponentPlaceHolderPattern(String str) {
        return Pattern.compile("^[\\p{L}\\p{N}-]+_" + str + "_\\d{17}-[0-9a-z]{15}$");
    }

    public static Pattern getTimeStampPattern() {
        if (timeStampPattern == null) {
            timeStampPattern = Pattern.compile("^\\d+.\\d{3}$");
        }
        return timeStampPattern;
    }

    public static Pattern getPropertyKeyPattern() {
        if (propertyKeyPattern == null) {
            propertyKeyPattern = Pattern.compile("^[\\p{L}\\p{N}][\\p{L}\\p{N}\\p{Pd}\\p{Pc}]*[\\p{L}\\p{N}]$");
        }
        return propertyKeyPattern;
    }

    public static Pattern getUrlPattern() {
        if (urlPattern == null) {
            urlPattern = Pattern.compile("[^\\p{Z}\\n\\p{Ps}]+://[^\\p{Z}\\n\\p{Pe}.]+(\\.[^\\p{Z}\\n\\p{Pe}.]+)*");
        }
        return urlPattern;
    }

    public static boolean isPositiveNumber(String str) {
        if (StringUtils.isEmpty(str)) {
            return false;
        }
        return getPositiveNumbersPattern().matcher(str).matches();
    }

    private static Pattern getEmailPattern() {
        if (emailPattern == null) {
            emailPattern = Pattern.compile("(?i)^[\\p{L}\\p{N}\\p{M}\\p{S}\\p{Po}A-Z0-9._%'-]{1,64}(\\+.*)?@[\\p{L}\\p{M}\\p{N}\\p{S}A-Z0-9'.-]{1,246}\\.[\\p{L}\\p{M}\\p{N}\\p{S}A-Z]{2,8}[^\\s]*$");
        }
        return emailPattern;
    }

    private static Pattern getPositiveNumbersPattern() {
        if (positiveNumbersPattern == null) {
            positiveNumbersPattern = Pattern.compile("^[+]?\\p{N}+(\\.\\p{N}+)?$");
        }
        return positiveNumbersPattern;
    }

    public static boolean isValidMime(String str) {
        if (StringUtils.isEmpty(str)) {
            return false;
        }
        return getMimePattern().matcher(str.trim()).matches();
    }

    private static Pattern getMimePattern() {
        if (mimePattern == null) {
            mimePattern = Pattern.compile("^.*[a-zA-Z]+.*/.*[a-zA-Z]+.*$");
        }
        return mimePattern;
    }
}
