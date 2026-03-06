package com.google.android.gms.measurement.internal;

import android.os.Process;
import com.google.android.gms.common.internal.Preconditions;
import java.util.concurrent.BlockingQueue;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzfo extends Thread {
    final /* synthetic */ zzfp zza;
    private final Object zzb;
    private final BlockingQueue<zzfn<?>> zzc;
    private boolean zzd = false;

    public zzfo(zzfp zzfpVar, String str, BlockingQueue<zzfn<?>> blockingQueue) {
        this.zza = zzfpVar;
        Preconditions.checkNotNull(str);
        Preconditions.checkNotNull(blockingQueue);
        this.zzb = new Object();
        this.zzc = blockingQueue;
        setName(str);
    }

    private final void zzb() {
        synchronized (this.zza.zzh) {
            if (!this.zzd) {
                this.zza.zzi.release();
                this.zza.zzh.notifyAll();
                if (this == this.zza.zzb) {
                    this.zza.zzb = null;
                } else if (this == this.zza.zzc) {
                    this.zza.zzc = null;
                } else {
                    this.zza.zzs.zzay().zzd().zza("Current scheduler thread is neither worker nor network");
                }
                this.zzd = true;
            }
        }
    }

    private final void zzc(InterruptedException interruptedException) {
        this.zza.zzs.zzay().zzk().zzb(String.valueOf(getName()).concat(" was interrupted"), interruptedException);
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() {
        boolean z = false;
        while (!z) {
            try {
                this.zza.zzi.acquire();
                z = true;
            } catch (InterruptedException e) {
                zzc(e);
            }
        }
        try {
            int threadPriority = Process.getThreadPriority(Process.myTid());
            while (true) {
                zzfn<?> zzfnVarPoll = this.zzc.poll();
                if (zzfnVarPoll == null) {
                    synchronized (this.zzb) {
                        if (this.zzc.peek() == null) {
                            zzfp.zzr(this.zza);
                            try {
                                this.zzb.wait(30000L);
                            } catch (InterruptedException e2) {
                                zzc(e2);
                            }
                        }
                    }
                    synchronized (this.zza.zzh) {
                        if (this.zzc.peek() == null) {
                            break;
                        }
                    }
                } else {
                    Process.setThreadPriority(true != zzfnVarPoll.zza ? 10 : threadPriority);
                    zzfnVarPoll.run();
                }
            }
            if (this.zza.zzs.zzf().zzs(null, zzdw.zzak)) {
                zzb();
            }
        } finally {
            zzb();
        }
    }

    public final void zza() {
        synchronized (this.zzb) {
            this.zzb.notifyAll();
        }
    }
}
