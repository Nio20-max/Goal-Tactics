package com.helpshift.support.imageloader;

import android.graphics.Bitmap;
import android.graphics.ImageDecoder;
import android.net.Uri;
import android.util.Size;
import com.helpshift.util.Callback;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.ImageUtil;
import java.io.IOException;

/* JADX INFO: loaded from: classes2.dex */
class UriBitmapProvider implements BitmapProvider {
    private static final String TAG = "Helpshift_UriBtmpPrvdr";
    private Uri fileUri;

    UriBitmapProvider(Uri uri) {
        this.fileUri = uri;
    }

    @Override // com.helpshift.support.imageloader.BitmapProvider
    public void getBitmap(final int i, final boolean z, Callback<Bitmap, String> callback) {
        try {
            ImageDecoder.Source sourceCreateSource = ImageDecoder.createSource(HelpshiftContext.getApplicationContext().getContentResolver(), this.fileUri);
            ImageDecoder.OnHeaderDecodedListener onHeaderDecodedListener = new ImageDecoder.OnHeaderDecodedListener() { // from class: com.helpshift.support.imageloader.UriBitmapProvider.1
                @Override // android.graphics.ImageDecoder.OnHeaderDecodedListener
                public void onHeaderDecoded(ImageDecoder imageDecoder, ImageDecoder.ImageInfo imageInfo, ImageDecoder.Source source) {
                    Size size = imageInfo.getSize();
                    int width = size.getWidth();
                    int height = size.getHeight();
                    int i2 = i;
                    int i3 = 4;
                    if (i2 > 0 && width > 0 && height > 0) {
                        int iCalculateInSampleSize = ImageUtil.calculateInSampleSize(width, height, i, ImageUtil.calculateReqHeight(width, height, i2));
                        if (iCalculateInSampleSize < 4) {
                            iCalculateInSampleSize++;
                        }
                        i3 = iCalculateInSampleSize;
                    }
                    if (!z) {
                        imageDecoder.setAllocator(1);
                    }
                    imageDecoder.setTargetSampleSize(i3);
                }
            };
            HSLogger.d(TAG, "Image downloaded from file URI: " + this.fileUri);
            callback.onSuccess(ImageDecoder.decodeBitmap(sourceCreateSource, onHeaderDecodedListener));
        } catch (IOException unused) {
            callback.onFailure("Error while building bitmap from uri: " + this.fileUri.toString());
        }
    }

    @Override // com.helpshift.support.imageloader.BitmapProvider
    public String getSource() {
        return this.fileUri.toString();
    }
}
