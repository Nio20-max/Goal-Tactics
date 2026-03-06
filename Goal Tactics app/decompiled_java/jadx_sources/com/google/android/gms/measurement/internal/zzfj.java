package com.google.android.gms.measurement.internal;

import android.text.TextUtils;
import androidx.collection.ArrayMap;
import androidx.collection.LruCache;
import com.google.android.gms.common.internal.Preconditions;
import com.google.android.gms.internal.measurement.zzpf;
import com.google.android.gms.internal.measurement.zzpl;
import com.google.firebase.analytics.FirebaseAnalytics;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.Callable;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
public final class zzfj extends zzkd implements zzae {
    final LruCache<String, com.google.android.gms.internal.measurement.zzc> zza;
    final com.google.android.gms.internal.measurement.zzr zzb;
    private final Map<String, Map<String, String>> zzc;
    private final Map<String, Map<String, Boolean>> zzd;
    private final Map<String, Map<String, Boolean>> zze;
    private final Map<String, com.google.android.gms.internal.measurement.zzfc> zzg;
    private final Map<String, Map<String, Integer>> zzh;
    private final Map<String, String> zzi;

    zzfj(zzkn zzknVar) {
        super(zzknVar);
        this.zzc = new ArrayMap();
        this.zzd = new ArrayMap();
        this.zze = new ArrayMap();
        this.zzg = new ArrayMap();
        this.zzi = new ArrayMap();
        this.zzh = new ArrayMap();
        this.zza = new zzfg(this, 20);
        this.zzb = new zzfh(this);
    }

    static /* bridge */ /* synthetic */ com.google.android.gms.internal.measurement.zzc zzd(zzfj zzfjVar, String str) throws Throwable {
        zzfjVar.zzY();
        Preconditions.checkNotEmpty(str);
        zzpl.zzc();
        if (!zzfjVar.zzs.zzf().zzs(null, zzdw.zzav) || !zzfjVar.zzl(str)) {
            return null;
        }
        if (!zzfjVar.zzg.containsKey(str) || zzfjVar.zzg.get(str) == null) {
            zzfjVar.zzt(str);
        } else {
            zzfjVar.zzu(str, zzfjVar.zzg.get(str));
        }
        return zzfjVar.zza.snapshot().get(str);
    }

    private final com.google.android.gms.internal.measurement.zzfc zzr(String str, byte[] bArr) {
        if (bArr == null) {
            return com.google.android.gms.internal.measurement.zzfc.zzg();
        }
        try {
            com.google.android.gms.internal.measurement.zzfc zzfcVarZzaA = ((com.google.android.gms.internal.measurement.zzfb) zzkp.zzl(com.google.android.gms.internal.measurement.zzfc.zze(), bArr)).zzaA();
            this.zzs.zzay().zzj().zzc("Parsed config. version, gmp_app_id", zzfcVarZzaA.zzq() ? Long.valueOf(zzfcVarZzaA.zzc()) : null, zzfcVarZzaA.zzp() ? zzfcVarZzaA.zzh() : null);
            return zzfcVarZzaA;
        } catch (com.google.android.gms.internal.measurement.zzkj e) {
            this.zzs.zzay().zzk().zzc("Unable to merge remote config. appId", zzei.zzn(str), e);
            return com.google.android.gms.internal.measurement.zzfc.zzg();
        } catch (RuntimeException e2) {
            this.zzs.zzay().zzk().zzc("Unable to merge remote config. appId", zzei.zzn(str), e2);
            return com.google.android.gms.internal.measurement.zzfc.zzg();
        }
    }

    private final void zzs(String str, com.google.android.gms.internal.measurement.zzfb zzfbVar) {
        ArrayMap arrayMap = new ArrayMap();
        ArrayMap arrayMap2 = new ArrayMap();
        ArrayMap arrayMap3 = new ArrayMap();
        if (zzfbVar != null) {
            for (int i = 0; i < zzfbVar.zza(); i++) {
                com.google.android.gms.internal.measurement.zzez zzezVarZzbv = zzfbVar.zzb(i).zzbv();
                if (TextUtils.isEmpty(zzezVarZzbv.zzc())) {
                    this.zzs.zzay().zzk().zza("EventConfig contained null event name");
                } else {
                    String strZzc = zzezVarZzbv.zzc();
                    String strZzb = zzgp.zzb(zzezVarZzbv.zzc());
                    if (!TextUtils.isEmpty(strZzb)) {
                        zzezVarZzbv.zzb(strZzb);
                        zzfbVar.zzd(i, zzezVarZzbv);
                    }
                    arrayMap.put(strZzc, Boolean.valueOf(zzezVarZzbv.zzd()));
                    arrayMap2.put(zzezVarZzbv.zzc(), Boolean.valueOf(zzezVarZzbv.zze()));
                    if (zzezVarZzbv.zzf()) {
                        if (zzezVarZzbv.zza() < 2 || zzezVarZzbv.zza() > 65535) {
                            this.zzs.zzay().zzk().zzc("Invalid sampling rate. Event name, sample rate", zzezVarZzbv.zzc(), Integer.valueOf(zzezVarZzbv.zza()));
                        } else {
                            arrayMap3.put(zzezVarZzbv.zzc(), Integer.valueOf(zzezVarZzbv.zza()));
                        }
                    }
                }
            }
        }
        this.zzd.put(str, arrayMap);
        this.zze.put(str, arrayMap2);
        this.zzh.put(str, arrayMap3);
    }

