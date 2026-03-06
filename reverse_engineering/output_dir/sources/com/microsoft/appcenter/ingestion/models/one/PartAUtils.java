package com.microsoft.appcenter.ingestion.models.one;

import com.microsoft.appcenter.ingestion.models.Device;
import com.microsoft.appcenter.ingestion.models.Log;
import com.microsoft.appcenter.utils.context.UserIdContext;
import java.util.Locale;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: classes2.dex */
public class PartAUtils {
    private static final Pattern NAME_REGEX = Pattern.compile("^[a-zA-Z0-9]((\\.(?!(\\.|$)))|[_a-zA-Z0-9]){3,99}$");

    public static String getTargetKey(String targetToken) {
        return targetToken.split("-")[0];
    }

    public static void setName(CommonSchemaLog log, String name) throws IllegalArgumentException {
        if (name == null) {
            throw new IllegalArgumentException("Name cannot be null.");
        }
        Pattern pattern = NAME_REGEX;
        if (!pattern.matcher(name).matches()) {
            throw new IllegalArgumentException("Name must match '" + pattern + "' but was '" + name + "'.");
        }
        log.setName(name);
    }

    public static void addPartAFromLog(Log src, CommonSchemaLog dest, String transmissionTarget) {
        Device device = src.getDevice();
        dest.setVer("3.0");
        dest.setTimestamp(src.getTimestamp());
        dest.setIKey("o:" + getTargetKey(transmissionTarget));
        dest.addTransmissionTarget(transmissionTarget);
        if (dest.getExt() == null) {
            dest.setExt(new Extensions());
        }
        dest.getExt().setProtocol(new ProtocolExtension());
        dest.getExt().getProtocol().setDevModel(device.getModel());
        dest.getExt().getProtocol().setDevMake(device.getOemName());
        dest.getExt().setUser(new UserExtension());
        dest.getExt().getUser().setLocalId(UserIdContext.getPrefixedUserId(src.getUserId()));
        dest.getExt().getUser().setLocale(device.getLocale().replace("_", "-"));
        dest.getExt().setOs(new OsExtension());
        dest.getExt().getOs().setName(device.getOsName());
        dest.getExt().getOs().setVer(device.getOsVersion() + "-" + device.getOsBuild() + "-" + device.getOsApiLevel());
        dest.getExt().setApp(new AppExtension());
        dest.getExt().getApp().setVer(device.getAppVersion());
        dest.getExt().getApp().setId("a:" + device.getAppNamespace());
        dest.getExt().setNet(new NetExtension());
        dest.getExt().getNet().setProvider(device.getCarrierName());
        dest.getExt().setSdk(new SdkExtension());
        dest.getExt().getSdk().setLibVer(device.getSdkName() + "-" + device.getSdkVersion());
        dest.getExt().setLoc(new LocExtension());
        Locale locale = Locale.US;
        Object[] objArr = new Object[3];
        objArr[0] = device.getTimeZoneOffset().intValue() >= 0 ? "+" : "-";
        objArr[1] = Integer.valueOf(Math.abs(device.getTimeZoneOffset().intValue() / 60));
        objArr[2] = Integer.valueOf(Math.abs(device.getTimeZoneOffset().intValue() % 60));
        dest.getExt().getLoc().setTz(String.format(locale, "%s%02d:%02d", objArr));
        dest.getExt().setDevice(new DeviceExtension());
    }
}
