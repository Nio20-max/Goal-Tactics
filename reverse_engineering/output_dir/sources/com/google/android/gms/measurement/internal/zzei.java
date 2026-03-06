package com.google.android.gms.measurement.internal;

import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.common.internal.Preconditions;
import org.checkerframework.checker.nullness.qual.EnsuresNonNull;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
public final class zzei extends zzgm {
    private char zza;
    private long zzb;
    private String zzc;
    private final zzeg zzd;
    private final zzeg zze;
    private final zzeg zzf;
    private final zzeg zzg;
    private final zzeg zzh;
    private final zzeg zzi;
    private final zzeg zzj;
    private final zzeg zzk;
    private final zzeg zzl;

    zzei(zzfs zzfsVar) {
        super(zzfsVar);
        this.zza = (char) 0;
        this.zzb = -1L;
        this.zzd = new zzeg(this, 6, false, false);
        this.zze = new zzeg(this, 6, true, false);
        this.zzf = new zzeg(this, 6, false, true);
        this.zzg = new zzeg(this, 5, false, false);
        this.zzh = new zzeg(this, 5, true, false);
        this.zzi = new zzeg(this, 5, false, true);
        this.zzj = new zzeg(this, 4, false, false);
        this.zzk = new zzeg(this, 3, false, false);
        this.zzl = new zzeg(this, 2, false, false);
    }

    protected static Object zzn(String str) {
        if (str == null) {
            return null;
        }
        return new zzeh(str);
    }

    static String zzo(boolean z, String str, Object obj, Object obj2, Object obj3) {
        String str2 = "";
        if (str == null) {
            str = "";
        }
        String strZzp = zzp(z, obj);
        String strZzp2 = zzp(z, obj2);
        String strZzp3 = zzp(z, obj3);
        StringBuilder sb = new StringBuilder();
        if (!TextUtils.isEmpty(str)) {
            sb.append(str);
            str2 = ": ";
        }
        String str3 = ", ";
        if (!TextUtils.isEmpty(strZzp)) {
            sb.append(str2);
            sb.append(strZzp);
            str2 = ", ";
        }
        if (TextUtils.isEmpty(strZzp2)) {
            str3 = str2;
        } else {
            sb.append(str2);
            sb.append(strZzp2);
        }
        if (!TextUtils.isEmpty(strZzp3)) {
            sb.append(str3);
            sb.append(strZzp3);
        }
        return sb.toString();
    }

    static String zzp(boolean z, Object obj) {
        String className;
        if (obj == null) {
            return "";
        }
        if (obj instanceof Integer) {
            obj = Long.valueOf(((Integer) obj).intValue());
        }
        int i = 0;
        if (obj instanceof Long) {
            if (!z) {
                return String.valueOf(obj);
            }
            Long l = (Long) obj;
            if (Math.abs(l.longValue()) < 100) {
                return String.valueOf(obj);
            }
            String str = String.valueOf(obj).charAt(0) == '-' ? "-" : "";
            String strValueOf = String.valueOf(Math.abs(l.longValue()));
            long jRound = Math.round(Math.pow(10.0d, strValueOf.length() - 1));
            long jRound2 = Math.round(Math.pow(10.0d, strValueOf.length()) - 1.0d);
            StringBuilder sb = new StringBuilder(str.length() + 43 + str.length());
            sb.append(str);
            sb.append(jRound);
            sb.append("...");
            sb.append(str);
            sb.append(jRound2);
            return sb.toString();
        }
        if (obj instanceof Boolean) {
            return String.valueOf(obj);
        }
        if (!(obj instanceof Throwable)) {
            return obj instanceof zzeh ? ((zzeh) obj).zza : z ? "-" : String.valueOf(obj);
        }
        Throwable th = (Throwable) obj;
        StringBuilder sb2 = new StringBuilder(z ? th.getClass().getName() : th.toString());
        String strZzy = zzy(zzfs.class.getCanonicalName());
        StackTraceElement[] stackTrace = th.getStackTrace();
        int length = stackTrace.length;
        while (true) {
            if (i >= length) {
                break;
            }
            StackTraceElement stackTraceElement = stackTrace[i];
            if (!stackTraceElement.isNativeMethod() && (className = stackTraceElement.getClassName()) != null && zzy(className).equals(strZzy)) {
                sb2.append(": ");
                sb2.append(stackTraceElement);
                break;
            }
            i++;
        }
        return sb2.toString();
    }

    private static String zzy(String str) {
        if (TextUtils.isEmpty(str)) {
            return "";
        }
        int iLastIndexOf = str.lastIndexOf(46);
        return iLastIndexOf == -1 ? str : str.substring(0, iLastIndexOf);
    }

    public final zzeg zzc() {
        return this.zzk;
    }

    public final zzeg zzd() {
        return this.zzd;
    }

    public final zzeg zze() {
        return this.zzf;
    }

    @Override // com.google.android.gms.measurement.internal.zzgm
    protected final boolean zzf() {
        return false;
    }

    public final zzeg zzh() {
        return this.zze;
    }

    public final zzeg zzi() {
        return this.zzj;
    }

    public final zzeg zzj() {
        return this.zzl;
    }

    public final zzeg zzk() {
        return this.zzg;
    }

    public final zzeg zzl() {
        return this.zzi;
    }

    public final zzeg zzm() {
        return this.zzh;
    }

    @EnsuresNonNull({"logTagDoNotUseDirectly"})
    protected final String zzq() {
        String str;
        synchronized (this) {
            if (this.zzc == null) {
                if (this.zzs.zzy() != null) {
                    this.zzc = this.zzs.zzy();
                } else {
                    this.zzc = this.zzs.zzf().zzn();
                }
            }
            Preconditions.checkNotNull(this.zzc);
            str = this.zzc;
        }
        return str;
    }

    protected final void zzt(int i, boolean z, boolean z2, String str, Object obj, Object obj2, Object obj3) {
        if (!z && Log.isLoggable(zzq(), i)) {
            Log.println(i, zzq(), zzo(false, str, obj, obj2, obj3));
        }
        if (z2 || i < 5) {
            return;
        }
        Preconditions.checkNotNull(str);
        zzfp zzfpVarZzo = this.zzs.zzo();
        if (zzfpVarZzo == null) {
            Log.println(6, zzq(), "Scheduler not set. Not logging error/warn");
        } else if (zzfpVarZzo.zzx()) {
            zzfpVarZzo.zzp(new zzef(this, i >= 9 ? 8 : i, str, obj, obj2, obj3));
        } else {
            Log.println(6, zzq(), "Scheduler not initialized. Not logging error/warn");
        }
    }
}
