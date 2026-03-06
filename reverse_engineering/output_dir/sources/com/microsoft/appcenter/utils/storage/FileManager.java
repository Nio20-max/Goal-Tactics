package com.microsoft.appcenter.utils.storage;

import android.content.Context;
import android.text.TextUtils;
import com.microsoft.appcenter.utils.AppCenterLog;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;

/* JADX INFO: loaded from: classes2.dex */
public class FileManager {
    private static Context sContext;

    public static synchronized void initialize(Context context) {
        if (sContext == null) {
            sContext = context;
        }
    }

    public static String read(String path) {
        return read(new File(path));
    }

    public static String read(File file) {
        try {
            BufferedReader bufferedReader = new BufferedReader(new FileReader(file));
            try {
                String property = System.getProperty("line.separator");
                StringBuilder sb = new StringBuilder();
                String line = bufferedReader.readLine();
                if (line != null) {
                    sb.append(line);
                    while (true) {
                        String line2 = bufferedReader.readLine();
                        if (line2 == null) {
                            break;
                        }
                        sb.append(property);
                        sb.append(line2);
                    }
                }
                bufferedReader.close();
                return sb.toString();
            } catch (Throwable th) {
                bufferedReader.close();
                throw th;
            }
        } catch (IOException e) {
            AppCenterLog.error("AppCenter", "Could not read file " + file.getAbsolutePath(), e);
            return null;
        }
    }

    public static byte[] readBytes(File file) {
        byte[] bArr = new byte[(int) file.length()];
        try {
            FileInputStream fileInputStream = new FileInputStream(file);
            try {
                new DataInputStream(fileInputStream).readFully(bArr);
                return bArr;
            } finally {
                fileInputStream.close();
            }
        } catch (IOException e) {
            AppCenterLog.error("AppCenter", "Could not read file " + file.getAbsolutePath(), e);
            return null;
        }
    }

    public static void write(String path, String contents) throws IOException {
        write(new File(path), contents);
    }

    public static void write(File file, String contents) throws IOException {
        if (TextUtils.isEmpty(contents) || TextUtils.getTrimmedLength(contents) <= 0) {
            return;
        }
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file));
        try {
            bufferedWriter.write(contents);
        } finally {
            bufferedWriter.close();
        }
    }

    public static String[] getFilenames(String path, FilenameFilter filter) {
        File file = new File(path);
        return file.exists() ? file.list(filter) : new String[0];
    }

    public static File lastModifiedFile(String path, FilenameFilter filter) {
        return lastModifiedFile(new File(path), filter);
    }

    public static File lastModifiedFile(File dir, FilenameFilter filter) {
        File file = null;
        if (dir.exists()) {
            File[] fileArrListFiles = dir.listFiles(filter);
            long jLastModified = 0;
            if (fileArrListFiles != null) {
                for (File file2 : fileArrListFiles) {
                    if (file2.lastModified() > jLastModified) {
                        jLastModified = file2.lastModified();
                        file = file2;
                    }
                }
            }
        }
        return file;
    }

    public static boolean delete(String path) {
        return delete(new File(path));
    }

    public static boolean delete(File file) {
        return file.delete();
    }

    public static boolean deleteDirectory(File file) {
        File[] fileArrListFiles = file.listFiles();
        if (fileArrListFiles != null) {
            for (File file2 : fileArrListFiles) {
                deleteDirectory(file2);
            }
        }
        return file.delete();
    }

    public static void cleanDirectory(File directory) {
        File[] fileArrListFiles = directory.listFiles();
        if (fileArrListFiles != null) {
            for (File file : fileArrListFiles) {
                deleteDirectory(file);
            }
        }
    }

    public static void mkdir(String path) {
        new File(path).mkdirs();
    }
}
