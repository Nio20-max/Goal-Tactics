package com.helpshift.campaigns.models;

import android.location.Location;
import android.text.TextUtils;
import com.helpshift.campaigns.util.constants.SyncStatus;
import com.helpshift.util.HSFormat;
import com.helpshift.util.LocationUtil;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;

/* JADX INFO: loaded from: classes.dex */
public class PropertyValue implements Serializable {
    private static final long serialVersionUID = 2;
    private Integer isSynced;
    private String type;
    private Object value;

    public static class ValueTypes {
        public static final String BOOLEAN = "b";
        public static final String DATE = "d";
        public static final String LOCATION = "l";
        public static final String NUMBER = "n";
        public static final String STRING = "s";
        public static final String UNKNOWN = "u";
    }

    public PropertyValue(Object obj) {
        this.value = obj;
        this.type = "u";
        this.isSynced = SyncStatus.UNSYNCED;
        if (obj instanceof String) {
            String strTrim = ((String) obj).trim();
            if (!TextUtils.isEmpty(strTrim)) {
                this.type = "s";
                this.value = strTrim;
            }
        } else if (obj instanceof Long) {
            this.type = "n";
        } else if (obj instanceof Boolean) {
            this.type = ValueTypes.BOOLEAN;
        } else if (obj instanceof Date) {
            this.type = "d";
        } else if (obj instanceof Location) {
            this.type = "l";
            this.value = LocationUtil.sanitizeLocation((Location) obj);
        }
        if (this.type.equals("u")) {
            this.value = null;
        }
    }

    public PropertyValue(String str, String str2) {
        this.type = str;
        if (str2 != null && str != null) {
            this.value = fromString(str2.trim());
        }
        if (this.value == null) {
            this.type = "u";
        }
        this.isSynced = SyncStatus.UNSYNCED;
    }

    public Object getValue() {
        return this.value;
    }

    public String getType() {
        return this.type;
    }

    public Integer getIsSynced() {
        return this.isSynced;
    }

    public void setIsSynced(Integer num) {
        if (num == null || !SyncStatus.valueSet.contains(num)) {
            return;
        }
        this.isSynced = num;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof PropertyValue)) {
            return false;
        }
        PropertyValue propertyValue = (PropertyValue) obj;
        return this.isSynced.equals(propertyValue.isSynced) && this.type.equals(propertyValue.type) && this.value.equals(propertyValue.value);
    }

    public String toString() {
        Object obj = this.value;
        if (obj == null) {
            return null;
        }
        String string = obj.toString();
        if (this.type.equals("d")) {
            return "" + ((Date) this.value).getTime();
        }
        if (!this.type.equals("l")) {
            return string;
        }
        Location location = (Location) this.value;
        return location.getLatitude() + "," + location.getLongitude();
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    private Object fromString(String str) {
        Object date;
        String str2 = this.type;
        str2.hashCode();
        byte b = -1;
        switch (str2.hashCode()) {
            case 98:
                if (str2.equals(ValueTypes.BOOLEAN)) {
                    b = 0;
                }
                break;
            case 100:
                if (str2.equals("d")) {
                    b = 1;
                }
                break;
            case 108:
                if (str2.equals("l")) {
                    b = 2;
                }
                break;
            case 110:
                if (str2.equals("n")) {
                    b = 3;
                }
                break;
            case 115:
                if (str2.equals("s")) {
                    b = 4;
                }
                break;
        }
        try {
            switch (b) {
                case 0:
                    return Boolean.valueOf(Boolean.parseBoolean(str));
                case 1:
                    date = new Date(Long.parseLong(str));
                    return date;
                case 2:
                    String[] strArrSplit = str.split(",");
                    Location location = new Location("");
                    location.setLatitude(Double.parseDouble(strArrSplit[0]));
                    location.setLongitude(Double.parseDouble(strArrSplit[1]));
                    date = LocationUtil.sanitizeLocation(location);
                    return date;
                case 3:
                    date = Long.valueOf(Long.parseLong(str));
                    return date;
                case 4:
                    if (!TextUtils.isEmpty(str)) {
                        return str;
                    }
                    break;
            }
        } catch (ArrayIndexOutOfBoundsException | NumberFormatException unused) {
        }
        return null;
    }

    public ArrayList getValueInfo() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(0, this.type);
        if (this.type.equals("l")) {
            Location location = (Location) this.value;
            arrayList.add(1, location.getLatitude() + "," + location.getLongitude());
        } else if (this.type.equals("d")) {
            arrayList.add(1, HSFormat.datePropertyTsFormat.format((Date) this.value));
        } else {
            arrayList.add(1, this.value);
        }
        return arrayList;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0036 A[PHI: r6
      0x0036: PHI (r6v2 java.lang.Object) = 
      (r6v0 java.lang.Object)
      (r6v0 java.lang.Object)
      (r6v0 java.lang.Object)
      (r6v6 java.lang.Object)
      (r6v6 java.lang.Object)
     binds: [B:42:0x009e, B:48:0x00bd, B:46:0x00b0, B:9:0x0028, B:11:0x0030] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean setValue(java.lang.Object r6) {
        /*
            Method dump skipped, instruction units count: 206
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.campaigns.models.PropertyValue.setValue(java.lang.Object):boolean");
    }

    public boolean setValue(PropertyValue propertyValue) {
        return setValue(propertyValue.value);
    }

    private void writeObject(ObjectOutputStream objectOutputStream) throws IOException {
        objectOutputStream.defaultWriteObject();
        objectOutputStream.writeObject(this.value);
        objectOutputStream.writeInt(this.isSynced.intValue());
        objectOutputStream.writeUTF(this.type);
    }

    private void readObject(ObjectInputStream objectInputStream) throws ClassNotFoundException, IOException {
        objectInputStream.defaultReadObject();
        this.value = objectInputStream.readObject();
        this.isSynced = Integer.valueOf(objectInputStream.readInt());
        this.type = objectInputStream.readUTF();
    }
}
