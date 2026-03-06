package com.google.android.gms.measurement.internal;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Pair;
import com.google.android.gms.common.internal.Preconditions;
import com.google.android.gms.common.util.Clock;
import com.google.android.gms.common.util.DefaultClock;
import com.google.android.gms.common.wrappers.Wrappers;
import com.google.android.gms.internal.measurement.zzny;
import com.google.android.gms.internal.measurement.zzob;
import java.net.URL;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import org.checkerframework.dataflow.qual.Pure;
import org.checkerframework.dataflow.qual.SideEffectFree;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
public final class zzfs implements zzgn {
    private static volatile zzfs zzd;
    private zzea zzA;
    private Boolean zzC;
    private long zzD;
    private volatile Boolean zzE;
    private volatile boolean zzF;
    private int zzG;
    protected Boolean zza;
    protected Boolean zzb;
    final long zzc;
    private final Context zze;
    private final String zzf;
    private final String zzg;
    private final String zzh;
    private final boolean zzi;
    private final zzaa zzj;
    private final zzaf zzk;
    private final zzex zzl;
    private final zzei zzm;
    private final zzfp zzn;
    private final zzjy zzo;
    private final zzku zzp;
    private final zzed zzq;
    private final Clock zzr;
    private final zzij zzs;
    private final zzhv zzt;
    private final zzd zzu;
    private final zzhz zzv;
    private final String zzw;
    private zzec zzx;
    private zzjj zzy;
    private zzan zzz;
    private boolean zzB = false;
    private final AtomicInteger zzH = new AtomicInteger(0);

    zzfs(zzgu zzguVar) {
        Bundle bundle;
        Preconditions.checkNotNull(zzguVar);
        zzaa zzaaVar = new zzaa(zzguVar.zza);
        this.zzj = zzaaVar;
        zzdt.zza = zzaaVar;
        Context context = zzguVar.zza;
        this.zze = context;
        this.zzf = zzguVar.zzb;
        this.zzg = zzguVar.zzc;
        this.zzh = zzguVar.zzd;
        this.zzi = zzguVar.zzh;
        this.zzE = zzguVar.zze;
        this.zzw = zzguVar.zzj;
        this.zzF = true;
        com.google.android.gms.internal.measurement.zzcl zzclVar = zzguVar.zzg;
        if (zzclVar != null && (bundle = zzclVar.zzg) != null) {
            Object obj = bundle.get("measurementEnabled");
            if (obj instanceof Boolean) {
                this.zza = (Boolean) obj;
            }
            Object obj2 = zzclVar.zzg.get("measurementDeactivated");
            if (obj2 instanceof Boolean) {
                this.zzb = (Boolean) obj2;
            }
        }
        com.google.android.gms.internal.measurement.zzhu.zzd(context);
        Clock defaultClock = DefaultClock.getInstance();
        this.zzr = defaultClock;
        Long l = zzguVar.zzi;
        this.zzc = l != null ? l.longValue() : defaultClock.currentTimeMillis();
        this.zzk = new zzaf(this);
        zzex zzexVar = new zzex(this);
        zzexVar.zzv();
        this.zzl = zzexVar;
        zzei zzeiVar = new zzei(this);
        zzeiVar.zzv();
        this.zzm = zzeiVar;
        zzku zzkuVar = new zzku(this);
        zzkuVar.zzv();
        this.zzp = zzkuVar;
        zzed zzedVar = new zzed(this);
        zzedVar.zzv();
        this.zzq = zzedVar;
        this.zzu = new zzd(this);
        zzij zzijVar = new zzij(this);
        zzijVar.zzb();
        this.zzs = zzijVar;
        zzhv zzhvVar = new zzhv(this);
        zzhvVar.zzb();
        this.zzt = zzhvVar;
        zzjy zzjyVar = new zzjy(this);
        zzjyVar.zzb();
        this.zzo = zzjyVar;
        zzhz zzhzVar = new zzhz(this);
        zzhzVar.zzv();
        this.zzv = zzhzVar;
        zzfp zzfpVar = new zzfp(this);
        zzfpVar.zzv();
        this.zzn = zzfpVar;
        com.google.android.gms.internal.measurement.zzcl zzclVar2 = zzguVar.zzg;
        boolean z = zzclVar2 == null || zzclVar2.zzb == 0;
        if (context.getApplicationContext() instanceof Application) {
            zzhv zzhvVarZzq = zzq();
            if (zzhvVarZzq.zzs.zze.getApplicationContext() instanceof Application) {
                Application application = (Application) zzhvVarZzq.zzs.zze.getApplicationContext();
                if (zzhvVarZzq.zza == null) {
                    zzhvVarZzq.zza = new zzhu(zzhvVarZzq, null);
                }
                if (z) {
                    application.unregisterActivityLifecycleCallbacks(zzhvVarZzq.zza);
                    application.registerActivityLifecycleCallbacks(zzhvVarZzq.zza);
                    zzhvVarZzq.zzs.zzay().zzj().zza("Registered activity lifecycle callback");
                }
            }
        } else {
            zzay().zzk().zza("Application context is not an Application");
        }
        zzfpVar.zzp(new zzfr(this, zzguVar));
    }

