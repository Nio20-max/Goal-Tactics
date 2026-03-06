package com.facebook.internal;

import android.net.Uri;
import com.facebook.LoggingBehavior;
import com.facebook.appevents.internal.ViewHierarchyConstants;
import com.facebook.internal.FileLruCache;
import com.facebook.share.internal.ShareConstants;
import java.io.Closeable;
import java.io.IOException;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.text.Charsets;

/* JADX INFO: compiled from: UrlRedirectCache.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\bÆ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u001c\u0010\b\u001a\u00020\t2\b\u0010\n\u001a\u0004\u0018\u00010\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u000bH\u0007J\b\u0010\r\u001a\u00020\tH\u0007J\b\u0010\u000e\u001a\u00020\u0007H\u0007J\u0014\u0010\u000f\u001a\u0004\u0018\u00010\u000b2\b\u0010\u0010\u001a\u0004\u0018\u00010\u000bH\u0007R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u0011"}, d2 = {"Lcom/facebook/internal/UrlRedirectCache;", "", "()V", "redirectContentTag", "", ViewHierarchyConstants.TAG_KEY, "urlRedirectFileLruCache", "Lcom/facebook/internal/FileLruCache;", "cacheUriRedirect", "", "fromUri", "Landroid/net/Uri;", "toUri", "clearCache", "getCache", "getRedirectedUri", ShareConstants.MEDIA_URI, "facebook-core_release"}, k = 1, mv = {1, 5, 1}, xi = 48)
public final class UrlRedirectCache {
    public static final UrlRedirectCache INSTANCE = new UrlRedirectCache();
    private static final String redirectContentTag;
    private static final String tag;
    private static FileLruCache urlRedirectFileLruCache;

    private UrlRedirectCache() {
    }

    static {
        String simpleName = Reflection.getOrCreateKotlinClass(UrlRedirectCache.class).getSimpleName();
        if (simpleName == null) {
            simpleName = "UrlRedirectCache";
        }
        tag = simpleName;
        redirectContentTag = Intrinsics.stringPlus(simpleName, "_Redirect");
    }

    @JvmStatic
    public static final synchronized FileLruCache getCache() throws IOException {
        FileLruCache fileLruCache;
        fileLruCache = urlRedirectFileLruCache;
        if (fileLruCache == null) {
            fileLruCache = new FileLruCache(tag, new FileLruCache.Limits());
        }
        urlRedirectFileLruCache = fileLruCache;
        return fileLruCache;
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x005e, code lost:
    
        if (kotlin.jvm.internal.Intrinsics.areEqual(r3, r11) == false) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0060, code lost:
    
        r5 = r7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0062, code lost:
    
        com.facebook.internal.Logger.INSTANCE.log(com.facebook.LoggingBehavior.CACHE, 6, com.facebook.internal.UrlRedirectCache.tag, "A loop detected in UrlRedirectCache");
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x006e, code lost:
    
        r11 = com.facebook.internal.Utility.INSTANCE;
        com.facebook.internal.Utility.closeQuietly(r7);
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0075, code lost:
    
        return null;
     */
    @kotlin.jvm.JvmStatic
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final android.net.Uri getRedirectedUri(android.net.Uri r11) {
        /*
            r0 = 0
            if (r11 != 0) goto L4
            return r0
        L4:
            java.lang.String r11 = r11.toString()
            java.lang.String r1 = "uri.toString()"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r11, r1)
            java.util.HashSet r1 = new java.util.HashSet
            r1.<init>()
            r1.add(r11)
            com.facebook.internal.FileLruCache r2 = getCache()     // Catch: java.lang.Throwable -> La2 java.io.IOException -> La4
            java.lang.String r3 = com.facebook.internal.UrlRedirectCache.redirectContentTag     // Catch: java.lang.Throwable -> La2 java.io.IOException -> La4
            java.io.InputStream r3 = r2.get(r11, r3)     // Catch: java.lang.Throwable -> La2 java.io.IOException -> La4
            r4 = 0
            r5 = r0
            r6 = 0
        L23:
            if (r3 == 0) goto L8c
            r6 = 1
            java.io.InputStreamReader r7 = new java.io.InputStreamReader     // Catch: java.io.IOException -> L8a java.lang.Throwable -> Lbc
            r7.<init>(r3)     // Catch: java.io.IOException -> L8a java.lang.Throwable -> Lbc
            r3 = 128(0x80, float:1.8E-43)
            char[] r5 = new char[r3]     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            java.lang.StringBuilder r8 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            r8.<init>()     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            int r9 = r7.read(r5, r4, r3)     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
        L38:
            if (r9 <= 0) goto L42
            r8.append(r5, r4, r9)     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            int r9 = r7.read(r5, r4, r3)     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            goto L38
        L42:
            com.facebook.internal.Utility r3 = com.facebook.internal.Utility.INSTANCE     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            r3 = r7
            java.io.Closeable r3 = (java.io.Closeable) r3     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            com.facebook.internal.Utility.closeQuietly(r3)     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            java.lang.String r3 = r8.toString()     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            java.lang.String r5 = "urlBuilder.toString()"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r3, r5)     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            boolean r5 = r1.contains(r3)     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            if (r5 == 0) goto L76
            boolean r1 = kotlin.jvm.internal.Intrinsics.areEqual(r3, r11)     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            if (r1 == 0) goto L62
            r5 = r7
            goto L8c
        L62:
            com.facebook.internal.Logger$Companion r11 = com.facebook.internal.Logger.INSTANCE     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            com.facebook.LoggingBehavior r1 = com.facebook.LoggingBehavior.CACHE     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            r2 = 6
            java.lang.String r3 = com.facebook.internal.UrlRedirectCache.tag     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            java.lang.String r4 = "A loop detected in UrlRedirectCache"
            r11.log(r1, r2, r3, r4)     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            com.facebook.internal.Utility r11 = com.facebook.internal.Utility.INSTANCE
            java.io.Closeable r7 = (java.io.Closeable) r7
            com.facebook.internal.Utility.closeQuietly(r7)
            return r0
        L76:
            r1.add(r3)     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            java.lang.String r11 = com.facebook.internal.UrlRedirectCache.redirectContentTag     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            java.io.InputStream r11 = r2.get(r3, r11)     // Catch: java.lang.Throwable -> L84 java.io.IOException -> L87
            r5 = r7
            r10 = r3
            r3 = r11
            r11 = r10
            goto L23
        L84:
            r11 = move-exception
            r0 = r7
            goto Lbe
        L87:
            r11 = move-exception
            r5 = r7
            goto La6
        L8a:
            r11 = move-exception
            goto La6
        L8c:
            if (r6 == 0) goto L9a
            android.net.Uri r11 = android.net.Uri.parse(r11)     // Catch: java.io.IOException -> L8a java.lang.Throwable -> Lbc
            com.facebook.internal.Utility r0 = com.facebook.internal.Utility.INSTANCE
            java.io.Closeable r5 = (java.io.Closeable) r5
            com.facebook.internal.Utility.closeQuietly(r5)
            return r11
        L9a:
            com.facebook.internal.Utility r11 = com.facebook.internal.Utility.INSTANCE
            java.io.Closeable r5 = (java.io.Closeable) r5
            com.facebook.internal.Utility.closeQuietly(r5)
            goto Lbb
        La2:
            r11 = move-exception
            goto Lbe
        La4:
            r11 = move-exception
            r5 = r0
        La6:
            com.facebook.internal.Logger$Companion r1 = com.facebook.internal.Logger.INSTANCE     // Catch: java.lang.Throwable -> Lbc
            com.facebook.LoggingBehavior r2 = com.facebook.LoggingBehavior.CACHE     // Catch: java.lang.Throwable -> Lbc
            r3 = 4
            java.lang.String r4 = com.facebook.internal.UrlRedirectCache.tag     // Catch: java.lang.Throwable -> Lbc
            java.lang.String r6 = "IOException when accessing cache: "
            java.lang.String r11 = r11.getMessage()     // Catch: java.lang.Throwable -> Lbc
            java.lang.String r11 = kotlin.jvm.internal.Intrinsics.stringPlus(r6, r11)     // Catch: java.lang.Throwable -> Lbc
            r1.log(r2, r3, r4, r11)     // Catch: java.lang.Throwable -> Lbc
            goto L9a
        Lbb:
            return r0
        Lbc:
            r11 = move-exception
            r0 = r5
        Lbe:
            com.facebook.internal.Utility r1 = com.facebook.internal.Utility.INSTANCE
            java.io.Closeable r0 = (java.io.Closeable) r0
            com.facebook.internal.Utility.closeQuietly(r0)
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: com.facebook.internal.UrlRedirectCache.getRedirectedUri(android.net.Uri):android.net.Uri");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0 */
    /* JADX WARN: Type inference failed for: r0v1 */
    /* JADX WARN: Type inference failed for: r0v2 */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v5, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r0v6, types: [java.io.OutputStream] */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9 */
    @JvmStatic
    public static final void cacheUriRedirect(Uri fromUri, Uri toUri) {
        ?? r0;
        if (fromUri == null || toUri == null) {
            return;
        }
        ?? OpenPutStream = 0;
        OpenPutStream = 0;
        try {
            try {
                FileLruCache cache = getCache();
                String string = fromUri.toString();
                Intrinsics.checkNotNullExpressionValue(string, "fromUri.toString()");
                OpenPutStream = cache.openPutStream(string, redirectContentTag);
                String string2 = toUri.toString();
                Intrinsics.checkNotNullExpressionValue(string2, "toUri.toString()");
                byte[] bytes = string2.getBytes(Charsets.UTF_8);
                Intrinsics.checkNotNullExpressionValue(bytes, "(this as java.lang.String).getBytes(charset)");
                OpenPutStream.write(bytes);
                r0 = OpenPutStream;
            } catch (IOException e) {
                Logger.INSTANCE.log(LoggingBehavior.CACHE, 4, tag, Intrinsics.stringPlus("IOException when accessing cache: ", e.getMessage()));
                r0 = OpenPutStream;
            }
        } finally {
            Utility utility = Utility.INSTANCE;
            Utility.closeQuietly((Closeable) OpenPutStream);
        }
    }

    @JvmStatic
    public static final void clearCache() {
        try {
            getCache().clearCache();
        } catch (IOException e) {
            Logger.INSTANCE.log(LoggingBehavior.CACHE, 5, tag, Intrinsics.stringPlus("clearCache failed ", e.getMessage()));
        }
    }
}
