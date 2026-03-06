package com.google.android.gms.measurement.internal;

import android.content.SharedPreferences;
import android.util.Pair;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.common.internal.Preconditions;
import org.checkerframework.checker.nullness.qual.EnsuresNonNull;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
final class zzex extends zzgm {
    static final Pair<String, Long> zza = new Pair<>("", 0L);
    public zzev zzb;
    public final zzet zzc;
    public final zzet zzd;
    public final zzew zze;
    public final zzet zzf;
    public final zzer zzg;
    public final zzew zzh;
    public final zzer zzi;
    public final zzet zzj;
    public boolean zzk;
    public final zzer zzl;
    public final zzer zzm;
    public final zzet zzn;
    public final zzew zzo;
    public final zzew zzp;
    public final zzet zzq;
    public final zzes zzr;
    private SharedPreferences zzt;
    private String zzu;
    private boolean zzv;
    private long zzw;

    zzex(zzfs zzfsVar) {
        super(zzfsVar);
        this.zzf = new zzet(this, "session_timeout", 1800000L);
        this.zzg = new zzer(this, "start_new_session", true);
        this.zzj = new zzet(this, "last_pause_time", 0L);
        this.zzh = new zzew(this, "non_personalized_ads", null);
        this.zzi = new zzer(this, "allow_remote_dynamite", false);
        this.zzc = new zzet(this, "first_open_time", 0L);
        this.zzd = new zzet(this, "app_install_time", 0L);
        this.zze = new zzew(this, "app_instance_id", null);
        this.zzl = new zzer(this, "app_backgrounded", false);
        this.zzm = new zzer(this, "deep_link_retrieval_complete", false);
        this.zzn = new zzet(this, "deep_link_retrieval_attempts", 0L);
        this.zzo = new zzew(this, "firebase_feature_rollouts", null);
        this.zzp = new zzew(this, "deferred_attribution_cache", null);
        this.zzq = new zzet(this, "deferred_attribution_cache_timestamp", 0L);
        this.zzr = new zzes(this, "default_event_parameters", null);
    }

    protected final SharedPreferences zza() {
        zzg();
        zzu();
        Preconditions.checkNotNull(this.zzt);
        return this.zzt;
    }

    @Override // com.google.android.gms.measurement.internal.zzgm
    @EnsuresNonNull.List({@EnsuresNonNull({"this.preferences"}), @EnsuresNonNull({"this.monitoringSample"})})
    protected final void zzaA() {
        SharedPreferences sharedPreferences = this.zzs.zzau().getSharedPreferences("com.google.android.gms.measurement.prefs", 0);
        this.zzt = sharedPreferences;
        boolean z = sharedPreferences.getBoolean("has_been_opened", false);
        this.zzk = z;
        if (!z) {
            SharedPreferences.Editor editorEdit = this.zzt.edit();
            editorEdit.putBoolean("has_been_opened", true);
            editorEdit.apply();
        }
        this.zzs.zzf();
        this.zzb = new zzev(this, "health_monitor", Math.max(0L, zzdw.zzb.zza(null).longValue()), null);
    }

    final Pair<String, Boolean> zzb(String str) {
        zzg();
        long jElapsedRealtime = this.zzs.zzav().elapsedRealtime();
        String str2 = this.zzu;
        if (str2 != null && jElapsedRealtime < this.zzw) {
            return new Pair<>(str2, Boolean.valueOf(this.zzv));
        }
        this.zzw = jElapsedRealtime + this.zzs.zzf().zzi(str, zzdw.zza);
        AdvertisingIdClient.setShouldSkipGmsCoreVersionCheck(true);
        try {
            AdvertisingIdClient.Info advertisingIdInfo = AdvertisingIdClient.getAdvertisingIdInfo(this.zzs.zzau());
            this.zzu = "";
            String id = advertisingIdInfo.getId();
            if (id != null) {
                this.zzu = id;
            }
            this.zzv = advertisingIdInfo.isLimitAdTrackingEnabled();
        } catch (Exception e) {
            this.zzs.zzay().zzc().zzb("Unable to get advertising id", e);
            this.zzu = "";
        }
        AdvertisingIdClient.setShouldSkipGmsCoreVersionCheck(false);
        return new Pair<>(this.zzu, Boolean.valueOf(this.zzv));
    }

    final zzag zzc() {
        zzg();
        return zzag.zzb(zza().getString("consent_settings", "G1"));
    }

    final Boolean zzd() {
        zzg();
        if (zza().contains("measurement_enabled")) {
            return Boolean.valueOf(zza().getBoolean("measurement_enabled", true));
        }
        return null;
    }

    @Override // com.google.android.gms.measurement.internal.zzgm
    protected final boolean zzf() {
        return true;
    }

    final void zzh(Boolean bool) {
        zzg();
        SharedPreferences.Editor editorEdit = zza().edit();
        if (bool != null) {
            editorEdit.putBoolean("measurement_enabled", bool.booleanValue());
        } else {
            editorEdit.remove("measurement_enabled");
        }
        editorEdit.apply();
    }

    final void zzi(boolean z) {
        zzg();
        this.zzs.zzay().zzj().zzb("App measurement setting deferred collection", Boolean.valueOf(z));
        SharedPreferences.Editor editorEdit = zza().edit();
        editorEdit.putBoolean("deferred_analytics_collection", z);
        editorEdit.apply();
    }

    final boolean zzj() {
        SharedPreferences sharedPreferences = this.zzt;
        if (sharedPreferences == null) {
            return false;
        }
        return sharedPreferences.contains("deferred_analytics_collection");
    }

    final boolean zzk(long j) {
        return j - this.zzf.zza() > this.zzj.zza();
    }

    final boolean zzl(int i) {
        return zzag.zzl(i, zza().getInt("consent_source", 100));
    }
}
