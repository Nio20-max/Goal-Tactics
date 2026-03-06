package com.helpshift.common.platform;

import android.os.Environment;
import android.text.TextUtils;
import com.helpshift.common.dao.BackupDAO;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.IOUtils;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.HashMap;

/* JADX INFO: loaded from: classes2.dex */
public class AndroidBackupDAO implements BackupDAO {
    private final String BACKUP_FILE_NAME = "__hs__backup_dao_storage";
    private String externalDirectoryPath;

    @Override // com.helpshift.common.dao.BackupDAO
    public synchronized void storeValue(String str, Serializable serializable) {
        if (!TextUtils.isEmpty(str) && serializable != null) {
            HashMap<String, Serializable> mapRestoreHashMap = restoreHashMap();
            if (mapRestoreHashMap == null) {
                mapRestoreHashMap = new HashMap<>();
            }
            if (serializable.equals(mapRestoreHashMap.get(str))) {
                return;
            }
            mapRestoreHashMap.put(str, serializable);
            backupHashMap(mapRestoreHashMap);
        }
    }

    @Override // com.helpshift.common.dao.BackupDAO
    public synchronized Serializable getValue(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        HashMap<String, Serializable> mapRestoreHashMap = restoreHashMap();
        if (mapRestoreHashMap == null) {
            return null;
        }
        return mapRestoreHashMap.get(str);
    }

    @Override // com.helpshift.common.dao.BackupDAO
    public synchronized void removeKey(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        HashMap<String, Serializable> mapRestoreHashMap = restoreHashMap();
        if (mapRestoreHashMap != null && mapRestoreHashMap.containsKey(str)) {
            mapRestoreHashMap.remove(str);
            backupHashMap(mapRestoreHashMap);
        }
    }

    @Override // com.helpshift.common.dao.BackupDAO
    public synchronized void delete() {
        if (backupExists()) {
            try {
                File externalStoragePublicDirectory = Environment.getExternalStoragePublicDirectory(getExternalDirectoryPath());
                if (externalStoragePublicDirectory != null && externalStoragePublicDirectory.exists()) {
                    File file = new File(externalStoragePublicDirectory, "__hs__backup_dao_storage");
                    if (file.canWrite()) {
                        file.delete();
                    }
                }
            } catch (Exception unused) {
            }
        }
    }

    private void backupHashMap(HashMap<String, Serializable> map) throws Throwable {
        if (map == null) {
            return;
        }
        ObjectOutputStream objectOutputStream = null;
        try {
            File externalStoragePublicDirectory = Environment.getExternalStoragePublicDirectory(getExternalDirectoryPath());
            if (!externalStoragePublicDirectory.exists()) {
                externalStoragePublicDirectory.mkdirs();
            }
            if (externalStoragePublicDirectory.canWrite()) {
                ObjectOutputStream objectOutputStream2 = new ObjectOutputStream(new FileOutputStream(new File(externalStoragePublicDirectory, "__hs__backup_dao_storage")));
                try {
                    objectOutputStream2.writeObject(map);
                } catch (Exception unused) {
                } catch (Throwable th) {
                    th = th;
                    objectOutputStream = objectOutputStream2;
                    IOUtils.closeQuitely(objectOutputStream);
                    throw th;
                }
                objectOutputStream = objectOutputStream2;
            }
        } catch (Exception unused2) {
        } catch (Throwable th2) {
            th = th2;
        }
        IOUtils.closeQuitely(objectOutputStream);
    }

    private HashMap<String, Serializable> restoreHashMap() throws Throwable {
        Throwable th;
        ObjectInputStream objectInputStream;
        HashMap<String, Serializable> map;
        ObjectInputStream objectInputStream2 = null;
        if (!backupExists()) {
            return null;
        }
        try {
            File externalStoragePublicDirectory = Environment.getExternalStoragePublicDirectory(getExternalDirectoryPath());
            if (externalStoragePublicDirectory.canRead()) {
                objectInputStream = new ObjectInputStream(new FileInputStream(new File(externalStoragePublicDirectory, "__hs__backup_dao_storage")));
                try {
                    map = (HashMap) objectInputStream.readObject();
                    objectInputStream2 = objectInputStream;
                } catch (Exception unused) {
                    IOUtils.closeQuitely(objectInputStream);
                    return null;
                } catch (Throwable th2) {
                    th = th2;
                    IOUtils.closeQuitely(objectInputStream);
                    throw th;
                }
            } else {
                map = null;
            }
            IOUtils.closeQuitely(objectInputStream2);
            return map;
        } catch (Exception unused2) {
            objectInputStream = null;
        } catch (Throwable th3) {
            th = th3;
            objectInputStream = null;
        }
    }

    private boolean backupExists() {
        try {
            return new File(Environment.getExternalStoragePublicDirectory(getExternalDirectoryPath()), "__hs__backup_dao_storage").exists();
        } catch (Exception unused) {
            return false;
        }
    }

    private String getExternalDirectoryPath() {
        if (this.externalDirectoryPath == null) {
            this.externalDirectoryPath = ".backups/" + HelpshiftContext.getApplicationContext().getPackageName() + "/helpshift/databases/";
        }
        return this.externalDirectoryPath;
    }
}
