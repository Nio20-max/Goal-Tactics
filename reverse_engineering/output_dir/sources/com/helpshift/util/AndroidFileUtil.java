package com.helpshift.util;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.webkit.MimeTypeMap;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.google.firebase.messaging.ServiceStarter;
import com.helpshift.analytics.AnalyticsEventKey;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public class AndroidFileUtil {
    public static final String TAG = "AndroidFileUtil";
    private static final Set<String> imageMimeTypes = new HashSet(Arrays.asList("image/jpeg", "image/png", "image/gif", "image/x-png", "image/x-citrix-pjpeg", "image/x-citrix-gif", "image/pjpeg"));

    public static boolean isSupportedMimeType(String str) {
        return imageMimeTypes.contains(str);
    }

    public static void saveFile(URL url, File file) throws Throwable {
        FileOutputStream fileOutputStream;
        InputStream inputStream = null;
        try {
            InputStream inputStreamOpenStream = url.openStream();
            try {
                fileOutputStream = new FileOutputStream(file);
                try {
                    byte[] bArr = new byte[ServiceStarter.ERROR_UNKNOWN];
                    while (true) {
                        int i = inputStreamOpenStream.read(bArr, 0, ServiceStarter.ERROR_UNKNOWN);
                        if (i < 0) {
                            break;
                        } else {
                            fileOutputStream.write(bArr, 0, i);
                        }
                    }
                    IOUtils.closeQuitely(inputStreamOpenStream);
                } catch (Exception e) {
                    e = e;
                    inputStream = inputStreamOpenStream;
                    try {
                        HSLogger.d(TAG, "saveFile Exception :", e);
                        IOUtils.closeQuitely(inputStream);
                    } catch (Throwable th) {
                        th = th;
                        IOUtils.closeQuitely(inputStream);
                        IOUtils.closeQuitely(fileOutputStream);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    inputStream = inputStreamOpenStream;
                    IOUtils.closeQuitely(inputStream);
                    IOUtils.closeQuitely(fileOutputStream);
                    throw th;
                }
            } catch (Exception e2) {
                e = e2;
                fileOutputStream = null;
            } catch (Throwable th3) {
                th = th3;
                fileOutputStream = null;
            }
        } catch (Exception e3) {
            e = e3;
            fileOutputStream = null;
        } catch (Throwable th4) {
            th = th4;
            fileOutputStream = null;
        }
        IOUtils.closeQuitely(fileOutputStream);
    }

    public static String getMimeType(URL url) {
        try {
            return url.openConnection().getContentType();
        } catch (Exception e) {
            HSLogger.d(TAG, "openConnection() Exception :", e);
            return null;
        }
    }

    public static String getMimeType(String str) {
        try {
            return getMimeType(new URL("file://" + str));
        } catch (MalformedURLException e) {
            HSLogger.d(TAG, "error in getting mimeType :", e);
            return null;
        }
    }

    public static String getFileExtension(String str) {
        if (StringUtils.isEmpty(str)) {
            return null;
        }
        int iLastIndexOf = str.lastIndexOf(47);
        int iLastIndexOf2 = str.lastIndexOf(46);
        if (iLastIndexOf2 <= 0 || iLastIndexOf2 >= str.length() - 1 || iLastIndexOf >= iLastIndexOf2) {
            return null;
        }
        return str.substring(iLastIndexOf2 + 1);
    }

    public static boolean doesFileFromUriExistAndCanRead(Uri uri, Context context) {
        try {
            ParcelFileDescriptor parcelFileDescriptorOpenFileDescriptor = context.getContentResolver().openFileDescriptor(uri, AnalyticsEventKey.SMART_INTENT_SEARCH_RANK);
            boolean z = parcelFileDescriptorOpenFileDescriptor != null;
            if (parcelFileDescriptorOpenFileDescriptor != null) {
                try {
                    parcelFileDescriptorOpenFileDescriptor.close();
                } catch (IOException unused) {
                }
            }
            return z;
        } catch (Exception e) {
            HSLogger.d(TAG, "Unable to open input file descriptor for doesFileFromUriExistAndCanRead: " + uri, e);
            return false;
        }
    }

    public static String getFileExtensionFromMimeType(Context context, Uri uri) {
        if (FirebaseAnalytics.Param.CONTENT.equals(uri.getScheme())) {
            return MimeTypeMap.getSingleton().getExtensionFromMimeType(context.getContentResolver().getType(uri));
        }
        return MimeTypeMap.getFileExtensionFromUrl(Uri.fromFile(new File(uri.getPath())).toString());
    }

    public static String getFileExtensionFromFileName(String str) {
        int iLastIndexOf;
        if (StringUtils.isEmpty(str) || (iLastIndexOf = str.lastIndexOf(46)) <= 0 || iLastIndexOf >= str.length() - 1) {
            return null;
        }
        String strSubstring = str.substring(iLastIndexOf + 1);
        if (strSubstring.indexOf(47) >= 0) {
            return null;
        }
        return strSubstring;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0 */
    /* JADX WARN: Type inference failed for: r0v1 */
    /* JADX WARN: Type inference failed for: r0v2, types: [android.database.Cursor] */
    public static String getFileExtension(Context context, Uri uri) throws Throwable {
        Cursor cursorQuery;
        ?? r0 = 0;
        if (uri != null) {
            try {
                if (context != null) {
                    try {
                        cursorQuery = context.getContentResolver().query(uri, null, null, null, null);
                        if (cursorQuery != null) {
                            try {
                                if (cursorQuery.moveToFirst()) {
                                    String fileExtensionFromFileName = getFileExtensionFromFileName(cursorQuery.getString(cursorQuery.getColumnIndex("_display_name")));
                                    if (cursorQuery != null) {
                                        cursorQuery.close();
                                    }
                                    return fileExtensionFromFileName;
                                }
                            } catch (Exception unused) {
                                HSLogger.e(TAG, "Unable to detect file extension via Uri");
                                if (cursorQuery != null) {
                                }
                                return null;
                            }
                        }
                    } catch (Exception unused2) {
                        cursorQuery = null;
                    } catch (Throwable th) {
                        th = th;
                        if (r0 != 0) {
                            r0.close();
                        }
                        throw th;
                    }
                    if (cursorQuery != null) {
                        cursorQuery.close();
                    }
                    return null;
                }
            } catch (Throwable th2) {
                th = th2;
                r0 = context;
            }
        }
        return null;
    }
}