    static /* bridge */ /* synthetic */ void zzA(zzfs zzfsVar, zzgu zzguVar) {
        zzfsVar.zzaz().zzg();
        zzfsVar.zzk.zzn();
        zzan zzanVar = new zzan(zzfsVar);
        zzanVar.zzv();
        zzfsVar.zzz = zzanVar;
        zzea zzeaVar = new zzea(zzfsVar, zzguVar.zzf);
        zzeaVar.zzb();
        zzfsVar.zzA = zzeaVar;
        zzec zzecVar = new zzec(zzfsVar);
        zzecVar.zzb();
        zzfsVar.zzx = zzecVar;
        zzjj zzjjVar = new zzjj(zzfsVar);
        zzjjVar.zzb();
        zzfsVar.zzy = zzjjVar;
        zzfsVar.zzp.zzw();
        zzfsVar.zzl.zzw();
        zzfsVar.zzA.zzc();
        zzeg zzegVarZzi = zzfsVar.zzay().zzi();
        zzfsVar.zzk.zzh();
        zzegVarZzi.zzb("App measurement initialized, version", 42097L);
        zzfsVar.zzay().zzi().zza("To enable debug logging run: adb shell setprop log.tag.FA VERBOSE");
        String strZzl = zzeaVar.zzl();
        if (TextUtils.isEmpty(zzfsVar.zzf)) {
            if (zzfsVar.zzv().zzad(strZzl)) {
                zzfsVar.zzay().zzi().zza("Faster debug mode event logging enabled. To disable, run:\n  adb shell setprop debug.firebase.analytics.app .none.");
            } else {
                zzeg zzegVarZzi2 = zzfsVar.zzay().zzi();
                String strValueOf = String.valueOf(strZzl);
                zzegVarZzi2.zza(strValueOf.length() != 0 ? "To enable faster debug mode event logging run:\n  adb shell setprop debug.firebase.analytics.app ".concat(strValueOf) : new String("To enable faster debug mode event logging run:\n  adb shell setprop debug.firebase.analytics.app "));
            }
        }
        zzfsVar.zzay().zzc().zza("Debug-level message logging enabled");
        if (zzfsVar.zzG != zzfsVar.zzH.get()) {
            zzfsVar.zzay().zzd().zzc("Not all components initialized", Integer.valueOf(zzfsVar.zzG), Integer.valueOf(zzfsVar.zzH.get()));
        }
        zzfsVar.zzB = true;
    }

    static final void zzO() {
        throw new IllegalStateException("Unexpected call on client side");
    }

    private static final void zzP(zzgl zzglVar) {
        if (zzglVar == null) {
            throw new IllegalStateException("Component not created");
        }
    }

