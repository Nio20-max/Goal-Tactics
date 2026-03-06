package com.google.android.gms.common.util.concurrent;

import com.google.android.gms.common.internal.Preconditions;
import com.ironsource.sdk.constants.Constants;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: com.google.android.gms:play-services-basement@@18.1.0 */
/* JADX INFO: loaded from: classes.dex */
public class NumberedThreadFactory implements ThreadFactory {
    private final String zza;
    private final AtomicInteger zzb = new AtomicInteger();
    private final ThreadFactory zzc = Executors.defaultThreadFactory();

    public NumberedThreadFactory(String str) {
        Preconditions.checkNotNull(str, "Name must not be null");
        this.zza = str;
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        Thread threadNewThread = this.zzc.newThread(new zza(runnable, 0));
        threadNewThread.setName(this.zza + Constants.RequestParameters.LEFT_BRACKETS + this.zzb.getAndIncrement() + Constants.RequestParameters.RIGHT_BRACKETS);
        return threadNewThread;
    }
}
