package com.helpshift.util;

import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.net.Uri;
import com.ironsource.sdk.constants.Constants;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public class ImageUtil {
    private static final String TAG = "Helpshift_ImageUtil";
    private static final Set<String> resizableImageMimeTypes = new HashSet(Arrays.asList("image/jpeg", "image/png", "image/x-png", "image/x-citrix-pjpeg", "image/pjpeg"));
    private static Set<String> supportedImageMimeTypes = new HashSet(Arrays.asList("image/jpeg", "image/png", "image/bmp"));

    public static int calculateReqHeight(int i, int i2, int i3) {
        return (int) ((i2 / i) * i3);
    }

    public static boolean isSupportedImageMimeType(String str) {
        return supportedImageMimeTypes.contains(str);
    }

    public static boolean isImageFileFormatSupported(String str) {
        return isSupportedImageMimeType(AndroidFileUtil.getMimeType(str));
    }

    public static boolean isResizableImage(String str) {
        return resizableImageMimeTypes.contains(AndroidFileUtil.getMimeType(str));
    }

    public static boolean isResizableImage(Uri uri, Context context) {
        return resizableImageMimeTypes.contains(context.getContentResolver().getType(uri));
    }

    public static Bitmap getBitmap(String str, int i) {
        if (android.text.TextUtils.isEmpty(str)) {
            return null;
        }
        File file = new File(str);
        if (!file.canRead()) {
            return null;
        }
        int i2 = 3;
        int i3 = 1;
        int i4 = 0;
        do {
            try {
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inSampleSize = i3;
                options.inJustDecodeBounds = false;
                return BitmapFactory.decodeFile(file.getAbsolutePath(), options);
            } catch (OutOfMemoryError unused) {
                i3 = i > 0 ? i : i3 * 2;
                i4++;
            }
        } while (i4 != i2);
        return null;
    }

    public static Bitmap getBitmap(Resources resources, int i, int i2) {
        int i3 = 1;
        int i4 = 0;
        do {
            try {
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inSampleSize = i3;
                options.inJustDecodeBounds = false;
                return BitmapFactory.decodeResource(resources, i, options);
            } catch (OutOfMemoryError unused) {
                i3 = i2 > 0 ? i2 : i3 * 2;
                i4++;
            }
        } while (i4 != 3);
        return null;
    }

    private static Bitmap getBitmapWithMaxDimension(Bitmap bitmap, int i) {
        float fMax = i / Math.max(r1, r0);
        return fMax >= 1.0f ? bitmap : Bitmap.createScaledBitmap(bitmap, (int) (bitmap.getWidth() * fMax), (int) (bitmap.getHeight() * fMax), true);
    }

    public static void scaleDownAndSave(String str, int i) throws Throwable {
        if (android.text.TextUtils.isEmpty(str) || i <= 0) {
            return;
        }
        File file = new File(str);
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(file.getAbsolutePath(), options);
        int i2 = options.outHeight;
        float f = options.outWidth;
        int iSqrt = ((int) Math.sqrt(i * 25 * (f / r0))) * 100;
        options.inSampleSize = calculateInSampleSize(options, iSqrt, (int) (iSqrt * (i2 / f)));
        if (options.inSampleSize > 1) {
            options.inJustDecodeBounds = false;
            Bitmap bitmapDecodeFile = BitmapFactory.decodeFile(str, options);
            if (bitmapDecodeFile != null) {
                saveBitmapToFile(bitmapDecodeFile, str, AndroidFileUtil.getMimeType(str));
            }
        }
    }

    public static void scaleDownAndSaveWithMaxDimension(String str, int i) throws Throwable {
        scaleDownAndSaveWithMaxDimension(str, i, 0);
    }

    public static void scaleDownAndSaveWithMaxDimension(String str, int i, int i2) throws Throwable {
        if (android.text.TextUtils.isEmpty(str)) {
            return;
        }
        File file = new File(str);
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(file.getAbsolutePath(), options);
        int i3 = options.outHeight;
        int i4 = options.outWidth;
        float fMax = i / Math.max(i3, i4);
        if (fMax < 1.0f) {
            options.inSampleSize = calculateInSampleSize(options, (int) (i4 * fMax), (int) (i3 * fMax));
            options.inJustDecodeBounds = false;
            Bitmap bitmapDecodeFile = BitmapFactory.decodeFile(str, options);
            if (bitmapDecodeFile != null) {
                Bitmap bitmapWithMaxDimension = getBitmapWithMaxDimension(bitmapDecodeFile, i);
                if (i2 != 0) {
                    bitmapWithMaxDimension = rotateImage(bitmapWithMaxDimension, i2);
                }
                saveBitmapToFile(bitmapWithMaxDimension, str, AndroidFileUtil.getMimeType(str));
            }
        }
    }

    private static Bitmap rotateImage(Bitmap bitmap, int i) {
        Matrix matrix = new Matrix();
        matrix.preRotate(i);
        return Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, false);
    }

    public static int getExifOrientation(Context context, Uri uri) {
        Cursor cursorQuery = null;
        try {
            cursorQuery = context.getContentResolver().query(uri, new String[]{Constants.ParametersKeys.ORIENTATION}, null, null, null);
            if (cursorQuery != null && cursorQuery.moveToFirst()) {
                int i = cursorQuery.getInt(0);
                if (cursorQuery != null) {
                    cursorQuery.close();
                }
                return i;
            }
            if (cursorQuery != null) {
                cursorQuery.close();
            }
            return 0;
        } catch (Exception unused) {
            if (cursorQuery != null) {
                cursorQuery.close();
            }
            return 0;
        } catch (Throwable th) {
            if (cursorQuery != null) {
                cursorQuery.close();
            }
            throw th;
        }
    }

    public static int calculateInSampleSize(int i, int i2, int i3, int i4) {
        int i5 = 1;
        if (i2 > i4 || i > i3) {
            int i6 = i2 / 2;
            int i7 = i / 2;
            while (i6 / i5 > i4 && i7 / i5 > i3) {
                i5 *= 2;
            }
        }
        return i5;
    }

    public static int calculateInSampleSize(BitmapFactory.Options options, int i, int i2) {
        return calculateInSampleSize(options.outWidth, options.outHeight, i, i2);
    }

    private static void saveBitmapToFile(Bitmap bitmap, String str, String str2) throws Throwable {
        Bitmap.CompressFormat compressFormat;
        FileOutputStream fileOutputStream;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        if (str2.contains("png")) {
            compressFormat = Bitmap.CompressFormat.PNG;
        } else {
            compressFormat = Bitmap.CompressFormat.JPEG;
        }
        if (bitmap.compress(compressFormat, 70, byteArrayOutputStream)) {
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            FileOutputStream fileOutputStream2 = null;
            try {
                try {
                    fileOutputStream = new FileOutputStream(str, false);
                } catch (Throwable th) {
                    th = th;
                }
            } catch (IOException e) {
                e = e;
            }
            try {
                fileOutputStream.write(byteArray);
                fileOutputStream.flush();
                IOUtils.closeQuitely(byteArrayOutputStream);
                IOUtils.closeQuitely(fileOutputStream);
            } catch (IOException e2) {
                e = e2;
                fileOutputStream2 = fileOutputStream;
                HSLogger.d(TAG, "saveBitmapToFile : ", e);
                IOUtils.closeQuitely(byteArrayOutputStream);
                IOUtils.closeQuitely(fileOutputStream2);
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream2 = fileOutputStream;
                IOUtils.closeQuitely(byteArrayOutputStream);
                IOUtils.closeQuitely(fileOutputStream2);
                throw th;
            }
            return;
        }
        HSLogger.e(TAG, "saveBitmapToFile : Compression Failed");
    }

    public static Bitmap decodeFile(String str, int i) {
        if (!FileUtil.doesFilePathExistAndCanRead(str)) {
            return null;
        }
        BitmapFactory.Options options = new BitmapFactory.Options();
        if (i > 0) {
            int iCalculateReqHeight = calculateReqHeight(options.outWidth, options.outHeight, i);
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeFile(str, options);
            options.inSampleSize = calculateInSampleSize(options, i, iCalculateReqHeight);
            if (options.inSampleSize < 4) {
                options.inSampleSize++;
            }
        } else {
            options.inSampleSize = 4;
        }
        options.inJustDecodeBounds = false;
        return BitmapFactory.decodeFile(str, options);
    }

    public static Bitmap decodeAvatarImageFile(String str) {
        if (FileUtil.doesFilePathExistAndCanRead(str)) {
            return BitmapFactory.decodeFile(str, new BitmapFactory.Options());
        }
        return null;
    }
}