    private static final void zzQ(zzf zzfVar) {
        if (zzfVar == null) {
            throw new IllegalStateException("Component not created");
        }
        if (zzfVar.zze()) {
            return;
        }
        String strValueOf = String.valueOf(zzfVar.getClass());
        StringBuilder sb = new StringBuilder(String.valueOf(strValueOf).length() + 27);
        sb.append("Component not initialized: ");
        sb.append(strValueOf);
        throw new IllegalStateException(sb.toString());
    }

    private static final void zzR(zzgm zzgmVar) {
        if (zzgmVar == null) {
            throw new IllegalStateException("Component not created");
        }
        if (zzgmVar.zzx()) {
            return;
        }
        String strValueOf = String.valueOf(zzgmVar.getClass());
        StringBuilder sb = new StringBuilder(String.valueOf(strValueOf).length() + 27);
        sb.append("Component not initialized: ");
        sb.append(strValueOf);
        throw new IllegalStateException(sb.toString());
    }

    public static zzfs zzp(Context context, com.google.android.gms.internal.measurement.zzcl zzclVar, Long l) {
        Bundle bundle;
        if (zzclVar != null && (zzclVar.zze == null || zzclVar.zzf == null)) {
            zzclVar = new com.google.android.gms.internal.measurement.zzcl(zzclVar.zza, zzclVar.zzb, zzclVar.zzc, zzclVar.zzd, null, null, zzclVar.zzg, null);
        }
        Preconditions.checkNotNull(context);
        Preconditions.checkNotNull(context.getApplicationContext());
        if (zzd == null) {
            synchronized (zzfs.class) {
                if (zzd == null) {
                    zzd = new zzfs(new zzgu(context, zzclVar, l));
                }
            }
        } else if (zzclVar != null && (bundle = zzclVar.zzg) != null && bundle.containsKey("dataCollectionDefaultEnabled")) {
            Preconditions.checkNotNull(zzd);
            zzd.zzE = Boolean.valueOf(zzclVar.zzg.getBoolean("dataCollectionDefaultEnabled"));
        }
        Preconditions.checkNotNull(zzd);
        return zzd;
    }

