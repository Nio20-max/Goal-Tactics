package com.google.android.gms.measurement.internal;

import android.content.Context;
import com.google.android.gms.common.internal.Preconditions;
import com.google.android.gms.common.util.Clock;
import org.checkerframework.dataflow.qual.Pure;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
class zzgl implements zzgn {
    protected final zzfs zzs;

    zzgl(zzfs zzfsVar) {
        Preconditions.checkNotNull(zzfsVar);
        this.zzs = zzfsVar;
    }

    @Override // com.google.android.gms.measurement.internal.zzgn
    @Pure
    public final Context zzau() {
        throw null;
    }

    @Override // com.google.android.gms.measurement.internal.zzgn
    @Pure
    public final Clock zzav() {
        throw null;
    }

    @Override // com.google.android.gms.measurement.internal.zzgn
    @Pure
    public final zzaa zzaw() {
        throw null;
    }

    public void zzax() {
        this.zzs.zzaz().zzax();
    }

    @Override // com.google.android.gms.measurement.internal.zzgn
    @Pure
    public final zzei zzay() {
        throw null;
    }

    @Override // com.google.android.gms.measurement.internal.zzgn
    @Pure
    public final zzfp zzaz() {
        throw null;
    }

    public void zzg() {
        this.zzs.zzaz().zzg();
    }
}
