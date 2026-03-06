package com.google.android.gms.measurement.internal;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.text.TextUtils;
import androidx.collection.ArrayMap;
import com.facebook.internal.ServerProtocol;
import com.google.android.gms.common.internal.Preconditions;
import com.google.android.gms.common.util.CollectionUtils;
import com.google.android.gms.common.util.Strings;
import com.google.android.gms.internal.measurement.zzny;
import com.google.android.gms.internal.measurement.zzoh;
import com.google.android.gms.internal.measurement.zzpx;
import com.google.android.gms.measurement.api.AppMeasurementSdk;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.google.firebase.messaging.Constants;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
public final class zzhv extends zzf {
    protected zzhu zza;
    final zzr zzb;
    protected boolean zzc;
    private zzgs zzd;
    private final Set<zzgt> zze;
    private boolean zzf;
    private final AtomicReference<String> zzg;
    private final Object zzh;
    private zzag zzi;
    private int zzj;
    private final AtomicLong zzk;
    private long zzl;
    private int zzm;
    private final zzkt zzn;

    protected zzhv(zzfs zzfsVar) {
        super(zzfsVar);
        this.zze = new CopyOnWriteArraySet();
        this.zzh = new Object();
        this.zzc = true;
        this.zzn = new zzhj(this);
        this.zzg = new AtomicReference<>();
        this.zzi = new zzag(null, null);
        this.zzj = 100;
        this.zzl = -1L;
        this.zzm = 100;
        this.zzk = new AtomicLong(0L);
        this.zzb = new zzr(zzfsVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzZ(Boolean bool, boolean z) {
        zzg();
        zza();
        this.zzs.zzay().zzc().zzb("Setting app measurement enabled (FE)", bool);
        this.zzs.zzm().zzh(bool);
        if (z) {
            zzex zzexVarZzm = this.zzs.zzm();
            zzfs zzfsVar = zzexVarZzm.zzs;
            zzexVarZzm.zzg();
            SharedPreferences.Editor editorEdit = zzexVarZzm.zza().edit();
            if (bool != null) {
                editorEdit.putBoolean("measurement_enabled_from_api", bool.booleanValue());
            } else {
                editorEdit.remove("measurement_enabled_from_api");
            }
            editorEdit.apply();
        }
        if (this.zzs.zzK() || !(bool == null || bool.booleanValue())) {
            zzaa();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzaa() {
        zzg();
        String strZza = this.zzs.zzm().zzh.zza();
        if (strZza != null) {
            if ("unset".equals(strZza)) {
                zzX("app", "_npa", null, this.zzs.zzav().currentTimeMillis());
            } else {
                zzX("app", "_npa", Long.valueOf(true != ServerProtocol.DIALOG_RETURN_SCOPES_TRUE.equals(strZza) ? 0L : 1L), this.zzs.zzav().currentTimeMillis());
            }
        }
        if (!this.zzs.zzJ() || !this.zzc) {
            this.zzs.zzay().zzc().zza("Updating Scion state (FE)");
            this.zzs.zzt().zzI();
            return;
        }
        this.zzs.zzay().zzc().zza("Recording app launch after enabling measurement for the first time (FE)");
        zzy();
        zzoh.zzc();
        if (this.zzs.zzf().zzs(null, zzdw.zzaj)) {
            this.zzs.zzu().zza.zza();
        }
        this.zzs.zzaz().zzp(new zzgy(this));
    }

    static /* bridge */ /* synthetic */ void zzv(zzhv zzhvVar, zzag zzagVar, int i, long j, boolean z, boolean z2) {
        zzhvVar.zzg();
        zzhvVar.zza();
        if (j <= zzhvVar.zzl && zzag.zzl(zzhvVar.zzm, i)) {
            zzhvVar.zzs.zzay().zzi().zzb("Dropped out-of-date consent setting, proposed settings", zzagVar);
            return;
        }
        zzex zzexVarZzm = zzhvVar.zzs.zzm();
        zzfs zzfsVar = zzexVarZzm.zzs;
        zzexVarZzm.zzg();
        if (!zzexVarZzm.zzl(i)) {
            zzhvVar.zzs.zzay().zzi().zzb("Lower precedence consent source ignored, proposed source", Integer.valueOf(i));
            return;
        }
        SharedPreferences.Editor editorEdit = zzexVarZzm.zza().edit();
        editorEdit.putString("consent_settings", zzagVar.zzi());
        editorEdit.putInt("consent_source", i);
        editorEdit.apply();
        zzhvVar.zzl = j;
        zzhvVar.zzm = i;
        zzhvVar.zzs.zzt().zzF(z);
        if (z2) {
            zzhvVar.zzs.zzt().zzu(new AtomicReference<>());
        }
    }

    public final void zzA() {
        if (!(this.zzs.zzau().getApplicationContext() instanceof Application) || this.zza == null) {
            return;
        }
        ((Application) this.zzs.zzau().getApplicationContext()).unregisterActivityLifecycleCallbacks(this.zza);
    }

    public final /* synthetic */ void zzB(Bundle bundle) {
        if (bundle == null) {
            this.zzs.zzm().zzr.zzb(new Bundle());
            return;
        }
        Bundle bundleZza = this.zzs.zzm().zzr.zza();
        for (String str : bundle.keySet()) {
            Object obj = bundle.get(str);
            if (obj != null && !(obj instanceof String) && !(obj instanceof Long) && !(obj instanceof Double)) {
                if (this.zzs.zzv().zzae(obj)) {
                    this.zzs.zzv().zzM(this.zzn, null, 27, null, null, 0);
                }
                this.zzs.zzay().zzl().zzc("Invalid default event parameter type. Name, value", str, obj);
            } else if (zzku.zzag(str)) {
                this.zzs.zzay().zzl().zzb("Invalid default event parameter name. Name", str);
            } else if (obj == null) {
                bundleZza.remove(str);
            } else {
                zzku zzkuVarZzv = this.zzs.zzv();
                this.zzs.zzf();
                if (zzkuVarZzv.zzZ("param", str, 100, obj)) {
                    this.zzs.zzv().zzN(bundleZza, str, obj);
                }
            }
        }
        this.zzs.zzv();
        int iZzc = this.zzs.zzf().zzc();
        if (bundleZza.size() > iZzc) {
            int i = 0;
            for (String str2 : new TreeSet(bundleZza.keySet())) {
                i++;
                if (i > iZzc) {
                    bundleZza.remove(str2);
                }
            }
            this.zzs.zzv().zzM(this.zzn, null, 26, null, null, 0);
            this.zzs.zzay().zzl().zza("Too many default event parameters set. Discarding beyond event parameter limit");
        }
        this.zzs.zzm().zzr.zzb(bundleZza);
        this.zzs.zzt().zzH(bundleZza);
    }

    public final void zzC(String str, String str2, Bundle bundle) {
        zzD(str, str2, bundle, true, true, this.zzs.zzav().currentTimeMillis());
    }

    public final void zzD(String str, String str2, Bundle bundle, boolean z, boolean z2, long j) {
        String str3 = str == null ? "app" : str;
        Bundle bundle2 = bundle == null ? new Bundle() : bundle;
        if (zzku.zzak(str2, FirebaseAnalytics.Event.SCREEN_VIEW)) {
            this.zzs.zzs().zzx(bundle2, j);
        } else {
            zzL(str3, str2, j, bundle2, z2, !z2 || this.zzd == null || zzku.zzag(str2), z, null);
        }
    }

    public final void zzE(String str, String str2, Bundle bundle, String str3) {
        zzfs.zzO();
        zzL("auto", str2, this.zzs.zzav().currentTimeMillis(), bundle, false, true, true, str3);
    }

    final void zzF(String str, String str2, Bundle bundle) {
        zzg();
        zzG(str, str2, this.zzs.zzav().currentTimeMillis(), bundle);
    }

    final void zzG(String str, String str2, long j, Bundle bundle) {
        zzg();
        zzH(str, str2, j, bundle, true, this.zzd == null || zzku.zzag(str2), true, null);
    }

    protected final void zzH(String str, String str2, long j, Bundle bundle, boolean z, boolean z2, boolean z3, String str3) {
        boolean z4;
        String str4;
        long j2;
        String str5;
        String str6;
        Bundle[] bundleArr;
        Preconditions.checkNotEmpty(str);
        Preconditions.checkNotNull(bundle);
        zzg();
        zza();
        if (!this.zzs.zzJ()) {
            this.zzs.zzay().zzc().zza("Event not sent since app measurement is disabled");
            return;
        }
        List<String> listZzo = this.zzs.zzh().zzo();
        if (listZzo != null && !listZzo.contains(str2)) {
            this.zzs.zzay().zzc().zzc("Dropping non-safelisted event. event name, origin", str2, str);
            return;
        }
        if (!this.zzf) {
            this.zzf = true;
            try {
                try {
                    (!this.zzs.zzN() ? Class.forName("com.google.android.gms.tagmanager.TagManagerService", true, this.zzs.zzau().getClassLoader()) : Class.forName("com.google.android.gms.tagmanager.TagManagerService")).getDeclaredMethod("initialize", Context.class).invoke(null, this.zzs.zzau());
                } catch (Exception e) {
                    this.zzs.zzay().zzk().zzb("Failed to invoke Tag Manager's initialize() method", e);
                }
            } catch (ClassNotFoundException unused) {
                this.zzs.zzay().zzi().zza("Tag Manager is not found and thus will not be used");
            }
        }
        if (Constants.ScionAnalytics.EVENT_FIREBASE_CAMPAIGN.equals(str2) && bundle.containsKey("gclid")) {
            this.zzs.zzaw();
            zzX("auto", "_lgclid", bundle.getString("gclid"), this.zzs.zzav().currentTimeMillis());
        }
        this.zzs.zzaw();
        if (z && zzku.zzal(str2)) {
            this.zzs.zzv().zzK(bundle, this.zzs.zzm().zzr.zza());
        }
        if (!z3) {
            this.zzs.zzaw();
            if (!"_iap".equals(str2)) {
                zzku zzkuVarZzv = this.zzs.zzv();
                int i = 2;
                if (zzkuVarZzv.zzab("event", str2)) {
                    if (zzkuVarZzv.zzY("event", zzgp.zza, zzgp.zzb, str2)) {
                        zzkuVarZzv.zzs.zzf();
                        if (zzkuVarZzv.zzX("event", 40, str2)) {
                            i = 0;
                        }
                    } else {
                        i = 13;
                    }
                }
                if (i != 0) {
                    this.zzs.zzay().zze().zzb("Invalid public event name. Event will not be logged (FE)", this.zzs.zzj().zzc(str2));
                    zzku zzkuVarZzv2 = this.zzs.zzv();
                    this.zzs.zzf();
                    this.zzs.zzv().zzM(this.zzn, null, i, "_ev", zzkuVarZzv2.zzC(str2, 40, true), str2 != null ? str2.length() : 0);
                    return;
                }
            }
        }
        zzpx.zzc();
        if (this.zzs.zzf().zzs(null, zzdw.zzaA)) {
            this.zzs.zzaw();
            zzic zzicVarZzj = this.zzs.zzs().zzj(false);
            if (zzicVarZzj != null && !bundle.containsKey("_sc")) {
                zzicVarZzj.zzd = true;
            }
            zzku.zzJ(zzicVarZzj, bundle, z && !z3);
        } else {
            this.zzs.zzaw();
            zzic zzicVarZzj2 = this.zzs.zzs().zzj(false);
            if (zzicVarZzj2 != null && !bundle.containsKey("_sc")) {
                zzicVarZzj2.zzd = true;
            }
            zzku.zzJ(zzicVarZzj2, bundle, z && !z3);
        }
        boolean zEquals = "am".equals(str);
        boolean zZzag = zzku.zzag(str2);
        if (!z || this.zzd == null || zZzag) {
            z4 = zEquals;
        } else {
            if (!zEquals) {
                this.zzs.zzay().zzc().zzc("Passing event to registered event handler (FE)", this.zzs.zzj().zzc(str2), this.zzs.zzj().zzb(bundle));
                Preconditions.checkNotNull(this.zzd);
                this.zzd.interceptEvent(str, str2, bundle, j);
                return;
            }
            z4 = true;
        }
        if (this.zzs.zzM()) {
            int iZzh = this.zzs.zzv().zzh(str2);
            if (iZzh != 0) {
                this.zzs.zzay().zze().zzb("Invalid event name. Event will not be logged (FE)", this.zzs.zzj().zzc(str2));
                zzku zzkuVarZzv3 = this.zzs.zzv();
                this.zzs.zzf();
                this.zzs.zzv().zzM(this.zzn, str3, iZzh, "_ev", zzkuVarZzv3.zzC(str2, 40, true), str2 != null ? str2.length() : 0);
                return;
            }
            Bundle bundleZzy = this.zzs.zzv().zzy(str3, str2, bundle, CollectionUtils.listOf((Object[]) new String[]{"_o", "_sn", "_sc", "_si"}), z3);
            Preconditions.checkNotNull(bundleZzy);
            this.zzs.zzaw();
            if (this.zzs.zzs().zzj(false) != null && "_ae".equals(str2)) {
                zzjw zzjwVar = this.zzs.zzu().zzb;
                long jElapsedRealtime = zzjwVar.zzc.zzs.zzav().elapsedRealtime();
                long j3 = jElapsedRealtime - zzjwVar.zzb;
                zzjwVar.zzb = jElapsedRealtime;
                if (j3 > 0) {
                    this.zzs.zzv().zzH(bundleZzy, j3);
                }
            }
            zzny.zzc();
            if (this.zzs.zzf().zzs(null, zzdw.zzai)) {
                if (!"auto".equals(str) && "_ssr".equals(str2)) {
                    zzku zzkuVarZzv4 = this.zzs.zzv();
                    String string = bundleZzy.getString("_ffr");
                    if (Strings.isEmptyOrWhitespace(string)) {
                        string = null;
                    } else if (string != null) {
                        string = string.trim();
                    }
                    if (zzku.zzak(string, zzkuVarZzv4.zzs.zzm().zzo.zza())) {
                        zzkuVarZzv4.zzs.zzay().zzc().zza("Not logging duplicate session_start_with_rollout event");
                        return;
                    }
                    zzkuVarZzv4.zzs.zzm().zzo.zzb(string);
                } else if ("_ae".equals(str2)) {
                    String strZza = this.zzs.zzv().zzs.zzm().zzo.zza();
                    if (!TextUtils.isEmpty(strZza)) {
                        bundleZzy.putString("_ffr", strZza);
                    }
                }
            }
            ArrayList arrayList = new ArrayList();
            arrayList.add(bundleZzy);
            if (this.zzs.zzm().zzj.zza() > 0 && this.zzs.zzm().zzk(j) && this.zzs.zzm().zzl.zzb()) {
                this.zzs.zzay().zzj().zza("Current session is expired, remove the session number, ID, and engagement time");
                str4 = "_ae";
                j2 = 0;
                zzX("auto", "_sid", null, this.zzs.zzav().currentTimeMillis());
                zzX("auto", "_sno", null, this.zzs.zzav().currentTimeMillis());
                zzX("auto", "_se", null, this.zzs.zzav().currentTimeMillis());
            } else {
                str4 = "_ae";
                j2 = 0;
            }
            if (bundleZzy.getLong(FirebaseAnalytics.Param.EXTEND_SESSION, j2) == 1) {
                this.zzs.zzay().zzj().zza("EXTEND_SESSION param attached: initiate a new session or extend the current active session");
                this.zzs.zzu().zza.zzb(j, true);
            }
            ArrayList arrayList2 = new ArrayList(bundleZzy.keySet());
            Collections.sort(arrayList2);
            int size = arrayList2.size();
            for (int i2 = 0; i2 < size; i2++) {
                String str7 = (String) arrayList2.get(i2);
                if (str7 != null) {
                    this.zzs.zzv();
                    Object obj = bundleZzy.get(str7);
                    if (obj instanceof Bundle) {
                        bundleArr = new Bundle[]{(Bundle) obj};
                    } else if (obj instanceof Parcelable[]) {
                        Parcelable[] parcelableArr = (Parcelable[]) obj;
                        bundleArr = (Bundle[]) Arrays.copyOf(parcelableArr, parcelableArr.length, Bundle[].class);
                    } else if (obj instanceof ArrayList) {
                        ArrayList arrayList3 = (ArrayList) obj;
                        bundleArr = (Bundle[]) arrayList3.toArray(new Bundle[arrayList3.size()]);
                    } else {
                        bundleArr = null;
                    }
                    if (bundleArr != null) {
                        bundleZzy.putParcelableArray(str7, bundleArr);
                    }
                }
            }
            for (int i3 = 0; i3 < arrayList.size(); i3++) {
                Bundle bundleZzt = (Bundle) arrayList.get(i3);
                if (i3 != 0) {
                    str6 = "_ep";
                    str5 = str;
                } else {
                    str5 = str;
                    str6 = str2;
                }
                bundleZzt.putString("_o", str5);
                if (z2) {
                    bundleZzt = this.zzs.zzv().zzt(bundleZzt);
                }
                Bundle bundle2 = bundleZzt;
                this.zzs.zzt().zzA(new zzat(str6, new zzar(bundle2), str, j), str3);
                if (!z4) {
                    Iterator<zzgt> it = this.zze.iterator();
                    while (it.hasNext()) {
                        it.next().onEvent(str, str2, new Bundle(bundle2), j);
                    }
                }
            }
            this.zzs.zzaw();
            if (this.zzs.zzs().zzj(false) == null || !str4.equals(str2)) {
                return;
            }
            this.zzs.zzu().zzb.zzd(true, true, this.zzs.zzav().elapsedRealtime());
        }
    }

    public final void zzI(zzgt zzgtVar) {
        zza();
        Preconditions.checkNotNull(zzgtVar);
        if (this.zze.add(zzgtVar)) {
            return;
        }
        this.zzs.zzay().zzk().zza("OnEventListener already registered");
    }

    public final void zzJ(long j) {
        this.zzg.set(null);
        this.zzs.zzaz().zzp(new zzhd(this, j));
    }

    final void zzK(long j, boolean z) {
        zzg();
        zza();
        this.zzs.zzay().zzc().zza("Resetting analytics data (FE)");
        zzjy zzjyVarZzu = this.zzs.zzu();
        zzjyVarZzu.zzg();
        zzjx zzjxVar = zzjyVarZzu.zza;
        zzjyVarZzu.zzb.zza();
        boolean zZzJ = this.zzs.zzJ();
        zzex zzexVarZzm = this.zzs.zzm();
        zzexVarZzm.zzc.zzb(j);
        if (!TextUtils.isEmpty(zzexVarZzm.zzs.zzm().zzo.zza())) {
            zzexVarZzm.zzo.zzb(null);
        }
        zzoh.zzc();
        if (zzexVarZzm.zzs.zzf().zzs(null, zzdw.zzaj)) {
            zzexVarZzm.zzj.zzb(0L);
        }
        if (!zzexVarZzm.zzs.zzf().zzv()) {
            zzexVarZzm.zzi(!zZzJ);
        }
        zzexVarZzm.zzp.zzb(null);
        zzexVarZzm.zzq.zzb(0L);
        zzexVarZzm.zzr.zzb(null);
        if (z) {
            this.zzs.zzt().zzC();
        }
        zzoh.zzc();
        if (this.zzs.zzf().zzs(null, zzdw.zzaj)) {
            this.zzs.zzu().zza.zza();
        }
        this.zzc = !zZzJ;
    }

    protected final void zzL(String str, String str2, long j, Bundle bundle, boolean z, boolean z2, boolean z3, String str3) {
        Bundle bundle2 = new Bundle(bundle);
        for (String str4 : bundle2.keySet()) {
            Object obj = bundle2.get(str4);
            if (obj instanceof Bundle) {
                bundle2.putBundle(str4, new Bundle((Bundle) obj));
            } else {
                int i = 0;
                if (obj instanceof Parcelable[]) {
                    Parcelable[] parcelableArr = (Parcelable[]) obj;
                    while (i < parcelableArr.length) {
                        Parcelable parcelable = parcelableArr[i];
                        if (parcelable instanceof Bundle) {
                            parcelableArr[i] = new Bundle((Bundle) parcelable);
                        }
                        i++;
                    }
                } else if (obj instanceof List) {
                    List list = (List) obj;
                    while (i < list.size()) {
                        Object obj2 = list.get(i);
                        if (obj2 instanceof Bundle) {
                            list.set(i, new Bundle((Bundle) obj2));
                        }
                        i++;
                    }
                }
            }
        }
        this.zzs.zzaz().zzp(new zzha(this, str, str2, j, bundle2, z, z2, z3, str3));
    }

    final void zzM(String str, String str2, long j, Object obj) {
        this.zzs.zzaz().zzp(new zzhb(this, str, str2, obj, j));
    }

    final void zzN(String str) {
        this.zzg.set(str);
    }

    public final void zzO(Bundle bundle) {
        zzP(bundle, this.zzs.zzav().currentTimeMillis());
    }

    public final void zzP(Bundle bundle, long j) {
        Preconditions.checkNotNull(bundle);
        Bundle bundle2 = new Bundle(bundle);
        if (!TextUtils.isEmpty(bundle2.getString("app_id"))) {
            this.zzs.zzay().zzk().zza("Package name should be null when calling setConditionalUserProperty");
        }
        bundle2.remove("app_id");
        Preconditions.checkNotNull(bundle2);
        zzgo.zza(bundle2, "app_id", String.class, null);
        zzgo.zza(bundle2, "origin", String.class, null);
        zzgo.zza(bundle2, "name", String.class, null);
        zzgo.zza(bundle2, "value", Object.class, null);
        zzgo.zza(bundle2, AppMeasurementSdk.ConditionalUserProperty.TRIGGER_EVENT_NAME, String.class, null);
        zzgo.zza(bundle2, AppMeasurementSdk.ConditionalUserProperty.TRIGGER_TIMEOUT, Long.class, 0L);
        zzgo.zza(bundle2, AppMeasurementSdk.ConditionalUserProperty.TIMED_OUT_EVENT_NAME, String.class, null);
        zzgo.zza(bundle2, AppMeasurementSdk.ConditionalUserProperty.TIMED_OUT_EVENT_PARAMS, Bundle.class, null);
        zzgo.zza(bundle2, AppMeasurementSdk.ConditionalUserProperty.TRIGGERED_EVENT_NAME, String.class, null);
        zzgo.zza(bundle2, AppMeasurementSdk.ConditionalUserProperty.TRIGGERED_EVENT_PARAMS, Bundle.class, null);
        zzgo.zza(bundle2, AppMeasurementSdk.ConditionalUserProperty.TIME_TO_LIVE, Long.class, 0L);
        zzgo.zza(bundle2, AppMeasurementSdk.ConditionalUserProperty.EXPIRED_EVENT_NAME, String.class, null);
        zzgo.zza(bundle2, AppMeasurementSdk.ConditionalUserProperty.EXPIRED_EVENT_PARAMS, Bundle.class, null);
        Preconditions.checkNotEmpty(bundle2.getString("name"));
        Preconditions.checkNotEmpty(bundle2.getString("origin"));
        Preconditions.checkNotNull(bundle2.get("value"));
        bundle2.putLong(AppMeasurementSdk.ConditionalUserProperty.CREATION_TIMESTAMP, j);
        String string = bundle2.getString("name");
        Object obj = bundle2.get("value");
        if (this.zzs.zzv().zzl(string) != 0) {
            this.zzs.zzay().zzd().zzb("Invalid conditional user property name", this.zzs.zzj().zze(string));
            return;
        }
        if (this.zzs.zzv().zzd(string, obj) != 0) {
            this.zzs.zzay().zzd().zzc("Invalid conditional user property value", this.zzs.zzj().zze(string), obj);
            return;
        }
        Object objZzB = this.zzs.zzv().zzB(string, obj);
        if (objZzB == null) {
            this.zzs.zzay().zzd().zzc("Unable to normalize conditional user property value", this.zzs.zzj().zze(string), obj);
            return;
        }
        zzgo.zzb(bundle2, objZzB);
        long j2 = bundle2.getLong(AppMeasurementSdk.ConditionalUserProperty.TRIGGER_TIMEOUT);
        if (!TextUtils.isEmpty(bundle2.getString(AppMeasurementSdk.ConditionalUserProperty.TRIGGER_EVENT_NAME))) {
            this.zzs.zzf();
            if (j2 > 15552000000L || j2 < 1) {
                this.zzs.zzay().zzd().zzc("Invalid conditional user property timeout", this.zzs.zzj().zze(string), Long.valueOf(j2));
                return;
            }
        }
        long j3 = bundle2.getLong(AppMeasurementSdk.ConditionalUserProperty.TIME_TO_LIVE);
        this.zzs.zzf();
        if (j3 > 15552000000L || j3 < 1) {
            this.zzs.zzay().zzd().zzc("Invalid conditional user property time to live", this.zzs.zzj().zze(string), Long.valueOf(j3));
        } else {
            this.zzs.zzaz().zzp(new zzhe(this, bundle2));
        }
    }

    public final void zzQ(Bundle bundle, int i, long j) {
        zza();
        String strZzh = zzag.zzh(bundle);
        if (strZzh != null) {
            this.zzs.zzay().zzl().zzb("Ignoring invalid consent setting", strZzh);
            this.zzs.zzay().zzl().zza("Valid consent values are 'granted', 'denied'");
        }
        zzR(zzag.zza(bundle), i, j);
    }

    public final void zzR(zzag zzagVar, int i, long j) {
        boolean z;
        boolean z2;
        zzag zzagVar2;
        boolean z3;
        zza();
        if (i != -10 && zzagVar.zze() == null && zzagVar.zzf() == null) {
            this.zzs.zzay().zzl().zza("Discarding empty consent settings");
            return;
        }
        synchronized (this.zzh) {
            z = true;
            z2 = false;
            if (zzag.zzl(i, this.zzj)) {
                boolean zZzm = zzagVar.zzm(this.zzi);
                if (zzagVar.zzk() && !this.zzi.zzk()) {
                    z2 = true;
                }
                zzag zzagVarZzd = zzagVar.zzd(this.zzi);
                this.zzi = zzagVarZzd;
                this.zzj = i;
                zzagVar2 = zzagVarZzd;
                z3 = z2;
                z2 = zZzm;
            } else {
                zzagVar2 = zzagVar;
                z3 = false;
                z = false;
            }
        }
        if (!z) {
            this.zzs.zzay().zzi().zzb("Ignoring lower-priority consent settings, proposed settings", zzagVar2);
            return;
        }
        long andIncrement = this.zzk.getAndIncrement();
        if (z2) {
            this.zzg.set(null);
            this.zzs.zzaz().zzq(new zzhp(this, zzagVar2, j, i, andIncrement, z3));
        } else if (i == 30 || i == -10) {
            this.zzs.zzaz().zzq(new zzhq(this, zzagVar2, i, andIncrement, z3));
        } else {
            this.zzs.zzaz().zzp(new zzhr(this, zzagVar2, i, andIncrement, z3));
        }
    }

    public final void zzS(zzgs zzgsVar) {
        zzgs zzgsVar2;
        zzg();
        zza();
        if (zzgsVar != null && zzgsVar != (zzgsVar2 = this.zzd)) {
            Preconditions.checkState(zzgsVar2 == null, "EventInterceptor already set.");
        }
        this.zzd = zzgsVar;
    }

    public final void zzT(Boolean bool) {
        zza();
        this.zzs.zzaz().zzp(new zzho(this, bool));
    }

    final void zzU(zzag zzagVar) {
        zzg();
        boolean z = (zzagVar.zzk() && zzagVar.zzj()) || this.zzs.zzt().zzM();
        if (z != this.zzs.zzK()) {
            this.zzs.zzG(z);
            zzex zzexVarZzm = this.zzs.zzm();
            zzfs zzfsVar = zzexVarZzm.zzs;
            zzexVarZzm.zzg();
            Boolean boolValueOf = zzexVarZzm.zza().contains("measurement_enabled_from_api") ? Boolean.valueOf(zzexVarZzm.zza().getBoolean("measurement_enabled_from_api", true)) : null;
            if (!z || boolValueOf == null || boolValueOf.booleanValue()) {
                zzZ(Boolean.valueOf(z), false);
            }
        }
    }

    public final void zzV(String str, String str2, Object obj, boolean z) {
        zzW("auto", "_ldl", obj, true, this.zzs.zzav().currentTimeMillis());
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0053  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    final void zzX(java.lang.String r9, java.lang.String r10, java.lang.Object r11, long r12) {
        /*
            r8 = this;
            com.google.android.gms.common.internal.Preconditions.checkNotEmpty(r9)
            com.google.android.gms.common.internal.Preconditions.checkNotEmpty(r10)
            r8.zzg()
            r8.zza()
            java.lang.String r0 = "allow_personalized_ads"
            boolean r0 = r0.equals(r10)
            java.lang.String r1 = "_npa"
            if (r0 == 0) goto L66
            boolean r0 = r11 instanceof java.lang.String
            if (r0 == 0) goto L53
            r0 = r11
            java.lang.String r0 = (java.lang.String) r0
            boolean r2 = android.text.TextUtils.isEmpty(r0)
            if (r2 != 0) goto L53
            r10 = 1
            java.util.Locale r11 = java.util.Locale.ENGLISH
            java.lang.String r11 = r0.toLowerCase(r11)
            java.lang.String r0 = "false"
            boolean r11 = r0.equals(r11)
            r2 = 1
            if (r10 == r11) goto L37
            r10 = 0
            goto L38
        L37:
            r10 = r2
        L38:
            java.lang.Long r11 = java.lang.Long.valueOf(r10)
            com.google.android.gms.measurement.internal.zzfs r10 = r8.zzs
            com.google.android.gms.measurement.internal.zzex r10 = r10.zzm()
            com.google.android.gms.measurement.internal.zzew r10 = r10.zzh
            long r4 = r11.longValue()
            int r6 = (r4 > r2 ? 1 : (r4 == r2 ? 0 : -1))
            if (r6 != 0) goto L4f
            java.lang.String r0 = "true"
        L4f:
            r10.zzb(r0)
            goto L63
        L53:
            if (r11 != 0) goto L66
            com.google.android.gms.measurement.internal.zzfs r10 = r8.zzs
            com.google.android.gms.measurement.internal.zzex r10 = r10.zzm()
            com.google.android.gms.measurement.internal.zzew r10 = r10.zzh
            java.lang.String r0 = "unset"
            r10.zzb(r0)
        L63:
            r6 = r11
            r3 = r1
            goto L68
        L66:
            r3 = r10
            r6 = r11
        L68:
            com.google.android.gms.measurement.internal.zzfs r10 = r8.zzs
            boolean r10 = r10.zzJ()
            if (r10 != 0) goto L80
            com.google.android.gms.measurement.internal.zzfs r9 = r8.zzs
            com.google.android.gms.measurement.internal.zzei r9 = r9.zzay()
            com.google.android.gms.measurement.internal.zzeg r9 = r9.zzj()
            java.lang.String r10 = "User property not set since app measurement is disabled"
            r9.zza(r10)
            return
        L80:
            com.google.android.gms.measurement.internal.zzfs r10 = r8.zzs
            boolean r10 = r10.zzM()
            if (r10 != 0) goto L89
            return
        L89:
            com.google.android.gms.measurement.internal.zzkq r10 = new com.google.android.gms.measurement.internal.zzkq
            r2 = r10
            r4 = r12
            r7 = r9
            r2.<init>(r3, r4, r6, r7)
            com.google.android.gms.measurement.internal.zzfs r9 = r8.zzs
            com.google.android.gms.measurement.internal.zzjj r9 = r9.zzt()
            r9.zzK(r10)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zzhv.zzX(java.lang.String, java.lang.String, java.lang.Object, long):void");
    }

    public final void zzY(zzgt zzgtVar) {
        zza();
        Preconditions.checkNotNull(zzgtVar);
        if (this.zze.remove(zzgtVar)) {
            return;
        }
        this.zzs.zzay().zzk().zza("OnEventListener had not been registered");
    }

    @Override // com.google.android.gms.measurement.internal.zzf
    protected final boolean zzf() {
        return false;
    }

    public final int zzh(String str) {
        Preconditions.checkNotEmpty(str);
        this.zzs.zzf();
        return 25;
    }

    public final Boolean zzi() {
        AtomicReference atomicReference = new AtomicReference();
        return (Boolean) this.zzs.zzaz().zzd(atomicReference, 15000L, "boolean test flag value", new zzhg(this, atomicReference));
    }

    public final Double zzj() {
        AtomicReference atomicReference = new AtomicReference();
        return (Double) this.zzs.zzaz().zzd(atomicReference, 15000L, "double test flag value", new zzhn(this, atomicReference));
    }

    public final Integer zzl() {
        AtomicReference atomicReference = new AtomicReference();
        return (Integer) this.zzs.zzaz().zzd(atomicReference, 15000L, "int test flag value", new zzhm(this, atomicReference));
    }

    public final Long zzm() {
        AtomicReference atomicReference = new AtomicReference();
        return (Long) this.zzs.zzaz().zzd(atomicReference, 15000L, "long test flag value", new zzhl(this, atomicReference));
    }

    public final String zzo() {
        return this.zzg.get();
    }

    public final String zzp() {
        zzic zzicVarZzi = this.zzs.zzs().zzi();
        if (zzicVarZzi != null) {
            return zzicVarZzi.zzb;
        }
        return null;
    }

    public final String zzq() {
        zzic zzicVarZzi = this.zzs.zzs().zzi();
        if (zzicVarZzi != null) {
            return zzicVarZzi.zza;
        }
        return null;
    }

    public final String zzr() {
        AtomicReference atomicReference = new AtomicReference();
        return (String) this.zzs.zzaz().zzd(atomicReference, 15000L, "String test flag value", new zzhk(this, atomicReference));
    }

    public final ArrayList<Bundle> zzs(String str, String str2) {
        if (this.zzs.zzaz().zzs()) {
            this.zzs.zzay().zzd().zza("Cannot get conditional user properties from analytics worker thread");
            return new ArrayList<>(0);
        }
        this.zzs.zzaw();
        if (zzaa.zza()) {
            this.zzs.zzay().zzd().zza("Cannot get conditional user properties from main thread");
            return new ArrayList<>(0);
        }
        AtomicReference atomicReference = new AtomicReference();
        this.zzs.zzaz().zzd(atomicReference, 5000L, "get conditional user properties", new zzhh(this, atomicReference, null, str, str2));
        List list = (List) atomicReference.get();
        if (list != null) {
            return zzku.zzG(list);
        }
        this.zzs.zzay().zzd().zzb("Timed out waiting for get conditional user properties", null);
        return new ArrayList<>();
    }

    public final List<zzkq> zzt(boolean z) {
        zza();
        this.zzs.zzay().zzj().zza("Getting user properties (FE)");
        if (this.zzs.zzaz().zzs()) {
            this.zzs.zzay().zzd().zza("Cannot get all user properties from analytics worker thread");
            return Collections.emptyList();
        }
        this.zzs.zzaw();
        if (zzaa.zza()) {
            this.zzs.zzay().zzd().zza("Cannot get all user properties from main thread");
            return Collections.emptyList();
        }
        AtomicReference atomicReference = new AtomicReference();
        this.zzs.zzaz().zzd(atomicReference, 5000L, "get user properties", new zzhc(this, atomicReference, z));
        List<zzkq> list = (List) atomicReference.get();
        if (list != null) {
            return list;
        }
        this.zzs.zzay().zzd().zzb("Timed out waiting for get user properties, includeInternal", Boolean.valueOf(z));
        return Collections.emptyList();
    }

    public final Map<String, Object> zzu(String str, String str2, boolean z) {
        if (this.zzs.zzaz().zzs()) {
            this.zzs.zzay().zzd().zza("Cannot get user properties from analytics worker thread");
            return Collections.emptyMap();
        }
        this.zzs.zzaw();
        if (zzaa.zza()) {
            this.zzs.zzay().zzd().zza("Cannot get user properties from main thread");
            return Collections.emptyMap();
        }
        AtomicReference atomicReference = new AtomicReference();
        this.zzs.zzaz().zzd(atomicReference, 5000L, "get user properties", new zzhi(this, atomicReference, null, str, str2, z));
        List<zzkq> list = (List) atomicReference.get();
        if (list == null) {
            this.zzs.zzay().zzd().zzb("Timed out waiting for handle get user properties, includeInternal", Boolean.valueOf(z));
            return Collections.emptyMap();
        }
        ArrayMap arrayMap = new ArrayMap(list.size());
        for (zzkq zzkqVar : list) {
            Object objZza = zzkqVar.zza();
            if (objZza != null) {
                arrayMap.put(zzkqVar.zzb, objZza);
            }
        }
        return arrayMap;
    }

    public final void zzy() {
        zzg();
        zza();
        if (this.zzs.zzM()) {
            if (this.zzs.zzf().zzs(null, zzdw.zzZ)) {
                zzaf zzafVarZzf = this.zzs.zzf();
                zzafVarZzf.zzs.zzaw();
                Boolean boolZzk = zzafVarZzf.zzk("google_analytics_deferred_deep_link_enabled");
                if (boolZzk != null && boolZzk.booleanValue()) {
                    this.zzs.zzay().zzc().zza("Deferred Deep Link feature enabled.");
                    this.zzs.zzaz().zzp(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzgv
                        @Override // java.lang.Runnable
                        public final void run() {
                            zzhv zzhvVar = this.zza;
                            zzhvVar.zzg();
                            if (zzhvVar.zzs.zzm().zzm.zzb()) {
                                zzhvVar.zzs.zzay().zzc().zza("Deferred Deep Link already retrieved. Not fetching again.");
                                return;
                            }
                            long jZza = zzhvVar.zzs.zzm().zzn.zza();
                            zzhvVar.zzs.zzm().zzn.zzb(1 + jZza);
                            zzhvVar.zzs.zzf();
                            if (jZza < 5) {
                                zzhvVar.zzs.zzE();
                            } else {
                                zzhvVar.zzs.zzay().zzk().zza("Permanently failed to retrieve Deferred Deep Link. Reached maximum retries.");
                                zzhvVar.zzs.zzm().zzm.zza(true);
                            }
                        }
                    });
                }
            }
            this.zzs.zzt().zzq();
            this.zzc = false;
            zzex zzexVarZzm = this.zzs.zzm();
            zzexVarZzm.zzg();
            String string = zzexVarZzm.zza().getString("previous_os_version", null);
            zzexVarZzm.zzs.zzg().zzu();
            String str = Build.VERSION.RELEASE;
            if (!TextUtils.isEmpty(str) && !str.equals(string)) {
                SharedPreferences.Editor editorEdit = zzexVarZzm.zza().edit();
                editorEdit.putString("previous_os_version", str);
                editorEdit.apply();
            }
            if (TextUtils.isEmpty(string)) {
                return;
            }
            this.zzs.zzg().zzu();
            if (string.equals(Build.VERSION.RELEASE)) {
                return;
            }
            Bundle bundle = new Bundle();
            bundle.putString("_po", string);
            zzF("auto", "_ou", bundle);
        }
    }

    public final void zzz(String str, String str2, Bundle bundle) {
        long jCurrentTimeMillis = this.zzs.zzav().currentTimeMillis();
        Preconditions.checkNotEmpty(str);
        Bundle bundle2 = new Bundle();
        bundle2.putString("name", str);
        bundle2.putLong(AppMeasurementSdk.ConditionalUserProperty.CREATION_TIMESTAMP, jCurrentTimeMillis);
        if (str2 != null) {
            bundle2.putString(AppMeasurementSdk.ConditionalUserProperty.EXPIRED_EVENT_NAME, str2);
            bundle2.putBundle(AppMeasurementSdk.ConditionalUserProperty.EXPIRED_EVENT_PARAMS, bundle);
        }
        this.zzs.zzaz().zzp(new zzhf(this, bundle2));
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x002d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void zzW(java.lang.String r16, java.lang.String r17, java.lang.Object r18, boolean r19, long r20) {
        /*
            Method dump skipped, instruction units count: 211
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zzhv.zzW(java.lang.String, java.lang.String, java.lang.Object, boolean, long):void");
    }
}
