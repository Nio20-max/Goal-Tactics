package com.microsoft.appcenter.ingestion.models.one;

import com.microsoft.appcenter.ingestion.models.Model;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;

/* JADX INFO: loaded from: classes2.dex */
public class Extensions implements Model {
    private static final String APP = "app";
    private static final String DEVICE = "device";
    private static final String LOC = "loc";
    private static final String METADATA = "metadata";
    private static final String NET = "net";
    private static final String OS = "os";
    private static final String PROTOCOL = "protocol";
    private static final String SDK = "sdk";
    private static final String USER = "user";
    private AppExtension app;
    private DeviceExtension device;
    private LocExtension loc;
    private MetadataExtension metadata;
    private NetExtension net;
    private OsExtension os;
    private ProtocolExtension protocol;
    private SdkExtension sdk;
    private UserExtension user;

    public MetadataExtension getMetadata() {
        return this.metadata;
    }

    public void setMetadata(MetadataExtension metadata) {
        this.metadata = metadata;
    }

    public ProtocolExtension getProtocol() {
        return this.protocol;
    }

    public void setProtocol(ProtocolExtension protocol) {
        this.protocol = protocol;
    }

    public UserExtension getUser() {
        return this.user;
    }

    public void setUser(UserExtension user) {
        this.user = user;
    }

    public DeviceExtension getDevice() {
        return this.device;
    }

    public void setDevice(DeviceExtension device) {
        this.device = device;
    }

    public OsExtension getOs() {
        return this.os;
    }

    public void setOs(OsExtension os) {
        this.os = os;
    }

    public AppExtension getApp() {
        return this.app;
    }

    public void setApp(AppExtension app) {
        this.app = app;
    }

    public NetExtension getNet() {
        return this.net;
    }

    public void setNet(NetExtension net) {
        this.net = net;
    }

    public SdkExtension getSdk() {
        return this.sdk;
    }

    public void setSdk(SdkExtension sdk) {
        this.sdk = sdk;
    }

    public LocExtension getLoc() {
        return this.loc;
    }

    public void setLoc(LocExtension loc) {
        this.loc = loc;
    }

    @Override // com.microsoft.appcenter.ingestion.models.Model
    public void read(JSONObject object) throws JSONException {
        if (object.has("metadata")) {
            MetadataExtension metadataExtension = new MetadataExtension();
            metadataExtension.read(object.getJSONObject("metadata"));
            setMetadata(metadataExtension);
        }
        if (object.has("protocol")) {
            ProtocolExtension protocolExtension = new ProtocolExtension();
            protocolExtension.read(object.getJSONObject("protocol"));
            setProtocol(protocolExtension);
        }
        if (object.has(USER)) {
            UserExtension userExtension = new UserExtension();
            userExtension.read(object.getJSONObject(USER));
            setUser(userExtension);
        }
        if (object.has("device")) {
            DeviceExtension deviceExtension = new DeviceExtension();
            deviceExtension.read(object.getJSONObject("device"));
            setDevice(deviceExtension);
        }
        if (object.has("os")) {
            OsExtension osExtension = new OsExtension();
            osExtension.read(object.getJSONObject("os"));
            setOs(osExtension);
        }
        if (object.has(APP)) {
            AppExtension appExtension = new AppExtension();
            appExtension.read(object.getJSONObject(APP));
            setApp(appExtension);
        }
        if (object.has(NET)) {
            NetExtension netExtension = new NetExtension();
            netExtension.read(object.getJSONObject(NET));
            setNet(netExtension);
        }
        if (object.has("sdk")) {
            SdkExtension sdkExtension = new SdkExtension();
            sdkExtension.read(object.getJSONObject("sdk"));
            setSdk(sdkExtension);
        }
        if (object.has(LOC)) {
            LocExtension locExtension = new LocExtension();
            locExtension.read(object.getJSONObject(LOC));
            setLoc(locExtension);
        }
    }