    /* JADX WARN: Not initialized variable reg: 2, insn: 0x0121: MOVE (r1 I:??[OBJECT, ARRAY]) = (r2 I:??[OBJECT, ARRAY]), block:B:42:0x0121 */
    /* JADX WARN: Removed duplicated region for block: B:30:0x009b  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0124  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final void zzt(java.lang.String r13) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 297
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zzfj.zzt(java.lang.String):void");
    }

    private final void zzu(final String str, com.google.android.gms.internal.measurement.zzfc zzfcVar) {
        if (zzfcVar.zza() == 0) {
            this.zza.remove(str);
            return;
        }
        this.zzs.zzay().zzj().zzb("EES programs found", Integer.valueOf(zzfcVar.zza()));
        com.google.android.gms.internal.measurement.zzgo zzgoVar = zzfcVar.zzj().get(0);
        try {
            com.google.android.gms.internal.measurement.zzc zzcVar = new com.google.android.gms.internal.measurement.zzc();
            zzcVar.zzd("internal.remoteConfig", new Callable() { // from class: com.google.android.gms.measurement.internal.zzfd
                @Override // java.util.concurrent.Callable
                public final Object call() {
                    return new com.google.android.gms.internal.measurement.zzn("internal.remoteConfig", new zzfi(this.zza, str));
                }
            });
            zzcVar.zzd("internal.appMetadata", new Callable() { // from class: com.google.android.gms.measurement.internal.zzff
                @Override // java.util.concurrent.Callable
                public final Object call() {
                    final zzfj zzfjVar = this.zza;
                    final String str2 = str;
                    return new com.google.android.gms.internal.measurement.zzu("internal.appMetadata", new Callable() { // from class: com.google.android.gms.measurement.internal.zzfe
                        @Override // java.util.concurrent.Callable
                        public final Object call() {
                            zzfj zzfjVar2 = zzfjVar;
                            String str3 = str2;
                            zzg zzgVarZzj = zzfjVar2.zzf.zzi().zzj(str3);
                            HashMap map = new HashMap();
                            map.put("platform", "android");
                            map.put("package_name", str3);
                            zzfjVar2.zzs.zzf().zzh();
                            map.put("gmp_version", 42097L);
                            if (zzgVarZzj != null) {
                                String strZzw = zzgVarZzj.zzw();
                                if (strZzw != null) {
                                    map.put("app_version", strZzw);
                                }
                                map.put("app_version_int", Long.valueOf(zzgVarZzj.zzb()));
                                map.put("dynamite_version", Long.valueOf(zzgVarZzj.zzk()));
                            }
                            return map;
                        }
                    });
                }
            });
            zzcVar.zzd("internal.logger", new Callable() { // from class: com.google.android.gms.measurement.internal.zzfc
                @Override // java.util.concurrent.Callable
                public final Object call() {
                    return new com.google.android.gms.internal.measurement.zzt(this.zza.zzb);
                }
            });
            zzcVar.zzc(zzgoVar);
            this.zza.put(str, zzcVar);
            this.zzs.zzay().zzj().zzc("EES program loaded for appId, activities", str, Integer.valueOf(zzgoVar.zza().zza()));
            Iterator<com.google.android.gms.internal.measurement.zzgm> it = zzgoVar.zza().zzd().iterator();
            while (it.hasNext()) {
                this.zzs.zzay().zzj().zzb("EES program activity", it.next().zzb());
            }
        } catch (com.google.android.gms.internal.measurement.zzd unused) {
            this.zzs.zzay().zzd().zzb("Failed to load EES program. appId", str);
        }
    }

    private static final Map<String, String> zzv(com.google.android.gms.internal.measurement.zzfc zzfcVar) {
        ArrayMap arrayMap = new ArrayMap();
        if (zzfcVar != null) {
            for (com.google.android.gms.internal.measurement.zzfe zzfeVar : zzfcVar.zzk()) {
                arrayMap.put(zzfeVar.zzb(), zzfeVar.zzc());
            }
        }
        return arrayMap;
    }

    @Override // com.google.android.gms.measurement.internal.zzae
    public final String zza(String str, String str2) throws Throwable {
        zzg();
        zzt(str);
        Map<String, String> map = this.zzc.get(str);
        if (map != null) {
            return map.get(str2);
        }
        return null;
    }

    @Override // com.google.android.gms.measurement.internal.zzkd
    protected final boolean zzb() {
        return false;
    }

    final int zzc(String str, String str2) throws Throwable {
        Integer num;
        zzg();
        zzt(str);
        Map<String, Integer> map = this.zzh.get(str);
        if (map == null || (num = map.get(str2)) == null) {
            return 1;
        }
        return num.intValue();
    }

    protected final com.google.android.gms.internal.measurement.zzfc zze(String str) {
        zzY();
        zzg();
        Preconditions.checkNotEmpty(str);
        zzt(str);
        return this.zzg.get(str);
    }

    protected final String zzf(String str) {
        zzg();
        return this.zzi.get(str);
    }

    protected final void zzi(String str) {
        zzg();
        this.zzi.put(str, null);
    }

    final void zzj(String str) {
        zzg();
        this.zzg.remove(str);
    }

    final boolean zzk(String str) {
        zzg();
        com.google.android.gms.internal.measurement.zzfc zzfcVarZze = zze(str);
        if (zzfcVarZze == null) {
            return false;
        }
        return zzfcVarZze.zzo();
    }

    public final boolean zzl(String str) {
        com.google.android.gms.internal.measurement.zzfc zzfcVar;
        zzpl.zzc();
        return (!this.zzs.zzf().zzs(null, zzdw.zzav) || TextUtils.isEmpty(str) || (zzfcVar = this.zzg.get(str)) == null || zzfcVar.zza() == 0) ? false : true;
    }

    final boolean zzm(String str) {
        return "1".equals(zza(str, "measurement.upload.blacklist_internal"));
    }

    final boolean zzn(String str, String str2) throws Throwable {
        Boolean bool;
        zzg();
        zzt(str);
        if (FirebaseAnalytics.Event.ECOMMERCE_PURCHASE.equals(str2) || FirebaseAnalytics.Event.PURCHASE.equals(str2) || FirebaseAnalytics.Event.REFUND.equals(str2)) {
            return true;
        }
        Map<String, Boolean> map = this.zze.get(str);
        if (map == null || (bool = map.get(str2)) == null) {
            return false;
        }
        return bool.booleanValue();
    }

    final boolean zzo(String str, String str2) throws Throwable {
        Boolean bool;
        zzg();
        zzt(str);
        if (zzm(str) && zzku.zzag(str2)) {
            return true;
        }
        if (zzp(str) && zzku.zzah(str2)) {
            return true;
        }
        Map<String, Boolean> map = this.zzd.get(str);
        if (map == null || (bool = map.get(str2)) == null) {
            return false;
        }
        return bool.booleanValue();
    }

    final boolean zzp(String str) {
        return "1".equals(zza(str, "measurement.upload.blacklist_public"));
    }

    protected final boolean zzq(String str, byte[] bArr, String str2) throws Throwable {
        zzY();
        zzg();
        Preconditions.checkNotEmpty(str);
        com.google.android.gms.internal.measurement.zzfb zzfbVarZzbv = zzr(str, bArr).zzbv();
        if (zzfbVarZzbv == null) {
            return false;
        }
        zzs(str, zzfbVarZzbv);
        zzpl.zzc();
        if (this.zzs.zzf().zzs(null, zzdw.zzav)) {
            zzu(str, zzfbVarZzbv.zzaA());
        }
        this.zzg.put(str, zzfbVarZzbv.zzaA());
        this.zzi.put(str, str2);
        this.zzc.put(str, zzv(zzfbVarZzbv.zzaA()));
        this.zzf.zzi().zzB(str, new ArrayList(zzfbVarZzbv.zze()));
        try {
            zzfbVarZzbv.zzc();
            bArr = zzfbVarZzbv.zzaA().zzbs();
        } catch (RuntimeException e) {
            this.zzs.zzay().zzk().zzc("Unable to serialize reduced-size config. Storing full config instead. appId", zzei.zzn(str), e);
        }
        zzpf.zzc();
        if (this.zzs.zzf().zzs(null, zzdw.zzat)) {
            this.zzf.zzi().zzF(str, bArr, str2);
        } else {
            this.zzf.zzi().zzF(str, bArr, null);
        }
        this.zzg.put(str, zzfbVarZzbv.zzaA());
        return true;
    }
}
