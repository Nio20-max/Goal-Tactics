package com.google.android.gms.measurement.internal;

import android.app.Activity;
import android.os.Bundle;
import com.google.android.gms.common.internal.Preconditions;
import com.google.firebase.analytics.FirebaseAnalytics;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
public final class zzij extends zzf {
    protected zzic zza;
    private volatile zzic zzb;
    private volatile zzic zzc;
    private final Map<Activity, zzic> zzd;
    private Activity zze;
    private volatile boolean zzf;
    private volatile zzic zzg;
    private zzic zzh;
    private boolean zzi;
    private final Object zzj;
    private zzic zzk;
    private String zzl;

    public zzij(zzfs zzfsVar) {
        super(zzfsVar);
        this.zzj = new Object();
        this.zzd = new ConcurrentHashMap();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzB(zzic zzicVar, zzic zzicVar2, long j, boolean z, Bundle bundle) {
        long j2;
        long j3;
        zzg();
        boolean z2 = false;
        boolean z3 = (zzicVar2 != null && zzicVar2.zzc == zzicVar.zzc && zzku.zzak(zzicVar2.zzb, zzicVar.zzb) && zzku.zzak(zzicVar2.zza, zzicVar.zza)) ? false : true;
        if (z && this.zza != null) {
            z2 = true;
        }
        if (z3) {
            Bundle bundle2 = bundle != null ? new Bundle(bundle) : new Bundle();
            zzku.zzJ(zzicVar, bundle2, true);
            if (zzicVar2 != null) {
                String str = zzicVar2.zza;
                if (str != null) {
                    bundle2.putString("_pn", str);
                }
                String str2 = zzicVar2.zzb;
                if (str2 != null) {
                    bundle2.putString("_pc", str2);
                }
                bundle2.putLong("_pi", zzicVar2.zzc);
            }
            if (z2) {
                zzjw zzjwVar = this.zzs.zzu().zzb;
                long j4 = j - zzjwVar.zzb;
                zzjwVar.zzb = j;
                if (j4 > 0) {
                    this.zzs.zzv().zzH(bundle2, j4);
                }
            }
            if (!this.zzs.zzf().zzu()) {
                bundle2.putLong("_mst", 1L);
            }
            String str3 = true != zzicVar.zze ? "auto" : "app";
            long jCurrentTimeMillis = this.zzs.zzav().currentTimeMillis();
            if (zzicVar.zze) {
                j2 = jCurrentTimeMillis;
                long j5 = zzicVar.zzf;
                if (j5 != 0) {
                    j3 = j5;
                }
                this.zzs.zzq().zzG(str3, "_vs", j3, bundle2);
            } else {
                j2 = jCurrentTimeMillis;
            }
            j3 = j2;
            this.zzs.zzq().zzG(str3, "_vs", j3, bundle2);
        }
        if (z2) {
            zzC(this.zza, true, j);
        }
        this.zza = zzicVar;
        if (zzicVar.zze) {
            this.zzh = zzicVar;
        }
        this.zzs.zzt().zzG(zzicVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzC(zzic zzicVar, boolean z, long j) {
        this.zzs.zzd().zzf(this.zzs.zzav().elapsedRealtime());
        if (!this.zzs.zzu().zzb.zzd(zzicVar != null && zzicVar.zzd, z, j) || zzicVar == null) {
            return;
        }
        zzicVar.zzd = false;
    }

    static /* bridge */ /* synthetic */ void zzp(zzij zzijVar, Bundle bundle, zzic zzicVar, zzic zzicVar2, long j) {
        bundle.remove(FirebaseAnalytics.Param.SCREEN_NAME);
        bundle.remove(FirebaseAnalytics.Param.SCREEN_CLASS);
        zzijVar.zzB(zzicVar, zzicVar2, j, true, zzijVar.zzs.zzv().zzy(null, FirebaseAnalytics.Event.SCREEN_VIEW, bundle, null, false));
    }

    private final zzic zzz(Activity activity) {
        Preconditions.checkNotNull(activity);
        zzic zzicVar = this.zzd.get(activity);
        if (zzicVar == null) {
            zzic zzicVar2 = new zzic(null, zzl(activity.getClass(), "Activity"), this.zzs.zzv().zzq());
            this.zzd.put(activity, zzicVar2);
            zzicVar = zzicVar2;
        }
        return this.zzg != null ? this.zzg : zzicVar;
    }

    @Override // com.google.android.gms.measurement.internal.zzf
    protected final boolean zzf() {
        return false;
    }

    public final zzic zzi() {
        return this.zzb;
    }

    public final zzic zzj(boolean z) {
        zza();
        zzg();
        if (!z) {
            return this.zza;
        }
        zzic zzicVar = this.zza;
        return zzicVar != null ? zzicVar : this.zzh;
    }

    final String zzl(Class<?> cls, String str) {
        String canonicalName = cls.getCanonicalName();
        if (canonicalName == null) {
            return "Activity";
        }
        String[] strArrSplit = canonicalName.split("\\.");
        int length = strArrSplit.length;
        String str2 = length > 0 ? strArrSplit[length - 1] : "";
        int length2 = str2.length();
        this.zzs.zzf();
        if (length2 <= 100) {
            return str2;
        }
        this.zzs.zzf();
        return str2.substring(0, 100);
    }

    public final void zzr(Activity activity, Bundle bundle) {
        Bundle bundle2;
        if (!this.zzs.zzf().zzu() || bundle == null || (bundle2 = bundle.getBundle("com.google.app_measurement.screen_service")) == null) {
            return;
        }
        this.zzd.put(activity, new zzic(bundle2.getString("name"), bundle2.getString("referrer_name"), bundle2.getLong("id")));
    }

    public final void zzs(Activity activity) {
        synchronized (this.zzj) {
            if (activity == this.zze) {
                this.zze = null;
            }
        }
        if (this.zzs.zzf().zzu()) {
            this.zzd.remove(activity);
        }
    }

    public final void zzt(Activity activity) {
        synchronized (this.zzj) {
            this.zzi = false;
            this.zzf = true;
        }
        long jElapsedRealtime = this.zzs.zzav().elapsedRealtime();
        if (!this.zzs.zzf().zzu()) {
            this.zzb = null;
            this.zzs.zzaz().zzp(new zzig(this, jElapsedRealtime));
        } else {
            zzic zzicVarZzz = zzz(activity);
            this.zzc = this.zzb;
            this.zzb = null;
            this.zzs.zzaz().zzp(new zzih(this, zzicVarZzz, jElapsedRealtime));
        }
    }

    public final void zzu(Activity activity) {
        synchronized (this.zzj) {
            this.zzi = true;
            if (activity != this.zze) {
                synchronized (this.zzj) {
                    this.zze = activity;
                    this.zzf = false;
                }
                if (this.zzs.zzf().zzu()) {
                    this.zzg = null;
                    this.zzs.zzaz().zzp(new zzii(this));
                }
            }
        }
        if (!this.zzs.zzf().zzu()) {
            this.zzb = this.zzg;
            this.zzs.zzaz().zzp(new zzif(this));
        } else {
            zzA(activity, zzz(activity), false);
            zzd zzdVarZzd = this.zzs.zzd();
            zzdVarZzd.zzs.zzaz().zzp(new zzc(zzdVarZzd, zzdVarZzd.zzs.zzav().elapsedRealtime()));
        }
    }

    public final void zzv(Activity activity, Bundle bundle) {
        zzic zzicVar;
        if (!this.zzs.zzf().zzu() || bundle == null || (zzicVar = this.zzd.get(activity)) == null) {
            return;
        }
        Bundle bundle2 = new Bundle();
        bundle2.putLong("id", zzicVar.zzc);
        bundle2.putString("name", zzicVar.zza);
        bundle2.putString("referrer_name", zzicVar.zzb);
        bundle.putBundle("com.google.app_measurement.screen_service", bundle2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x0088, code lost:
    
        if (r1 <= 100) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00b4, code lost:
    
        if (r1 <= 100) goto L39;
     */
    @java.lang.Deprecated
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void zzw(android.app.Activity r4, java.lang.String r5, java.lang.String r6) {
        /*
            Method dump skipped, instruction units count: 253
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zzij.zzw(android.app.Activity, java.lang.String, java.lang.String):void");
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0031, code lost:
    
        if (r2 > 100) goto L15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0063, code lost:
    
        if (r4 > 100) goto L24;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void zzx(android.os.Bundle r13, long r14) {
        /*
            Method dump skipped, instruction units count: 286
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zzij.zzx(android.os.Bundle, long):void");
    }

    public final void zzy(String str, zzic zzicVar) {
        zzg();
        synchronized (this) {
            String str2 = this.zzl;
            if (str2 == null || str2.equals(str) || zzicVar != null) {
                this.zzl = str;
                this.zzk = zzicVar;
            }
        }
    }

    private final void zzA(Activity activity, zzic zzicVar, boolean z) {
        zzic zzicVar2;
        zzic zzicVar3 = this.zzb == null ? this.zzc : this.zzb;
        if (zzicVar.zzb == null) {
            zzicVar2 = new zzic(zzicVar.zza, activity != null ? zzl(activity.getClass(), "Activity") : null, zzicVar.zzc, zzicVar.zze, zzicVar.zzf);
        } else {
            zzicVar2 = zzicVar;
        }
        this.zzc = this.zzb;
        this.zzb = zzicVar2;
        this.zzs.zzaz().zzp(new zzie(this, zzicVar2, zzicVar3, this.zzs.zzav().elapsedRealtime(), z));
    }
}