    final void zzB() {
        this.zzH.incrementAndGet();
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final /* synthetic */ void zzC(java.lang.String r7, int r8, java.lang.Throwable r9, byte[] r10, java.util.Map r11) {
        /*
            Method dump skipped, instruction units count: 290
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zzfs.zzC(java.lang.String, int, java.lang.Throwable, byte[], java.util.Map):void");
    }

    final void zzD() {
        this.zzG++;
    }

    public final void zzE() {
        zzaz().zzg();
        zzR(zzr());
        String strZzl = zzh().zzl();
        Pair<String, Boolean> pairZzb = zzm().zzb(strZzl);
        if (!this.zzk.zzr() || ((Boolean) pairZzb.second).booleanValue() || TextUtils.isEmpty((CharSequence) pairZzb.first)) {
            zzay().zzc().zza("ADID unavailable to retrieve Deferred Deep Link. Skipping");
            return;
        }
        zzhz zzhzVarZzr = zzr();
        zzhzVarZzr.zzu();
        ConnectivityManager connectivityManager = (ConnectivityManager) zzhzVarZzr.zzs.zze.getSystemService("connectivity");
        NetworkInfo activeNetworkInfo = null;
        if (connectivityManager != null) {
            try {
                activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
            } catch (SecurityException unused) {
            }
        }
        if (activeNetworkInfo == null || !activeNetworkInfo.isConnected()) {
            zzay().zzk().zza("Network is not available for Deferred Deep Link request. Skipping");
            return;
        }
        zzku zzkuVarZzv = zzv();
        zzh().zzs.zzk.zzh();
        URL urlZzD = zzkuVarZzv.zzD(42097L, strZzl, (String) pairZzb.first, zzm().zzn.zza() - 1);
        if (urlZzD != null) {
            zzhz zzhzVarZzr2 = zzr();
            zzfq zzfqVar = new zzfq(this);
            zzhzVarZzr2.zzg();
            zzhzVarZzr2.zzu();
            Preconditions.checkNotNull(urlZzD);
            Preconditions.checkNotNull(zzfqVar);
            zzhzVarZzr2.zzs.zzaz().zzo(new zzhy(zzhzVarZzr2, strZzl, urlZzD, null, null, zzfqVar, null));
        }
    }

    final void zzF(boolean z) {
        this.zzE = Boolean.valueOf(z);
    }

    public final void zzG(boolean z) {
        zzaz().zzg();
        this.zzF = z;
    }

    protected final void zzH(com.google.android.gms.internal.measurement.zzcl zzclVar) {
        zzag zzagVar;
        zzaz().zzg();
        zzag zzagVarZzc = zzm().zzc();
        zzex zzexVarZzm = zzm();
        zzfs zzfsVar = zzexVarZzm.zzs;
        zzexVarZzm.zzg();
        int i = 100;
        int i2 = zzexVarZzm.zza().getInt("consent_source", 100);
        zzaf zzafVar = this.zzk;
        zzfs zzfsVar2 = zzafVar.zzs;
        Boolean boolZzk = zzafVar.zzk("google_analytics_default_allow_ad_storage");
        zzaf zzafVar2 = this.zzk;
        zzfs zzfsVar3 = zzafVar2.zzs;
        Boolean boolZzk2 = zzafVar2.zzk("google_analytics_default_allow_analytics_storage");
        if (!(boolZzk == null && boolZzk2 == null) && zzm().zzl(-10)) {
            zzagVar = new zzag(boolZzk, boolZzk2);
            i = -10;
        } else {
            if (TextUtils.isEmpty(zzh().zzn()) || !(i2 == 0 || i2 == 30 || i2 == 10 || i2 == 30 || i2 == 30 || i2 == 40)) {
                zzob.zzc();
                if ((!this.zzk.zzs(null, zzdw.zzau) || TextUtils.isEmpty(zzh().zzn())) && zzclVar != null && zzclVar.zzg != null && zzm().zzl(30)) {
                    zzagVar = zzag.zza(zzclVar.zzg);
                    if (!zzagVar.equals(zzag.zza)) {
                        i = 30;
                    }
                }
            } else {
                zzq().zzR(zzag.zza, -10, this.zzc);
            }
            zzagVar = null;
        }
        if (zzagVar != null) {
            zzq().zzR(zzagVar, i, this.zzc);
            zzagVarZzc = zzagVar;
        }
        zzq().zzU(zzagVarZzc);
        if (zzm().zzc.zza() == 0) {
            zzay().zzj().zzb("Persisting first open", Long.valueOf(this.zzc));
            zzm().zzc.zzb(this.zzc);
        }
        zzq().zzb.zzc();
        if (zzM()) {
            if (!TextUtils.isEmpty(zzh().zzn()) || !TextUtils.isEmpty(zzh().zzk())) {
                zzku zzkuVarZzv = zzv();
                String strZzn = zzh().zzn();
                zzex zzexVarZzm2 = zzm();
                zzexVarZzm2.zzg();
                String string = zzexVarZzm2.zza().getString("gmp_app_id", null);
                String strZzk = zzh().zzk();
                zzex zzexVarZzm3 = zzm();
                zzexVarZzm3.zzg();
                if (zzkuVarZzv.zzam(strZzn, string, strZzk, zzexVarZzm3.zza().getString("admob_app_id", null))) {
                    zzay().zzi().zza("Rechecking which service to use due to a GMP App Id change");
                    zzex zzexVarZzm4 = zzm();
                    zzexVarZzm4.zzg();
                    Boolean boolZzd = zzexVarZzm4.zzd();
                    SharedPreferences.Editor editorEdit = zzexVarZzm4.zza().edit();
                    editorEdit.clear();
                    editorEdit.apply();
                    if (boolZzd != null) {
                        zzexVarZzm4.zzh(boolZzd);
                    }
                    zzi().zzj();
                    this.zzy.zzs();
                    this.zzy.zzr();
                    zzm().zzc.zzb(this.zzc);
                    zzm().zze.zzb(null);
                }
                zzex zzexVarZzm5 = zzm();
                String strZzn2 = zzh().zzn();
                zzexVarZzm5.zzg();
                SharedPreferences.Editor editorEdit2 = zzexVarZzm5.zza().edit();
                editorEdit2.putString("gmp_app_id", strZzn2);
                editorEdit2.apply();
                zzex zzexVarZzm6 = zzm();
                String strZzk2 = zzh().zzk();
                zzexVarZzm6.zzg();
                SharedPreferences.Editor editorEdit3 = zzexVarZzm6.zza().edit();
                editorEdit3.putString("admob_app_id", strZzk2);
                editorEdit3.apply();
            }
            if (!zzm().zzc().zzk()) {
                zzm().zze.zzb(null);
            }
            zzq().zzN(zzm().zze.zza());
            zzny.zzc();
            if (this.zzk.zzs(null, zzdw.zzai)) {
                try {
                    zzv().zzs.zze.getClassLoader().loadClass("com.google.firebase.remoteconfig.FirebaseRemoteConfig");
                } catch (ClassNotFoundException unused) {
                    if (!TextUtils.isEmpty(zzm().zzo.zza())) {
                        zzay().zzk().zza("Remote config removed with active feature rollouts");
                        zzm().zzo.zzb(null);
                    }
                }
            }
            if (!TextUtils.isEmpty(zzh().zzn()) || !TextUtils.isEmpty(zzh().zzk())) {
                boolean zZzJ = zzJ();
                if (!zzm().zzj() && !this.zzk.zzv()) {
                    zzm().zzi(!zZzJ);
                }
                if (zZzJ) {
                    zzq().zzy();
                }
                zzu().zza.zza();
                zzt().zzu(new AtomicReference<>());
                zzt().zzH(zzm().zzr.zza());
            }
        } else if (zzJ()) {
            if (!zzv().zzac("android.permission.INTERNET")) {
                zzay().zzd().zza("App is missing INTERNET permission");
            }
            if (!zzv().zzac("android.permission.ACCESS_NETWORK_STATE")) {
                zzay().zzd().zza("App is missing ACCESS_NETWORK_STATE permission");
            }
            if (!Wrappers.packageManager(this.zze).isCallerInstantApp() && !this.zzk.zzx()) {
                if (!zzku.zzai(this.zze)) {
                    zzay().zzd().zza("AppMeasurementReceiver not registered/enabled");
                }
                if (!zzku.zzaj(this.zze, false)) {
                    zzay().zzd().zza("AppMeasurementService not registered/enabled");
                }
            }
            zzay().zzd().zza("Uploading is not possible. App measurement disabled");
        }
        zzm().zzi.zza(true);
    }

    public final boolean zzI() {
        return this.zzE != null && this.zzE.booleanValue();
    }

    public final boolean zzJ() {
        return zza() == 0;
    }

    public final boolean zzK() {
        zzaz().zzg();
        return this.zzF;
    }

    @Pure
    public final boolean zzL() {
        return TextUtils.isEmpty(this.zzf);
    }

    protected final boolean zzM() {
        if (!this.zzB) {
            throw new IllegalStateException("AppMeasurement is not initialized");
        }
        zzaz().zzg();
        Boolean bool = this.zzC;
        if (bool == null || this.zzD == 0 || (!bool.booleanValue() && Math.abs(this.zzr.elapsedRealtime() - this.zzD) > 1000)) {
            this.zzD = this.zzr.elapsedRealtime();
            boolean z = true;
            Boolean boolValueOf = Boolean.valueOf(zzv().zzac("android.permission.INTERNET") && zzv().zzac("android.permission.ACCESS_NETWORK_STATE") && (Wrappers.packageManager(this.zze).isCallerInstantApp() || this.zzk.zzx() || (zzku.zzai(this.zze) && zzku.zzaj(this.zze, false))));
            this.zzC = boolValueOf;
            if (boolValueOf.booleanValue()) {
                if (!zzv().zzW(zzh().zzn(), zzh().zzk(), zzh().zzm()) && TextUtils.isEmpty(zzh().zzk())) {
                    z = false;
                }
                this.zzC = Boolean.valueOf(z);
            }
        }
        return this.zzC.booleanValue();
    }

    @Pure
    public final boolean zzN() {
        return this.zzi;
    }

    public final int zza() {
        zzaz().zzg();
        if (this.zzk.zzv()) {
            return 1;
        }
        Boolean bool = this.zzb;
        if (bool != null && bool.booleanValue()) {
            return 2;
        }
        zzaz().zzg();
        if (!this.zzF) {
            return 8;
        }
        Boolean boolZzd = zzm().zzd();
        if (boolZzd != null) {
            return boolZzd.booleanValue() ? 0 : 3;
        }
        zzaf zzafVar = this.zzk;
        zzaa zzaaVar = zzafVar.zzs.zzj;
        Boolean boolZzk = zzafVar.zzk("firebase_analytics_collection_enabled");
        if (boolZzk != null) {
            return boolZzk.booleanValue() ? 0 : 4;
        }
        Boolean bool2 = this.zza;
        return bool2 != null ? bool2.booleanValue() ? 0 : 5 : (!this.zzk.zzs(null, zzdw.zzS) || this.zzE == null || this.zzE.booleanValue()) ? 0 : 7;
    }

    @Override // com.google.android.gms.measurement.internal.zzgn
    @Pure
    public final Context zzau() {
        return this.zze;
    }

    @Override // com.google.android.gms.measurement.internal.zzgn
    @Pure
    public final Clock zzav() {
        return this.zzr;
    }

    @Override // com.google.android.gms.measurement.internal.zzgn
    @Pure
    public final zzaa zzaw() {
        return this.zzj;
    }

    @Override // com.google.android.gms.measurement.internal.zzgn
    @Pure
    public final zzei zzay() {
        zzR(this.zzm);
        return this.zzm;
    }

    @Override // com.google.android.gms.measurement.internal.zzgn
    @Pure
    public final zzfp zzaz() {
        zzR(this.zzn);
        return this.zzn;
    }

    @Pure
    public final zzd zzd() {
        zzd zzdVar = this.zzu;
        if (zzdVar != null) {
            return zzdVar;
        }
        throw new IllegalStateException("Component not created");
    }

    @Pure
    public final zzaf zzf() {
        return this.zzk;
    }

    @Pure
    public final zzan zzg() {
        zzR(this.zzz);
        return this.zzz;
    }

    @Pure
    public final zzea zzh() {
        zzQ(this.zzA);
        return this.zzA;
    }

    @Pure
    public final zzec zzi() {
        zzQ(this.zzx);
        return this.zzx;
    }

    @Pure
    public final zzed zzj() {
        zzP(this.zzq);
        return this.zzq;
    }

    public final zzei zzl() {
        zzei zzeiVar = this.zzm;
        if (zzeiVar == null || !zzeiVar.zzx()) {
            return null;
        }
        return this.zzm;
    }

    @Pure
    public final zzex zzm() {
        zzP(this.zzl);
        return this.zzl;
    }

    @SideEffectFree
    final zzfp zzo() {
        return this.zzn;
    }

    @Pure
    public final zzhv zzq() {
        zzQ(this.zzt);
        return this.zzt;
    }

    @Pure
    public final zzhz zzr() {
        zzR(this.zzv);
        return this.zzv;
    }

    @Pure
    public final zzij zzs() {
        zzQ(this.zzs);
        return this.zzs;
    }

    @Pure
    public final zzjj zzt() {
        zzQ(this.zzy);
        return this.zzy;
    }

    @Pure
    public final zzjy zzu() {
        zzQ(this.zzo);
        return this.zzo;
    }

    @Pure
    public final zzku zzv() {
        zzP(this.zzp);
        return this.zzp;
    }

    @Pure
    public final String zzw() {
        return this.zzf;
    }

    @Pure
    public final String zzx() {
        return this.zzg;
    }

    @Pure
    public final String zzy() {
        return this.zzh;
    }

    @Pure
    public final String zzz() {
        return this.zzw;
    }
}
