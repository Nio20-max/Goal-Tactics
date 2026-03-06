package com.helpshift.util;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.provider.MediaStore;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public class AttachmentDataProvider {
    public static final int PICK_ATTACHMENT_REQUEST_ID = 1;
    public static final int PICK_ATTACHMENT_WITHOUT_PERMISSIONS_REQUEST_ID = 2;

    public static Intent getIntentForAttachmentType(Context context, int i, int i2, List<String> list) {
        if (i == 1) {
            return getIntentForImage(context, i2);
        }
        if (i == 2) {
            return getIntentForVideo(context, i2);
        }
        if (i == 3) {
            return getIntentForDocument(i2, list);
        }
        return null;
    }

    private static Intent getIntentForDocument(int i, List<String> list) {
        Intent intent;
        if (i == 2 && Build.VERSION.SDK_INT >= 19) {
            intent = new Intent("android.intent.action.OPEN_DOCUMENT");
            intent.setType(AttachmentConstants.ALLOW_ALL_MIME);
            intent.addFlags(1);
            intent.putExtra("android.intent.extra.LOCAL_ONLY", true);
        } else {
            intent = new Intent("android.intent.action.GET_CONTENT");
            intent.setType(AttachmentConstants.ALLOW_ALL_MIME);
            intent.putExtra("android.intent.extra.LOCAL_ONLY", true);
        }
        Set<String> mIMEForDocument = getMIMEForDocument(list);
        if (Build.VERSION.SDK_INT >= 19) {
            String[] strArr = new String[mIMEForDocument.size()];
            int i2 = 0;
            Iterator<String> it = mIMEForDocument.iterator();
            while (it.hasNext()) {
                strArr[i2] = it.next();
                i2++;
            }
            intent.putExtra("android.intent.extra.MIME_TYPES", strArr);
        } else {
            intent.setType(android.text.TextUtils.join("|", mIMEForDocument));
        }
        return intent;
    }

    private static Intent getIntentForImage(Context context, int i) {
        return getIntentForMedia(context, "image/*", MediaStore.Images.Media.EXTERNAL_CONTENT_URI, i);
    }

    private static Intent getIntentForVideo(Context context, int i) {
        return getIntentForMedia(context, "video/*", MediaStore.Video.Media.EXTERNAL_CONTENT_URI, i);
    }

    private static Intent getIntentForMedia(Context context, String str, Uri uri, int i) {
        if (i == 2 && Build.VERSION.SDK_INT >= 19) {
            Intent intent = new Intent("android.intent.action.OPEN_DOCUMENT");
            intent.setType(str);
            intent.addFlags(1);
            intent.putExtra("android.intent.extra.LOCAL_ONLY", true);
            return intent;
        }
        Intent intent2 = new Intent("android.intent.action.PICK", uri);
        intent2.setDataAndType(uri, str);
        if (intent2.resolveActivity(context.getPackageManager()) != null) {
            return intent2;
        }
        Intent intent3 = new Intent("android.intent.action.GET_CONTENT");
        intent3.setType(str);
        intent3.putExtra("android.intent.extra.LOCAL_ONLY", true);
        return intent3;
    }

    private static Set<String> getMIMEForDocument(List<String> list) {
        HashSet hashSet = new HashSet();
        for (String str : list) {
            if (!str.startsWith(AttachmentConstants.IMAGE_MIME_PREFIX) && !str.startsWith(AttachmentConstants.VIDEO_MIME_PREFIX)) {
                hashSet.add(str);
            }
        }
        hashSet.add(AttachmentConstants.UNKNOWN_FILE_MIME);
        return hashSet;
    }
}