    @Override // com.microsoft.appcenter.ingestion.models.Model
    public void write(JSONStringer writer) throws JSONException {
        if (getMetadata() != null) {
            writer.key("metadata").object();
            getMetadata().write(writer);
            writer.endObject();
        }
        if (getProtocol() != null) {
            writer.key("protocol").object();
            getProtocol().write(writer);
            writer.endObject();
        }
        if (getUser() != null) {
            writer.key(USER).object();
            getUser().write(writer);
            writer.endObject();
        }
        if (getDevice() != null) {
            writer.key("device").object();
            getDevice().write(writer);
            writer.endObject();
        }
        if (getOs() != null) {
            writer.key("os").object();
            getOs().write(writer);
            writer.endObject();
        }
        if (getApp() != null) {
            writer.key(APP).object();
            getApp().write(writer);
            writer.endObject();
        }
        if (getNet() != null) {
            writer.key(NET).object();
            getNet().write(writer);
            writer.endObject();
        }
        if (getSdk() != null) {
            writer.key("sdk").object();
            getSdk().write(writer);
            writer.endObject();
        }
        if (getLoc() != null) {
            writer.key(LOC).object();
            getLoc().write(writer);
            writer.endObject();
        }
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Extensions extensions = (Extensions) o;
        MetadataExtension metadataExtension = this.metadata;
        if (metadataExtension == null ? extensions.metadata != null : !metadataExtension.equals(extensions.metadata)) {
            return false;
        }
        ProtocolExtension protocolExtension = this.protocol;
        if (protocolExtension == null ? extensions.protocol != null : !protocolExtension.equals(extensions.protocol)) {
            return false;
        }
        UserExtension userExtension = this.user;
        if (userExtension == null ? extensions.user != null : !userExtension.equals(extensions.user)) {
            return false;
        }
        DeviceExtension deviceExtension = this.device;
        if (deviceExtension == null ? extensions.device != null : !deviceExtension.equals(extensions.device)) {
            return false;
        }
        OsExtension osExtension = this.os;
        if (osExtension == null ? extensions.os != null : !osExtension.equals(extensions.os)) {
            return false;
        }
        AppExtension appExtension = this.app;
        if (appExtension == null ? extensions.app != null : !appExtension.equals(extensions.app)) {
            return false;
        }
        NetExtension netExtension = this.net;
        if (netExtension == null ? extensions.net != null : !netExtension.equals(extensions.net)) {
            return false;
        }
        SdkExtension sdkExtension = this.sdk;
        if (sdkExtension == null ? extensions.sdk != null : !sdkExtension.equals(extensions.sdk)) {
            return false;
        }
        LocExtension locExtension = this.loc;
        LocExtension locExtension2 = extensions.loc;
        return locExtension != null ? locExtension.equals(locExtension2) : locExtension2 == null;
    }

    public int hashCode() {
        MetadataExtension metadataExtension = this.metadata;
        int iHashCode = (metadataExtension != null ? metadataExtension.hashCode() : 0) * 31;
        ProtocolExtension protocolExtension = this.protocol;
        int iHashCode2 = (iHashCode + (protocolExtension != null ? protocolExtension.hashCode() : 0)) * 31;
        UserExtension userExtension = this.user;
        int iHashCode3 = (iHashCode2 + (userExtension != null ? userExtension.hashCode() : 0)) * 31;
        DeviceExtension deviceExtension = this.device;
        int iHashCode4 = (iHashCode3 + (deviceExtension != null ? deviceExtension.hashCode() : 0)) * 31;
        OsExtension osExtension = this.os;
        int iHashCode5 = (iHashCode4 + (osExtension != null ? osExtension.hashCode() : 0)) * 31;
        AppExtension appExtension = this.app;
        int iHashCode6 = (iHashCode5 + (appExtension != null ? appExtension.hashCode() : 0)) * 31;
        NetExtension netExtension = this.net;
        int iHashCode7 = (iHashCode6 + (netExtension != null ? netExtension.hashCode() : 0)) * 31;
        SdkExtension sdkExtension = this.sdk;
        int iHashCode8 = (iHashCode7 + (sdkExtension != null ? sdkExtension.hashCode() : 0)) * 31;
        LocExtension locExtension = this.loc;
        return iHashCode8 + (locExtension != null ? locExtension.hashCode() : 0);
    }
}
