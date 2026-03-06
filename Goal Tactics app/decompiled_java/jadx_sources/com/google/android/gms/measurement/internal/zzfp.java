package com.google.android.gms.measurement.internal;

import com.google.android.gms.common.internal.Preconditions;
import java.lang.Thread;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.Semaphore;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
public final class zzfp extends zzgm {
    private static final AtomicLong zza = new AtomicLong(Long.MIN_VALUE);
    private zzfo zzb;
    private zzfo zzc;
    private final PriorityBlockingQueue<zzfn<?>> zzd;
    private final BlockingQueue<zzfn<?>> zze;
    private final Thread.UncaughtExceptionHandler zzf;
    private final Thread.UncaughtExceptionHandler zzg;
    private final Object zzh;
    private final Semaphore zzi;
    private volatile boolean zzj;

    zzfp(zzfs zzfsVar) {
        super(zzfsVar);
        this.zzh = new Object();
        this.zzi = new Semaphore(2);
        this.zzd = new PriorityBlockingQueue<>();
        this.zze = new LinkedBlockingQueue();
        this.zzf = new zzfm(this, "Thread death: Uncaught exception on worker thread");
        this.zzg = new zzfm(this, "Thread death: Uncaught exception on network thread");
    }

    static /* bridge */ /* synthetic */ boolean zzr(zzfp zzfpVar) {
        boolean z = zzfpVar.zzj;
        return false;
    }

    private final void zzt(zzfn<?> zzfnVar) {
        synchronized (this.zzh) {
            this.zzd.add(zzfnVar);
            zzfo zzfoVar = this.zzb;
            if (zzfoVar == null) {
                zzfo zzfoVar2 = new zzfo(this, "Measurement Worker", this.zzd);
                this.zzb = zzfoVar2;
                zzfoVar2.setUncaughtExceptionHandler(this.zzf);
                this.zzb.start();
            } else {
                zzfoVar.zza();
            }
        }
    }

    @Override // com.google.android.gms.measurement.internal.zzgl
    public final void zzax() {
        if (Thread.currentThread() != this.zzc) {
            throw new IllegalStateException("Call expected from network thread");
        }
    }

    final <T> T zzd(AtomicReference<T> atomicReference, long j, String str, Runnable runnable) {
        synchronized (atomicReference) {
            this.zzs.zzaz().zzp(runnable);
            try {
                atomicReference.wait(j);
            } catch (InterruptedException unused) {
                this.zzs.zzay().zzk().zza(str.length() != 0 ? "Interrupted waiting for ".concat(str) : new String("Interrupted waiting for "));
                return null;
            }
        }
        T t = atomicReference.get();
        if (t == null) {
            this.zzs.zzay().zzk().zza(str.length() != 0 ? "Timed out waiting for ".concat(str) : new String("Timed out waiting for "));
        }
        return t;
    }

    @Override // com.google.android.gms.measurement.internal.zzgm
    protected final boolean zzf() {
        return false;
    }

    @Override // com.google.android.gms.measurement.internal.zzgl
    public final void zzg() {
        if (Thread.currentThread() != this.zzb) {
            throw new IllegalStateException("Call expected from worker thread");
        }
    }

    public final <V> Future<V> zzh(Callable<V> callable) throws IllegalStateException {
        zzu();
        Preconditions.checkNotNull(callable);
        zzfn<?> zzfnVar = new zzfn<>(this, (Callable<?>) callable, false, "Task exception on worker thread");
        if (Thread.currentThread() == this.zzb) {
            if (!this.zzd.isEmpty()) {
                this.zzs.zzay().zzk().zza("Callable skipped the worker queue.");
            }
            zzfnVar.run();
        } else {
            zzt(zzfnVar);
        }
        return zzfnVar;
    }

    public final <V> Future<V> zzi(Callable<V> callable) throws IllegalStateException {
        zzu();
        Preconditions.checkNotNull(callable);
        zzfn<?> zzfnVar = new zzfn<>(this, (Callable<?>) callable, true, "Task exception on worker thread");
        if (Thread.currentThread() == this.zzb) {
            zzfnVar.run();
        } else {
            zzt(zzfnVar);
        }
        return zzfnVar;
    }

    public final void zzo(Runnable runnable) throws IllegalStateException {
        zzu();
        Preconditions.checkNotNull(runnable);
        zzfn<?> zzfnVar = new zzfn<>(this, runnable, false, "Task exception on network thread");
        synchronized (this.zzh) {
            this.zze.add(zzfnVar);
            zzfo zzfoVar = this.zzc;
            if (zzfoVar == null) {
                zzfo zzfoVar2 = new zzfo(this, "Measurement Network", this.zze);
                this.zzc = zzfoVar2;
                zzfoVar2.setUncaughtExceptionHandler(this.zzg);
                this.zzc.start();
            } else {
                zzfoVar.zza();
            }
        }
    }

    public final void zzp(Runnable runnable) throws IllegalStateException {
        zzu();
        Preconditions.checkNotNull(runnable);
        zzt(new zzfn<>(this, runnable, false, "Task exception on worker thread"));
    }

    public final void zzq(Runnable runnable) throws IllegalStateException {
        zzu();
        Preconditions.checkNotNull(runnable);
        zzt(new zzfn<>(this, runnable, true, "Task exception on worker thread"));
    }

    public final boolean zzs() {
        return Thread.currentThread() == this.zzb;
    }
}
