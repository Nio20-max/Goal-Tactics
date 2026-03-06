package com.helpshift.support.imageloader;

import android.graphics.Bitmap;
import com.helpshift.util.Callback;
import com.helpshift.util.ImageUtil;

/* JADX INFO: loaded from: classes2.dex */
public class AvatarFilePathBitmapProvider extends FilePathBitmapProvider {
    @Override // com.helpshift.support.imageloader.FilePathBitmapProvider, com.helpshift.support.imageloader.BitmapProvider
    public /* bridge */ /* synthetic */ void getBitmap(int i, boolean z, Callback callback) {
        super.getBitmap(i, z, callback);
    }

    @Override // com.helpshift.support.imageloader.FilePathBitmapProvider, com.helpshift.support.imageloader.BitmapProvider
    public /* bridge */ /* synthetic */ String getSource() {
        return super.getSource();
    }

    AvatarFilePathBitmapProvider(String str) {
        super(str);
    }

    @Override // com.helpshift.support.imageloader.FilePathBitmapProvider
    protected Bitmap decodeFile(String str, int i) {
        return ImageUtil.decodeAvatarImageFile(str);
    }
}
