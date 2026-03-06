package com.helpshift.util;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import androidx.core.content.FileProvider;
import java.io.File;

/* JADX INFO: loaded from: classes2.dex */
public class IntentUtil {
    public static Intent createFileProviderIntent(Context context, File file, String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        Uri uriForFile = FileProvider.getUriForFile(context, context.getApplicationContext().getPackageName() + ".helpshift.fileprovider", file);
        intent.setFlags(1);
        intent.setDataAndType(uriForFile, str);
        return intent;
    }
}
